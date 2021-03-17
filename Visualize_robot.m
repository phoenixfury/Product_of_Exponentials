function [] = Visualize_robot(Tleg,T1, T2, color)
%VISUALIZE_ROBOT Summary of this function goes here
hold on
line([-1 2],[0 0],[0 0],'Color','k','LineStyle','--')
line([0 0],[0 0],[-1 2],'Color','k','LineStyle','--')
line([0 0],[-1 2],[0 0],'Color','k','LineStyle','--')

config_joint_1 = T1;
config_joint_2 = T2;
config_joint_3 = Tleg;

Tbase = eye(4);
line([Tbase(1,4) config_joint_1(1,4)],[Tbase(2,4) config_joint_1(2,4)],[Tbase(3,4) config_joint_1(3,4)],...
    'linewidth', 2,'Color',color)
line([config_joint_1(1,4) config_joint_2(1,4)],[config_joint_1(2,4) config_joint_2(2,4)],...
    [config_joint_1(3,4) config_joint_2(3,4)],'linewidth', 2,'Color',color)
line([config_joint_2(1,4) config_joint_3(1,4)],[config_joint_2(2,4) config_joint_3(2,4)],...
    [config_joint_2(3,4) config_joint_3(3,4)],'linewidth', 2,'Color',color)


plot3(config_joint_1(1,4),config_joint_1(2,4),config_joint_1(3,4),'r*','linewidth', 2,'MarkerSize',4)
plot3(config_joint_2(1,4),config_joint_2(2,4),config_joint_2(3,4),'r*','linewidth', 2,'MarkerSize',4)
plot3(config_joint_3(1,4),config_joint_3(2,4),config_joint_3(3,4),'r*','linewidth', 1,'MarkerSize',4)

end


