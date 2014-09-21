#!/usr/bin/env zsh

# Source local configuration
source ~/.zshrc

echo "Beginning the installation process..."

# Ensure that the Heroku toolbelt is installed
command -v heroku > /dev/null 2>&1 || { echo "ERROR: install the Heroku toolbelt first https://toolbelt.herokuapp.com/" >&2; exit 1; }
command -v workon > /dev/null 2>&1 || { echo "ERROR: install virtualenvwrapper first http://virtualenvwrapper.readthedocs.org/en/latest/install.html" >&2; exit 1; }

# Create a new virtualenv
echo "Creating the virtualenv 'my-project'..."
PYTHON_PATH=$(which python3.4)
mkvirtualenv {{ cookiecutter.repo_name }} --python=$PYTHON_PATH

echo "Installing the project's local Python dependencies..."
workon {{ cookiecutter.repo_name }} && pip install -r requirements/local.txt

echo "Installing the project's Node dependencies..."
npm install

echo "Creating a new database (your PostgreSQL server must be running)"
psql -c "CREATE DATABASE {{ cookiecutter.repo_name }}"

echo "\n\n---------\n"
echo "Your new PostgreSQL database is named {{ cookiecutter.repo_name }}"
echo "Your new virtualenv is named {{ cookiecutter.repo_name }}"
echo "Type 'workon {{ cookiecutter.repo_name }}' to source the environment"
