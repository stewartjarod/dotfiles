
function activate_virtual_env() {
  folder=$(basename $PWD)
  virtual_path="$HOME/VirtualEnvs/$folder/bin"
  if [ -e "$virtual_path" ]
  then
    source "$virtual_path/activate"
  fi

}
