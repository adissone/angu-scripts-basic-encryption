package com.angu.bs;

import com.angu.bs.command.ReadGitConfigCommand;
import com.angu.bs.command.TryCommand;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import picocli.CommandLine;

import static picocli.CommandLine.*;
import static picocli.CommandLine.Command;
import static picocli.CommandLine.Model.*;

@RequiredArgsConstructor
@Component
@Command(name = "", subcommands = {TryCommand.class, ReadGitConfigCommand.class})
public class TopCommand implements Runnable {
    @Spec
    CommandSpec spec;

    public void run() {
        throw new ParameterException(spec.commandLine(), "Missing required command");
    }

}
