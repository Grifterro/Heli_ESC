file(REMOVE_RECURSE
  "APP.elf"
  "APP.elf.manifest"
  "APP.elf.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang ASM C)
  include(CMakeFiles/APP.elf.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
