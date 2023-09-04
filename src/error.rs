use snafu::Snafu;

#[derive(Snafu, Debug)]
pub enum FSRSError {
    NotEnoughData,
    Interrupted,
}

pub type Result<T, E = FSRSError> = std::result::Result<T, E>;
