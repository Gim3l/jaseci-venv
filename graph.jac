node state {
    has title;
    has message;
    has prompts;
}

node input_state:state {
    has input;
}

node closing_state:state;

// Allows transitons between nodes
edge transition{
    has intent;
}

graph main_graph{
    has anchor root;

    spawn {
        root = spawn node::state(
            title = 'Introduction',
            message = "Hi there, what can we do for you?",
            prompts = ['website', 'mobile app', 'information system', 'quit']
        );
            
        closing = spawn node::closing_state(
            title = "Thank you",
            message = "Great! We'll be in touch."
        );

        website = spawn root -[transition(intent="website")]-> node::state(
            title = 'Website',
            message = 'What type of website would you like to have?',
            prompts = ['one page website', 'custom website', 'five page website', 'back']
        );
            
        // Goes back to root node 
        website -[transition(intent ="back")]->root;
    }
}
