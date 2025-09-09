VBUS/VBAT Measurement (noise-robust, PWM-synchronous)

Measure the battery/bus voltage on PB13 (ADC3_IN5, STM32F303) with hardware filtering, PWM-synchronous sampling, and firmware smoothing. Designed for ESCs where the DC bus is noisy (ripple + BLDC commutation spikes).

Hardware

Divider: R1 = 169 kΩ (to VBAT), R2 = 18 kΩ (to GND) → scale k = 0.0962567.
Max 25.2 V → ~2.43 V at the ADC (ample headroom on VDDA=3.3 V).

Pin RC filter: Rseries 220 Ω from divider node to PB13, Cpin 100–220 nF from PB13 to GND (placed at the MCU pin).
With Rth ≈ 16.27 kΩ → fc ≈ 98 Hz (100 nF) or ≈ 44 Hz (220 nF). This kills PWM/commutation HF content while keeping ~ms response.

Protection (recommended): the 220 Ω already limits clamp current; add Schottky clamps to 3V3 and GND or a small 5 V TVS if your layout is very “spiky”.

Analog rails: decouple VDDA/VREF+ well (100 nF + 1 µF close to pins).

(Optional): Use an internal OPAMP in unity-gain as a buffer for even lower source impedance.

ADC configuration (HAL/CubeMX-style)

ADC: ADC3, channel IN5 (PB13), 12-bit, right-aligned.

Sampling time: long, e.g. 181.5 cycles (up to 601.5 if needed) to accommodate the ~16 kΩ source and further average residual ripple.

Mode: Injected conversion triggered by the PWM timer to avoid sampling during switching edges.

Trigger: TIM1_CC4 (or TIM1_TRGO) scheduled at mid-period of center-aligned PWM; add a few µs offset after commutation if using 6-step.

Start: enable injected conversions once; every trigger captures one sample.

VREFINT: periodically sample and compensate results for VDDA drift.

Firmware filtering & scaling

Outlier handling: clip/winsorize a few highest/lowest samples in each window to reject sporadic spikes.

Smoothing: moving average of 32–64 samples or first-order IIR y += α·(x−y) with α = 0.02–0.10 (pick to match your RC).

Update rate: publish ~50–200 Hz telemetry; internal sampling can be higher (kHz-range) since it’s timer-driven and cheap via DMA/JEOC.

Scaling:

k = R2 / (R1 + R2) = 0.0962566845
VBAT = Vadc / k
// Integer-friendly:
VBAT_mV = (ADC * Vdda_mV / 4095) * (R1+R2) / R2
// 1 LSB @ ADC pin ≈ 0.8059 mV → ≈ 8.372 mV referred to VBAT


Calibration: store a 1-point gain factor using a lab PSU; optionally add a small offset term.

Alarms / safety

Analog Watchdog: set per-channel thresholds on ADC3_IN5 for fast undervoltage detection (LVC). Choose limits in ADC counts mapped from your per-cell policy.

Debounce: confirm watchdog events with a short digital filter window to ignore single-sample glitches.

Performance (typical)

Range: 0–~30 V input (limited by divider & protection; spec’d for ≤ 25.2 V).

Resolution: ~8.37 mV/LSB referred to VBAT (12-bit).

Latency: analog τ = Rth·Cpin ≈ 1.6–3.6 ms (+ digital smoothing → ~10–40 ms total, tuneable).

Immunity: PWM-synchronous sampling plus RC and long sampling time gives robust readings even under heavy commutation ripple.

Integration knobs

Cpin: 100 nF (faster) ↔ 220 nF (quieter).

InjectedSamplingTime: 181.5 ↔ 601.5 cycles (trade speed vs. ripple rejection).

sample_point: TIM1_CC4 compare value = ARR/2 + shift (µs after commutation).

α or window length: responsiveness vs. smoothness.

Watchdog thresholds: map to your pack (e.g., x V/cell × cells).

Why it works:
We (1) remove HF noise in hardware at the ADC pin, (2) sample only in a “quiet” point of the PWM cycle via timer trigger, and (3) finish with light digital filtering and VDDA compensation. The result is a low-jitter, low-latency VBAT reading that’s suitable both for telemetry and for real-time protections in an ESC.