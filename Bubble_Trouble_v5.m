function Bubble_Trouble_v5
%----------CONSTANTS-------------------
characterright = false; %character not initially moving
characterleft = false;
character_array = [];
characterlocation = [];
character_x = [2.3 2]; %initial location of character
character_y = [0.3 0];

ball1_alive = []; %creating constants/variables
ball_array = [];
ball1_location = [];
ball1_x = [];
ball1_y = [];

ball2_alive = [];
ball2_location = [];
ball2_x = [];
ball2_y = [];

split1 = [];
split1_x = [6.3 6]; %values are off the screen to prevent issues
split1_y = [6.3 6]; %initial ball locations and whether they exist
split1_alive = false;
split2 = [];
split2_x = [6.3 6];
split2_y = [6.3 6];
split2_alive = false;
split3 = [];
split3_x = [6.3 6];
split3_y = [6.3 6];
split3_alive = false;
split4 = [];
split4_x = [6.3 6];
split4_y = [6.3 6];
split4_alive = false;

fireball_array = [];
fireball = false;
movefireball = false;
fireball_x = [7 7.3];
fireball_y = [7 7.3];
fireballlocation = [];

storm_array = [];
movestorm = false;
hail = false;
stormq = [];

scoret = []; %high score text
scoretext = [];
scorelabel = [];
score = 1000; %initial score set
highscore = [];

q = [];
q_alive = false; %question box intials
q_x = [];
q_y = [0.2 0];
qspot = [];
question_array = [];
questim = [];

storm_x = []; %storm parts initials
storm_y = [5 4.6];
storm_x2 = [];
storm_y2 = [5 4.6];
stormimage2 = [];
stormimage = [];

candie = true; %character can die initially

life_num = 3; %number of lives you start with
life1 = []; %defines images that show lives
life2 = [];
life3 = [];
life4 = [];
life5 = [];
life_y = [4 3.8]; %set locations of these images
life_x1 = [4 3.8];
life_x2 = [3.7 3.5];
life_x3 = [3.4 3.2];
life_x4 = [3.1 2.9];
life_x5 = [2.8 2.6];

dt = 0.01; %these are all variables used to formulate
%ball motion
ay = -2;
vx = 0.75;
vy = -0.75;
vx1 = 2;
vx2 = -2;
vx3 = 2;
vx4 = -2;
vy2 = -2;
vy1 = -2;
vy3 = -2;
vy4 = -2;
vx_2 = -0.75;
vy_2 = -0.75;
fig = [];

t = 1; %used as a tic/toc type feature
t2 = 1;
t3 = 1;

o = 0.8; %values for array to be gray

introtext = []; %all the texts that will be used
level1_text = [];
level2_text = [];
level3_text = [];
level4_text = [];
lifetext = [];
fulllifetext = [];
death_text = [];
shrinktext = [];
expandtext = [];

level3 = false; %once true balls flash

chop = true; %initially, character can shrink

played = 1; %once played = 2 there is high score
%----------------ARRAYS--------------------
character_array = ones(15,15,3);

