package micronat.graalvm.docker

import io.micronaut.configuration.picocli.PicocliRunner
import io.micronaut.context.ApplicationContext

import picocli.CommandLine
import picocli.CommandLine.Command
import picocli.CommandLine.Option
import picocli.CommandLine.Parameters

@Command(name = "micronat-graalvm-docker", description = ["..."],
        mixinStandardHelpOptions = true)
class MicronatGraalvmDockerCommand : Runnable {

    @Option(names = ["-v", "--verbose"], description = ["..."])
    private var verbose : Boolean = false

    override fun run() {
        // business logic here
        if (verbose) {
            println("Hi!")
        }
        println("Hello Kotlin")
    }

    companion object {
        @JvmStatic fun main(args: Array<String>) {
            PicocliRunner.run(MicronatGraalvmDockerCommand::class.java, *args)
        }
    }
}
