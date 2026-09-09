Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE84C79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 08:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6DA10EFA8;
	Wed,  9 Sep 2026 08:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhcHw5fz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7C310EFA8
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 08:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788941017; x=1820477017;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=YlsU4wzunwm2G4akCiN7PALzw/VgmdJpONSN0EVnXd0=;
 b=QhcHw5fzKXaDQPjtbZbKdZH4SjFIhlZehuJ7FGxciTKPw6mGhUoOdyKh
 4pGlzgUTD40vNV38RVI9b56Xm61jLsNhwTqoJIBvrmha5QRnKjh+biLhS
 lIBBSgLmCykoNS/uiAo11O18cL6glnWPmFntUBHFXwNMXRKFAbhq+VgIP
 a5EhbNBigNc+CjrJTtp+IhfDO3dWsGrXSHxdZ61E6CB6i5SVYqx782RyH
 F/XeZyhjSdm/JDG8/UoVH/GYG3kwmJZx6XLbPjio1Wd5Q+NjIFaEZV+6r
 pUAA5tKpKVQLWeIRMmuqVpctcqhZ2OPLMJr1WUJgD7eHvWpuq+nOUod6D A==;
X-CSE-ConnectionGUID: 7/qNw9y4RRe8zpLaulpGaQ==
X-CSE-MsgGUID: UmondyPzTKyBUvCq6bvdUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106726562"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="106726562"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 01:03:36 -0700
X-CSE-ConnectionGUID: HuDAOXPFRWe0pS2seifnhw==
X-CSE-MsgGUID: kppcC0jLSBa1oiUaFcqQQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="274779992"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.60])
 ([10.245.245.60])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 01:03:35 -0700
Message-ID: <ede219e02fab3c78c66edfb9cabd0e029de318e6.camel@linux.intel.com>
Subject: Re: [PATCH v6 23/24] drm/xe: Add modparam to enable / disable ULLS
 on migrate queue
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 10:03:32 +0200
In-Reply-To: <20260904211613.3934307-24-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-24-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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

On Fri, 2026-09-04 at 14:16 -0700, Matthew Brost wrote:
> Having modparam to enable / disable ULLS on migrate queue will help
> with
> quick experiments.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link:
> https://patch.msgid.link/20260228013501.106680-26-matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/xe/xe_defaults.h=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 1 +
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0drivers/gpu/drm/xe/xe_module.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 4 ++++
> =C2=A0drivers/gpu/drm/xe/xe_module.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 1 +
> =C2=A07 files changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> b/drivers/gpu/drm/xe/xe_debugfs.c
> index 80f62634fae5..f3f37d116d62 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -222,6 +222,7 @@ static int info(struct seq_file *m, void *data)
> =C2=A0	drm_printf(&p, "revid %d\n", xe->info.revid);
> =C2=A0	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
> =C2=A0	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
> +	drm_printf(&p, "ulls_enable %s\n", str_yes_no(xe-
> >info.ulls_enable));
> =C2=A0	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe-
> >info.has_flat_ccs));
> =C2=A0	drm_printf(&p, "has_usm %s\n", str_yes_no(xe-
> >info.has_usm));
> =C2=A0	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe-
> >info.skip_guc_pc));
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h
> b/drivers/gpu/drm/xe/xe_defaults.h
> index 0884224ef7c7..9c7e89a169c5 100644
> --- a/drivers/gpu/drm/xe/xe_defaults.h
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -14,6 +14,7 @@
> =C2=A0#endif
> =C2=A0
> =C2=A0#define
> XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> +#define XE_DEFAULT_ULLS_ENABLE			true
> =C2=A0#define XE_DEFAULT_VRAM_BAR_SIZE		0
> =C2=A0#define
> XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
> =C2=A0#define XE_DEFAULT_MAX_VFS			~0
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index ade971de1652..9b81759af28a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -520,6 +520,7 @@ static void xe_device_parse_modparam(struct
> xe_device *xe)
> =C2=A0	xe->atomic_svm_timeslice_ms =3D 5;
> =C2=A0	xe->min_run_period_lr_ms =3D 5;
> =C2=A0	xe->info.num_pf_work =3D xe_modparam.num_pf_work;
> +	xe->info.ulls_enable =3D xe_modparam.ulls_enable;

