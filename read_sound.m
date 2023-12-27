function [x_limited, fs] = read_sound(ime_dat)

[x, fs] = audioread(ime_dat);
FS = 48000;
x = x(:, 1);

assert(fs == FS);
assert(length(x) >= FS*6);

x = x - mean(x);
x = x / sqrt(mean(x.*x));
x_limited = x((FS*5):(FS*6))';

end