%array of main character
character_array(1,:,1) =  [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
character_array(2,:,1) =  [1 1 1 1 o o 1 1 1 o o 1 1 1 1];
character_array(3,:,1) =  [1 1 o 1 o 1 o o o 1 o 1 o 1 1];
character_array(4,:,1) =  [1 1 o 1 1 o 1 1 1 o 1 1 o 1 1];
character_array(5,:,1) =  [1 1 o o o o 1 1 1 o o o o 1 1];
character_array(6,:,1) =  [1 1 1 1 1 o o o o o 1 1 1 1 1];
character_array(7,:,1) =  [1 1 1 1 1 o o o o o 1 1 1 1 1];
character_array(8,:,1) =  [1 1 1 1 1 o o o o o 1 1 1 1 1];
character_array(9,:,1) =  [1 1 1 1 1 o o o o o 1 1 1 1 1];
character_array(10,:,1) = [1 1 1 1 1 o o o o o 1 1 1 1 1];
character_array(11,:,1) = [1 1 1 1 o o o o o o o 1 1 1 1];
character_array(12,:,1) = [1 1 1 1 o 1 1 1 1 1 o 1 1 1 1];
character_array(13,:,1) = [1 1 1 1 o 1 1 1 1 1 o 1 1 1 1];
character_array(14,:,1) = [1 1 o o o 1 1 1 1 1 o o o 1 1];
character_array(15,:,1) = [1 1 o o o 1 1 1 1 1 o o o 1 1];

character_array(:,:,2) = character_array(:,:,1);
character_array(:,:,3) = character_array(:,:,1);

%array of balls
ball_array(1,:,1) = [1 1 1 o o o o 1 1 1];
ball_array(2,:,1) = [1 1 o o o o o o 1 1];
ball_array(3,:,1) = [1 o o o o o o o o 1];
ball_array(4,:,1) = [o o o o o o o o o o];
ball_array(5,:,1) = [o o o o o o o o o o];
ball_array(6,:,1) = [o o o o o o o o o o];
ball_array(7,:,1) = [1 o o 1 o o o o o 1];
ball_array(8,:,1) = [1 1 o 1 1 o o o 1 1];
ball_array(9,:,1) = [1 1 1 o o o o 1 1 1];

ball_array(:,:,2) = ball_array(:,:,1);
ball_array(:,:,3) = ball_array(:,:,1);

fireball_array = ones(5,5,3);
%array of fireballs
fireball_array(1,:,1) = [1 1 o 1 1];
fireball_array(2,:,1) = [1 o o o 1];
fireball_array(3,:,1) = [o o o o o];
fireball_array(4,:,1) = [o o o o o];
fireball_array(5,:,1) = [o 1 o 1 o];

fireball_array(:,:,2) = fireball_array(:,:,1);
fireball_array(:,:,3) = fireball_array(:,:,1);

%array for question mark boxes
question_array(1, :, 1) = [o 1 o o o o o 1 o];
question_array(2, :, 1) = [o 1 o 1 1 1 o 1 o];
question_array(3, :, 1) = [o 1 1 1 1 1 o 1 o];
question_array(4, :, 1) = [o 1 1 1 1 1 o 1 o];
question_array(5, :, 1) = [o 1 1 1 o o 1 1 o];
question_array(6, :, 1) = [o 1 1 1 o 1 1 1 o];
question_array(7, :, 1) = [o 1 1 1 o 1 1 1 o];
question_array(8, :, 1) = [o 1 1 1 1 1 1 1 o];
question_array(9, :, 1) = [o 1 1 1 o 1 1 1 o];

question_array(:,:,2) = question_array(:,:,1);
question_array(:,:,3) = question_array(:,:,1);

smile_array = ones(10, 10, 3);
%array for lives images
smile_array(1,:,1) = [1 1 1 1 1 1 1 1 1 1];
smile_array(2,:,1) = [1 1 1 o o o o 1 1 1];
smile_array(3,:,1) = [1 1 o 1 1 1 1 o 1 1];
smile_array(4,:,1) = [1 o 1 o 1 1 o 1 o 1];
smile_array(5,:,1) = [o 1 1 1 1 1 1 1 1 o];
smile_array(6,:,1) = [o 1 1 o 1 1 o 1 1 o];
smile_array(7,:,1) = [1 o 1 1 o o 1 1 o 1];
smile_array(8,:,1) = [1 1 o 1 1 1 1 o 1 1];
smile_array(9,:,1) = [1 1 1 o o o o 1 1 1];
smile_array(10,:,1) = [1 1 1 1 1 1 1 1 1 1];

smile_array(1,:,2) = smile_array(1,:,1);
smile_array(1,:,3) = smile_array(1,:,1);

storm_array = ones(5, 5, 3);
%array for storm images
storm_array(1,:,1) = [o 1 1 1 o];
storm_array(2,:,1) = [o o 1 o o];
storm_array(3,:,1) = [o o o o o];
storm_array(4,:,1) = [1 o o o 1];
storm_array(5,:,1) = [1 1 o 1 1];

storm_array(:,:,2) = storm_array(:,:,1);
storm_array(:,:,3) = storm_array(:,:,1);

%----------------LAUNCH GAME---------------
    function launchgame %this function actually launches the figure
        fig = figure('KeyPressFcn',@keydownlistener);
        %create figure relating to the key function
        set(fig,'color', 'w', 'MenuBar','None');
        %set background to white, turn off menubar
        set(fig,'Position', [100 100 900 700]);
        %set position of figure on screen
        axvalues=axes();
        %define axes
        axis(axvalues,'manual');
        axis(axvalues,[0 5 0 5]);
        %set axes to 0 to 5 on both
        axis(axvalues,'off');
        %turn off display of values
        set(axvalues,'YDir','normal')
        %increases in positive direction
        hold on
    end
%----------------INTRODUCTION--------------
    function introduction %this function displays text at intro screen
        introtext(1) = text(2.5, 4.5, 'Bubble Trouble', 'Fontsize', 40);
        introtext(2) = text(2.5, 3.5, 'By Nikhil Krishnan', 'Fontsize', 20);
        introtext(3) = text(2.5, 2.5, 'Press space to start','Fontsize', 20);
        introtext(4) = text(2.5, 1.5, 'Move with a & d, Space to shoot','Fontsize', 20);
        %set introtext locations and font size
        
        if played == 2
            highscore = score;
            introtext(5) = text(2.5, 1,'HIGH SCORE','Fontsize', 20);
            introtext(6) = text(2.5, 0.5,num2str(highscore), 'Fontsize', 20);
            played = 3;
            %once it has been played once, high score shown
        elseif played == 3
            if score > highscore
                highscore = score;
                introtext(5) = text(2.5, 1,'HIGH SCORE','Fontsize', 20);
                introtext(6) = text(2.5, 0.5,num2str(highscore), 'Fontsize', 20);
                %if score is higher, update high score
            end
            
        end
        for kk = 1:length(introtext)
            set(introtext(kk), 'HorizontalAlignment','Center','Color',[0.2 0.5 0.5]);
            %make introtext in middle and set the color
        end
         score = 1000; %reset score
    end
%-------------------------levelonetext------------------------------------
    function levelonetext %this function shows text before level one
        level1_text = text(2.5,2.5,'LEVEL ONE'); %show text
        for kk = 1:length(level1_text)
            set(level1_text(kk), 'HorizontalAlignment','Center', 'FontSize', 30);
        end %center text and change font size
        pause(3); %wait
        delete(level1_text); %delete text
    end
%-------------------------leveltwotext-------------------------------------
    function leveltwotext %this text shows text before level two ('')
        level2_text = text(2.5,2.5,'LEVEL TWO');
        for kk = 1:length(level2_text)
            set(level2_text(kk), 'HorizontalAlignment','Center', 'FontSize', 30);
        end
        pause(3);
        delete(level2_text);
    end
%-------------------------levelthreetext-------------------------------------
    function levelthreetext
        level3_text = text(2.5,2.5,'LEVEL THREE');
        for kk = 1:length(level3_text)
            set(level3_text(kk), 'HorizontalAlignment','Center', 'FontSize', 30);
        end
        pause(3);
        delete(level3_text);
    end
%-------------------------levelfourtext-------------------------------------
    function levelfourtext %this text shows text before level four ('')
        level4_text = text(2.5,2.5,'LEVEL FOUR');
        for kk = 1:length(level4_text)
            set(level4_text(kk), 'HorizontalAlignment','Center', 'FontSize', 30);
        end
        pause(3);
        delete(level4_text);
    end
%--------------SPLIT BALL------------------------------
    function[x1, y1, x2, y2]= split(x_coordinates, y_coordinates)
        %this is a function that takes in the [xmax xmin]
        % and [ymax ymin] of a ball and splits it
        %into two balls where x1 is [x1min x1max]
        %x2 is [x2min x2max], same with y values
        x1(1) = x_coordinates(1);
        x1(2) = x_coordinates(1) - 0.25;
        x2(1) = x_coordinates(2) + 0.25;
        x2(2) = x_coordinates(2);
        y1(1) = y_coordinates(1);
        y2(1) = y_coordinates(1);
        y1(2) = y_coordinates(2) + 0.25;
        y2(2) = y_coordinates(2) + 0.25;
        %these equations manipulate the size of the balls
        %to make them smaller than original ball
    end
%----------------SCORE TEXT----------------
    function scorefcn %this function defines the score
        scoret = scoret + 1;
        if scoret == 25 %over time score gets smaller and smaller
            score = score - 1;
            scoret = 0;
            delete(scoretext); %keep updating score display
            scoretext = text(4.4,4.6,num2str(score),'FontSize', 20);
            %displays "score"
        end
    end
%------------------QUESTION MARK-------------
    function question %this function creates and functions
        %question mark boxes
        if q_alive == false %if a box doesn't exist
            q = randi(1000); %makes it very random for box to appear
            if q == 1 || q == 2
                qspot = randi(3);
                if qspot == 1
                    q_x = [1.2 1]; %chooses the location of the box randomly
                elseif qspot == 2
                    q_x = [2.2 2];
                else
                    q_x = [3.2 3];
                end
                questim = image(q_x, q_y, question_array);
                q_alive = true; %box already exists until picked up
            end
        end
        if q_alive == true && sum(character_x)/2 < ...
                q_x(2)+0.2 && sum(character_x)/2 > ...
                q_x(1)-0.2
            delete(questim); %box has been picked up
            q_alive = false;
            if q == 1 %half the time shrink the guy
                if chop == true
                    character_x(1) = character_x(1) - 0.05;
                    character_y(1) = character_y(1) - 0.05;
                    shrinktext = text(2.5,2.5,'SHRINK'); %display text
                    pause(1);
                    delete(shrinktext);
                    chop = false; %already shrunk
                elseif chop == false %if already shrunk expand him
                    character_x(1) = character_x(1) + 0.05;
                    character_y(1) = character_y(1) + 0.05;
                    expandtext = text(2.5,2.5,'EXPAND'); %display text
                    pause(1);
                    delete(expandtext);
                    chop = true; %can be shrunk again
                end
            elseif q == 2
                gainlife; %give another life
            end
        end
    end
%----------------function gainlife---------
    function gainlife %this function adds a life to the character
        if life_num < 5 %only add life if less than 5
            lifetext = text(2.5,2.5,'LIFE UP'); %display text
            if life_num == 1
                life2 = image(life_x2, life_y, smile_array); %add life 2
            elseif life_num == 2
                life3 = image(life_x3, life_y, smile_array); %add life 3 display
            elseif life_num == 3
                life4 = image(life_x4, life_y, smile_array); %add life 4 display
            elseif life_num == 4
                life5 = image(life_x5, life_y, smile_array); %add life 5 display
            end
            life_num = life_num + 1; %add life
            pause(0.5);
            delete(lifetext); %delete the life up showing
        else
            fulllifetext = text(2.5,2.5,'ALREADY FULL LIVES'); %if you have five lives
            pause(0.5);
            delete(fulllifetext);
        end
    end


%----------------GAME OVER-----------------
    function gameover %this function ends the game
        delete(life1); delete(life2);
        delete(life3); delete(life4); delete(life5);%you lost your last life
        delete(ball1_location); delete(ball2_location); %presets
        delete(split1); delete(split2); delete(split3);
        delete(split4); delete(stormimage); delete(stormimage2);
        delete(fireball); delete(characterlocation); 
        gameover_text = text(2.5,2.5,'GAME OVER!'); %show game over
        for kk = 1:length(gameover_text)
            set(gameover_text(kk), 'HorizontalAlignment','Center', 'FontSize', 30);
        end
        pause(1);
        delete(gameover_text);
        game = 2; %go to introduction screen
        life_num = 3; %reset lives
       if played == 1
            played = 2; %already played once
        elseif played == 2;
            played = 3; %played twice and up
       end
        delete(scoretext);
    end
%----------------UPDATE BALL---------------
    function [dx, dy, vx, vy] = updateBall(x,y,vx,vy,dt,ay)
        %function determines general movement of ball
        %using constant acceleration equations
        vyo = vy; xo = x; yo = y;
        vy = vyo + ay * dt;
        dx = vx * dt;
        dy = vyo * dt + 1/2 * ay * dt^2;
    end
%---------------UPDATE LOCATION--------------
%this function determines location of ball
%after collision simply by switching velocity signs
    function [vx,vy, x_coordinates, y_coordinates] = updateLocation(x_coordinates,y_coordinates,vx,vy,dt,ay)
        x = sum(x_coordinates)/2; y = sum(y_coordinates/2);
        if x > 0.2 && y > 0.2 &&...
                x < 4.8 && y < 4.8
            [dx, dy, vx, vy] = updateBall(x,y,vx,vy,dt,ay);
            x_coordinates = x_coordinates + dx;
            y_coordinates = y_coordinates + dy;
            
        elseif y < 0.2 %floor
            vy = -.95*vy; %every time lose a little
            y_coordinates = y_coordinates + 0.05;
            %move ball away from floor
        elseif x > 4.8 %rightwall
            vx = -.95*vx;
            x_coordinates = x_coordinates - 0.05;
        elseif x < 0.2
            vx = -.95*vx; %leftwall
            x_coordinates = x_coordinates + 0.05;
        end
    end
%-------------------------leveloneobjects---------------------------------
    function leveloneobjects %objects & initials to be created for level one
        chop = true; %guy is big again
        scoret = 1; %reset score timer
        scorelabel = text(4.4,4.8,'SCORE','FontSize',20); %show score display
        delete(life1); delete(life2); delete(life3);
        delete(life4); delete(life5); %delete all images that exist
        split2_x = [6.3 6]; %reset these values to avoid conflict
        split2_y = [6.3 6];
        split1_x = [6.3 6];
        split1_y = [6.3 6];
        vx = 0.75; vy = -0.75;
        vx1 = -0.75; vy1 = -0.75; %initials for the balls
        vx2 = 0.75; vy2 = -0.75;
        life1 = image(life_x1, life_y, smile_array);
        life2 = image(life_x2, life_y, smile_array); %recreate the lives
        life3 = image(life_x3, life_y, smile_array);
        life4 = image(life_x4, life_y, smile_array);
        life5 = image(life_x5, life_y, smile_array);
        if life_num < 5
            delete(life5);
        end
        if life_num < 4
            delete(life4);
        end
        if life_num < 3
            delete(life3);
        end
        if life_num < 2
            delete(life2);
        end
        if life_num < 1
            delete(life1);
        end
        %show the correct number of lives
        ball1_alive = true; %ball1 is alive
        ball1_x = [0.5 0]; %coordinates of ball 1
        ball1_y = [3 2.5];
        character_x = [2.3 2]; %initial character coordinates
        character_y = [0.3 0];
        characterlocation = image(character_x,character_y, character_array);
        %create character image
        ball1_location = image(ball1_x, ball1_y, ball_array); %create ball image
        candie = true; %character can now die
    end
%-------------------------leveltwoobjects--------------------------------
    function leveltwoobjects %creates objects/intials for level two and above
        chop = true;
        delete(life1); delete(life2); delete(life3); candie = true;
        delete(life4); delete(life5); delete(characterlocation);
        delete(fireballlocation); delete(ball1_location); delete(ball2_location);
        delete(split1); delete(split2); delete(split3); delete(split4);
        %delete all images
        fireball_x = [6.3 6];
        fireball_y = [6.3 6];
        split2_x = [6.3 6]; %preset these locations to avoid conflict
        split2_y = [6.3 6];
        split1_x = [6.3 6];
        split1_y = [6.3 6];
        split3_x = [6.3 6];
        split3_y = [6.3 6];
        split4_x = [6.3 6];
        split4_y = [6.3 6];
        storm_x = [6.3 6];
        storm_x2 = [6.3 6];
        storm_y = [6.3 6];
        storm_y2 = [6.3 6];
        vx = 0.75; vy = -0.75; %reset all initials for balls
        vx1 = 0.75; vy1 = -0.75;
        vx2 = -0.75; vy2 = -0.75;
        vx3 = 0.75; vy3 = -0.75;
        vx4 = -0.75; vy4 = -0.75;
        vx_2 = -0.75; vy_2 = -0.75;
        life1 = image(life_x1, life_y, smile_array); %create life images
        life2 = image(life_x2, life_y, smile_array);
        life3 = image(life_x3, life_y, smile_array);
        life4 = image(life_x4, life_y, smile_array);
        life5 = image(life_x5, life_y, smile_array);
        if life_num < 5
            delete(life5);
        end
        if life_num < 4
            delete(life4);
        end
        if life_num < 3
            delete(life3);
        end
        if life_num < 2
            delete(life2);
        end
        if life_num < 1
            delete(life1);
        end
        %set the correct number of lives
        ball1_alive = true;
        ball2_alive = true;
        split1_alive = false; split2_alive = false;
        split3_alive = false;
        split4_alive = false; %set all balls alive
        ball1_x = [0.5 0]; %set locations of balls
        ball1_y = [3 2.5];
        ball2_x = [4.5 4];
        ball2_y = [3 2.5];
        character_x = [2.3 2];
        character_y = [0.3 0]; %set location of character
        characterlocation = image(character_x,character_y, character_array);
        ball1_location = image(ball1_x, ball1_y, ball_array);
        ball2_location = image(ball2_x,ball2_y,ball_array);
        %create relevant images
        candie = true; %character can die
    end

%-------------------------movecharacter----------------------------------
    function movecharacter %this function moves the character
        if characterright == true %when d is pressed
            delete(characterlocation);
            if character_x < 5 %as long as not on right end
                character_x = character_x + .1; %move right
                characterlocation = image(character_x,character_y, character_array);
            end
        elseif characterleft == true %as long as not on left end
            delete(characterlocation);
            if character_x(1) > 0.3 && character_x(2) > 0
                character_x = character_x - .1; %move left
                characterlocation = image(character_x,character_y, character_array);
            end
        end
        characterright = false; %reset so character stops moving
        characterleft = false;
    end
%----------------------------------moveball1--------------------------
    function moveball1 %this function controls the movement of ball 1
        delete(ball1_location);
        if ball1_alive == true %use function frombefore
            [vx,vy, ball1_x, ball1_y] = updateLocation(ball1_x,ball1_y,vx,vy,dt,-2);
            if level3 == true
                t = t+1;
                if t > 100 && t < 200 %makes ball appear only at periods
                    %of time, harder to see
                    ball1_location = image(ball1_x, ball1_y, ball_array);
                elseif t == 200
                    %reset timer
                    t = 0;
                end
            else
                ball1_location = image(ball1_x, ball1_y, ball_array);
            end
            
        end
    end
%----------------------------------moveball2-------------------------
    function moveball2 %this function controls movement of ball 2
        %is same as above
        delete(ball2_location);
        if ball2_alive == true
            [vx_2,vy_2, ball2_x, ball2_y] = updateLocation(ball2_x,ball2_y,vx_2,vy_2,dt,-2);
            if level3 == true
                t2 = t2 + 1;
                if t2 > 100 && t2 < 200
                    ball2_location = image(ball2_x, ball2_y, ball_array);
                elseif t2 == 200
                    t2 = 0;
                end
            else
                ball2_location = image(ball2_x, ball2_y, ball_array);
            end
        end
    end

%----------------------------------move storm---------------------------
    function storm %function for last level air strikes
        if hail == false
            storm_y = [5 4.6]; %sets initial y values of storm
            storm_y2 = [5 4.6];
            t3 = t3 + 1;
            stormq = randi(5); %random
            if stormq == 1
                storm_x = [0.4 0]; %these select the random locations of
                %the storms
                storm_x2 = [2.4 2];
            elseif stormq == 2
                storm_x = [1.4 1];
                storm_x2 = [4.4 4];
            elseif stormq == 3
                storm_x = [2.4 2];
                storm_x2 = [3.4 3];
            elseif stormq == 4
                storm_x = [3.4 3];
                storm_x2 = [0.4 0];
            elseif stormq == 5
                storm_x = [4.4 4];
                storm_x2 = [1.4 1];
            end
        end
        if t3 == 2 %every two stops MAKE IT RAIN
            hail = true;
            t3 = 1;
        end
        
        if hail == true && movestorm == false
            stormimage = image(storm_x, storm_y, storm_array);
            stormimage2 = image(storm_x2, storm_y2, storm_array);
            movestorm = true; %create images & move them
        elseif hail == true && movestorm == true %ready to move images
            if storm_y(2) > 0 && movestorm == true
                delete(stormimage); %when it reaches bottom delete
                delete(stormimage2);
                stormimage = image(storm_x, storm_y, storm_array);
                stormimage2 = image(storm_x2, storm_y2, storm_array);
                storm_y = storm_y - 0.1;
                storm_y2 = storm_y2 - 0.1; %slowly move images down
            elseif storm_y(2) <= 0
                movestorm = false; %images are done moving, reset
                delete(stormimage);
                delete(stormimage2);
                hail = false;
            end
        end
    end

%----------------------------------shoot fireball---------------------
    function shoot %this function fires fireball into air
        if fireball == true && movefireball == false
            %if space is hit run  this
            fireball_x(1) = character_x(1) - 0.1;
            fireball_x(2) = character_x(2) + 0.1;
            fireball_y(1) = character_y(1) + 0.2;
            fireball_y(2) = character_y(2) + 0.3;
            %initialize the location of the fireball
            fireball = false;
            %can't shoot again
            movefireball = true;
            %fireball is moving now
            fireballlocation = image(fireball_x,fireball_y,fireball_array);
        end
        if fireball_y(2) < 5 && movefireball == true
            delete(fireballlocation);
            fireballlocation = image(fireball_x,fireball_y,fireball_array);
            fireball_y = fireball_y + 0.1;
            %move fireball up till off screen
            
        elseif fireball_y(2) >= 5
            movefireball = false;
            delete(fireballlocation);
            %once fireball is off, reset
        end
    end
%----------------------------------split ball one---------------------
    function splitball1
        if ball1_alive == true
            if ball1_x(1) > fireball_x(1) ...
                    && ball1_x(2) < fireball_x(2) ...
                    && ball1_y(1) > fireball_y(1) ...
                    && ball1_y(2) < fireball_y(2)
                %if a fireball makes contact with a ball
                [split1_x, split1_y, split2_x, split2_y] = split(ball1_x, ball1_y);
                %create the two splits
                split1 = image(split1_x,split1_y,ball_array);
                split2 = image(split2_x, split2_y, ball_array);
                delete(fireballlocation);
                %get rid of fireball, ball no logner alive
                ball1_alive = false;
                fireball_x = [6 6.3];
                fireball_y = [6 6.3];
                %move these off screen to avoid conflict
                movefireball = false;
                split1_alive = true;
                split2_alive = true;
                ball1_x = [6.3 6];
                ball1_y = [6.3 6]; %get this out of way
            end
        end
    end
%----------------------------------split ball two---------------------
    function splitball2 %same function as above for ball 2
        if ball2_alive == true
            if ball2_x(1) > fireball_x(1) ...
                    && ball2_x(2) < fireball_x(2) ...
                    && ball2_y(1) > fireball_y(1) ...
                    && ball2_y(2) < fireball_y(2)
                [split3_x, split3_y, split4_x, split4_y] = split(ball2_x, ball2_y);
                split3 = image(split3_x,split3_y,ball_array);
                split4 = image(split4_x, split4_y, ball_array);
                delete(fireballlocation);
                ball2_alive = false;
                fireball_x = [6.3 6];
                fireball_y = [6.3 6];
                movefireball = false;
                split3_alive = true;
                split4_alive = true;
                ball2_x = [6.3 6];
                ball2_y = [6.3 6];
            end
        end
    end
%----------------------------------move splits 2------------------------
    function movesplits_2 %make the splits move. it is the same function
        %as the one moving balls 1 and two
        if split3_alive == true
            delete(split3);
            [vx3,vy3, split3_x, split3_y] = updateLocation(split3_x,split3_y,vx3,vy3,dt,ay);
            split3 = image(split3_x, split3_y, ball_array);
        end
        if split4_alive == true
            delete(split4);
            [vx4,vy4, split4_x, split4_y] = updateLocation(split4_x,split4_y,vx4,vy4,dt,ay);
            split4 = image(split4_x, split4_y, ball_array);
        end
        if split3_x(1) > fireball_x(1) ... %add some space
             ...   %because balls are smaller than before
            && split3_x(2) < fireball_x(2) ...
                && split3_y(1) + 0.2 > fireball_y(1) ...
                && split3_y(2) - 0.2 < fireball_y(2)
            split3_alive = false;
            delete(split3);
            delete(fireballlocation);
            fireball_x = [6.3 6];
            fireball_y = [6.3 6];
            split3_x = [6.3 6];
            split3_y = [6.3 6];
            movefireball = false;
        end
        if split4_x(1) + 0.1 > fireball_x(1) ...
                && split4_x(2) - 0.1 < fireball_x(2) ...
                && split4_y(1) + 0.2 > fireball_y(1) ...
                && split4_y(2) - 0.2 < fireball_y(2)
            split4_alive = false;
            delete(split4);
            delete(fireballlocation);
            fireball_x = [6.3 6];
            fireball_y = [6.3 6];
            split4_x = [6.3 6];
            split4_y = [6.3 6];
            movefireball = false;
        end
        
    end
%----------------------------------move splits 1------------------------
    function movesplits_1 %same as function above for other two splits
        if split1_alive == true
            delete(split1);
            [vx1,vy1, split1_x, split1_y] = updateLocation(split1_x,split1_y,vx1,vy1,dt,ay);
            split1 = image(split1_x, split1_y, ball_array);
        end
        if split2_alive == true
            delete(split2);
            [vx2,vy2, split2_x, split2_y] = updateLocation(split2_x,split2_y,vx2,vy2,dt,ay);
            split2 = image(split2_x, split2_y, ball_array);
        end
        if split1_x(1) > fireball_x(1) ...
                && split1_x(2) < fireball_x(2) ...
                && split1_y(1) + 0.2 > fireball_y(1) ...
                && split1_y(2) - 0.2 < fireball_y(2)
            split1_alive = false;
            delete(split1);
            delete(fireballlocation);
            fireball_x = [6.3 6];
            fireball_y = [6.3 6];
            split1_x = [6.3 6];
            split1_y = [6.3 6];
            movefireball = false;
        end
        if split2_x(1) + 0.1 > fireball_x(1) ...
                && split2_x(2) - 0.1 < fireball_x(2) ...
                && split2_y(1) + 0.2 > fireball_y(1) ...
                && split2_y(2) - 0.2 < fireball_y(2)
            split2_alive = false;
            delete(split2);
            delete(fireballlocation);
            fireball_x = [6.3 6];
            fireball_y = [6.3 6];
            split2_x = [6.3 6];
            split2_y = [6.3 6];
            movefireball = false;
        end
    end
%----------------------------------death1-------------------
    function death1 %controls ball 1 related death
        if candie == true %if not a recent death
            if ball1_y(2) < character_y(1) && ball1_x(1) < character_x(1) ...
                    && ball1_x(2) > character_x(2)
                %all of these are just ways the ball can hit the character
                if game == 5 %restarts respective levels
                    levelonedeath
                elseif game == 7
                    leveltwodeath
                elseif game == 9
                    levelthreedeath
                elseif game == 11
                    levelfourdeath
                end
                candie = false;
            elseif ball1_y(2) < character_y(1)... %another condition
                    && ball1_x(1) > character_x(1) && ball1_x(2) < character_x(2)...
                    if game == 5
                    levelonedeath
                    elseif game == 7
                        leveltwodeath
                    elseif game == 9
                        levelthreedeath
                    elseif game == 11
                        levelfourdeath
                    end
                    candie = false;
            elseif ball1_y(2) < character_y(1) && ball1_x(1) > character_x(1)...
                    && ball1_x(2) < character_x(2)
                if game == 5
                    levelonedeath
                elseif game == 7
                    leveltwodeath
                elseif game == 9
                    levelthreedeath
                elseif game == 11
                    levelfourdeath
                end
                candie = false;
            elseif split1_y(2) < character_y(1) && split1_x(1)-0.1 < character_x(1) ...
                    && split1_x(2)+0.1 > character_x(2)
                if game == 5
                    levelonedeath
                elseif game == 7
                    leveltwodeath
                elseif game == 9
                    levelthreedeath
                elseif game == 11
                    levelfourdeath
                end
                candie = false;
            elseif split1_y(2) < character_y(1) && split1_x(1)+0.1 > character_x(1)...
                    && split1_x(2)-0.1 < character_x(2)
                if game == 5
                    levelonedeath
                elseif game == 7
                    leveltwodeath
                elseif game == 9
                    levelthreedeath
                elseif game == 11
                    levelfourdeath
                end
                candie = false;
            elseif split2_y(2) < character_y(1) && split2_x(1)-0.1 < character_x(1) ...
                    && split2_x(2)+0.1 > character_x(2)
                if game == 5
                    levelonedeath
                elseif game == 7
                    leveltwodeath
                elseif game == 9
                    levelthreedeath
                elseif game == 11
                    levelfourdeath
                end
                candie = false;
            elseif split2_y(2) < character_y(1) && split2_x(1)+0.1 > character_x(1)...
                    && split2_x(2)-0.1 < character_x(2)
                if game == 5
                    levelonedeath
                elseif game == 7
                    leveltwodeath
                elseif game == 9
                    levelthreedeath
                elseif game == 11
                    levelfourdeath
                end
                candie = false;
            else
            end
        end
    end
%---------------------------------death2-----------------------------
    function death2 %controls death based on ball 2 (same function as above)
        if candie == true
            if ball2_y(2) < character_y(1) && ball2_x(1) < character_x(1) ...
                    && ball2_x(2) > character_x(2)
                if game == 7
                    leveltwodeath
                elseif game == 9
                    levelthreedeath
                elseif game == 11
                    levelfourdeath
                end
                candie = false;
            elseif ball2_y(2) < character_y(1)...
                    && ball2_x(1) > character_x(1) && ball2_x(2) < character_x(2)...
                    if game == 7
                    leveltwodeath
                    elseif game == 9
                        levelthreedeath
                    elseif game == 11
                        levelfourdeath
                    end
                    candie = false;
            elseif ball2_y(2) < character_y(1) && ball2_x(1) > character_x(1)...
                    && ball2_x(2) < character_x(2)
                if game == 7
                    leveltwodeath
                elseif game == 9
                    levelthreedeath
                elseif game == 11
                    levelfourdeath
                end
                candie = false;
            elseif split3_y(2) < character_y(1) && split3_x(1)-0.1 < character_x(1) ...
                    && split3_x(2)+0.1 > character_x(2)
                if game == 7
                    leveltwodeath
                elseif game == 9
                    levelthreedeath
                elseif game == 11
                    levelfourdeath
                end
                candie = false;
            elseif split3_y(2) < character_y(1) && split3_x(1)+0.1 > character_x(1)...
                    && split3_x(2)-0.1 < character_x(2)
                if game == 7
                    leveltwodeath
                elseif game == 9
                    levelthreedeath
                elseif game == 11
                    levelfourdeath
                end
                candie = false;
            elseif split4_y(2) < character_y(1) && split4_x(1)-0.1 < character_x(1) ...
                    && split4_x(2)+0.1 > character_x(2)
                if game == 7
                    leveltwodeath
                elseif game == 9
                    levelthreedeath
                elseif game == 11
                    levelfourdeath
                end
                candie = false;
            elseif split4_y(2) < character_y(1) && split4_x(1)+0.1 > character_x(1)...
                    && split4_x(2)-0.1 < character_x(2)
                if game == 7
                    leveltwodeath
                elseif game == 9
                    levelthreedeath
                elseif game == 11
                    levelfourdeath
                end
                candie = false;
            else
            end
        end
    end
%----------------------------------death 3 -------------------------
    function death3 %this is the death function for the final level
        %determines if character will die from storm
        if storm_x(1) > character_x(1) && storm_x(2) < character_x(2)...
                && character_y(1) + 0.4 > storm_y(2)
            levelfourdeath
        elseif storm_x2(1) > character_x(1) && storm_x2(2) < character_x(2)...
                && character_y(1) + 0.4 > storm_y(2)
            levelfourdeath
        end
    end
%---------------------------------level one death--------------------
    function levelonedeath %clear out the whole level
        delete(ball1_location); delete(split1); delete(split2); delete(split3);
        delete(fireballlocation); delete(characterlocation); delete(split4);
        delete(ball2_location);
        life_num = life_num - 1; %one less live
        score = score - 100; %score drops
        game = 4; %go to level one 
        death_text = text(2.5,2.5,'You Lost a Life!');
        for kk = 1:length(death_text)
            set(death_text(kk), 'HorizontalAlignment','Center', 'FontSize', 30);
        end
        pause(1);
        delete(death_text);
        if life_num == 0; %your done
            gameover;
        end
    end
%---------------------------------level two death------------------------
    function leveltwodeath
        delete(ball1_location); delete(split1); delete(split2); delete(split3);
        delete(split4); delete(ball2_location);
        delete(fireballlocation); delete(characterlocation);
        life_num = life_num - 1;
        game = 6;
        score = score - 100;
        death_text = text(2.5,2.5,'You Lost a Life!');
        for kk = 1:length(death_text)
            set(death_text(kk), 'HorizontalAlignment','Center', 'FontSize', 30);
        end
        pause(1);
        delete(death_text);
        if life_num == 0;
            gameover;
        end
    end
%---------------level 3 death----------------------
    function levelthreedeath
        delete(ball1_location); delete(split1); delete(split2); delete(split3);
        delete(split4); delete(ball2_location);
        delete(fireballlocation); delete(characterlocation);
        life_num = life_num - 1;
        game = 8;
        score = score - 100;
        death_text = text(2.5,2.5,'You Lost a Life!');
        for kk = 1:length(death_text)
            set(death_text(kk), 'HorizontalAlignment','Center', 'FontSize', 30);
        end
        pause(1);
        delete(death_text);
        if life_num == 0;
            gameover;
        end
    end
%---------------level 4 death----------------------
    function levelfourdeath
        delete(ball1_location); delete(split1); delete(split2); delete(split3);
        delete(split4); delete(ball2_location); delete(stormimage); delete(stormimage2);
        delete(fireballlocation); delete(characterlocation);
        life_num = life_num - 1;
        game = 10;
        score = score - 100;
        death_text = text(2.5,2.5,'You Lost a Life!');
        for kk = 1:length(death_text)
            set(death_text(kk), 'HorizontalAlignment','Center', 'FontSize', 30);
        end
        pause(1);
        delete(death_text);
        if life_num == 0;
            gameover;
        end
    end

%----------------------------------level_one--------------------------
    function level_one %function initializes level one
        levelonetext; %check
        leveloneobjects; %check
        game = 5;
        while game == 5
            movecharacter %check
            moveball1 %check
            shoot %check
            splitball1 %check
            movesplits_1 %check
            death1
            question
            drawnow
            scorefcn
            if split1_alive == false && split2_alive ==false && ball1_alive == false
                game = 6; %on to the next one when balls are dead
                score = score + 100; %score increase
            end
        end
    end
%----------------------------------level_two---------------------------
    function level_two
        leveltwotext; %presets
        leveltwoobjects;
        game = 7;
        while game == 7 %run previously described functions
            movecharacter
            moveball1
            moveball2
            splitball1
            movesplits_1
            death1
            death2
            splitball2
            movesplits_2
            scorefcn
            question
            drawnow
            shoot
            if split1_alive == false && split2_alive == false && split3_alive == false...
                    && split4_alive ==false && ball2_alive == false...
                    && ball1_alive == false
                game = 8; %on to the next one when balls are dead
                score = score + 300; %score increase
            end
        end
    end
%------------------------------level three-----------------------------
    function level_three
        levelthreetext %presets
        leveltwoobjects
        game = 9;
        while game == 9 %run previously described functions
            movecharacter
            moveball1
            question
            moveball2
            splitball1
            movesplits_1
            splitball2
            movesplits_2
            death1
            death2
            shoot
            scorefcn
            drawnow
            
            if split1_alive == false && split2_alive == false && split3_alive == false...
                    && split4_alive ==false && ball2_alive == false...
                    && ball1_alive == false %move on when balls are dead
                score = score + 500; %increase score
                game = 10; %on to the next one
            end
        end
    end
%------------------------------level four-----------------------------
    function level_four
        levelfourtext
        leveltwoobjects
        game = 11;
        while game == 11 %during while loop run all described functions
            movecharacter
            moveball1
            moveball2
            splitball1
            movesplits_1
            splitball2
            movesplits_2
            death1
            question
            storm
            death2
            shoot
            scorefcn
            death3
            drawnow
            
            if split1_alive == false && split2_alive == false && split3_alive == false...
                    && split4_alive ==false && ball2_alive == false...
                    && ball1_alive == false %once all balls are dead, end level
                score = score + 700; %score increases
                gameover %end game with this level
            end
        end
    end
%---------------------------------KEYS---------------------------------
    function keydownlistener(~,cases)
        switch cases.Key
            case 'space'
                if game == 3 %if intro, delete text, start
                    delete(introtext);
                    game = 4;
                elseif game > 4 %otherwise fire fireball
                    fireball = true;
                end
            case 'd'
                if game > 4 %move characterright
                    characterright = true;
                end
                
            case 'a'
                if game > 4 %move characterleft
                    characterleft = true;
                end
        end
    end

play = true; %game on
game = 1; %to create flow
while play == true
    if game == 1
        launchgame; %launch game once
        game = 2;
    elseif game == 2
        introduction %introduction once
        game = 3;
    elseif game == 3; %to give chance for space
        pause(0.5);
    elseif game == 4
        level_one %flow through levels
    elseif game == 6
        level_two
    elseif game == 8
        level3 = true; %to allow ball to flash
        level_three
    elseif game == 10
        level_four;
    end
end
end
