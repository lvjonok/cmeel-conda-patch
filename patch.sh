# first argument is conda env name

# activate conda env
eval "$(conda shell.bash hook)"
conda activate $1

# create needed files
cd $CONDA_PREFIX
mkdir -p ./etc/conda/activate.d
mkdir -p ./etc/conda/deactivate.d
touch ./etc/conda/activate.d/env_vars.sh
touch ./etc/conda/deactivate.d/env_vars.sh

# ensure that cmeel is installed
python3 -m pip install cmeel

# add cmeel to LD_LIBRARY_PATH on activate
echo "export ORIG_LD_LIBRARY_PATH=$LD_LIBRARY_PATH" >> ./etc/conda/activate.d/env_vars.sh
echo "export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH:$(python3 -m cmeel lib)" >> ./etc/conda/activate.d/env_vars.sh

# remove cmeel from LD_LIBRARY_PATH on deactivate
echo "export LD_LIBRARY_PATH=$ORIG_LD_LIBRARY_PATH" >> ./etc/conda/deactivate.d/env_vars.sh