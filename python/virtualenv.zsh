
function activate_virtual_env() {
  folder=$(basename $PWD)
  virtual_path="$HOME/.virtualEnvs/$folder/bin"
  if [ -e "$virtual_path" ]
  then
    source "$virtual_path/activate"
  fi

}

function create_virtual_env() {
  python3 -m venv $HOME/.virtualEnvs/$1
}
