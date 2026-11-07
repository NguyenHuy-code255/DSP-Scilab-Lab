// 1. Tao mot tin hieu am thanh (song sin 440Hz)
Fs = 44100; // Tan so lay mau (44.1 kHz)
t = 0:1/Fs:2; // Thoi gian: 2 giay
f = 440; // Tan so: 440 Hz
y = sin(2 * %pi * f * t); // Tao tin hieu
// 2. Phat am thanh vua tao
playsnd(y, Fs);

// 3. Ghi ra file .wav
wavwrite(y, Fs, "test_audio.wav");

// 4. Doc lai tu file va ve do thi 0.01 giay dau tien
[y_read, Fs_read] = wavread("test_audio.wav");
t_plot = 0:1/Fs:0.01;
samples_to_plot = length(t_plot);

clf();
plot(t_plot, y_read(1:samples_to_plot));
title('Tin hieu am thanh (0.01s dau tien)');
xlabel('Thoi gian (s)');
ylabel('Bien do');
