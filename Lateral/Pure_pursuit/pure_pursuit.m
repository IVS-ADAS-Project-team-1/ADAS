function steering_angle = pure_pursuit(coeff, ego_velocity)
    % coeff: 다항식 계수 (poly_coeff)
    % ego_velocity: 자차 속도
    % lookahead_distance: 추적할 거리
    lookahead_distance = max(1 * ego_velocity, 5); % Lookahead 거리 계산 (속도에 비례)
    L = 3; % 자차의 휠베이스 (기본값 3m)

    % Lookahead 지점 계산
    x_lookahead = lookahead_distance; % Lookahead 거리 내 x 값 계산
    y_lookahead = polyval(coeff, x_lookahead); % 다항식을 통한 y 값 계산

    % Lookahead 지점에서 자차와의 거리와 각도 계산
    alpha = atan2(y_lookahead, x_lookahead); % Lookahead 지점과 자차 위치 간의 각도 계산

    % Pure Pursuit Steering Angle 계산
    steering_angle = atan(2 * L * sin(alpha) / lookahead_distance);
end