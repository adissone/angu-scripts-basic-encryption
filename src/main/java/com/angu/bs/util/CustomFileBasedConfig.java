package com.angu.bs.util;
import java.io.File;
import java.util.Arrays;

import org.eclipse.jgit.lib.Config;
import org.eclipse.jgit.storage.file.FileBasedConfig;
import org.eclipse.jgit.util.FS;

public class CustomFileBasedConfig extends FileBasedConfig {
    public CustomFileBasedConfig(File file, FS fs) {
        super(file, fs);
    }

    /**
     * Merge another Config into this Config.
     *
     * <p>In case a configuration parameter exists both in this instance and in the merged instance
     * then the value in this instance will simply replaced by the value from the merged instance.
     *
     * @param s Config to merge into this instance
     */
    public void merge(Config s) {
        if (s == null) {
            return;
        }
        for (String section : s.getSections()) {
            for (String subsection : s.getSubsections(section)) {
                for (String name : s.getNames(section, subsection, true)) {
                    setStringList(
                            section,
                            subsection,
                            name,
                            Arrays.asList(s.getStringList(section, subsection, name)));
                }
            }

            for (String name : s.getNames(section, true)) {
                setStringList(
                        section, null, name, Arrays.asList(s.getStringList(section, null, name)));
            }
        }
    }
}
