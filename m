Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AB5C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA6E10F133;
	Wed,  9 Sep 2026 12:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FIbF8kgP";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF48510F133
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:56:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9039C43578;
 Wed,  9 Sep 2026 12:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495E71F00A3A;
 Wed,  9 Sep 2026 12:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788958586;
 bh=Opq8GQKR1HvAO5sTe4jm+aM98xREVnVrCXfTIlNn1Fo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FIbF8kgPtwODzUXgqR46MZcuX0C7IM8D4BenfNbuzYxaL/DQMrIf+IZtheLjOGQJ1
 MkvNxFu4Uj7g7Tu4Dz7tcdLlRzssN5sVzNSc9NDRd1lyDCgA8SpTjEGdvQhPf4JULk
 bar7xMB4BN2Ac8gIqN/LWbkELqrfD7inXByOPDwGdsY6S6IInVLomEN93nk+G6e0cV
 4yXOrDkUHy8Zrng1MmFAwfaE8gw/ifTpIrARDxo1+0jHht/zz9Wpwg8t02QygNstbI
 OXVwvlesW/ghxomXto8zxw3pnCZAFiqb/TRYKytkTxUIejHAM7qCLYmf352I6SncEd
 v95A+M08UHAyg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC v2 17/21] drm/xe/pt: Set NC PTE bit for VMAs ineligible
 for access counting
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909124457.1610890-40-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
 <20260909124457.1610890-40-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 12:56:25 +0000
Message-Id: <20260909125626.495E71F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Compilation fails when `CONFIG_DRM_XE_GPUSVM` is disabled due to mi=
ssing `flags` member in the fallback definition of `struct xe_svm_range`.
--

commit a329d005c363a2e1052a0d0ac8ba4b191802a6e5
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/pt: Set NC PTE bit for VMAs ineligible for access counting

This commit sets the XE_PPGTT_PTE_NC flag on PTEs for VMAs that are ineligi=
ble
for access counter migration hints to avoid wasteful slot allocation.

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -800,6 +800,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma =
*vma,
>  		.clear_pt =3D clear_pt,
>  	};
>  	struct xe_pt *pt =3D vm->pt_root[tile->id];
> +	struct drm_gpusvm_range_flags range_flags;

[ ... ]

> @@ -862,6 +863,18 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma=
 *vma,
>  			XE_USM_PPGTT_PTE_AE : 0;
>  	}
> =20
> +	if (!xe_vma_supports_access_ctr(xe, vma, tile)) {
> +		xe_walk.default_vram_pte |=3D XE_PPGTT_PTE_NC;
> +		xe_walk.default_system_pte |=3D XE_PPGTT_PTE_NC;
> +	}
> +
> +	if (range) {
> +		xe_walk.default_vram_pte |=3D XE_PPGTT_PTE_NC;
> +		range_flags.__flags =3D READ_ONCE(range->base.flags.__flags);

[Severity: Low]
Does this cause a compilation failure when CONFIG_DRM_XE_GPUSVM is disabled?

Looking at the fallback definition of struct xe_svm_range in xe_svm.h used
when GPUSVM is disabled:

struct xe_svm_range {
	struct {
		struct interval_tree_node itree;
	} base;
	struct {
		const struct drm_pagemap_addr *dma_addr;
	} pages;
	struct mutex lock;
	u32 tile_present;
	u32 tile_invalidated;
};

The base struct does not contain a flags member in this configuration.
Additionally, the struct drm_gpusvm_range_flags type used for range_flags
above is undefined when the kernel is compiled without GPUSVM support, as
the gpusvm header is not included.

> +		if (!range_flags.migrate_devmem)
> +			xe_walk.default_system_pte |=3D XE_PPGTT_PTE_NC;
> +	}
> +
>  	xe_walk.default_vram_pte |=3D XE_PPGTT_PTE_DM;
>  	xe_walk.dma_offset =3D (bo && !is_purged) ? vram_region_gpu_offset(bo->=
ttm.resource) : 0;
>  	if (!range)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909124457.1610=
890-23-himal.prasad.ghimiray@intel.com?part=3D17
