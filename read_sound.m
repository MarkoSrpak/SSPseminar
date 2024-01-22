function [x_limited, fs] = read_sound(ime_dat)

[x, fs] = audioread(ime_dat);
FS = 44100;
x = x(:, 1);

assert(fs == FS);
assert(length(x) >= FS*4);

x = x - mean(x);
x = x / sqrt(mean(x.*x));
x_limited = x((FS*0+1):((FS*4)-1))';

end