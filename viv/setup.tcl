add_files -scan_for_includes {../rtl/fpadd.v, ../rtl/fpcmp.v, ../rtl/fpmul.v, ../rtl/fputop.v, ../rtl/insdec.v, ../rtl/regFile.v}
set_property ip_repo_paths "../ip_repo" [current_project]
set_property top fputop [current_fileset]
source design_1.tcl