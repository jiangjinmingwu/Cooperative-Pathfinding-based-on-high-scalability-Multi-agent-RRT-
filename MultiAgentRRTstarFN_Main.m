%
%
% ��ʼ����ͼ�� 1�����ϰ��� -1�����������ʼλ�ú�Ŀ��λ��    
% input_map = zeros(10,10);
% input_map = zeros(30,30);
% input_map = zeros(50,50);
% input_map = zeros(70,70);
% input_map = zeros(90,90);
% agent = 1;


is_solutions_marrts = cell(5,10,120);                                              % ��������ʼ��
is_solutions_marrtsG = cell(5,10,120);                                              % ��������ʼ��
is_solutions = cell(5,10,120);
is_solutionsG = cell(5,10,120);
solutions_marrts = cell(5,10,120);                                              % ��������ʼ��
solutions_marrtsG = cell(5,10,120);                                              % ��������ʼ��
solutions = cell(5,10,120);
solutionsG = cell(5,10,120);
parfor rand_instance = 1 : 120
    for agent = 1 : 10
        for map_index = 1 : 5
            % ��������������ͼ��ʼ��
            choose_map = {zeros(10,10);zeros(30,30);zeros(50,50);zeros(70,70);zeros(90,90)}; % ��ͼѡ������ʼ��
            input_map = choose_map{map_index,1};                                    % ��ͼ��ʼ��     
            agent_count = agent;                                                    % ���������������ʼ��     
            [rows,cols] = size(input_map);                                          % ��ͼ������������
            % ��ʼ���ϰ���λ��
            for i = 1 : (rows*cols/4)                                              % ȡ����������1/10��Ϊ�ϰ������
                input_map(ceil((rows-1)*rand),ceil((cols-1)*rand)) = 1;             % ���ѡ��1��������Ϊ�ϰ������
            end
            % ��ʼ��������λ�ú�Ŀ��
            valid = false;                                                          % ��ʼ����������Ч�̶�Ϊ��
            A = [];                                                                 % ��������������ʼ��Ϊ��
            for i = 1 : agent_count
                while valid == false
                    rand_position = [ceil((rows-1)*rand),ceil((cols-1)*rand)];              % ���ѡ��1��������Ϊ�������ʼλ�ø���
                    rand_goal = [ceil((rows-1)*rand),ceil((cols-1)*rand)];                  % ���ѡ��1��������Ϊ������Ŀ��λ�ø���
                    if (input_map(rand_position(1),rand_position(2)) ~= 1) && ...
                            (input_map(rand_position(1),rand_position(2)) ~= -1) && ...
                            (input_map(rand_goal(1),rand_goal(2)) ~= 1) && ...
                            (input_map(rand_goal(1),rand_goal(2)) ~= -1)                     % ������ĳ�ʼλ�ò��غϣ�Ŀ��λ�ò��غϣ����ϰ��ﲻ����
                        input_map(rand_position(1),rand_position(2)) = -1;                   % ��ʼλ����-1
                        input_map(rand_goal(1),rand_goal(2)) = -1;                           % Ŀ��λ����-1
                        backup_A = Agent(rand_position,rand_goal,input_map);                % ��ʼ����������,��ÿ��������ĵ�ͼ�������Լ��ĳ�ʼλ�ú�Ŀ��λ�á�
                        A = [A;backup_A];                                                   % �Ѹ������������δ�������
                        valid = true;                                                       % ��Ч�̶�Ϊ��
                    end
                end
                valid = false;                                                              % ��Ч�̶�����
            end
            position = A(1).position;                                                       % �洢�������λ�ã���Ϊ��ʼ״̬�ڵ㣬��������
            goal = A(1).goal;                                                               % �洢�������Ŀ�꣬��ΪĿ��״̬�ڵ㣬��������
            if agent_count > 1
                for i = 2 : agent_count
                    position = [position,A(i).position];
                    goal = [goal,A(i).goal];
                end
            end
            % ����RRT�㷨
            marrts = MARRTs(input_map,position,goal,agent_count);                               % ��ʼ��MARRTs�㷨���������
            marrts = runMARRTs(marrts);                                                         % ����MARRTs�㷨
            marrtsG = MARRTsG(input_map,position,goal,agent_count);                               % ��ʼ��MARRTs�㷨���������
            marrtsG = runMARRTsG(marrtsG);                                                         % ����MARRTs�㷨
            % ������
            solutions{map_index,agent,rand_instance} = marrts;                           % �����������
            solutionsG{map_index,agent,rand_instance} = marrtsG;                           % �����������
            % ���е���rrt�㷨
            single_solution = [];                                                             % ����������Ľ��ʼ��Ϊ��
            for i = 1 : agent_count                                                           % ��ÿһ�������壬������һ�ν�
                rrts = RRTs(input_map,A(i).position,A(i).goal,1);                             % ��ʼ��RRT�㷨���������
                rrts = runRRTs(rrts);                                                         % ����rrt�㷨
                single_solution = [single_solution;rrts];                                     % ��õĽ�洢��single_solution��
            end
            % ����RRT�㷨
            is_marrts = MARRTs(input_map,position,goal,agent_count);                               % ��ʼ��MARRTs�㷨���������
            is_marrts = runMARRTs(is_marrts,single_solution);                                     % ����MARRTs�㷨
            is_marrtsG = MARRTsG(input_map,position,goal,agent_count);                               % ��ʼ��MARRTs�㷨���������
            is_marrtsG = runMARRTsG(is_marrtsG,single_solution);                                   % ����MARRTs�㷨
            % ������
            is_solutions{map_index,agent,rand_instance} = is_marrts;                           % �����������
            is_solutionsG{map_index,agent,rand_instance} = is_marrtsG;                           % �����������
        end
    end 
