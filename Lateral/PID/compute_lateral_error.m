function lateral_error = compute_lateral_error(velocity, lookahead_time, poly_coeff)
    % 입력:
    % velocity: 차량의 속도 (스칼라 값)
    % lookahead_time: 예측 시간 (스칼라 값)
    % poly_coeff: 경로의 다항식 계수 (벡터)
    
    % 출력:
    % lateral_error: 측면 오차 (스칼라 값)
    
    % Lookahead Distance 계산
    lookahead_distance = velocity * lookahead_time;  % 예측 거리 = 속도 * 예측 시간
    
    % 다항식을 사용하여 Lookahead 거리에서의 y값 계산
    lateral_error = polyval(poly_coeff, lookahead_distance);
    
    % 실제 오차는 실수값으로만 반환 (복소수 방지)
    lateral_error = real(lateral_error);
end