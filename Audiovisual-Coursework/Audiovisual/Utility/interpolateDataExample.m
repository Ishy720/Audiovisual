vid_len = 547;
aud_len = 573;

video_features = rand(vid_len, 6);
audio_features = rand(aud_len, 13);

new_video_features = dg_visual_feature_interp(video_features, audio_features);

disp("audio time steps:") 
disp(length(audio_features))
disp("video time steps:")
disp(length(video_features))
disp("new video time steps:")
disp(length(new_video_features))


