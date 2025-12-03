# ai-homework-grid
Homework AI – Grid Pathfinding with A* and PDDL
This project compares A* search and PDDL classical planning on identical grid-based pathfinding tasks.
Using the same GridWorld maps (MovingAI / GPPC format), we evaluate how a search-based approach and a planning-based approach differ in:
	•	runtime
	•	search effort (expanded / generated nodes)
	•	branching factor statistics (A*)
	•	scalability on large maps
	•	plan length and step count (PDDL)

The result is a full experimental pipeline:

GridWorld → A* → Metrics
GridWorld → PDDL → Fast Downward → Plan → Metrics

This provides a clean, scientific comparison between search algorithms and planners on the same domain.

project/
│
├── grid_pathfinding.py      # Full implementation (A*, PDDL, experiments)
├── domain.pddl              # PDDL domain (generated automatically)
├── pddl_results.csv         # Results for PDDL runs
├── A*_results.csv           # Results for A* runs
├── comparison_results.csv   # Joined table A* vs PDDL
└── README.md                # This file


1. How to Run the Project

Option A — Run in Google Colab 

The notebook is fully compatible with Colab and automatically:
	•	installs Fast Downward,
	•	downloads the benchmark map dataset,
	•	runs A*,
	•	runs PDDL planning,
	•	visualizes paths,
	•	outputs CSV files and plots.

Simply upload grid_pathfinding.py or your notebook, then run all cells.

Option B - Run it locally (but less optimized) 

2. Installing Dependencies (Local Python >= 3.8)

To run this project locally, you need:

Python packages
pip install numpy matplotlib pandas

System requirements

You must install:
	•	cmake
	•	g++
	•	python3-dev

sudo apt-get install cmake g++ python3-dev

Fast Downward (Required for PDDL planning)

Download and build the planner:

git clone https://github.com/aibasel/downward.git fastdownward
cd fastdownward
./build.py

Ensure fast-downward.py is executable:
./fast-downward.py --help


3. Downloading the Benchmark Map Dataset

The official MovingAI + GPPC datasets are too large to store in the repo.
The code automatically downloads and extracts them.

Manual installation:
wget https://bitbucket.org/shortestpathlab/benchmarks/get/master.zip
unzip master.zip
mv shortestpathlab-benchmarks-*/grid-maps benchmarks/maps/

Directory structure required:
benchmarks/maps/local/
benchmarks/maps/gppc-2013/
benchmarks/maps/gppc-2014/
benchmarks/maps/movingai/


4. Running A* Experiments

A* is implemented with:
	•	duplicate elimination
	•	no re-opening
	•	g(n)+h(n) evaluation
	•	two heuristics: Manhattan (4-connected) and Euclidean (8-connected)
	•	full metrics collection

Example 
df_easy = run_astar_experiment(easy_maps, connectivity=4, heuristic=manhattan)
df_hard = run_astar_experiment(hard_maps, connectivity=8, heuristic=euclidean)

Metrics collected:
	•	path length
	•	runtime
	•	expanded nodes
	•	generated nodes
	•	branching factor (min, max, average)
	•	max frontier size
	•	max explored size

5. Running PDDL Planning

The pipeline:
	1.	Generate problem_auto.pddl from GridWorld
	2.	Call Fast Downward
	3.	Parse sas_plan
	4.	Convert actions → grid path

6. Visualization
   Plots include:
	•	grid map
	•	obstacles
	•	complete path
	•	start and goal markers

7. A* vs PDDL Comparison
   Comparison includes:
	•	runtime (log scale plots)
	•	path length comparison
	•	runtime ratio (PDDL/A*)

8. License

This project is for academic use as part of the AI Planning & Search homework assignment.

9. Author

Arianna Navarra — 2025
