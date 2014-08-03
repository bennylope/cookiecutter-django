FROM ubuntu:14.04
MAINTAINER {{ cookiecutter.author_name }} "{{ cookiecutter.email }}"
RUN apt-get -qq update
RUN apt-get install -y python-dev python-setuptools supervisor git-core
RUN easy_install pip
RUN pip install virtualenv
RUN pip install uwsgi
RUN virtualenv --no-site-packages /opt/venv/{{ cookiecutter.repo_name }}
ADD . /opt/apps/{{ cookiecutter.repo_name }}
ADD .docker/supervisor.conf /opt/supervisor.conf
ADD .docker/run.sh /usr/local/bin/run

# Not wholly sure why the repository needs to be identified *within* the Docker
# container for the time being.
# RUN (cd /opt/apps/{{ cookiecutter.repo_name }} && git remote rm origin)
# RUN (cd /opt/apps/{{ cookiecutter.repo_name }} && git remote add origin https://github.com/username/repo-name.git)

RUN /opt/venv/{{ cookiecutter.repo_name }}/bin/pip install -r /opt/apps/{{ cookiecutter.repo_name }}/requirements.txt
RUN (cd /opt/apps/{{ cookiecutter.repo_name }} && /opt/venv/{{ cookiecutter.repo_name }}/bin/python manage.py syncdb --noinput)
RUN (cd /opt/apps/{{ cookiecutter.repo_name }} && /opt/venv/{{ cookiecutter.repo_name }}/bin/python manage.py collectstatic --noinput)
EXPOSE 8000
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
