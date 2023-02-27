package com.angu.bs;

import javax.validation.constraints.NotNull;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.ExitCodeGenerator;
import org.springframework.stereotype.Component;
import picocli.CommandLine;

@Component
@RequiredArgsConstructor
public class BsApplicationRunner implements CommandLineRunner, ExitCodeGenerator {
    private final @NotNull CommandLine.IFactory picocliFactory;
    private final @NotNull TopCommand mainCommand;

    private int exitCode;
    Logger log = LoggerFactory.getLogger(getClass().getName());

    @Override
    public void run(String... args) throws Exception {
        exitCode = new CommandLine(mainCommand, picocliFactory).execute(args);
    }

    @Override
    public int getExitCode() {
        return exitCode;
    }
}
