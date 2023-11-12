% Задамо значення параметру A
A_values = [33, 43, 53, 63, 73];
% Створимо фігуру для графіків
figure;
% Пройдимося по різним значенням A
for i = 1:length(A_values)
    A = A_values(i);
    % Створимо вектор значень x_2
    x2 = linspace(0, 160, 20); % Від 0 до 160 з 20 кроків
    % Обчислимо відповідні значення x_1 за рівнянням x_1=2A-x_2
    x1 = 2 * A - x2;
    % Побудуємо лінію переваги
    plot(x2, x1, 'DisplayName', sprintf('A = %d', A));
    hold on;
end
% Додамо функцію легенди та підписи вісей
legend;
xlabel('x_2');
ylabel('x_1');
title('Функція переваги: x_1 = 2A - x_2');
% Встановимо обмеження на вісі x та y для зручності
xlim([0, 160]);
ylim([0, 160]);
% Відобразимо сітку для легшого аналізу
grid on;
% Збережемо графік в зображення
% saveas(gcf, 'функція_переваги.png');