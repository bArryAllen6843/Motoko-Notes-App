import List "mo:base/List";
import Debug "mo:base/Debug";
import Text "mo:base/Text";
import Nat "mo:base/Nat";

actor DKeeper {

  // making a data type of name Note
  public type Note = {
    title: Text;
    content: Text;
  };

  // creating a list of name notes
  stable var notes : List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text) {

    // updating our newNote using Note data type which created above
    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

    // this newNote is pushed at the starting of notes
    notes := List.push(newNote,notes);
    Debug.print(debug_show(notes));
  };

  public query func readNotes(): async [Note] {
    return List.toArray(notes); 
  };

  public func removeNote(id: Nat) {
    
    let listFront = List.take(notes, id);
    let listBack = List.drop(notes, id+1);
    notes := List.append(listFront, listBack);  
    // Debug.print("akdjkgdql");
  };
} 