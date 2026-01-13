file(REMOVE_RECURSE
  "BootLoader.elf"
  "BootLoader.elf.manifest"
  "BootLoader.elf.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang ASM C)
  include(CMakeFiles/BootLoader.elf.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
