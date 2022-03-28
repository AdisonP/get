folder("Tools") {
    description "Folder for miscellaneous tools."
}

freestyle("Tools/clone-repository") {
    wrappers {
        preBuildCleanup()
    }
    parameters {
        stringParam("GIT_REPOSITORY_URL", "", "Git URL of the repository to clone")
    }
    steps {
        sh "git clone ${GIT_REPOSITORY_URL}"
    }
}

freestyle("Tools/SEED") {
    parameters {
        stringParam("GITHUB_NAME", "", 'GitHub repository owner/repo_name (e.g.: "EpitechIT31000/chocolatine")')
        stringParam("DISPLAY_NAME", "", "Display name for the job")
    }
    steps {
        sh "git clone ${GIT_REPOSITORY_URL}"
    }

    job("root") {
        name "${DISPLAY_NAME}"
        wrappers {
            preBuildCleanup()
        }
        steps {
            sh "make fclean"
            sh "make"
            sh "make tests_run"
            sh "make clean"
        }
    }
}