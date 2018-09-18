from vtk import *
from vtkDRCFiltersPython import *

try:
    from vtkPCLFiltersPython import *
    open("/tmp/vtkPCLFiltersPython", "w").close()
except ImportError:
    open("/tmp/vtkNOOOOPCLFiltersPython", "w").close()
    pass
