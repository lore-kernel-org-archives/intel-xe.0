Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AA1E6E80E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 11:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F375E10E61D;
	Tue,  3 Feb 2026 11:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SwG0x9u4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCCA10E61D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 11:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770117215; x=1801653215;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=4NAMrrgB17QLhaYpPrOmpA8nxtH1lb8kr35OrjF5a1w=;
 b=SwG0x9u4DXSGvA0XlJMOBxl2r016Lo2btiVoQlHLH3Iqv94q1U/4MLU4
 0c/eVz2K2FWQtFvy20kyO3QoSFmjlHcyV+2XaenpBRIyYMfD7R3pO/ufw
 5YwAC8cN7DwwPVw0gXng/cKB8cMTpWOFHeEioechQh8U8qAKxjkTpf9qE
 ZuWcKSVuMqIkDrGTT2Y5/sHCwdoPkqWBu5zH5n5HroWZQ6zMpH3xKRRYE
 Xq2GVANMTZnJNzdkcmr11wdiy6GYel/o2B3uRDTBJUlMP2SPOHqu8kLqE
 uTXq0WGFn4C/zn2mgVRgsUBavnJ+tmiGRmcK7w+O6GCq9Xf5tPTPQScLV w==;
X-CSE-ConnectionGUID: 7I/sNxrdTJqjk4iMAo3iHA==
X-CSE-MsgGUID: 21JkTnulQO6In20+BxLRrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71007721"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71007721"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 03:13:35 -0800
X-CSE-ConnectionGUID: VYbJDNlCTDOdZnXY/G+vFg==
X-CSE-MsgGUID: YfCR8xxXTheeEpvecegjZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209986682"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 03:13:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Keep all defaults in single header
In-Reply-To: <20260121214218.2817-2-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
 <20260121214218.2817-2-michal.wajdeczko@intel.com>
Date: Tue, 03 Feb 2026 13:13:30 +0200
Message-ID: <716600dcc0dd91626f45eed2faadc6d80d456de9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 21 Jan 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> We already have most of Xe defaults defined in xe_module.c,
> where we use them for the modparam initializations, but some
> were defined elsewhere, which breaks the consistency.
>
> Introduce xe_defaults.h file, that will act as a placeholder
> for all our default values, and can be used from other places.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_defaults.h     | 25 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.c       |  3 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  3 --
>  drivers/gpu/drm/xe/xe_module.c       | 42 ++++++++++------------------
>  4 files changed, 41 insertions(+), 32 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_defaults.h
>
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_def=
aults.h
> new file mode 100644
> index 000000000000..9183d05b96e1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +#ifndef _XE_DEFAULTS_H_
> +#define _XE_DEFAULTS_H_
> +
> +#include "xe_device_types.h"

What part of this header depends on xe_device_types.h?

> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define XE_DEFAULT_GUC_LOG_LEVEL		3
> +#else
> +#define XE_DEFAULT_GUC_LOG_LEVEL		1
> +#endif
> +
> +#define XE_DEFAULT_PROBE_DISPLAY		true
> +#define XE_DEFAULT_VRAM_BAR_SIZE		0
> +#define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
> +#define XE_DEFAULT_MAX_VFS			~0
> +#define XE_DEFAULT_MAX_VFS_STR			"unlimited"
> +#define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
> +#define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
> +#define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index aad4aa53a51f..17f4d048c8b9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -26,6 +26,7 @@
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
>  #include "xe_debugfs.h"
> +#include "xe_defaults.h"
>  #include "xe_devcoredump.h"
>  #include "xe_device_sysfs.h"
>  #include "xe_dma_buf.h"
> @@ -743,7 +744,7 @@ int xe_device_probe_early(struct xe_device *xe)
>  	assert_lmem_ready(xe);
>=20=20
>  	xe->wedged.mode =3D xe_device_validate_wedged_mode(xe, xe_modparam.wedg=
ed_mode) ?
> -			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
> +			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
>  	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
>  		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 34feef79fa4e..b4600c5069a9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -62,9 +62,6 @@ enum xe_wedged_mode {
>  	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET =3D 2,
>  };
>=20=20
> -#define XE_WEDGED_MODE_DEFAULT		XE_WEDGED_MODE_UPON_CRITICAL_ERROR
> -#define XE_WEDGED_MODE_DEFAULT_STR	"upon-critical-error"
> -
>  #define XE_BO_INVALID_OFFSET	LONG_MAX
>=20=20
>  #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_modul=
e.c
> index a0048f64ed12..903d3b433421 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -10,6 +10,7 @@
>=20=20
>  #include <drm/drm_module.h>
>=20=20
> +#include "xe_defaults.h"
>  #include "xe_device_types.h"
>  #include "xe_drv.h"
>  #include "xe_configfs.h"
> @@ -19,51 +20,36 @@
>  #include "xe_observation.h"
>  #include "xe_sched_job.h"
>=20=20
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -#define DEFAULT_GUC_LOG_LEVEL		3
> -#else
> -#define DEFAULT_GUC_LOG_LEVEL		1
> -#endif
> -
> -#define DEFAULT_PROBE_DISPLAY		true
> -#define DEFAULT_VRAM_BAR_SIZE		0
> -#define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
> -#define DEFAULT_MAX_VFS			~0
> -#define DEFAULT_MAX_VFS_STR		"unlimited"
> -#define DEFAULT_WEDGED_MODE		XE_WEDGED_MODE_DEFAULT
> -#define DEFAULT_WEDGED_MODE_STR		XE_WEDGED_MODE_DEFAULT_STR
> -#define DEFAULT_SVM_NOTIFIER_SIZE	512
> -
>  struct xe_modparam xe_modparam =3D {
> -	.probe_display =3D	DEFAULT_PROBE_DISPLAY,
> -	.guc_log_level =3D	DEFAULT_GUC_LOG_LEVEL,
> -	.force_probe =3D		DEFAULT_FORCE_PROBE,
> +	.probe_display =3D	XE_DEFAULT_PROBE_DISPLAY,
> +	.guc_log_level =3D	XE_DEFAULT_GUC_LOG_LEVEL,
> +	.force_probe =3D		XE_DEFAULT_FORCE_PROBE,
>  #ifdef CONFIG_PCI_IOV
> -	.max_vfs =3D		DEFAULT_MAX_VFS,
> +	.max_vfs =3D		XE_DEFAULT_MAX_VFS,
>  #endif
> -	.wedged_mode =3D		DEFAULT_WEDGED_MODE,
> -	.svm_notifier_size =3D	DEFAULT_SVM_NOTIFIER_SIZE,
> +	.wedged_mode =3D		XE_DEFAULT_WEDGED_MODE,
> +	.svm_notifier_size =3D	XE_DEFAULT_SVM_NOTIFIER_SIZE,
>  	/* the rest are 0 by default */
>  };
>=20=20
>  module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uin=
t, 0600);
>  MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, m=
ust be power of 2 "
> -		 "[default=3D" __stringify(DEFAULT_SVM_NOTIFIER_SIZE) "]");
> +		 "[default=3D" __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
>=20=20
>  module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bo=
ol, 0444);
>  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>=20=20
>  module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
>  MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left u=
ntouched "
> -		 "[default=3D" __stringify(DEFAULT_PROBE_DISPLAY) "])");
> +		 "[default=3D" __stringify(XE_DEFAULT_PROBE_DISPLAY) "])");
>=20=20
>  module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, =
0600);
>  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=3Ddisa=
ble-resize, 0=3Dmax-needed-size, >0=3Dforce-size "
> -		 "[default=3D" __stringify(DEFAULT_VRAM_BAR_SIZE) "])");
> +		 "[default=3D" __stringify(XE_DEFAULT_VRAM_BAR_SIZE) "])");
>=20=20
>  module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=3Ddisable=
, 1=3Dnormal, 2..5=3Dverbose-levels "
> -		 "[default=3D" __stringify(DEFAULT_GUC_LOG_LEVEL) "])");
> +		 "[default=3D" __stringify(XE_DEFAULT_GUC_LOG_LEVEL) "])");
>=20=20
>  module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_pa=
th, charp, 0400);
>  MODULE_PARM_DESC(guc_firmware_path,
> @@ -80,20 +66,20 @@ MODULE_PARM_DESC(gsc_firmware_path,
>  module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0=
400);
>  MODULE_PARM_DESC(force_probe,
>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_P=
ROBE for details "
> -		 "[default=3D" DEFAULT_FORCE_PROBE "])");
> +		 "[default=3D" XE_DEFAULT_FORCE_PROBE "])");
>=20=20
>  #ifdef CONFIG_PCI_IOV
>  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>  MODULE_PARM_DESC(max_vfs,
>  		 "Limit number of Virtual Functions (VFs) that could be managed. "
>  		 "(0=3Dno VFs; N=3Dallow up to N VFs "
> -		 "[default=3D" DEFAULT_MAX_VFS_STR "])");
> +		 "[default=3D" XE_DEFAULT_MAX_VFS_STR "])");
>  #endif
>=20=20
>  module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 06=
00);
>  MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode (0=3Dnever, 1=3Dupon-cri=
tical-error, 2=3Dupon-any-hang-no-reset "
> -		 "[default=3D" DEFAULT_WEDGED_MODE_STR "])");
> +		 "[default=3D" XE_DEFAULT_WEDGED_MODE_STR "])");
>=20=20
>  static int xe_check_nomodeset(void)
>  {

--=20
Jani Nikula, Intel
