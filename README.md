Grid Pathfinding: A* vs PDDL (Fast Downward)

This project compares A* search and PDDL classical planning on identical grid-based pathfinding tasks.
Using the same GridWorld maps (MovingAI / GPPC format), we evaluate the differences between search-based algorithms and symbolic planners in:
	•	runtime
	•	search effort (expanded / generated nodes)
	•	branching factor statistics (A*)
	•	scalability on large maps
	•	plan length and step count (PDDL)

The experimental pipeline is:

GridWorld → A* → Metrics
GridWorld → PDDL → Fast Downward → Plan → Metrics


1.HOW TO RUN THE PROJECT 

	OPTION A — Google Colab (recommended)
	
	The notebook is fully compatible with Google Colab and automatically:
		•	installs Fast Downward
		•	downloads the benchmark map dataset
		•	runs A* experiments
		•	runs PDDL planning
		•	visualizes paths
		•	exports CSV results and plots
	
	To use it:
	Upload grid_pathfinding.py or the notebook → Run all cells.
	
	OPTION B — Run Locally (Python ≥ 3.8)
	
	Python dependencies (install via pip)
		•	numpy
		•	matplotlib
		•	pandas
	
	Required system packages
		•	cmake
		•	g++
		•	python3-dev
	
	Example (Linux):
	sudo apt-get install cmake g++ python3-dev
	
	Windows / macOS
	
	Install equivalent compilers (Visual Studio Build Tools, Xcode Command Line Tools)
	and ensure Python headers are available.


2. Fast Downward (required for PDDL planning)

		Download and build the planner:
		
		git clone https://github.com/aibasel/downward.git fastdownward
		cd fastdownward
		./build.py
		
		Verify installation:
		./fast-downward.py –help


3. Benchmark Map Dataset

		The MovingAI + GPPC benchmark set is too large to include in this repository.
		It is downloaded automatically by the code.
		
		If you want to download it manually:
			1.	Download:
		wget https://bitbucket.org/shortestpathlab/benchmarks/get/master.zip
			2.	Extract:
		unzip master.zip
			3.	Move the grid maps:
		mv shortestpathlab-benchmarks-*/grid-maps benchmarks/maps/
		
		Required directory structure:
		
		benchmarks/maps/local/
		benchmarks/maps/gppc-2013/
		benchmarks/maps/gppc-2014/
		benchmarks/maps/movingai/



4. Running A* Experiments

		A* is implemented with:
			•	duplicate elimination
			•	no re-opening
			•	g(n) + h(n) evaluation
			•	Manhattan heuristic for 4-connected grids
			•	Euclidean heuristic for 8-connected grids
			•	full metric collection


5. Running PDDL Planning (Fast Downward)

		The PDDL pipeline consists of:
			1.	Automatic generation of problem_auto.pddl from GridWorld
			2.	Execution of Fast Downward
			3.	Parsing of the sas_plan output
			4.	Conversion of symbolic actions into grid coordinates
		
		

6. Collected metrics:
   
		•	path length
		•	runtime
		•	expanded nodes
		•	generated nodes
		•	branching factor (min, max, average)
		•	max frontier size
		•	max explored size


7. Visualization

		The script produces visual overlays showing:
			•	grid structure
			•	obstacles
			•	A* path
			•	PDDL path
			•	start and goal cells

8. A* vs PDDL Comparison

		The final comparison includes:
			•	runtime (log-scale bar charts)
			•	path length comparison
			•	runtime ratio (PDDL / A*)
			•	exported CSV files for all metrics
		


License

This project is for academic use as part of the AI Planning & Search homework assignment.

Author

Arianna Navarra — 2025


