find . -iname "*.jpg" |xargs -l -i convert {}  -modulate 100,150,92 -scale 800x600 {}-out.jpg
