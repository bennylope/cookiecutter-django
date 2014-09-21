#!/usr/bin/env zsh

# Source local configuration
source ~/.zshrc

echo "Beginning the installation process..."

# Ensure that the Heroku toolbelt is installed
command -v heroku > /dev/null 2>&1 || { echo "ERROR: install the Heroku toolbelt first https://toolbelt.herokuapp.com/" >&2; exit 1; }
command -v workon > /dev/null 2>&1 || { echo "ERROR: install virtualenvwrapper first http://virtualenvwrapper.readthedocs.org/en/latest/install.html" >&2; exit 1; }

# Create a new virtualenv
echo "Creating the virtualenv 'my-project'..."
mkvirtualenv {{ cookiecutter.repo_name }} --python=3.4

echo "Installing the project's local Python dependencies..."
pip install -r requirements/local.txt

echo "Installing the project's Node dependencies..."
npm install

echo "Creating a new database (your PostgreSQL server must be running)"
psql -c "CREATE DATABASE {{ cookiecutter.repo_name }}"

echo "All set and ready to rock!"
