Automatically generates (or updates if already existing) an SSL certificate for domain registered at Godaddy and hosted at GitLab Pages.

Run:

    chmod 770 certbot_generate.sh  register_gitlab.sh register_godaddy.sh

Configure domain names and your API keys at the file called `config`:

The run the script:

    ./certbot_generate.sh

You can optionally pass a custom config file (absolute or relative the to certbot_generate.sh file location):

    ./certbot_generate.sh path/to_custom_config_file

Note: USE AT YOUR OWN RISK.
This software is distributed on an "AS IS" BASIS, WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
