Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7D1C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 12:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98A210E809;
	Thu, 12 Jun 2025 12:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8W0WDir";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15C710E809
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 12:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749732802; x=1781268802;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tPwkxSrjR2JXtaHNgboYm70riACszRYR/kpO2Oq9Kp0=;
 b=n8W0WDirIeOvOMoHRWfUq6JSXLgHZG+Y/WmFqlH5EyXpDjbyNTiGgJ2b
 sGWN/J8BKLys1n7rVH/gnToAuPR4YwSxgCcbclWiMx7Y+MuuiPs2TZ6Py
 WL0YCY7KZBNYe1RCwCIvQS91U0wT2/hBCvIv7nxg/lH6HQGHAQyfXjzLZ
 J7oa4Q9U1LZadKoF2wg3a5gBffGLufyGr2nCkiGVIzXEMZCkyydk12/Ai
 qgkGqlD8kQgaUS4G9livhFsyklA10CwpLq9DCUrQifKi3GtMmC54T6tW5
 z7m+GZqdExUks8A8E4sKSDBTk0/Lca7sLTh/iHuCaZ3TpUghlbTS1nEWH w==;
X-CSE-ConnectionGUID: iICgGB9cQ1u4SPWkz/MZ4g==
X-CSE-MsgGUID: /AVs83/fSSmTM1CUzSIUmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62560630"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="62560630"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:53:21 -0700
X-CSE-ConnectionGUID: xA+IkhdjTa2bDBaHB1LFkg==
X-CSE-MsgGUID: 1FC22iVtS+6UwYuZX6a+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147416876"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.109])
 ([10.245.244.109])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:53:20 -0700
Message-ID: <cb53d2efe677724fd5d141d8f3cada5f06758adb.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Date: Thu, 12 Jun 2025 14:53:16 +0200
In-Reply-To: <20250611054235.3540936-1-matthew.brost@intel.com>
References: <20250611054235.3540936-1-matthew.brost@intel.com>
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

On Tue, 2025-06-10 at 22:42 -0700, Matthew Brost wrote:
> Clearing on free should hide latency of BO clears on new user BO
> allocations.
>=20
> Implemented via calling xe_migrate_clear in release notify and
> updating
> iterator in xe_migrate_clear to skip cleared buddy blocks. Only user
> BOs
> cleared in release notify as kernel BOs could still be in use (e.g.,
> PT
> BOs need to wait for dma-resv to be idle).

Wouldn't it be fully possible for a user to do (deep pipelining 3d
case)

create_bo();
map_write_unmap_bo();
bind_bo();
submit_job_touching_bo();
unbind_bo();
free_bo();

Where the free_bo and release_notify() is called long before the job we
submitted even started?

So that would mean the clear needs to await any previous fences, and
that dependency addition seems to have been removed from
xe_migrate_clear.

Another side-effect I think this will have is that bos that are deleted
are not subject to asynchronous evicton. I think if this bo is hit
during lru walk and clearing, TTM will just sync wait for it to become
idle and then free the memory. I think the reason that could not be
fixed in TTM is that TTM needs for all resource manager fences to be
ordered, but if a check for ordered fences which I think requires here
that the eviction exec_queue is the same as the clearing one, that
could be fixed in TTM.

Otherwise, this could also cause newly introduced sync waits in the
exec() and vm_bind paths where we previously performed eviction and the
subsequent clearing async.

Some additional stuff below:


