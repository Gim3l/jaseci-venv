walker talker {
    has utterance;
    can use.enc_question, use.enc_answer; # Actions walker can take

    state {
        report {"message": "Early Exit"}; // This is intentional
        disengage;  
    }

    closing_state {
        disengage;
    }

    root{
        take -->[0];
    }
}