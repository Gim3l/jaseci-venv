import {*} with './graph.jac';
import {*} with './walkers.jac';

walker init {
    // Spawn main graph at root
    root {
        spawn here --> graph::main_graph;
    }
}
