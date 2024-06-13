conda create -n please python=3.10
conda activate please
conda config --add channels conda-forge 
conda config --set channel_priority strict
conda install cudatoolkit=11.8  tensorflow
conda uninstall cudnn
conda install cudnn
python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"

