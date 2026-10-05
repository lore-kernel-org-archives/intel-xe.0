Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B1ACA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560CD10E23E;
	Mon,  5 Oct 2026 09:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V8Uj6ulv";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E28510E1E8
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:43:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6A9DD60A83;
 Mon,  5 Oct 2026 09:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047E21F000FF;
 Mon,  5 Oct 2026 09:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791193431;
 bh=ml2rjY6/e9Au/LRKvkI55GjNvGW8EQirxAopCoqlP3E=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=V8Uj6ulvqFtIc54EWNtuaOm25XTNP2fH6s5bkmkhLBpTvfdoi5YdQ7MPWT81HuR7m
 KWK8e+1oGVw5mUL6Fo/mgqsCBviXQ14exgkOyzot0ds9FZzScbUXV67mEqetkEg1me
 eP2CpYJ6JcgyO/Un9pNuS+lVMwIHzc04iAl0gdY6tvrZbkUQ3Wd5Sgn5/8NxTcTBaR
 +we5fAHlKsZhb/FXfbRGORkcxgbb/dkukWw68gWar7g4cnQJ10281o4dS861MAWKpD
 gh0oAG3uA4YuK1v058ML+RILBpTQPHvgr00zYl3rdZAQfZP2WqzZNOCoMgTmmmZrTh
 wkweuOLKlg55w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] drm/xe/vram: Allow splitting a region into pools
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261005093021.3741599-6-piotr.piorkowski@intel.com>
References: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
 <20261005093021.3741599-6-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 09:43:50 +0000
Message-Id: <20261005094351.047E21F000FF@smtp.kernel.org>
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
- [Medium] drm/xe/vram: kernel pool bounds break fixed-address BIOS takeover
--

commit 822201337f9b8f0df54e932ff7b27d938393e680
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
drm/xe/vram: Allow splitting a region into pools

This commit adds xe_vram_pool_create() to carve out dedicated pools
from the low addresses of a VRAM region, intended for kernel allocations.

> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index ec95b53bc53b1..1df4f2514afc0 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
[ ... ]
> @@ -358,19 +371,88 @@ static int vram_region_init(struct xe_device *xe, s=
truct xe_vram_region *vram,
> +/**
> + * xe_vram_pool_create - Add a pool to a VRAM region
> + * @vram: the VRAM region
> + * @purpose: the purpose served by the new pool
> + * @size: the size of the new pool
> + *
> + * Add a pool at the bottom of @vram and shrink the default pool accordi=
ngly.
> + * Existing non-default pools stay at the bottom in creation order. All =
pools
> + * share the region, the TTM manager and the placement, while the VRAM m=
anager
> + * backs each of them with a buddy allocator of its own.
> + *
> + * The bottom of a region is also where its CPU visible window starts, s=
o on
> + * a small BAR device the new pool takes CPU visible memory away from the
> + * default pool.
> + *
> + * Creating a pool does not make allocations use it. BO placement resolv=
es
> + * pools through the tile, so the caller has to publish the new pool the=
re,
> + * e.g. in &xe_tile.mem.kernel_vram for a kernel-only pool.
> + *
> + * Return: the new pool, or NULL if the pool cannot be created, in parti=
cular
> + * once the TTM manager of @vram is initialized.
> + */
> +struct xe_vram_pool *xe_vram_pool_create(struct xe_vram_region *vram,
> +					 enum xe_vram_pool_purpose purpose, u64 size)

[Severity: Medium]
Will this kernel pool partitioning break the initial display plane takeover?

Currently, initial_plane_bo() allocates the pre-existing BIOS framebuffer
at a fixed physical address using ttm_bo_type_kernel:

drivers/gpu/drm/xe/display/xe_initial_plane.c:initial_plane_bo() {
    ...
    bo =3D xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
                                      ttm_bo_type_kernel, flags, 0, false);
    ...
}

When __xe_bo_fixed_placement() processes this, it intersects the fixed
placement address with the kernel pool bounds using xe_vram_pool_place():

drivers/gpu/drm/xe/xe_bo.c:__xe_bo_fixed_placement() {
    ...
    xe_vram_pool_place(bo_vram_pool(xe, flags, vram_flag, type), place);
    if (place->lpfn && place->fpfn >=3D place->lpfn)
        return -EINVAL;
    ...
}

Since the kernel pool is a small carve-out at the bottom of VRAM, if the BI=
OS
framebuffer resides outside this pool, clamping its bounds will result in
place->fpfn >=3D place->lpfn, failing the allocation with -EINVAL.

How should fixed-address allocations outside the kernel pool be handled when
they use ttm_bo_type_kernel?

> +{
> +	struct xe_device *xe =3D vram->xe;
> +	struct xe_vram_pool *pool;
> +	u64 offset;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005093021.3741=
599-1-piotr.piorkowski@intel.com?part=3D5
