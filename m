Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD05CC636CC
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 13:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80A210E180;
	Thu, 16 Feb 2023 13:12:21 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3539D10E179
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 13:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676553139; x=1708089139;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Z15Xo5UI3gDtObiv0aEzP496bUvhydP9O2ZVhRnit7Q=;
 b=W57A1cDqRzbbinz46NL96JskDeaur4HPHsG2x3vt0piTdfqOVp4A3UW+
 21QeU8a1cizcBq2enDb6EICEEi9tydTCB603Q8yGj/uxWvStuzBjHa497
 ek1P/qJH37R0HEAkwdTtaoJRJPquNJKuHp620rtuJeZmrSYx6NbJT97/2
 K+PKZ2b4MGGttT45fXLlFcrH2oyq1DJaXKHCwBmBNZLej2ZxRaeJNnzy3
 C1sPrwjsf+5hhwrXeraS52tQ6QCQrQ65h4WvFz4Rz9oqfkWONfEwPa8Dy
 IEOQS1+T9BUqDQzg7apI4tA4bQKqxhdoMv96MetBmJiCGVsNToIntRTnD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="315389726"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="315389726"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 05:12:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="779337295"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="779337295"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.155])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 05:12:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230203202742.577659-3-rodrigo.vivi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230203202742.577659-1-rodrigo.vivi@intel.com>
 <20230203202742.577659-3-rodrigo.vivi@intel.com>
Date: Thu, 16 Feb 2023 15:12:13 +0200
Message-ID: <87cz6921qq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: place all modprobe parameters at
 the same place
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 03 Feb 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
> It makes easier to identify the module parameters if they're
> placed it at the same place.
>
> Place them together with the module author/description/license.
>
> While here, fix a checkpatch.pl warning on force_probe description:
> 	WARNING: quoted string split across lines
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I don't really see why this needs to reinvent the wheel when we could
use the same model as i915. Separate file, all params in a struct that
provides a namespace for the params. It's hideous to have them all in
the driver local namespace.

> ---
>  drivers/gpu/drm/xe/xe_device.c  | 10 +---------
>  drivers/gpu/drm/xe/xe_guc_log.c |  5 +----
>  drivers/gpu/drm/xe/xe_mmio.c    |  5 +----
>  drivers/gpu/drm/xe/xe_module.c  | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_module.h  | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_pci.c     |  7 +------
>  6 files changed, 39 insertions(+), 23 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_module.h
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 2e1f4beba9b0..60938c2deee2 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -20,6 +20,7 @@
>  #include "xe_exec.h"
>  #include "xe_gt.h"
>  #include "xe_irq.h"
> +#include "xe_module.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> @@ -42,15 +43,6 @@
>  #include "display/ext/intel_pm.h"
>  #endif
>=20=20
> -/* FIXME: Move to common param infrastructure */
> -static bool enable_guc =3D true;
> -module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
> -MODULE_PARM_DESC(enable_guc, "Enable GuC submission");
> -
> -static bool enable_display =3D true;
> -module_param_named(enable_display, enable_display, bool, 0444);
> -MODULE_PARM_DESC(enable_display, "Enable display");
> -
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct xe_file *xef;
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_=
log.c
> index 3f19fbf243d1..7ec1b2bb1f8e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -9,10 +9,7 @@
>  #include "xe_gt.h"
>  #include "xe_guc_log.h"
>  #include "xe_map.h"
> -
> -static int xe_guc_log_level =3D 5;
> -module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
> -MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=3Ddisable=
, 1..5=3Denable with verbosity min..max)");
> +#include "xe_module.h"
>=20=20
>  static struct xe_gt *
>  log_to_gt(struct xe_guc_log *log)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f20734cf15ba..8a953df2b468 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -12,6 +12,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
> +#include "xe_module.h"
>=20=20
>  #include "i915_reg.h"
>  #include "gt/intel_engine_regs.h"
> @@ -21,10 +22,6 @@
>  #define TILE_COUNT		REG_GENMASK(15, 8)
>  #define GEN12_LMEM_BAR		2
>=20=20
> -static u32 xe_force_lmem_bar_size;
> -module_param_named(lmem_bar_size, xe_force_lmem_bar_size, uint, 0600);
> -MODULE_PARM_DESC(lmem_bar_size, "Set the lmem bar size(in MiB)");
> -
>  static int xe_set_dma_info(struct xe_device *xe)
>  {
>  	unsigned int mask_size =3D xe->info.dma_mask_size;
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_modul=
e.c
> index d6b50f1c2a05..9cd1663f83f6 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -8,9 +8,31 @@
>=20=20
>  #include "xe_drv.h"
>  #include "xe_hw_fence.h"
> +#include "xe_module.h"
>  #include "xe_pci.h"
>  #include "xe_sched_job.h"
>=20=20
> +bool enable_guc =3D true;
> +module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
> +MODULE_PARM_DESC(enable_guc, "Enable GuC submission");
> +
> +bool enable_display =3D true;
> +module_param_named(enable_display, enable_display, bool, 0444);
> +MODULE_PARM_DESC(enable_display, "Enable display");
> +
> +u32 xe_force_lmem_bar_size;
> +module_param_named(lmem_bar_size, xe_force_lmem_bar_size, uint, 0600);
> +MODULE_PARM_DESC(lmem_bar_size, "Set the lmem bar size(in MiB)");
> +
> +int xe_guc_log_level =3D 5;
> +module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
> +MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=3Ddisable=
, 1..5=3Denable with verbosity min..max)");
> +
> +char *xe_param_force_probe =3D CONFIG_DRM_XE_FORCE_PROBE;
> +module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400=
);
> +MODULE_PARM_DESC(force_probe,
> +		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_P=
ROBE for details.");
> +
>  struct init_funcs {
>  	int (*init)(void);
>  	void (*exit)(void);
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_modul=
e.h
> new file mode 100644
> index 000000000000..2c6ee46f5595
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#include <linux/init.h>
> +
> +/* Module modprobe variables */
> +extern bool enable_guc;
> +extern bool enable_display;
> +extern u32 xe_force_lmem_bar_size;
> +extern int xe_guc_log_level;
> +extern char *xe_param_force_probe;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1d5b6afed2c3..20aa2b5ca9ac 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -17,17 +17,12 @@
>  #include "xe_drv.h"
>  #include "xe_device.h"
>  #include "xe_macros.h"
> +#include "xe_module.h"
>  #include "xe_pm.h"
>  #include "xe_step.h"
>=20=20
>  #include "i915_reg.h"
>=20=20
> -static char *xe_param_force_probe =3D CONFIG_DRM_XE_FORCE_PROBE;
> -module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400=
);
> -MODULE_PARM_DESC(force_probe,
> -		 "Force probe options for specified devices. "
> -		 "See CONFIG_DRM_XE_FORCE_PROBE for details.");
> -
>  #define DEV_INFO_FOR_EACH_FLAG(func) \
>  	func(require_force_probe); \
>  	func(is_dgfx); \

--=20
Jani Nikula, Intel Open Source Graphics Center
