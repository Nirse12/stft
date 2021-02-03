function [S] = my_stft(s, v, R , M)
    m = 0:M-1;
    len_s = length(s); % length of input
    len_v = length(v); % length of window
    last_frame_index = (len_s - len_v) + 1; % the last frame
    index
    frames_iter = 1:R:last_frame_index; % cut to frames
    num_of_frames = length(frames_iter); % number of total frames
    n = 0:num_of_frames-1;
    z_k = zeros(M, num_of_frames); % preping the stft matrix
    v_l2r = fliplr(v); % for the convolution
    for frame_index = frames_iter % runs on each frame
        k = (frame_index-1)/R; % mapping k to an index
        s_f = s(frame_index:frame_index+len_v-1); % signal frame
        based
        res = s_f .* v_l2r; % convolving with window
        res = sum(reshape(res, M, len_v/M), 2); % reshaping and
        summing
        res = fft(res); % fft res
        z_k(:, k+1) = res; % inserting res into z_k
    end
    W_k_n = exp((-1j*2*pi*R/M).*(m'*n));
    S = z_k .* W_k_n; % stft final
end