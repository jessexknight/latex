import os
import sys

imgpro = '-trim -colorspace RGB -density 150 +repage -crop +0-15 -trim -border 50 -alpha remove'
imglnk = '<a href="{path}/{main}.tex">\n  <img src="{path}/{main}.png?" width="300"/>\n</a>\n'
xexts = ['.log','.aux','.png']
cmd = {
  'latex': 'cd {path} && pdflatex {main}.tex > /dev/null',
  'png':   'cd {path} && convert '+imgpro+' {main}.pdf {main}.png',
  'clean': 'cd {path} && rm *.png '+' '.join(['{main}'+ext for ext in xexts])
}[sys.argv[1]]

def headfun(iheads,oheads,readme):
  for i,(ih,oh) in enumerate(zip(iheads,oheads)):
    if i and (ih != oh):
      readme += '\n{} {}\n'.format('#'*(i+1),ih)
  return iheads[:],readme

with open('.py/README.md','r') as f:
  readme = f.read()

oheads = [None]*4
iheads = [None]*4
paths = sorted([r for r,d,f in os.walk('.')])
for path in paths:
  main = os.path.split(path)[1]
  dirs = path.split(os.path.sep)
  iheads[0:len(dirs)] = dirs
  if os.path.exists(os.path.join(path,main+'.tex')):
    print(main,flush=True)
    oheads,readme = headfun(iheads,oheads,readme)
    os.system(cmd.format(path=path,main=main))
    readme += imglnk.format(path=path,main=main)

with open('README.md','w') as f:
  f.write(readme)