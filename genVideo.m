clear; close all; clc

% Set video file name
videoName   = "yourVideo.avi";

% Set name of folder with screenshots
folderName  = "yourScreenshotsFolder";

% Create video object
vid     = VideoWriter(videoName);

% Set frame rate
vid.FrameRate = 10;

% Open file to write
open(vid);

% Open folder and get number of elements
directory = dir(folderName + '*.png');

% Time information
dt  = 1 / vid.FrameRate;
t   = 0.0;

% Loop through screenshots and append to video file
for i = 1:numel(directory)
    % Update time
    t   = t + dt;

    % Get time string for current file
    if abs(round(t) - t) < 0.0001
        fileTimeStr = num2str(t,'%0.0f');
    else
        fileTimeStr = num2str(t,'%0.1f');
    end

    % Construct full file path
    name = folderName + "sim_0_t=" + fileTimeStr + "s.png";
  
    % Read image and write to video
    I = imread(name); 
    writeVideo(vid,I);
end
close(vid);
