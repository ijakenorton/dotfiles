conda create -n ml python=3.11
conda activate ml
conda config --add channels conda-forge 
conda config --set channel_priority strict
conda install cudatoolkit=11.8
conda install tensorflow
python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
