extern crate argparse;

use argparse::{ArgumentParser, StoreTrue};

fn main() {
    let mut verbose = false;

    { // Limit the scope of borrows by the ap.refer() method.
        let mut parser = ArgumentParser::new();
        parser.set_description("Hello, world.");
        parser.refer(&mut verbose)
            .add_option(&["-v", "--verbose"], StoreTrue,
            "Enable verbose output.");
        parser.parse_args_or_exit();
    }

    if verbose {
        println!("Hello, world.");
    }
}
