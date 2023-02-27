package com.angu.bs.command.converter;

import picocli.CommandLine;

import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class PathConverter implements CommandLine.ITypeConverter<Path> {
    @Override
    public Path convert(String value) throws FileNotFoundException {
        Path result = Paths.get(value);
        if (!Files.exists(result)) {
            throw new FileNotFoundException("Not found: " + value);
        }
        return result;
    }
}

