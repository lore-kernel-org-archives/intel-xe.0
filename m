Return-Path: <intel-xe-bounces@lists.freedesktop.org>
Date: Fri, 20 Jan 2023 23:58:25 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <20230120235811.060baaad@coco.lan>
In-Reply-To: <20230120204426.68104-13-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
 <20230120204426.68104-13-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 12/20] ]65; 7002;
 1cdrm/xe: Add min config for kunit integration ARCH=um
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, maarten.lankhorst@linux.intel.com, intel-xe@lists.freedesktop.org, philippe.lecluse@intel.com

Em Fri, 20 Jan 2023 15:44:18 -0500
Rodrigo Vivi <rodrigo.vivi@intel.com> escreveu:

> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Some of the tests may benefit from running with ARCH=um, forgoing any
> additional setup on the CI build side. Add min config for that.
> 
> Tested with:
> 
> 	./tools/testing/kunit/kunit.py build \
> 		--kunitconfig drivers/gpu/drm/xe/.kunitconfig \
> 		--jobs $(nproc) \
> 		--build_dir build_kunit
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

There are some issues on this patch that were addressed later on in
this series, on other patches, but, as after having this series applied,
kunit.py runs, feel free to add:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Regards,
Mauro

PS.: I think "--jobs $(nproc)" is optional, as kunit.py already
does that.

> ---
>  drivers/gpu/drm/xe/.kunitconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/.kunitconfig
> 
> diff --git a/drivers/gpu/drm/xe/.kunitconfig b/drivers/gpu/drm/xe/.kunitconfig
> new file mode 100644
> index 000000000000..ce8a4348669d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/.kunitconfig
> @@ -0,0 +1,7 @@
> +# xe dependencies
> +CONFIG_KUNIT=y
> +CONFIG_PCI=y
> +CONFIG_DRM=y
> +CONFIG_DRM_XE=y
> +CONFIG_EXPERT=y
> +CONFIG_DRM_XE_KUNIT_TEST=y



Thanks,
Mauro

