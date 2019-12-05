% 提取runtime,运行前需载入结果
% runtime = zeros(6000,1);
% count = 0;
% for i = 1 : 120
%     for j = 1 : 10
%         for k = 1 : 5
%             count = count + 1;
%             runtime(count,:) = solutions_marrts{k,j,i}.runtime;
%         end
%     end
% end
% runtime = runtime * 1000;
% runtime = sort(runtime);
% save('runtime.mat','runtime');
% 
% runtimeG = zeros(6000,1);
% count = 0;
% for i = 1 : 120
%     for j = 1 : 10
%         for k = 1 : 5
%             count = count + 1;
%             runtimeG(count,:) = solutions_marrtsG{k,j,i}.runtime;
%         end
%     end
% end
% runtimeG = runtimeG * 1000;
% runtimeG = sort(runtimeG);
% save('runtime.mat','runtimeG','-append');
% 
% is_runtime = zeros(6000,1);
% count = 0;
% for i = 1 : 120
%     for j = 1 : 10
%         for k = 1 : 5
%             count = count + 1;
%             is_runtime(count,:) = is_solutions_marrts{k,j,i}.runtime;
%         end
%     end
% end
% is_runtime = is_runtime * 1000;
% is_runtime = sort(is_runtime);
% save('runtime.mat','is_runtime','-append');
% 
% is_runtimeG = zeros(6000,1);
% count = 0;
% for i = 1 : 120
%     for j = 1 : 10
%         for k = 1 : 5
%             count = count + 1;
%             is_runtimeG(count,:) = is_solutions_marrtsG{k,j,i}.runtime;
%         end
%     end
% end
% is_runtimeG = is_runtimeG * 1000;
% is_runtimeG = sort(is_runtimeG);
% save('runtime.mat','is_runtimeG','-append');

% 提取solutions
% first_solution = zeros(6000,1);
% best_solution = zeros(6000,1);
% optimal_solution = zeros(6000,1);
% count = 0;
% for i = 1 : 120
%     for j = 1 : 10
%         for k = 1 : 5
%             if ~isempty(solutions_marrts{k,j,i}.firstsol)
%                 count = count + 1;
%                 first_solution(count,:) = solutions_marrts{k,j,i}.firstsol;
%                 best_solution(count,:) = solutions_marrts{k,j,i}.bestsol;
%                 optimal_solution(count,:) = solutions_marrts{k,j,i}.optisol;
%             end
%         end
%     end
% end
% first_solution(first_solution == 0) = [];
% optimal_solution(optimal_solution == 0) = [];
% best_solution(best_solution == 0) = [];
% save('solutions.mat','first_solution','best_solution','optimal_solution');
% 
% % 计算suboptimality
% first_suboptimality = (first_solution ./ optimal_solution - 1) * 100;
% best_suboptimality = (best_solution ./ optimal_solution - 1) * 100;
% save('suboptimality.mat','first_suboptimality','best_suboptimality');
% 
% first_solutionG = zeros(6000,1);
% best_solutionG = zeros(6000,1);
% optimal_solutionG = zeros(6000,1);
% count = 0;
% for i = 1 : 120
%     for j = 1 : 10
%         for k = 1 : 5
%             if ~isempty(solutions_marrtsG{k,j,i}.firstsol)
%                 count = count + 1;
%                 first_solutionG(count,:) = solutions_marrtsG{k,j,i}.firstsol;
%                 best_solutionG(count,:) = solutions_marrtsG{k,j,i}.bestsol;
%                 optimal_solutionG(count,:) = solutions_marrtsG{k,j,i}.optisol;
%             end
%         end
%     end
% end
% first_solutionG(first_solutionG == 0) = [];
% optimal_solutionG(optimal_solutionG == 0) = [];
% best_solutionG(best_solutionG == 0) = [];
% save('solutions.mat','first_solutionG','best_solutionG','optimal_solutionG','-append');
% 
% % 计算suboptimality
% first_suboptimalityG = (first_solutionG ./ optimal_solutionG - 1) * 100;
% best_suboptimalityG = (best_solutionG ./ optimal_solutionG - 1) * 100;
% save('suboptimality.mat','first_suboptimalityG','best_suboptimalityG','-append');
% 
% is_first_solution = zeros(6000,1);
% is_best_solution = zeros(6000,1);
% is_optimal_solution = zeros(6000,1);
% count = 0;
% for i = 1 : 120
%     for j = 1 : 10
%         for k = 1 : 5
%             if ~isempty(is_solutions_marrts{k,j,i}.firstsol)
%                 count = count + 1;
%                 is_first_solution(count,:) = is_solutions_marrts{k,j,i}.firstsol;
%                 is_best_solution(count,:) = is_solutions_marrts{k,j,i}.bestsol;
%                 is_optimal_solution(count,:) = is_solutions_marrts{k,j,i}.optisol;
%             end
%         end
%     end
% end
% is_first_solution(is_first_solution == 0) = [];
% is_optimal_solution(is_optimal_solution == 0) = [];
% is_best_solution(is_best_solution == 0) = [];
% save('solutions.mat','is_first_solution','is_best_solution','is_optimal_solution','-append');
% 
% % 计算suboptimality
% is_first_suboptimality = (is_first_solution ./ is_optimal_solution - 1) * 100;
% is_best_suboptimality = (is_best_solution ./ is_optimal_solution - 1) * 100;
% save('suboptimality.mat','is_first_suboptimality','is_best_suboptimality','-append');
% 
% is_first_solutionG = zeros(6000,1);
% is_best_solutionG = zeros(6000,1);
% is_optimal_solutionG = zeros(6000,1);
% count = 0;
% for i = 1 : 120
%     for j = 1 : 10
%         for k = 1 : 5
%             if ~isempty(is_solutions_marrtsG{k,j,i}.firstsol)
%                 count = count + 1;
%                 is_first_solutionG(count,:) = is_solutions_marrtsG{k,j,i}.firstsol;
%                 is_best_solutionG(count,:) = is_solutions_marrtsG{k,j,i}.bestsol;
%                 is_optimal_solutionG(count,:) = is_solutions_marrtsG{k,j,i}.optisol;
%             end
%         end
%     end
% end
% is_first_solutionG(is_first_solutionG == 0) = [];
% is_optimal_solutionG(is_optimal_solutionG == 0) = [];
% is_best_solutionG(is_best_solutionG == 0) = [];
% save('solutions.mat','is_first_solutionG','is_best_solutionG','is_optimal_solutionG','-append');
% 
% % 计算suboptimality
% is_first_suboptimalityG = (is_first_solutionG ./ is_optimal_solutionG - 1) * 100;
% is_best_suboptimalityG = (is_best_solutionG ./ is_optimal_solutionG - 1) * 100;
% save('suboptimality.mat','is_first_suboptimalityG','is_best_suboptimalityG','-append');