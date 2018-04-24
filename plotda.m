function plotda(x,y,z)
  %To open a new figure window
  figure;
  
  %ploting the data
  
  plot(x,y,'rx','MarkerSize',10,'LineWidth',1.5);
  plot(x,z,'rx','MarkerSize',10,'LineWidth',1.5);
  ylabel('Testing accuracy');
  xlabel('Number of features');
  title('20% of unlabelled data');
  hold on;
  plot(x,y,'-','LineWidth',2);
  plot(x,z,'-','LineWidth',2);
  legend('JMI algorithm','MIM algorithm','location','southeast');
  hold off;
 end