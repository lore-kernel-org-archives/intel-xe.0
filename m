Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE256C61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 16:55:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DDC10F11E;
	Thu, 27 Aug 2026 16:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MM3Wapt9";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E99F10F11E
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 16:55:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1BFB6600D9;
 Thu, 27 Aug 2026 16:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC071F000E9;
 Thu, 27 Aug 2026 16:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787849706;
 bh=BdFKmwQufldqR6CQrVN9cPZFaP/ByrcAS8kpFJBBD0A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=MM3Wapt9Ru09ZOJGeWGHpr9n6hXLcZxwDPNxdyVWppcAtIK4F74kz2GilXjjlGLkL
 sIcabrmSUmLrEgwF9cOyLv+Cl09AZ3CHi1yVvw1YPzEYkQc7dKjDXA64AHS++r6ZSz
 50yURih7yN3XP2pBIoGd75vquzXt97VN0RtBwJVQDQka9T6D/O7AVfdCGgqeHhSRPd
 GsuH4Usfb5i8B821KZSQPnOi4NCM2T2paSnq+OO2PzBG0c/15J6aN7p0zXa+Z3EFwT
 1FhNYuSXCKTWe6EEWfy4APCgAlcNL7rr+UDwT8et+ijW4mt22nC9Zhtje+2D6nPjjw
 WShKwqcx3bv2g==
From: sashiko-bot@kernel.org
Subject: Re: [CI v4] drm/xe/vram: Add early VRAM health check
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260827164456.504540-2-matthew.auld@intel.com>
References: <20260827164456.504540-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 16:55:06 +0000
Message-Id: <20260827165506.9AC071F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Memory leak of `scratch_bo_before` and `scratch_bo_after` on err=
or paths in `xe_vram_memtest()`.
- [Medium] L2 cache flush in `xe_device_l2_flush()` always targets the root=
 GT, missing remote tiles on multi-tile devices.
- [Medium] Ignored return value of `devm_add_action_or_reset()` in `xe_vram=
_reserve_memtest_bo()`.
--

commit 2f7e446013d1817f370eab63e573b6ed23bda268
Author: Matthew Auld <matthew.auld@intel.com>

    drm/xe/vram: Add early VRAM health check

