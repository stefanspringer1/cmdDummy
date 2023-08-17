import Foundation
import ArgumentParser
import libDummy
import Workflow

@main
@available(macOS 10.15, *)
struct Main: ParsableCommand {
    
    @Argument(help: "The path to the XML source.")
    var source: String
 
    mutating func run() throws {
        
        let applicationName = "cmdDummy"
        
        let collectingLogger = CollectingLogger(loggingLevel: .Warning)
        
        let logger = MultiLogger(
            PrintLogger(loggingLevel: .Progress),
            collectingLogger
        )
        
        let execution = Execution(logger: logger, applicationName: applicationName)
        
        defer {
            try? logger.close()
        }
        
        dummy_step(
            during: execution,
            forSource: URL(fileURLWithPath: source)
        )
    }
}
