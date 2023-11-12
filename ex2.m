% Задаємо значення параметру А
A_values = [48];
% Ініціалізуємо матриці для зберігання x1 і x2 значень
x1_values = zeros(100, length(A_values));
x2_values = zeros(100, length(A_values));
% Перебираємо значення параметру А
for i = 1:length(A_values)
    A = A_values(i);
    % Генеруємо значення x2 в діапазоні від 0 до 2*A з кроком 100 точок
    x2 = linspace(0, 2*A, 100);
    % Обчислюємо відповідні значення x1
    x1 = 2*A - x2;
    % Зберігаємо x1 і x2 відповідно до значення параметру А
    x1_values(:, i) = x1;
    x2_values(:, i) = x2;
end
% Координати РТ (Робочої Точки)
RT_x1 = 48;
RT_x2 = 48;
% Створюємо фігуру для графіків
figure;
% Графік нейтральної функції переваги для всіх значень А
plot(x1_values, x2_values, 'Color', 'black');
xlim([0 120]);
ylim([0 120]);
hold on;
% Відображення РТ на графіку
scatter(RT_x1, RT_x2, 100, 'yellow', 'filled', 's', 'MarkerEdgeColor', 'black');
text(RT_x1, RT_x2, 'РТ', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
% Додавання підписів та заголовка графіку
xlabel('x1');
ylabel('x2');
title({'Функції переваги нейтральної, песимістичної та оптимістичної позицій ЛПР'}, 'FontSize', 10);
% Відображення легенди
legend('A=48', 'Location', 'NorthEast');
grid on;
% Задаємо коефіцієнти для побудови парабол
k1 = 0.005; % Коефіцієнт песимістичної параболи
k2 = -0.005; % Коефіцієнт оптимістичної параболи
% Діапазон значень x1
x1_range = -96:96;
% Обчислення значень x2 для песимістичної і оптимістичної парабол
x2_pessimistic = k1 * x1_range.^2;
x2_optimistic = k2 * x1_range.^2;
% Перетворення координат для песимістичної параболи (поворот на 45 градусів)
x1_pessimistic_rotated = x2_pessimistic * cosd(45) - x1_range * sind(45) + 48;
x2_pessimistic_rotated = x2_pessimistic * cosd(45) + x1_range * sind(45) + 48;
% Перетворення координат для оптимістичної параболи (поворот на 45 градусів)
x1_optimistic_rotated = x2_optimistic * cosd(45) - x1_range * sind(45) + 48;
x2_optimistic_rotated = x2_optimistic * cosd(45) + x1_range * sind(45) + 48;
% Додавання графіків песимістичної та оптимістичної парабол
plot(x1_pessimistic_rotated, x2_pessimistic_rotated, 'LineStyle', '--', 'Color', 'blue'); 
plot(x1_optimistic_rotated, x2_optimistic_rotated, 'LineStyle', '--', 'Color', 'red'); 
% Додавання легенди для песимістичної та оптимістичної парабол
legend('A=48', 'РТ','Песимістична позиція', 'Оптимістична позиція', 'Location', 'NorthEast');
