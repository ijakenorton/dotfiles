curl https://sh.rustup.rs -sSf | sh -s
git clone --depth=1 --branch=main --recursive https://github.com/wez/wezterm.git
cd ./wezterm
git submodule update --init --recursive
./get-deps
cargo build --release
cargo run --release --bin wezterm -- start
cd ..
rm -rf ./wezterm
