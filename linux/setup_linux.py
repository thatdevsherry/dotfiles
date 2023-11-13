import logging
from dataclasses import dataclass
from subprocess import run
from typing import Any, List
from urllib.request import urlretrieve
from tempfile import TemporaryDirectory
from os import path

logging.basicConfig(level=logging.DEBUG)


@dataclass
class GnomeDconf:
    title: str
    section: str
    option: str
    value: Any


MY_GNOME_SETTINGS = [
    GnomeDconf(
        title="Swap escape with caps lock",
        section="org.gnome.desktop.input-sources",
        option="xkb-options",
        value="['caps:swapescape']",
    ),
    GnomeDconf(
        title="Disable tap to click",
        section="org.gnome.desktop.peripherals.touchpad",
        option="tap-to-click",
        value="false",
    ),
    GnomeDconf(
        title="Enable natural scroll on touchpad",
        section="org.gnome.desktop.peripherals.touchpad",
        option="natural-scroll",
        value="true",
    ),
    GnomeDconf(
        title="Move dock to left",
        section="org.gnome.shell.extensions.dash-to-dock",
        option="dock-position",
        value="'LEFT'",
    ),
    GnomeDconf(
        title="Set workspace on primary display only",
        section="org.gnome.mutter",
        option="workspaces-only-on-primary",
        value="true",
    ),
    GnomeDconf(
        title="Disable automatic brightness",
        section="org.gnome.settings-daemon.plugins.power",
        option="ambient-enabled",
        value="false",
    ),
]


def cmd_to_str(cmd: List[str]) -> str:
    return f"\"{' '.join(cmd)}\""


def update_setting(conf_setting: GnomeDconf) -> None:
    """
    Updates the setting if the current value is not equal to the one passed.
    """
    logging.info(f"Running: {conf_setting.title}")
    cmd_get = ["gsettings", "get", conf_setting.section, conf_setting.option]
    cmd_get_result = run(cmd_get, capture_output=True).stdout.decode().strip()
    logging.debug(f"cmd get result: {cmd_get_result}")
    if cmd_get_result == conf_setting.value:
        logging.debug("Setting already applied, skipping.")
        return
    cmd_set = cmd_get.copy()
    cmd_set[1] = "set"
    cmd_set.append(conf_setting.value)
    logging.debug(f"set cmd -> {cmd_to_str(cmd_set)}")
    cmd_set_result = run(cmd_set, capture_output=True)

    if cmd_set_result.returncode != 0:
        raise RuntimeError(f"Expected {cmd_set} to have been executed successfully")
    logging.debug("Done")


def install_deb(filepath: str) -> None:
    cmd = ["sudo", "apt", "install", filepath]
    logging.debug(f"cmd -> {cmd_to_str(cmd)}")
    cmd_output = run(cmd, capture_output=True)
    logging.debug(f"cmd output: {cmd_output}")
    logging.debug("Package installed")


def download(url: str, download_filepath: str) -> None:
    logging.debug(f"Downloading to {download_filepath}")
    a = urlretrieve(url, download_filepath)
    logging.debug(a)


def update_gnome_settings() -> None:
    logging.info("Updating gnome settings")
    [update_setting(i) for i in MY_GNOME_SETTINGS]
    logging.info("Gnome settings updated!")


DEBS = [
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb",
    "https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb",
]


def download_software() -> None:
    logging.info("Will need sudo for installing packages.")
    with TemporaryDirectory() as temp_dir:
        for url in DEBS:
            download_filepath = path.join(temp_dir, url.split("/")[-1])
            # download(url, download_filepath)
            install_deb(download_filepath)


def do_setup() -> None:
    update_gnome_settings()
    # download_software()


if __name__ == "__main__":
    logging.info("Script started.")
    do_setup()
    logging.info("Script ended.")
