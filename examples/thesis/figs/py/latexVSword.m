function latexVSword()
t = 0:0.1:10;
latex = t.^0.5;
word  = 1./(7-t)-(1/7);
plot(t,latex,t,word,'linewidth',2);
ylim([0,5]);
yticks([])
xticks([])
set(gca,'fontsize',18);
xlabel('Document Complexity \& Size','interpreter','latex')
ylabel('Effort \& Time','interpreter','latex')
legend('location','nw',{'\LaTeX','MS Word'},'interpreter','latex')
print(gcf,'latex-vs-word.eps','-depsc');