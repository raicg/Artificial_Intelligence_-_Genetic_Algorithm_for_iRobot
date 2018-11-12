function finalRad= ExampleControlProgram(serPort)

    
    % Set constants for this program
    maxDuration= 1200;  % Max time to allow the program to run (s)
    maxFwdVel= 0.5;     % Max allowable forward velocity with no angular 
                        % velocity at the time (m/s)   
    
    % Initialize loop variables
    tStart= tic;        % Time limit marker
    
    % Enter main loop
    while toc(tStart) < maxDuration
        % Check for and react to bump sensor readings
        % 1 - right, 2 - front, 3 - left, 4 - back
        front = ReadSonarMultiple(serPort,2);
        right = ReadSonarMultiple(serPort,1);
        left = ReadSonarMultiple(serPort,3);
        
        % Check for bugs on sensors reading
        if length([right; front; left])==3
            %[status,term_out] = system(['swipl -s plscript.pl ',num2str(left),' ',num2str(front),' ',num2str(right)])
            %wheels_speeds =  str2num(term_out);
            % If the sensors bug, rotate the robot
            %SetDriveWheelsCreate(serPort,wheels_speeds(1),wheels_speeds(2));
        else
            % If the sensors bug, rotate the robot
            SetDriveWheelsCreate(serPort,0.0,0.0);
        end
        % Get robot position
        [x y th]= OverheadLocalizationCreate(serPort);
        
        % Print a red star on the robot position
        %plot(x,y,'r*');
        %end
        
        x = 3;
        y = 3;
        prev_x = 3;
        prev_y = 3;
        i = 0;
        while i < 4
            start_x = prev_x;
            start_y = prev_y;
            move_x = rand*8 - 4;
            move_y = rand*8 - 4;

            isvalid = valid_point(start_x,start_y,move_x,move_y);
            if isvalid == 1
                x = [x;move_x];
                y = [y;move_y];
                plot(x,y);
                prev_x = move_x;
                prev_y = move_y;
                i = i+1
            end

        end

        
        
        pause(1)
    end
    
    % Specify output parameter
    finalRad= 0;
    
    % Stop the robot
    SetFwdVelAngVelCreate(serPort,0,0)
end