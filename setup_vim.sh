#! /usr/bin/env bash

if [ ! -f "${HOME}/.vim/autoload/pathogen.vim" ]; then
  echo "Setting up pathogen..."
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
else
  echo "Pathogen is already configured."
fi

plugins=(
  "https://github.com/rust-lang/rust.vim.git"
  "https://github.com/vim-syntastic/syntastic.git"
  "https://github.com/godlygeek/tabular.git"
  "https://github.com/vim-airline/vim-airline-themes.git"
  "https://github.com/ntpeters/vim-better-whitespace.git"
  "https://github.com/vim-crystal/vim-crystal.git"
  "https://github.com/tpope/vim-eunuch.git"
  "https://github.com/tpope/vim-fugitive.git"
  "https://github.com/airblade/vim-gitgutter.git"
  "https://github.com/fatih/vim-go.git"
  "https://github.com/tpope/vim-repeat.git"
  "https://github.com/vim-ruby/vim-ruby.git"
  "https://github.com/tpope/vim-sensible.git"
  "https://github.com/tpope/vim-surround.git"
  "https://github.com/hashivim/vim-terraform.git"
  "https://github.com/stephpy/vim-yaml.git"
  "https://github.com/vim-python/python-syntax.git"
  "https://github.com/ycm-core/YouCompleteMe.git"
)

# Setup our bundles directory for vim & clone down or pull latest for each repo
mkdir -p ~/.vim/bundle
pushd ~/.vim/bundle

dir_regex='[^/]+(?=\.git$)'

for repo in "${plugins[@]}"
do
  # Note that this looks really terrible to me, but grabbing a capture group
  # in a shell regex is a PITA.
  dir=$(cut -f 5 -d '/' <<< "${repo}" | rev | cut -c 5- | rev)
  if [[ ! -d $dir ]]
  then
    echo "Cloning ${repo}"
    git clone $repo
  else
    # skip YouCompleteMe because it's very finicky
    if [[ "YouCompleteMe" != $dir ]]
    then
      echo "${repo} already cloned, pulling latest"
      pushd $dir
      git pull
      popd
    else
      echo "Skipping updates to YouCompleteMe"
    fi
  fi
done

# And head back to wherever we started from
popd
