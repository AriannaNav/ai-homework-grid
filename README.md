Grid Pathfinding: A* vs PDDL (Fast Downward)

This project compares A* search and PDDL classical planning on identical grid-based pathfinding tasks.
Using the same GridWorld maps (MovingAI / GPPC format), we evaluate how a search-based approach and a planning-based approach differ in:
• runtime
• search effort (expanded / generated nodes)
• branching factor statistics (A*)
• scalability on large maps
• plan length and step count (PDDL)

The result is a full experimental pipeline:

GridWorld → A* → Metrics
GridWorld → PDDL → Fast Downward → Plan → Metrics

This provides a clean, scientific comparison between search algorithms and planners on the same domain.

How to Run the Project

Option A — Run in Google Colab

The notebook is fully compatible with Colab and automatically:
• installs Fast Downward
• downloads the benchmark map dataset
• runs A*
• runs PDDL planning
• visualizes paths
• outputs CSV files and plots

Simply upload grid_pathfinding.py or your notebook, then run all cells.

Option B — Run it locally (Python ≥ 3.8)

Python dependencies

Install via pip:
numpy
matplotlib
pandas

System requirements

You must install:
cmake
g++
python3-dev

Example command:
sudo apt-get install cmake g++ python3-dev

Fast Downward (required for PDDL planning)

Download and build the planner:

git clone https://github.com/aibasel/downward.git fastdownward
cd fastdownward
./build.py

Check it works by running:
./fast-downward.py –help

Downloading the Benchmark Map Dataset

The official MovingAI + GPPC datasets are too large to store in the repository.
They are downloaded automatically by the code.

Manual installation steps:
wget https://bitbucket.org/shortestpathlab/benchmarks/get/master.zip
unzip master.zip
mv shortestpathlab-benchmarks-*/grid-maps benchmarks/maps/

Required directory layout:

benchmarks/maps/local/
benchmarks/maps/gppc-2013/
benchmarks/maps/gppc-2014/
benchmarks/maps/movingai/

Running A* Experiments

A* is implemented with:
• duplicate elimination
• no re-opening
• g(n)+h(n) evaluation
• Manhattan heuristic for 4-connected grids
• Euclidean heuristic for 8-connected grids
• complete metrics collection

Collected metrics include:
• path length
• runtime
• expanded nodes
• generated nodes
• branching factor (min, max, average)
• max frontier size
• max explored size

Running PDDL Planning

The PDDL pipeline works as follows:
	1.	Generate problem_auto.pddl from GridWorld
	2.	Call Fast Downward
	3.	Parse the sas_plan output file
	4.	Convert symbolic actions into a grid path

Visualization

The script produces:
• visual maps
• obstacles
• A* paths
• PDDL paths
• start and goal positions

A* vs PDDL Comparison

Side-by-side evaluation includes:
• runtime comparison (log scale)
• path length comparison
• runtime ratio (PDDL/A*)

License

This project is for academic use as part of the AI Planning & Search homework assignment.

Author

Arianna Navarra — 2025

