# PySilon Installer
**An Educational Batch Script for Easy PySilon Installation with Persistence**

[](https://opensource.org/licenses/MIT)

## 📋 Table of Contents
- [Features](#-features)
- [Installation](#%EF%B8%8F-installation)
- [Uninstallation](#%EF%B8%8F-uninstallation)
- [FAQ](#-faq)
- [Disclaimer](#-disclaimer)
- [Contributing](#-contributing)
- [License](#-license)

## ✨ Features
- **Easy Installation**: Simple batch interface for quick deployment.
- **Persistence**: Automatically configures system for persistent operation.
- **Educational**: Designed for learning purposes with clear documentation.
- **Open Source**: Completely transparent codebase.

## ⚙️ Installation

### Requirements
- Windows operating system
- Administrator privileges
- Disabled antivirus/firewall during installation

### Steps
1. Prepare PySilon executable:
   - Compile PySilon using the official repository: [https://github.com/mategol/PySilon](https://github.com/mategol/PySilon)
   - Place your compiled executable in the `files` folder

2. Run the installer:
   - Execute `install.bat`
   - When prompted, enter your executable name (without extension)
   - Follow on-screen instructions

### Post-Installation
- PySilon will be installed to system directories
- Persistence mechanisms will be configured
- Antivirus exclusions will be added automatically

## 🗑️ Uninstallation

### Steps
1. Prepare for uninstallation:
   - Ensure your PySilon executable is in the `files` folder
   
2. Run the uninstaller:
   - Execute `uninstall.cmd`
   - Enter the same executable name used during installation
   - Follow the cleanup process

### Post-Uninstallation
- All PySilon files will be removed
- Registry entries will be restored
- Antivirus exclusions will be removed
- System will be cleaned up

## 📁 Files Structure
 PySilon-Installer/ 
 ── install.bat # Main installation script 
 ── uninstall.cmd # Uninstallation script 
 ── z_Batch_Ofuscator # Batch obfuscation tool 
 ── instructions.txt # Detailed installation guide 
 ── README.md # This instructions.
 ── AAA_Instructions.txt # Less-detailed instructions of the project.
 ── z_Compressed-by-password.rar # Compressed-by-password files to avoid antivirus detection.
 └── files/ 
 ── your_pysilon.exe # Your compiled PySilon executable
 └── z_files_ofuscated # -> All of the batchs ofuscated via a very easy to de-ofuscate way.


## ❓ FAQ
**Q: Is this safe to use?**  
A: This is an educational tool. Use only on systems you own or have permission to test on.

**Q: Why does it need administrator privileges?**  
A: The script modifies system directories and registry entries for persistence.

**Q: Can I modify the source code?**  
A: Absolutely! This is open source - feel free to customize and improve it but not copying it literally.

**Q: Will this work on all Windows versions?**  
A: Tested on Windows 10 and 11. Compatibility with older versions may vary.

## ⚠️ Disclaimer
**THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.**


## 🤝 Contributing
- Fork the repository
- Create your feature branch (`git checkout -b feature/amazing-feature`)
- Commit your changes (`git commit -am 'Add amazing feature'`)
- Push to the branch (`git push origin feature/amazing-feature`)
- Create a new Pull Request

## 📜 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact
For questions or support, please open an issue on GitHub or contact:
- Email: [github@mateag.com](mailto:github@mateag.com)

## 🏆 Acknowledgments
- PySilon project for the base functionality
- Batch scripting community for techniques and best practices

> Note: This tool is for educational purposes only. The creator is NOT responsible for any illegal or malicious use of this software. Always obtain proper authorization before using this on any system you do not own.
