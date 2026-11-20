Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443C7606A336
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 06:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmY6J94R
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE0511253B;
	Fri, 20 Nov 2026 06:10:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF3C11253B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 06:09:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B60E661948;
 Fri, 20 Nov 2026 06:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F46D1F000C4;
 Fri, 20 Nov 2026 06:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795154992;
 bh=X23VdC3CuzYs+cK7yIgm+9RU5+06BJbLNNVBX+XBEaE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dmY6J94R2CpyPN1Yf7lIz33YrZW5nTUacB1eyxJW46sU0v70Y7oJTGNX75mkPeHNo
 ySLmNVeShUU2IMq9wNVMnu8Nodku7pwVR3QEhzVR/uiqYPITn1+fUr0PDItY33qSNF
 ulqTJEsYU463P6WqEA99hSDA5eVvoyjFcMcFmqHe0BoNIDiAHVqs5uOp9ljduJayry
 vqFmIXeSTcDVgxegTMIllhMOxQTKSao27u3hXBcjIRiO0Z9bK/wOWJEczojZnArDuq
 8lMgQqJkZVEkdyWZUTLIrCKmcWZrtNtKQkH6Tuc90GbCBLkcblnPgoB+FGRoQAWTe8
 bgR8p88iC+WrQ==
Message-ID: <sashiko-outbox-224536@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/16] drm/xe: Fall back to CPU copies when the tile
 cannot blit
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261120054712.377573-31-stuart.summers@intel.com>
References: <20261120054712.377573-18-stuart.summers@intel.com>
 <20261120054712.377573-31-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 06:09:51 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Critical] drm/xe: out-of-bounds ioremap on non-contiguous VRAM BO in
  ttm_bo_move_memcpy()
- [High] drm/xe: WARN_ON and -EINVAL on VRAM BO clear in xe_bo_move()
  via ttm_bo_move_memcpy()
- [High] drm/xe: invalid xe_bo_vmap() fallback in pinned BO save and
  restore paths
- [High] drm/xe: missing fence wait before synchronous
  ttm_bo_move_memcpy() in xe_bo_move()
- [Medium] drm/xe: unchecked blitter calls in xe_ttm_access_memory() and
  xe_vram_memtest()
--

commit 0cfa915c2d6cb675a189debb683cd051c34415aa
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Fall back to CPU copies when the tile cannot blit

This commit adds xe_migrate_can_blit() to detect tiles without a primary GT
and falls back to CPU copies in xe_bo_move(), xe_bo_evict_pinned_copy(),
and xe_bo_restore_pinned().

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 353ac1e9a9d6f..8a8a034d1edb6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1277,6 +1277,19 @@ static int xe_bo_move(struct ttm_buffer_object *tt=
m_bo, bool evict,
>  		xe_pm_runtime_get_noresume(xe);
>  	}
> =20
> +	/*
> +	 * A tile with no copy engine cannot blit, so move the data with the
> +	 * CPU instead.  For VRAM that means going over the PCIe BAR, which is
> +	 * slow, but a device with no graphics IP offers no alternative.
> +	 * ttm_bo_move_memcpy() covers the clear case too, by way of an
> +	 * unpopulated source.
> +	 */
> +	if (!xe_migrate_can_blit(migrate)) {
> +		ret =3D ttm_bo_move_memcpy(ttm_bo, ctx, new_mem);
> +		xe_pm_runtime_put(xe);
> +		goto out;
> +	}

[Severity: Critical]
Can ttm_bo_move_memcpy() ioremap an overflowed physical address when moving
or clearing a non-contiguous VRAM BO?

User VRAM BOs do not set force_contiguous(bo_flags), so when a VRAM
allocation spans non-adjacent buddy blocks, xe_ttm_vram_mgr_new() leaves
TTM_PL_FLAG_CONTIGUOUS unset and sets vres->base.start to
XE_BO_INVALID_OFFSET (LONG_MAX).  When ttm_bo_move_memcpy() initializes its
linear IO iterator, xe_ttm_io_mem_reserve() shifts mem->start by
PAGE_SHIFT:

