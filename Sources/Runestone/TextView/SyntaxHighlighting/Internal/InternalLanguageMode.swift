import Foundation

struct InsertLineBreakIndentStrategy {
    let indentLevel: Int
    let insertExtraLineBreak: Bool
}

protocol InternalLanguageMode: AnyObject {
    var syntaxTree: TreeSitterTree? { get }
    func parse(_ text: NSString)
    func parse(_ text: NSString, completion: @escaping ((Bool) -> Void))
    func textDidChange(_ change: TextChange) -> LineChangeSet
    func createLineSyntaxHighlighter() -> LineSyntaxHighlighter
    func syntaxNode(at linePosition: LinePosition) -> SyntaxNode?
    func currentIndentLevel(of line: DocumentLineNode, using indentStrategy: IndentStrategy) -> Int
    func strategyForInsertingLineBreak(
        from startLinePosition: LinePosition,
        to endLinePosition: LinePosition,
        using indentStrategy: IndentStrategy) -> InsertLineBreakIndentStrategy
    func detectIndentStrategy() -> DetectedIndentStrategy
}
