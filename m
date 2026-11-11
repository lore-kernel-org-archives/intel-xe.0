Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04014606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 04:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KzjpzKiy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91C410E114;
	Wed, 11 Nov 2026 04:25:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC05810E089
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 04:25:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A95C7611BB;
 Wed, 11 Nov 2026 04:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BEC1F0089F;
 Wed, 11 Nov 2026 04:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794371105;
 bh=PV8ZagC6yy94ZAwGKAf+XxRAas1Vdpys18CSgjG6H54=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KzjpzKiyVDYgk9sbLO2Rz4pZBprEE0VAVyUGgz8B2EuHhDDeLURU1i4PV2eOMiKoi
 hsiY5clAM/j7EjsZMvHnv15h+gbwv/j9ExOpssVsBGpj+eQxITZzvEWTjFTRGrO4vh
 QW8UYpUybolootXZmvjBqwyTpDm8hKp3lo5yQPDmAFMY1noPglx7qRWwOBqziGUK4B
 vwJCqljHJvGLBRjFOJG+WMd7sNUFrx8NEnso0FB79FXoLPZ5UGfCX6iOintipTZuAe
 ///SZ2av13mwpDNs/zYOM+FiB+1CC8QJKQruzIqLAHkcN9HxmiIfvOlBoipapTIzWb
 jfk2P3WiWl76A==
Message-ID: <sashiko-outbox-208281@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/11] drm/xe: Fall back to CPU copies when the tile
 cannot blit
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261110231442.218721-22-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
 <20261110231442.218721-22-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 04:25:04 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] drm/xe: WARN_ON and -EINVAL in xe_bo_move() on initial VRAM BO
  clear
- [High] drm/xe: invalid BAR mapping in xe_bo_move() for non-contiguous
  VRAM BOs
- [High] drm/xe: WARN_ON in xe_bo_vmap() during pinned BO save and
  restore
- [High] drm/xe: missing fence wait before ttm_bo_move_memcpy() in
  xe_bo_move()
- [Medium] drm/xe: blitter commands emitted in xe_ttm_access_memory()
  and memtest
- [Medium] drm/xe: missing fence wait before CPU copy in
  xe_bo_evict_pinned_copy()
--

commit fcb1ac36084339205a63d9c4c32dc0af3e3062ff
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Fall back to CPU copies when the tile cannot blit

