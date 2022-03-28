FROM jenkins/jenkins

COPY --chown=jenkins:jenkins job_dsl.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy

ENV JENKINS_UC=https://updates.jenkins.io

ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs/

ENV USER_CHOCOLATEEN_PASSWORD=${USER_CHOCOLATEEN_PASSWORD}

ENV USER_VAUGIE_G_PASSWORD=${USER_VAUGIE_G_PASSWORD}

ENV USER_I_DONT_KNOW_PASSWORD=${USER_I_DONT_KNOW_PASSWORD}

ENV USER_NASSO_PASSWORD=${USER_NASSO_PASSWORD}

COPY --chown=jenkins:jenkins my_marvin.yml /var/jenkins_home/casc_configs/my_marvin.yml

RUN jenkins-plugin-cli --plugins cloudbees-folder configuration-as-code credentials github job-dsl script-security structs role-strategy ws-cleanup