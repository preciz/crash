# crash - This crashes something somewhere

## Steps

1. Build docker image
```bash
git clone https://www.github.com/preciz/crash
cd crash
wget 'https://huggingface.co/TheBloke/Llama-2-7B-GGML/resolve/main/llama-2-7b.ggmlv3.q4_K_M.bin'
docker build . -t embedding
```

2. Install Elixir for the stress test scripts:
```bash
pacman -S elixir
```

3. Run the stress test
```bash
elixir start.exs
```