This commit adds an xe_migrate_can_blit() helper and falls back to CPU
copies in xe_bo_move(), xe_bo_evict_pinned_copy(), and
xe_bo_restore_pinned() when a tile has no primary GT copy engine.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 42a6aa1a2e4a0..49a3d4df77f62 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1275,6 +1275,19 @@ static int xe_bo_move(struct ttm_buffer_object *tt=
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

[Severity: High]
Does calling ttm_bo_move_memcpy() here hit WARN_ON(!src_mem) and return
-EINVAL when clearing a newly created VRAM BO?

When xe_bo_init_locked() creates a standard user VRAM BO without
XE_BO_FLAG_DEFER_BACKING, ttm_bo_validate() calls xe_bo_move() while
ttm_bo->resource is still NULL (move_lacks_source is true and needs_clear
is true).  ttm_bo_move_memcpy() only supports clearing from an existing
non-NULL use_tt resource with an unpopulated ttm_tt, and rejects a NULL
bo->resource at the start of the function:

drivers/gpu/drm/ttm/ttm_bo_util.c:ttm_bo_move_memcpy() {
	struct ttm_resource *src_mem =3D bo->resource;
	...
	if (WARN_ON(!src_mem))
		return -EINVAL;
}

Every non-deferred VRAM BO allocation on a tile that cannot blit will
warn and fail with -EINVAL.

[Severity: High]
Can passing a non-contiguous VRAM BO to ttm_bo_move_memcpy() corrupt
memory at the start of the VRAM BAR?

Unpinned user VRAM BOs do not set TTM_PL_FLAG_CONTIGUOUS, so when
xe_ttm_vram_mgr_new() allocates multiple discontiguous buddy blocks it
sets vres->base.start to XE_BO_INVALID_OFFSET (LONG_MAX).
ttm_bo_move_memcpy() uses ttm_kmap_iter_linear_io_init(), which calls
xe_ttm_io_mem_reserve():

drivers/gpu/drm/xe/xe_bo.c:xe_ttm_io_mem_reserve() {
	case XE_PL_VRAM0:
	case XE_PL_VRAM1: {
		...
		mem->bus.offset =3D mem->start << PAGE_SHIFT;

		if (vram->mapping &&
		    mem->placement & TTM_PL_FLAG_CONTIGUOUS)
			mem->bus.addr =3D (u8 __force *)vram->mapping +
				mem->bus.offset;

		mem->bus.offset +=3D vram->io_start;
		mem->bus.is_iomem =3D true;
}

With mem->start =3D=3D LONG_MAX and TTM_PL_FLAG_CONTIGUOUS clear,
mem->bus.addr stays NULL and mem->bus.offset wraps to
vram->io_start - PAGE_SIZE.  ttm_kmap_iter_linear_io_init() then ioremaps
mem->size bytes starting one page before the VRAM BAR and
ttm_move_memcpy() linearly reads, writes, or zeroes across that address
range instead of walking the BO's buddy blocks.

[Severity: High]
Does ttm_bo_move_memcpy() also run without waiting for in-flight GPU
fences on ttm_bo->base.resv?

In the GPU migration path, xe_migrate_copy() and xe_migrate_clear() chain
the migration job behind existing fences in ttm_bo->base.resv.
ttm_bo_move_memcpy(), however, performs the synchronous CPU copy in
ttm_move_memcpy() before ttm_bo_move_sync_cleanup() waits on the
reservation object.  When xe_bo_trigger_rebind() does not idle the BO
(for example on a non-fault-mode VM when !xe_device_is_l2_flush_optimized(x=
e),
or when move_lacks_source is true and new_mem carries pipelined eviction
fences), the CPU copy or clear races with active media GT jobs and ignores
ctx->no_wait_gpu unless ttm_bo_wait_ctx(ttm_bo, ctx) is called first.

> @@ -1576,17 +1589,18 @@ int xe_bo_notifier_unprepare_pinned(struct xe_bo =
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

[Severity: Medium]
When xe_bo_evict_pinned_copy() falls back to the else branch for a
XE_BO_FLAG_PINNED_LATE_RESTORE or user BO, does the CPU copy race with
in-flight GPU work?

xe_bo_evict_all() runs before xe_gt_suspend().  The xe_migrate_copy()
branch orders the copy behind DMA_RESV_USAGE_BOOKKEEP fences in
bo->ttm.base.resv, but the CPU fallback calls xe_map_memcpy_from()
immediately without waiting on bo->ttm.base.resv, so it can snapshot
stale VRAM while media GT jobs or page-table updates are still running.

> @@ -1715,6 +1729,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>  	};
>  	struct xe_device *xe =3D ttm_to_xe_device(bo->ttm.bdev);
>  	struct xe_bo *backup =3D bo->backup_obj;
> +	struct xe_migrate *migrate;
>  	bool unmap =3D false;
>  	int ret;
> =20
> @@ -1729,14 +1744,14 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
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
Can the CPU fallback in xe_bo_evict_pinned_copy() and
xe_bo_restore_pinned() hit the drm_WARN_ON() in xe_bo_vmap() and fail
suspend/resume with -EINVAL?

When !xe_migrate_can_blit(migrate), both functions fall back to calling
xe_bo_vmap(bo) whenever iosys_map_is_null(&bo->vmap):

drivers/gpu/drm/xe/xe_bo.c:xe_bo_vmap() {
	if (drm_WARN_ON(&xe->drm, !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS) ||
			!force_contiguous(bo->flags)))
		return -EINVAL;
}

User BOs pinned via xe_dma_buf_pin() -> xe_bo_pin_external() do not have
XE_BO_FLAG_PINNED set, so force_contiguous(bo->flags) is false (and they
may also be non-contiguous or lack XE_BO_FLAG_NEEDS_CPU_ACCESS).
Likewise, late-restore kernel BOs created without
XE_BO_FLAG_NEEDS_CPU_ACCESS, such as VF LMEM BOs in
pf_provision_vf_lmem(), will fail xe_bo_vmap(bo) during suspend and
resume.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 754592c5cf881..c06f43fc9e4fe 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2093,6 +2093,22 @@ void xe_migrate_wait(struct xe_migrate *m)
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
xe_migrate_can_blit() before issuing blitter commands?

In xe_ttm_access_memory(), accesses with len >=3D SZ_16K unconditionally
call xe_migrate_access_memory(), which emits blitter copy instructions via
xe_migrate_vram() instead of using the CPU BAR memcpy loop right below it.
In xe_vram_memtest() (when CONFIG_DRM_XE_DEBUG_MEM is enabled), the probe
path checks tile->migrate and calls xe_migrate_clear(), which emits
blitter commands to the media migration queue and fails device probe with
-EIO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110231442.2187=
21-13-stuart.summers@intel.com?part=3D9
