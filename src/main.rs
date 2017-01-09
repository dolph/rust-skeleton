extern crate argparse;

struct Options {
    debug: bool,
    verbose: bool,
}

fn main() {
    let mut options = Options {
        debug: false,
        verbose: false,
    };

    { // Limit the scope of borrows by the ap.refer() method.
        let mut parser = argparse::ArgumentParser::new();
        parser.set_description(env!("CARGO_PKG_DESCRIPTION"));
        parser.add_option(&["--version"],
            argparse::Print(
                format!(
                    "{} {}",
                    env!("CARGO_PKG_NAME"),
                    env!("CARGO_PKG_VERSION"))),
            "Show version information.");
        parser.refer(&mut options.verbose)
            .add_option(&["-v", "--verbose"], argparse::StoreTrue,
            "Enable verbose output.");
        parser.refer(&mut options.debug)
            .add_option(&["--debug"], argparse::StoreTrue,
            "Enable debug mode.");
        parser.parse_args_or_exit();
    }

    if options.verbose {
        println!("Hello, world.");
    }
}

#[cfg(test)]
mod tests {
    use super::main;

    #[test]
    fn it_works() {
        main();
    }
}
