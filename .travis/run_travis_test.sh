#! /bin/bash

PYTHON=${PYTHON:-python}

run_test()
{
  mkdir -p _test
  cd _test

  INSTALLDIR=$($PYTHON -c "import os; import landlab; print(os.path.dirname(landlab.__file__))")

  echo $(which python)
  echo $(ls /home/travis/miniconda/envs/test-env/lib/python2.7/site-packages)
  echo $(python -c 'import yaml; print(yaml.__path__)')
  conda list
  coverage run --source=$INSTALLDIR ../scripts/test-installed-landlab.py --doctest && (coverage report && cp .coverage ..)
}

run_test