drivers/gpu/drm/xe/xe_bo.c:xe_ttm_io_mem_reserve() {
	...
		mem->bus.offset =3D mem->start << PAGE_SHIFT;

		if (vram->mapping &&
		    mem->placement & TTM_PL_FLAG_CONTIGUOUS)
			mem->bus.addr =3D (u8 __force *)vram->mapping +
				mem->bus.offset;

		mem->bus.offset +=3D vram->io_start;
		mem->bus.is_iomem =3D true;
	...
}

Because TTM_PL_FLAG_CONTIGUOUS is clear, mem->bus.addr stays NULL and
mem->bus.offset wraps to vram->io_start - PAGE_SIZE.
ttm_kmap_iter_linear_io_init() then ioremaps mem->size bytes starting at
physical address vram->io_start - PAGE_SIZE, and ttm_move_memcpy() linearly
reads, writes, or zeroes across that address and the start of the VRAM BAR
instead of walking the BO's buddy blocks via xe_res_cursor.

[Severity: High]
Does ttm_bo_move_memcpy() hit WARN_ON(!src_mem) and return -EINVAL when
clearing a newly created VRAM BO?

When a ttm_bo_type_device BO is created in VRAM without
XE_BO_FLAG_DEFER_BACKING, xe_bo_init_locked() validates it while
ttm_bo->resource (old_mem) and ttm_bo->ttm are both NULL.  In xe_bo_move(),
move_lacks_source and needs_clear are both true, so execution reaches
ttm_bo_move_memcpy(), which requires a non-NULL bo->resource:

drivers/gpu/drm/ttm/ttm_bo_util.c:ttm_bo_move_memcpy() {
	...
	struct ttm_resource *src_mem =3D bo->resource;
	...
	if (WARN_ON(!src_mem))
		return -EINVAL;

Every non-deferred user VRAM BO creation on a tile that cannot blit will
trigger the warning and fail with -EINVAL.

[Severity: High]
Does this path also run ttm_bo_move_memcpy() before waiting for existing
fences on ttm_bo->base.resv?

Unlike xe_migrate_copy() and xe_migrate_clear(), which queue job
dependencies on DMA_RESV_USAGE_BOOKKEEP and DMA_RESV_USAGE_KERNEL fences,
ttm_bo_move_memcpy() copies or zeroes with the CPU immediately and only
waits on bo->base.resv inside ttm_bo_move_sync_cleanup() after
ttm_move_memcpy() has already finished.  When xe_bo_trigger_rebind() skips
its DMA_RESV_USAGE_BOOKKEEP wait (for example on a non-fault-mode VM when
!xe_device_is_l2_flush_optimized(xe)), or when new_mem carries pipelined
DMA_RESV_USAGE_KERNEL eviction fences, the CPU copy runs concurrently with
in-flight GPU work and ignores ctx->no_wait_gpu unless ttm_bo_wait_ctx() is
called first.

> @@ -1578,17 +1591,18 @@ int xe_bo_notifier_unprepare_pinned(struct xe_bo =
*bo)
>  static int xe_bo_evict_pinned_copy(struct xe_bo *bo, struct xe_bo *backu=
p)
>  {
>  	struct xe_device *xe =3D xe_bo_device(bo);
> +	struct xe_migrate *migrate;
>  	bool unmap =3D false;
>  	int ret =3D 0;
> =20
> -	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> -		struct xe_migrate *migrate;
> -		struct dma_fence *fence;
> +	if (bo->tile)
> +		migrate =3D bo->tile->migrate;
> +	else
> +		migrate =3D mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
> =20
> -		if (bo->tile)
> -			migrate =3D bo->tile->migrate;
> -		else
> -			migrate =3D mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
> +	if ((xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE))=
 &&
> +	    xe_migrate_can_blit(migrate)) {
> +		struct dma_fence *fence;
> =20
>  		xe_assert(xe, bo->ttm.base.resv =3D=3D backup->ttm.base.resv);
>  		ret =3D dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> @@ -1717,6 +1731,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>  	};
>  	struct xe_device *xe =3D ttm_to_xe_device(bo->ttm.bdev);
>  	struct xe_bo *backup =3D bo->backup_obj;
> +	struct xe_migrate *migrate;
>  	bool unmap =3D false;
>  	int ret;
> =20
> @@ -1731,14 +1746,14 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>  			goto out_unlock_bo;
>  	}
> =20
> -	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> -		struct xe_migrate *migrate;
> -		struct dma_fence *fence;
> +	if (bo->tile)
> +		migrate =3D bo->tile->migrate;
> +	else
> +		migrate =3D mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
> =20
> -		if (bo->tile)
> -			migrate =3D bo->tile->migrate;
> -		else
> -			migrate =3D mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
> +	if ((xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE))=
 &&
