package com.angu.bs.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

public class Utils {

    public static String getFileContent(File file) {
        try {
            byte[] bytes = Files.readAllBytes(Paths.get(file.getAbsolutePath()));
            return new String(bytes);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String getCurrentDateFormatted(String dateTimePattern) {
        return ZonedDateTime.now().format(DateTimeFormatter.ofPattern(dateTimePattern));
    }

    public static Path getBackupPathForFile(Path originalPath) {
        String suffixDatePattern = "yyyyMMdd_HHmmss";
        String backupFileName = String.format("%s_%s.bkp", originalPath.getFileName().toString(), getCurrentDateFormatted(suffixDatePattern));
        return Paths.get(originalPath.getParent().toString(), backupFileName);
    }

    public static void makeBackup(Path originalPath) throws IOException {
        // Make backup of the user git config (add date to the backup file name: e.g. ".gitconfig_20200101_110000.bkp")
        if (Files.isRegularFile(originalPath)) {
            Path userGitConfigBackupPath = getBackupPathForFile(originalPath);
            LoggerFactory.getLogger(Utils.class.getName()).debug("Creating backup of {} into {}", originalPath, userGitConfigBackupPath);
            Files.copy(originalPath, userGitConfigBackupPath);
        }
    }

    public static String adddTrailingSlash(String value) {
        return value.endsWith("/") ? value : value + "/";
    }
}
