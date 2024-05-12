sudo apt update && sudo apt upgrade -y
sudo apt install nvidia-driver-550 nvidia-cuda-toolkit - y
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
conda create -n ml python=3.11
conda activate ml
conda install -c conda-forge tensorflow
python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
conda activate ml
python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
pip install numpy matplotlib tensorflow scikit-learn scikit-image pillow pandas tensorflow-datasets tf-explain opencv-python jinja2 progressbar2