>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 47
> ++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 =
++++++---
> =C2=A0drivers/gpu/drm/xe/xe_migrate.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_res_cursor.h=C2=A0=C2=A0 | 26 +++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |=C2=A0 5 ++-
> =C2=A0drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |=C2=A0 6 ++++
> =C2=A06 files changed, 94 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4e39188a021a..74470f4d418d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1434,6 +1434,51 @@ static bool
> xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
> =C2=A0	return locked;
> =C2=A0}
> =C2=A0
> +static void xe_ttm_bo_release_clear(struct ttm_buffer_object
> *ttm_bo)
> +{
> +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> +	struct dma_fence *fence;
> +	int err, idx;
> +
> +	xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> +
> +	if (ttm_bo->type !=3D ttm_bo_type_device)
> +		return;
> +
> +	if (xe_device_wedged(xe))
> +		return;
> +
> +	if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo->resource-
> >mem_type))
> +		return;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return;
> +
> +	if (!xe_pm_runtime_get_if_active(xe))
> +		goto unbind;
> +
> +	err =3D dma_resv_reserve_fences(&ttm_bo->base._resv, 1);
> +	if (err)
> +		goto put_pm;
> +
> +	fence =3D xe_migrate_clear(mem_type_to_migrate(xe, ttm_bo-
> >resource->mem_type),
> +				 ttm_to_xe_bo(ttm_bo), ttm_bo-
> >resource,

We should be very careful with passing the xe_bo part here because the
gem refcount is currently zero. So that any caller deeper down in the
call chain might try to do an xe_bo_get() and blow up.

Ideally we'd make xe_migrate_clear() operate only on the ttm_bo for
this to be safe.

/Thomas


> +				 XE_MIGRATE_CLEAR_FLAG_FULL |
> +				 XE_MIGRATE_CLEAR_NON_DIRTY);
> +	if (XE_WARN_ON(IS_ERR(fence)))
> +		goto put_pm;
> +
> +	xe_ttm_vram_mgr_resource_set_cleared(ttm_bo->resource);
> +	dma_resv_add_fence(&ttm_bo->base._resv, fence,
> +			=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> +	dma_fence_put(fence);
> +
> +put_pm:
> +	xe_pm_runtime_put(xe);
> +unbind:
> +	drm_dev_exit(idx);
> +}
> +
> =C2=A0static void xe_ttm_bo_release_notify(struct ttm_buffer_object
> *ttm_bo)
> =C2=A0{
> =C2=A0	struct dma_resv_iter cursor;
> @@ -1478,6 +1523,8 @@ static void xe_ttm_bo_release_notify(struct
> ttm_buffer_object *ttm_bo)
> =C2=A0	}
> =C2=A0	dma_fence_put(replacement);
> =C2=A0
> +	xe_ttm_bo_release_clear(ttm_bo);
> +
> =C2=A0	dma_resv_unlock(ttm_bo->base.resv);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a8..39d7200cb366 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1063,7 +1063,7 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0	struct xe_gt *gt =3D m->tile->primary_gt;
> =C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> =C2=A0	bool clear_only_system_ccs =3D false;
> -	struct dma_fence *fence =3D NULL;
> +	struct dma_fence *fence =3D dma_fence_get_stub();
> =C2=A0	u64 size =3D bo->size;
> =C2=A0	struct xe_res_cursor src_it;
> =C2=A0	struct ttm_resource *src =3D dst;
> @@ -1075,10 +1075,13 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> =C2=A0		clear_only_system_ccs =3D true;
> =C2=A0
> -	if (!clear_vram)
> +	if (!clear_vram) {
> =C2=A0		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
> -	else
> +	} else {
> =C2=A0		xe_res_first(src, 0, bo->size, &src_it);
> +		if (!(clear_flags & XE_MIGRATE_CLEAR_NON_DIRTY))
> +			size -=3D xe_res_next_dirty(&src_it);
> +	}
> =C2=A0
> =C2=A0	while (size) {
> =C2=A0		u64 clear_L0_ofs;
> @@ -1125,6 +1128,9 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0			emit_pte(m, bb, clear_L0_pt, clear_vram,
> clear_only_system_ccs,
> =C2=A0				 &src_it, clear_L0, dst);
> =C2=A0
> +		if (clear_vram && !(clear_flags &
> XE_MIGRATE_CLEAR_NON_DIRTY))
> +			size -=3D xe_res_next_dirty(&src_it);
> +
> =C2=A0		bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> =C2=A0		update_idx =3D bb->len;
> =C2=A0
> @@ -1146,7 +1152,7 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0		}
> =C2=A0
> =C2=A0		xe_sched_job_add_migrate_flush(job, flush_flags);
> -		if (!fence) {
> +		if (fence =3D=3D dma_fence_get_stub()) {
> =C2=A0			/*
> =C2=A0			 * There can't be anything userspace related
> at this
> =C2=A0			 * point, so we just need to respect any
> potential move
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> b/drivers/gpu/drm/xe/xe_migrate.h
> index fb9839c1bae0..58a7b747ef11 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct xe_migrate
> *m, struct xe_bo *bo,
> =C2=A0
> =C2=A0#define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> =C2=A0#define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> +#define XE_MIGRATE_CLEAR_NON_DIRTY		BIT(2)
> =C2=A0#define
> XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
> =C2=A0					XE_MIGRATE_CLEAR_FLAG_CCS_DA
> TA)
> =C2=A0struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> b/drivers/gpu/drm/xe/xe_res_cursor.h
> index d1a403cfb628..630082e809ba 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -315,6 +315,32 @@ static inline void xe_res_next(struct
> xe_res_cursor *cur, u64 size)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/**
> + * xe_res_next_dirty - advance the cursor to next dirty buddy block
> + *
> + * @cur: the cursor to advance
> + *
> + * Move the cursor until dirty buddy block is found.
> + *
> + * Return: Number of bytes cursor has been advanced
> + */
> +static inline u64 xe_res_next_dirty(struct xe_res_cursor *cur)
> +{
> +	struct drm_buddy_block *block =3D cur->node;
> +	u64 bytes =3D 0;
> +
> +	XE_WARN_ON(cur->mem_type !=3D XE_PL_VRAM0 &&
> +		=C2=A0=C2=A0 cur->mem_type !=3D XE_PL_VRAM1);
> +
> +	while (cur->remaining && drm_buddy_block_is_clear(block)) {
> +		bytes +=3D cur->size;
> +		xe_res_next(cur, cur->size);
> +		block =3D cur->node;
> +	}
> +
> +	return bytes;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_res_dma - return dma address of cursor at current position
> =C2=A0 *
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 9e375a40aee9..120046941c1e 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct
> ttm_resource_manager *man,
> =C2=A0	if (place->fpfn || lpfn !=3D man->size >> PAGE_SHIFT)
> =C2=A0		vres->flags |=3D DRM_BUDDY_RANGE_ALLOCATION;
> =C2=A0
> +	if (tbo->type =3D=3D ttm_bo_type_device)
> +		vres->flags |=3D DRM_BUDDY_CLEAR_ALLOCATION;
> +
> =C2=A0	if (WARN_ON(!vres->base.size)) {
> =C2=A0		err =3D -EINVAL;
> =C2=A0		goto error_fini;
> @@ -187,7 +190,7 @@ static void xe_ttm_vram_mgr_del(struct
> ttm_resource_manager *man,
> =C2=A0	struct drm_buddy *mm =3D &mgr->mm;
> =C2=A0
> =C2=A0	mutex_lock(&mgr->lock);
> -	drm_buddy_free_list(mm, &vres->blocks, 0);
> +	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> =C2=A0	mgr->visible_avail +=3D vres->used_visible_size;
> =C2=A0	mutex_unlock(&mgr->lock);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index cc76050e376d..dfc0e6890b3c 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct ttm_resource
> *res)
> =C2=A0	return container_of(res, struct xe_ttm_vram_mgr_resource,
> base);
> =C2=A0}
> =C2=A0
> +static inline void
> +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource *res)
> +{
> +	to_xe_ttm_vram_mgr_resource(res)->flags |=3D
> DRM_BUDDY_CLEARED;
> +}
> +
> =C2=A0static inline struct xe_ttm_vram_mgr *
> =C2=A0to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> =C2=A0{

