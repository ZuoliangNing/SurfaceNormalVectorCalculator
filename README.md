

**GitHub Project Introduction: Surface Normal Vector Calculator for SEM Analysis**  

**Project Overview**  
The Surface Normal Vector Calculator is a MATLAB-based application designed to measure the orientation of microscopic facets on metal material surfaces from Scanning Electron Microscopy (SEM) images. This tool automates the analysis of surface normals and crystallographic orientations, aiding researchers and engineers in materials science, metallurgy, and related fields.  

---

**Key Features**  
- **SEM Image Processing**: Import and preprocess SEM images (supports TIFF, PNG, etc.).  
- **Facet Detection**: Automatically identify microscopic facet boundaries.  
- **Normal Vector Calculation**: Compute surface normals using geometric models.  
- **Interactive Interface**: Real-time visualization and parameter adjustments.  

---

**Quick Start**  
1. **Requirements**  
   - MATLAB R2021a or later  

2. **Usage**  
   ```matlab  
   % Launch the application
   addpath( 'app_fun\', 'cal_fun\' )
   SurfaceNormalVectorCalculator  
   % Import SEM image → Adjust detection parameters → Run analysis → Export results  
   ```  

---

**Applications**  
- **Fracture Surface Analysis**: Quantify facet orientations in metal fractures.  

---

**Contribution & Support**  
- **Issues**: Report bugs or request features via (ninguzoliang2019@outlook.com)
- **Contributions**: PRs welcome for algorithm enhancements or new modules.  

**License**  
MIT License. Free for academic and commercial use.  

---

**Resources**  
- [User Guide (中文)](./UserGuide_CN.doc)  
- [Sample Dataset](./example_images/)  

*Empowering efficient and intuitive quantitative analysis of microstructures!* 🔬📊