This commit introduces an early VRAM health check that reserves the last pa=
ge
of VRAM as a canary. It performs CPU and GPU memory operations to verify
mapping and check for flat CCS metadata overlaps.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 396d02eb2af83..601c372775eff 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
[ ... ]
> @@ -1270,7 +1276,7 @@ bool xe_device_is_l2_flush_optimized(struct xe_devi=
ce *xe)
>  	return false;
>  }
> =20
> -void xe_device_l2_flush(struct xe_device *xe)
> +void xe_device_l2_flush(struct xe_device *xe, bool force)
>  {
>  	struct xe_gt *gt;
> =20
> @@ -1278,7 +1284,7 @@ void xe_device_l2_flush(struct xe_device *xe)
>  	if (!gt)
>  		return;
> =20
> -	if (!XE_GT_WA(gt, 16023588340))
> +	if (!force && !XE_GT_WA(gt, 16023588340))
>  		return;

[Severity: Medium]
Since this function hardcodes the target to the root GT via xe_root_mmio_gt=
(),
will this miss flushing the L2 cache on remote tiles?

When called in a multi-tile context (like during xe_vram_memtest() below),
flushing only the root GT could cause CPU writes to VRAM on remote tiles to
remain in the cache, preventing the GPU migrator from seeing them.

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 7b4478fb1697c..76cb87dc48578 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
[ ... ]
> +void xe_vram_reserve_memtest_bo(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	for_each_tile(tile, xe, id) {
> +		u64 vram_size;
[ ... ]
> +		tile->mem.memtest_bo =3D xe_bo_create_pin_map_at_novm(xe, tile, SZ_64K,
> +								    vram_size - SZ_64K,
> +								    ttm_bo_type_kernel,
> +								    XE_BO_FLAG_VRAM_IF_DGFX(tile),
> +								    0, false);
> +		if (IS_ERR(tile->mem.memtest_bo)) {
> +			drm_warn(&xe->drm, "Tile %d: Failed to reserve memtest BO\n", id);
> +			tile->mem.memtest_bo =3D NULL;
> +			continue;
> +		}
> +
> +		drm_info(&xe->drm, "Tile %d: Reserved memtest BO at offset 0x%llx\n",
> +			 id, vram_size - SZ_64K);
> +	}
> +
> +	devm_add_action_or_reset(xe->drm.dev, memtest_bo_cleanup, xe);

[Severity: Medium]
Is it safe to ignore the return value of devm_add_action_or_reset() here?

If devres allocation fails due to memory pressure, it will return -ENOMEM
and immediately execute memtest_bo_cleanup(), freeing the BOs. The function
will then silently exit instead of properly propagating the error, which
could leave the driver state expecting those BOs to exist.

> +}
[ ... ]
> +int xe_vram_memtest(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +	int err =3D 0;
[ ... ]
> +		if (xe_device_has_flat_ccs(xe) && GRAPHICS_VERx100(xe) >=3D 2000) {
> +			struct xe_bo *scratch_bo_before;
> +			struct xe_bo *scratch_bo_after;
> +
> +			scratch_bo_before =3D xe_bo_create_pin_map_novm(xe, tile, SZ_1M,
> +								      ttm_bo_type_kernel,
> +								      XE_BO_FLAG_VRAM_IF_DGFX(tile),
> +								      false);
> +			if (IS_ERR(scratch_bo_before)) {
> +				err =3D PTR_ERR(scratch_bo_before);
> +				goto unpin;
> +			}
> +
> +			scratch_bo_after =3D xe_bo_create_pin_map_novm(xe, tile, SZ_1M,
> +								     ttm_bo_type_kernel,
> +								     XE_BO_FLAG_VRAM_IF_DGFX(tile),
> +								     false);
> +			if (IS_ERR(scratch_bo_after)) {
> +				xe_bo_unpin_map_no_vm(scratch_bo_before);
> +				err =3D PTR_ERR(scratch_bo_after);
> +				goto unpin;
> +			}
> +
> +			/* Save original CCS metadata for PA 0 */
> +			err =3D xe_migrate_debug_ccs_overlap(tile->migrate, scratch_bo_before=
, false);
> +			if (err)
> +				goto unpin;

[Severity: Medium]
Does this code leak both scratch_bo_before and scratch_bo_after?

If xe_migrate_debug_ccs_overlap() fails here, the execution jumps directly
to the unpin label. Because the cleanup block down there only handles the
global memtest_bo through xe_vram_free_memtest_bos(), both of these
temporary pinned BOs will be permanently lost if the jump occurs.

> +
> +			/* Fill last page with CPU */
> +			xe_map_memset(xe, &last_page_bo->vmap, 0, 0x5A, SZ_64K);
> +			xe_device_wmb(xe);
> +			xe_device_l2_flush(xe, true);
> +
> +			/* Use GPU to clear CCS state for PA 0 */
> +			xe_map_memset(xe, &scratch_bo_after->vmap, 0, 0x00, SZ_1M);
> +			err =3D xe_migrate_debug_ccs_overlap(tile->migrate, scratch_bo_after,=
 true);
> +			if (err)
> +				goto unpin;

[Severity: Medium]
This is another error path where the scratch BOs appear to be leaked by
skipping the xe_bo_unpin_map_no_vm() calls before jumping to the unpin labe=
l.

> +			xe_device_l2_flush(xe, true);
> +
> +			/* Check if last_page_bo was corrupted by the GPU CCS clear */
> +			for (i =3D 0; i < SZ_64K; i +=3D 8) {
> +				u64 payload =3D xe_map_rd(xe, &last_page_bo->vmap, i, u64);
> +
> +				if (payload !=3D 0x5A5A5A5A5A5A5A5AULL) {
> +					overlap =3D true;
> +					break;
> +				}
> +			}
> +
> +			/* Restore original CCS metadata for PA 0 */
> +			err =3D xe_migrate_debug_ccs_overlap(tile->migrate, scratch_bo_before=
, true);
> +			if (err)
> +				drm_warn(&xe->drm, "Failed to restore CCS metadata\n");
> +
> +			xe_bo_unpin_map_no_vm(scratch_bo_before);
> +			xe_bo_unpin_map_no_vm(scratch_bo_after);
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827164456.5045=
40-2-matthew.auld@intel.com?part=3D1
