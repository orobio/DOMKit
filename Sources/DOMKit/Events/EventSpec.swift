public struct EventSpec<Type: Event> {
    let type: String
}

extension EventSpec {
    public static var drag          : EventSpec<DragEvent>          { .init(type: "drag")          }
    public static var dragEnd       : EventSpec<DragEvent>          { .init(type: "dragend")       }
    public static var dragEnter     : EventSpec<DragEvent>          { .init(type: "dragenter")     }
    public static var dragLeave     : EventSpec<DragEvent>          { .init(type: "dragleave")     }
    public static var dragOver      : EventSpec<DragEvent>          { .init(type: "dragover")      }
    public static var dragStart     : EventSpec<DragEvent>          { .init(type: "dragstart")     }
    public static var drop          : EventSpec<DragEvent>          { .init(type: "drop")          }

    public static var mouseDown     : EventSpec<MouseEvent>         { .init(type: "mousedown")     }
    public static var mouseEnter    : EventSpec<MouseEvent>         { .init(type: "mouseenter")    }
    public static var mouseLeave    : EventSpec<MouseEvent>         { .init(type: "mouseleave")    }
    public static var mouseMove     : EventSpec<MouseEvent>         { .init(type: "mousemove")     }
    public static var mouseUp       : EventSpec<MouseEvent>         { .init(type: "mouseup")       }

    public static var resize        : EventSpec<Event>              { .init(type: "resize")        }
}
