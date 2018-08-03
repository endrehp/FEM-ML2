%% Frequency spectrum

r_spec = fft(D(:,end-1));
r_spec = r_spec/max(abs(r_spec));

f_spec = fft(ft);
f_spec = f_spec/max(abs(f_spec));
figure

x = (0:k/2)*1/(tf);
hold on
plot(x,abs(r_spec(1:length(x))), 'DisplayName', 'response');
plot(x,abs(f_spec(1:length(x))), 'r', 'DisplayName', 'input');
legend('show')
