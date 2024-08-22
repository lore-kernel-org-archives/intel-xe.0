Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E52C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 12:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE5F10E094;
	Thu, 22 Aug 2024 12:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLkz1iUn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C70E10E094
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 12:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724330902; x=1755866902;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EJtPtvigZdhX+tD5P2ZACpdiJBXDRyr5qTgl4LWXKso=;
 b=bLkz1iUnrCGM1kzD06h3ciP0UhZY4W3Sr2KjjNrmoQDAFkAetj/gKH6C
 i2m7CqnOqlErQ4JmzMRgdsjKaEEyEAiBEZ/uP+qWQNCc2HuW6Z1juB9du
 p55x26XXUqnxu9yMBa8GftZDXPoLkheAuWvlkWclBPQoWwKxckimwJu7q
 TAww3VaZz2PGcrWd1JNRCa2HqyHP7fncAny8D1dyjL5XXqc5lnWo29daI
 1B9bZBSMlxVBJYRiikUY6ld5L3jMO9vg4aioAdZGXcAAiJadvJokCqMtB
 k2J/ZPkjaJ2hgiCR1uOhigtwhaAyafLBVBsthA/LDg1ssld/A8dMX5F/o Q==;
X-CSE-ConnectionGUID: E3yEgmkzQfips/TNYOyDGA==
X-CSE-MsgGUID: z8giTQW6ROu6l4xfMab7bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26608408"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="26608408"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:48:21 -0700
X-CSE-ConnectionGUID: stFe3mE6SdGbZGE1juyBPA==
X-CSE-MsgGUID: QZePXiD1QyOOcrXFLkifsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61753021"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.121])
 ([10.245.244.121])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:48:20 -0700
Message-ID: <a9ad7e74e3bbd66ed290abaa00b77a9338de7482.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Align all 64k VRAM buffers physically
 when multiple of 64k.
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Zbigniew =?UTF-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Juha-Pekka =?ISO-8859-1?Q?Heikkil=E4?=
 <juha-pekka.heikkila@intel.com>
Date: Thu, 22 Aug 2024 14:48:16 +0200
In-Reply-To: <20240821205637.552424-2-maarten.lankhorst@linux.intel.com>
References: <20240821205637.552424-1-maarten.lankhorst@linux.intel.com>
 <20240821205637.552424-2-maarten.lankhorst@linux.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Hi, Maarten

On Wed, 2024-08-21 at 22:56 +0200, Maarten Lankhorst wrote:
> For CCS formats on affected platforms, CCS can be used freely, but
> display engine requires a multiple of 64k physical pages. No other
> changes are needed.
>=20
> At the BO creation time we don't know if the BO will be used for CCS
> or not. If the scanout flag is set, and the BO is a multiple of 64k,
> we take the safe route and force the physical alignment of 64k pages.
>=20
> If the BO is not a multiple of 64k, or the scanout flag was not set
> at BO creation, we reject it for usage as CCS in display. The
> physical
> pages are likely not aligned correctly, and this will cause
> corruption
> when used as FB.
>=20
> This is a slightly different approach from my previous patch. Instead
> of requiring a scanout flag at FB creation, we now make all buffers
> of
> the right size physically aligned correctly, so no change from
> userspace
> is needed.
>=20
> It will be interesting to see if it affects performance in any way,
> could potentially even improve things with 64k PTE's.
>=20
> Inspired by Zbigniews patch.

I'm still concerned about this patch, since I think we should restrict
the 64K contigous requirement to scanout bos only, and IMO it's better
to completely understand the case where we need to implicitly promote
to scanout so that UMDs do not need to do that for every bo.

The worry is that *if* fragmentation comes to play, we no longer have
the option to go back to scanout bos only, since that would break UAPI
and the only viable option would then be to require 64K minimum
alignment for all bos.

/Thomas


>=20
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Co-developed-by: Zbigniew Kempczy=C5=84ski
> <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Juha-Pekka Heikkil=C3=A4 <juha-pekka.heikkila@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/display/intel_fb_bo.c |=C2=A0 6 ++++++
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A04 files changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c
> b/drivers/gpu/drm/xe/display/intel_fb_bo.c
> index f835492f73fb4..407367719abe2 100644
> --- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
> @@ -7,6 +7,7 @@
> =C2=A0#include <drm/ttm/ttm_bo.h>
> =C2=A0
> =C2=A0#include "intel_display_types.h"
> +#include "intel_fb.h"
> =C2=A0#include "intel_fb_bo.h"
> =C2=A0#include "xe_bo.h"
> =C2=A0
> @@ -28,6 +29,11 @@ int intel_fb_bo_framebuffer_init(struct
> intel_framebuffer *intel_fb,
> =C2=A0	struct xe_device *xe =3D to_xe_device(bo->ttm.base.dev);
> =C2=A0	int ret;
> =C2=A0
> +	if (XE_IOCTL_DBG(xe, intel_fb_is_ccs_modifier(mode_cmd-
> >modifier[0]) &&
> +			=C2=A0=C2=A0=C2=A0=C2=A0 (xe->info.vram_flags &
> XE_VRAM_FLAGS_DISPLAY_NEED64K_CCS) &&
> +			=C2=A0=C2=A0=C2=A0=C2=A0 !(bo->flags & XE_BO_FLAG_NEEDS_64K)))
> +		return -EINVAL;
> +
> =C2=A0	xe_bo_get(bo);
> =C2=A0
> =C2=A0	ret =3D ttm_bo_reserve(&bo->ttm, true, false, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6ed0e19552159..3a753f4644cb6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2017,6 +2017,16 @@ int xe_gem_create_ioctl(struct drm_device
> *dev, void *data,
> =C2=A0	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
> =C2=A0		bo_flags |=3D XE_BO_FLAG_SCANOUT;
> =C2=A0
> +	/*
> +	 * Lets see what happens if we simply align any buffer
> that's
> +	 * a multiple of 64k to 64k in places where it's not
> officially
> +	 * needed.
> +	 */
> +	if ((bo_flags & XE_BO_FLAG_VRAM_MASK) &&
> +	=C2=A0=C2=A0=C2=A0 !(xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) &&
> +	=C2=A0=C2=A0=C2=A0 !(args->size % SZ_64K))
> +		bo_flags |=3D XE_BO_FLAG_NEEDS_64K;
> +
> =C2=A0	bo_flags |=3D args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
> =C2=A0
> =C2=A0	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> {
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 5ed6f5434f42c..12ddab91a01c0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -47,6 +47,7 @@ struct xe_pat_ops;
> =C2=A0#define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
> =C2=A0
> =C2=A0#define XE_VRAM_FLAGS_NEED64K		BIT(0)
> +#define XE_VRAM_FLAGS_DISPLAY_NEED64K_CCS	BIT(1)
> =C2=A0
> =C2=A0#define XE_GT0		0
> =C2=A0#define XE_GT1		1
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d1bfd0b6e9558..af215f6d6588b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2878,7 +2878,8 @@ static int xe_vm_bind_ioctl_validate_bo(struct
> xe_device *xe, struct xe_bo *bo,
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	if (bo->flags & XE_BO_FLAG_INTERNAL_64K) {
> +	if ((bo->flags & XE_BO_FLAG_INTERNAL_64K) &&
> +	=C2=A0=C2=A0=C2=A0 (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)) {
> =C2=A0		if (XE_IOCTL_DBG(xe, obj_offset &
> =C2=A0				 XE_64K_PAGE_MASK) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||