migrate_ulls_enable?

> =C2=A0	if (xe->info.num_pf_work < 1)
> =C2=A0		xe->info.num_pf_work =3D 1;
> =C2=A0	else if (xe->info.num_pf_work > XE_PAGEFAULT_WORK_MAX)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 997ac82fd571..fd4560378f5b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -245,6 +245,11 @@ struct xe_device {
> =C2=A0		u8 skip_pcode:1;
> =C2=A0		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ
> on VF */
> =C2=A0		u8 needs_shared_vf_gt_wq:1;
> +		/**
> +		 * @info.ulls_enable: Enable ULLS on migration queue
> in LR VM
> +		 * open
> +		 */
> +		u8 ulls_enable:1;
> =C2=A0	} info;
> =C2=A0
> =C2=A0	/** @wa_active: keep track of active workarounds */
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 3e59aeeca614..3bc78f761f23 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -523,7 +523,7 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
> =C2=A0
> =C2=A0	xe_assert(xe, xe->info.has_usm);
> =C2=A0
> -	if (!IS_DGFX(xe))
> +	if (!IS_DGFX(xe) || !xe->info.ulls_enable)
> =C2=A0		return;
> =C2=A0
> =C2=A0job_alloc:
> diff --git a/drivers/gpu/drm/xe/xe_module.c
> b/drivers/gpu/drm/xe/xe_module.c
> index 4bc28dfc1992..a8b546550ead 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -23,6 +23,7 @@
> =C2=A0
> =C2=A0struct xe_modparam xe_modparam =3D {
> =C2=A0	.probe_display =3D	XE_DEFAULT_PROBE_DISPLAY,
> +	.ulls_enable =3D		XE_DEFAULT_ULLS_ENABLE,
> =C2=A0	.guc_log_level =3D	XE_DEFAULT_GUC_LOG_LEVEL,
> =C2=A0	.force_probe =3D		XE_DEFAULT_FORCE_PROBE,
> =C2=A0#ifdef CONFIG_PCI_IOV
> @@ -44,6 +45,9 @@ MODULE_PARM_DESC(probe_display, "Probe display HW,
> otherwise it's left untouched
> =C2=A0		 "[default=3D" __stringify(XE_DEFAULT_PROBE_DISPLAY)
> "])");
> =C2=A0#endif
> =C2=A0
> +module_param_named(ulls_enable, xe_modparam.ulls_enable, bool,
> 0444);
> +MODULE_PARM_DESC(ulls_enable, "Enable ULLS on migration queue if LR
> VM open (default: true)");
> +
> =C2=A0module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size,
> int, 0600);
> =C2=A0MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB
> (<0=3Ddisable-resize, 0=3Dmax-needed-size, >0=3Dforce-size "
> =C2=A0		 "[default=3D" __stringify(XE_DEFAULT_VRAM_BAR_SIZE)
> "])");
> diff --git a/drivers/gpu/drm/xe/xe_module.h
> b/drivers/gpu/drm/xe/xe_module.h
> index 6272d9e41207..5d88448c298a 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -13,6 +13,7 @@ struct work_struct;
> =C2=A0/* Module modprobe variables */
> =C2=A0struct xe_modparam {
> =C2=A0	bool probe_display;
> +	bool ulls_enable;

Shouldn't this be per device rather than per driver? So sysfs knob,
perhaps with a modparam default?

Thanks,
Thomas



> =C2=A0	int force_vram_bar_size;
> =C2=A0	int guc_log_level;
> =C2=A0	char *guc_firmware_path;