> +	    xe_migrate_can_blit(migrate)) {
> +		struct dma_fence *fence;

[Severity: High]
Will falling back to the else branch in xe_bo_evict_pinned_copy() and
xe_bo_restore_pinned() trigger drm_WARN_ON() and fail with -EINVAL in
xe_bo_vmap(bo)?

When !xe_migrate_can_blit(migrate), the else branch calls xe_bo_vmap(bo) if
bo->vmap is null, and xe_bo_vmap() rejects any BO that does not have both
XE_BO_FLAG_NEEDS_CPU_ACCESS and force_contiguous(bo->flags):

drivers/gpu/drm/xe/xe_bo.c:xe_bo_vmap() {
	...
	if (drm_WARN_ON(&xe->drm, !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS) ||
			!force_contiguous(bo->flags)))
		return -EINVAL;

User BOs pinned via xe_bo_pin_external() never have XE_BO_FLAG_PINNED set,
and late-restore kernel BOs such as VF LMEM BOs in pf_provision_vf_lmem()
do not set XE_BO_FLAG_NEEDS_CPU_ACCESS, so force_contiguous(bo->flags) is
false (and their VRAM blocks are not guaranteed to be contiguous), causing
suspend and resume to warn and fail with -EINVAL.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 8fc3e5d500a2b..7e845cbaa0829 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2155,6 +2155,22 @@ void xe_migrate_wait(struct xe_migrate *m)
>  		dma_fence_wait(m->fence, false);
>  }
> =20
> +/**
> + * xe_migrate_can_blit() - Whether a migration context can issue blits
> + * @m: The migration context
> + *
> + * xe_migrate_copy() and xe_migrate_clear() emit blitter commands, which=
 only
> + * the copy engine understands, and the copy engine lives on the primary=
 GT.
> + * A tile without one can still update page tables, so its migration con=
text
> + * is usable, but callers that want to move data have to do it themselve=
s.
> + *
> + * Return: true if blit based copy and clear are available on @m.
> + */
> +bool xe_migrate_can_blit(struct xe_migrate *m)
> +{
> +	return m->tile->primary_gt;
> +}

[Severity: Medium]
Should xe_ttm_access_memory() and xe_vram_memtest() also check
xe_migrate_can_blit()?

In xe_ttm_access_memory(), accesses with len >=3D SZ_16K unconditionally ca=
ll
xe_migrate_access_memory() instead of falling through to the CPU BAR memcpy
loop, which emits blitter copy commands onto the migration queue.
Similarly, when CONFIG_DRM_XE_DEBUG_MEM is enabled, xe_vram_memtest() only
checks tile->migrate before calling xe_migrate_clear(), which fails the GPU
clear check and aborts xe_device_probe() with -EIO on a tile without a
primary GT.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120054712.3775=
73-18-stuart.summers@intel.com?part=3D13
