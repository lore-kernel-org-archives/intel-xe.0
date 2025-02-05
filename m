Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5F5C02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 13:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADC210E086;
	Wed,  5 Feb 2025 13:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFEAZPw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F134A10E086
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 13:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738761395; x=1770297395;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uGhbUKOIC5TP3sa2XSrjKo2WEB/MRZjIRFNuC299r04=;
 b=eFEAZPw6rkJkJN89SGpeXk8QmB7dTIkg0p6QMhvzKxwrfF/vGGN0+1ei
 9bsElj4KfzP1BOFVCBj2/DzUBFPwjOQi7M+B336WrI7P4rHuxkTyWCq6L
 QYcv1ttBNAfrQn3xQxtptMHi8ed2J8ZeYXkIytaRSFdFBtPL4mnF4Ui53
 wa5zaDDi6XzvNwaBWjffyzGYRc3JglPVLdGw0UfQtalLM/o2TD0krsgXo
 h9lj/00v4Sggn1n3EKnZ7N8pEeljJDyUWc0kS5FEwo7aA327o/HiyrC+j
 ycGfXjhoAB1vcClsh0I+p3IjEjrGTbpT5MjR9Mn1kIGPyOz7MuQJb0R0c w==;
X-CSE-ConnectionGUID: J20PlUceT5SDeM04qyrBVg==
X-CSE-MsgGUID: 31IuO4X7RmWOA8AEWWelAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39436368"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39436368"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 05:16:35 -0800
X-CSE-ConnectionGUID: 3A1JOTyERtuehJwL/JIwuQ==
X-CSE-MsgGUID: 7XyLJILeSy2LDXWqtEJCBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110747720"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.213])
 ([10.245.246.213])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 05:16:34 -0800
Message-ID: <f5ea7496a09c6dd74a2f69ed0c927ca358a0e33d.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Introduced needs_scratch bit in device
 descriptor
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, jonathan.cavitt@intel.com
Date: Wed, 05 Feb 2025 14:16:31 +0100
In-Reply-To: <20250204184558.4181478-1-oak.zeng@intel.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Tue, 2025-02-04 at 13:45 -0500, Oak Zeng wrote:
> On some platform, scratch page is needed for out of bound prefetch
> to work. Introduce a bit in device descriptor to specify whether
> this device needs scratch page to work.
>=20
> v2: introduce a needs_scratch bit in device info (Thomas, Jonathan)
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h | 3 +++
> =C2=A0drivers/gpu/drm/xe/xe_pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 5 +++++
> =C2=A02 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index c0e886bac183..1197ab31e528 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -45,6 +45,7 @@ struct xe_pxp;
> =C2=A0#define GRAPHICS_VERx100(xe) ((xe)->info.graphics_verx100)
> =C2=A0#define MEDIA_VERx100(xe) ((xe)->info.media_verx100)
> =C2=A0#define IS_DGFX(xe) ((xe)->info.is_dgfx)
> +#define NEEDS_SCRATCH(xe) ((xe)->info.needs_scratch)
> =C2=A0
> =C2=A0#define XE_VRAM_FLAGS_NEED64K		BIT(0)
> =C2=A0
> @@ -318,6 +319,8 @@ struct xe_device {
> =C2=A0		u8 has_usm:1;
> =C2=A0		/** @info.is_dgfx: is discrete device */
> =C2=A0		u8 is_dgfx:1;
> +		/** @info.needs_scratch: needs scratch page for oob
> prefetch to work */
> +		u8 needs_scratch:1;
> =C2=A0		/**
> =C2=A0		 * @info.probe_display: Probe display hardware.=C2=A0 If
> set to
> =C2=A0		 * false, the driver will behave as if there is no
> display
> diff --git a/drivers/gpu/drm/xe/xe_pci.c
> b/drivers/gpu/drm/xe/xe_pci.c
> index e8ef7d6b4db8..09736674a77e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -67,6 +67,7 @@ struct xe_device_desc {
> =C2=A0	u8 has_llc:1;
> =C2=A0	u8 has_pxp:1;
> =C2=A0	u8 has_sriov:1;
> +	u8 needs_scratch:1;
> =C2=A0	u8 skip_guc_pc:1;
> =C2=A0	u8 skip_mtcfg:1;
> =C2=A0	u8 skip_pcode:1;
> @@ -353,6 +354,7 @@ static const struct xe_device_desc lnl_desc =3D {
> =C2=A0	.dma_mask_size =3D 46,
> =C2=A0	.has_display =3D true,
> =C2=A0	.has_pxp =3D true,
> +	.needs_scratch =3D true,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct xe_device_desc bmg_desc =3D {
> @@ -361,6 +363,7 @@ static const struct xe_device_desc bmg_desc =3D {
> =C2=A0	.dma_mask_size =3D 46,
> =C2=A0	.has_display =3D true,
> =C2=A0	.has_heci_cscfi =3D 1,
> +	.needs_scratch =3D true,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct xe_device_desc ptl_desc =3D {
> @@ -368,6 +371,7 @@ static const struct xe_device_desc ptl_desc =3D {
> =C2=A0	.dma_mask_size =3D 46,
> =C2=A0	.has_display =3D true,
> =C2=A0	.require_force_probe =3D true,
> +	.needs_scratch =3D true,
> =C2=A0};
> =C2=A0
> =C2=A0#undef PLATFORM
> @@ -643,6 +647,7 @@ static int xe_info_init_early(struct xe_device
> *xe,
> =C2=A0	xe->info.skip_guc_pc =3D desc->skip_guc_pc;
> =C2=A0	xe->info.skip_mtcfg =3D desc->skip_mtcfg;
> =C2=A0	xe->info.skip_pcode =3D desc->skip_pcode;
> +	xe->info.needs_scratch =3D desc->needs_scratch;
> =C2=A0
> =C2=A0	xe->info.probe_display =3D IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> &&
> =C2=A0				 xe_modparam.probe_display &&