end
    is_solutions_marrts(:,:,1:120) = is_solutions(:,:,1:120);
    is_solutions_marrtsG(:,:,1:120) = is_solutionsG(:,:,1:120);
    solutions_marrts(:,:,1:120) = solutions(:,:,1:120);
    solutions_marrtsG(:,:,1:120) = solutionsG(:,:,1:120);
    save('marrts.mat','solutions_marrts');                                                 % ��������ļ�
    save('marrtsG.mat','solutions_marrtsG');                                               % ��������ļ�
    save('is_marrts.mat','is_solutions_marrts');                                           % ��������ļ�
    save('is_marrtsG.mat','is_solutions_marrtsG');                                         % ��������ļ�

%     single_solution = [];                                                           % ����������Ľ��ʼ��Ϊ��
%     for i = 1 : agent_count                                                         % ��ÿһ�������壬������һ�ν�
%         rrts = RRTs(input_map,A(i).position,A(i).goal,1);                            % ��ʼ��RRT�㷨���������
%         rrts = runRRTs(rrts);                                                        % ����rrt�㷨
%         single_solution = [single_solution;rrts];                                    % ��õĽ�洢��single_solution��
%     end
%     rrtfn = MARRTsFN(input_map,position,goal,agent_count);                               % ��ʼ��RRT�㷨���������
%     rrtfn = runRRTfn(rrtfn);%,single_solution);                                                            % ����rrt�㷨�����뵥�����������еĽ��
%     marrts = MARRTs(input_map,position,goal,agent_count);                               % ��ʼ��RRT�㷨���������
%     marrts = runMARRTs(marrts);%,single_solution);                                                            % ����rrt�㷨�����뵥�����������еĽ��
%     ymax = max(rrtfn.pathcost(:,1),marrts.pathcost(:,1));
%     ymin = min(marrts.pathcost(:,end),rrtfn.pathcost(:,end));
%     solutions_rrtfn{n} = rrtfn;
%     solutions_marrts{n} = marrts;
%     save('test.mat','marrts')
%     save('test.mat','solutions_rrtfn','solutions_marrts')    
% if ymin == ymax
%     axis_bias = 30;
% else
%     axis_bias = (ymax-ymin)/4;
% end
% plot(marrts.numiterations,marrts.pathcost,'DisplayName','maRRTs','Color','k');                                         % ���Ƶ���������·�����۹�ϵͼ
% hold on;
% plot(rrtfn.numiterations,rrtfn.pathcost,'DisplayName','maRRTsFN','Color','b');                                         % ���Ƶ���������·�����۹�ϵͼ
% ylim manual
% xlim manual
% ylim([ymin-axis_bias,ymax+axis_bias])
% xlim([0,rrtfn.maxiterations]);
% xticks(0:1000:5000);
% yticks(ymin:axis_bias:ymax);
% ax = gca;
% ax.FontSize = 13;
% % set(gca,'FontSize',11);
% title('One Agent Navigation');
% xlabel('Number of iterations');
% ylabel('Path Cost');
% legend('Location','southoutside','Orientation','horizontal');
% grid on;
% hold off;