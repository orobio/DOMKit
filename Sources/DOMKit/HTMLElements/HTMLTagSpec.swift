public struct HTMLTagSpec<Type: HTMLElement> {
    let tagName: String
}

extension HTMLTagSpec {
    public static var div       : HTMLTagSpec<HTMLDivElement>           { .init(tagName: "DIV")     }

    public static var head      : HTMLTagSpec<HTMLHeadElement>          { .init(tagName: "HEAD")    }

    public static var input     : HTMLTagSpec<HTMLInputElement>         { .init(tagName: "INPUT")   }

    public static var span      : HTMLTagSpec<HTMLSpanElement>          { .init(tagName: "SPAN")    }

    public static var style     : HTMLTagSpec<HTMLStyleElement>         { .init(tagName: "STYLE")   }

    public static var th        : HTMLTagSpec<HTMLTableCellElement>     { .init(tagName: "TH")      }
    public static var td        : HTMLTagSpec<HTMLTableCellElement>     { .init(tagName: "TD")      }

    public static var table     : HTMLTagSpec<HTMLTableElement>         { .init(tagName: "TABLE")   }

    public static var tr        : HTMLTagSpec<HTMLTableRowElement>      { .init(tagName: "TR")      }

    public static var thead     : HTMLTagSpec<HTMLTableSectionElement>  { .init(tagName: "THEAD")   }
    public static var tbody     : HTMLTagSpec<HTMLTableSectionElement>  { .init(tagName: "TBODY")   }
    public static var tfoot     : HTMLTagSpec<HTMLTableSectionElement>  { .init(tagName: "TFOOT")   }
}
