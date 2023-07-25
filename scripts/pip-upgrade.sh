cp requirements-devel.txt /tmp/
cd /tmp/
pip-upgrade requirements-devel.txt --skip-virtualenv-check -p all
cat requirements-devel.txt
