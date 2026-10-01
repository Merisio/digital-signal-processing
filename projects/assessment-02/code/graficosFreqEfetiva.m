function graficosFreqEfetiva(fout, H)

figure;
semilogx(fout, abs(H),'linewidth',2);
xlabel('Frequência (Hz)');
ylabel('Magnitude (abs)');
axis([10^0 10^4 0 1]);
grid on;

end