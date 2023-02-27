package com.angu.bs.command;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ExitCodeGenerator;
import org.springframework.stereotype.Component;
import picocli.CommandLine;

@CommandLine.Command(name = "try", showAtFileInUsageHelp = true, mixinStandardHelpOptions = true)
@Component
@RequiredArgsConstructor
public class TryCommand implements Runnable, ExitCodeGenerator {
    @CommandLine.Option(names = {"-o", "--output"}, description = "Output parameter")
    String output;

    @Override
    public void run() {
        System.out.println("'try' command executing...");
    }

    @Override
    public int getExitCode() {
        return 0;
    }
}
