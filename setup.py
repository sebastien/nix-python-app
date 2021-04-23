#!/usr/bin/env python3
from distutils.core import setup
setup(
    name="nix-python-app",
    package_dir={"": "src/py"},
    packages=["nixpythonapp", ],
    scripts=["bin/nix-python-app"],
    install_requires=["pytz"]
)
# EOF
