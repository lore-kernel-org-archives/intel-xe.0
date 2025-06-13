Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DBFC61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 08:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2C510E05E;
	Fri, 13 Jun 2025 08:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQXQ6x5U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E440410E05E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 08:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749802044; x=1781338044;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=k2zghYX97jiP+R7e77X4JcYJ1Ghg+h0ByElNMv00Xt8=;
 b=hQXQ6x5USVkzmzbE37+8M3jixJLm3satOrSb9m3aLYWdGjyDb7wXmtYq
 sUB7aP6eSLDAjQDWz2j5JpXoGzjiG05vFxRk5J3y5qEfsY2c7BIZMMAVI
 tVI2UDh1feNqTKr70K/frOVxwSQI9fmPGT8YWiYLMg3TbhVIy/ycxBJBx
 3P3yAhw9v9vF6WWyu2SRRICAz4bdNgfH5ufSh3xow0bu1yZ3No/UvcjXt
 +ImIzFb1yEWvCq6tKad5QkeJ6m2zj3HwZ6+1DywNblhW0BebwD/2I2AJX
 6tCGKzrNtIU0R3dY0X/uiM87qZJnorBD4LClChmMUNcRGVY78ZKaHuBRQ g==;
X-CSE-ConnectionGUID: mtkDWbYeQwGw3IwGu98agg==
X-CSE-MsgGUID: e4/sh8anRCegxxno56JEzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52106345"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="52106345"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 01:07:20 -0700
X-CSE-ConnectionGUID: Gr55W9caTI68UBJHU6LtmQ==
X-CSE-MsgGUID: RxpR26EHRwmvhp4+ivHOHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="147667614"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.245.83])
 ([10.245.245.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 01:07:18 -0700
Message-ID: <eb5531f03ee560a593f77f60ae1f6f862eea6a14.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Date: Fri, 13 Jun 2025 10:07:17 +0200
In-Reply-To: <aEsKU2LliY6JmG6a@lstrano-desk.jf.intel.com>
References: <20250611054235.3540936-1-matthew.brost@intel.com>
 <cb53d2efe677724fd5d141d8f3cada5f06758adb.camel@linux.intel.com>
 <aEsKU2LliY6JmG6a@lstrano-desk.jf.intel.com>
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

On Thu, 2025-06-12 at 10:11 -0700, Matthew Brost wrote:
> On Thu, Jun 12, 2025 at 02:53:16PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2025-06-10 at 22:42 -0700, Matthew Brost wrote:
> > > Clearing on free should hide latency of BO clears on new user BO
> > > allocations.
> > >=20
> > > Implemented via calling xe_migrate_clear in release notify and
> > > updating
> > > iterator in xe_migrate_clear to skip cleared buddy blocks. Only
> > > user
> > > BOs
> > > cleared in release notify as kernel BOs could still be in use
> > > (e.g.,
> > > PT
> > > BOs need to wait for dma-resv to be idle).
> >=20
> > Wouldn't it be fully possible for a user to do (deep pipelining 3d
> > case)
> >=20
> > create_bo();
> > map_write_unmap_bo();
> > bind_bo();
> > submit_job_touching_bo();
> > unbind_bo();
> > free_bo();
> >=20
> > Where the free_bo and release_notify() is called long before the
> > job we
> > submitted even started?
> >=20
> > So that would mean the clear needs to await any previous fences,
> > and
> > that dependency addition seems to have been removed from
> > xe_migrate_clear.
> >=20
>=20
> I think we are actually ok here. xe_vma_destroy is called on unbind
> with
> the out fence from the bind IOCTL, so we don't get to
> xe_vma_destroy_late until that fence signals, and xe_vma_destroy_late
> (possibly) does the final BO put. Whether this follow makes sense is
> a
> bit questable - this was very early code I wrote in Xe and if I
> rewrote
> today I suspect it would look different.

Hmm, yeah you're right. So the unbind kernel fence should indeed be
last fence we need to wait for here.

>=20
> We could make this 'safer' by waiting on DMA_RESV_USAGE_BOOKKEEP in
> xe_migrate_clear for calls from release notify but for private to VM
> BO's we'd risk the clear getting stuck behind newly submitted (i.e.,
> submitted after the unbind) exec IOCTLs or binds.

Yeah, although at this point the individualization has already taken
place, so at least there should be no starving, since the only
unnecessary waits would be for execs submitted between the unbind and
the individualization. So doable but leave it up to you.

> > Another side-effect I think this will have is that bos that are
> > deleted
> > are not subject to asynchronous evicton. I think if this bo is hit
> > during lru walk and clearing, TTM will just sync wait for it to
> > become
> > idle and then free the memory. I think the reason that could not be
> > fixed in TTM is that TTM needs for all resource manager fences to
> > be
> > ordered, but if a check for ordered fences which I think requires
> > here
> > that the eviction exec_queue is the same as the clearing one, that
> > could be fixed in TTM.
> >=20
>=20
> I think async eviction is still controlled by no_wait_gpu, right? See
> ttm_bo_wait_ctx, if a deleted BO is found and no_wait_gpu is clear
> the
> eviction process moves on, right? So the exec IOCTL can still be
> pipelined albeit not with deleted BOs that have pending clears. We
> also
> clear no_wait_gpu in Xe FWIW.

Yes this is a rather complex problem further complicated by the fact
that since we can in wait for fences under dma_resv locks, for a true
no_wait_gpu exec to succeed, we're only allowed to do dma_resv_trylock.

Better to try to fix this in TTM rather than try to worry too much
about it here.

>=20
> > Otherwise, this could also cause newly introduced sync waits in the
> > exec() and vm_bind paths where we previously performed eviction and
> > the
> > subsequent clearing async.
> >=20
> > Some additional stuff below:
> >=20
> >=20
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 47
> > > ++++++++++++++++++++++++++++
> > > =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 14 ++++++---
> > > =C2=A0drivers/gpu/drm/xe/xe_migrate.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> > > =C2=A0drivers/gpu/drm/xe/xe_res_cursor.h=C2=A0=C2=A0 | 26 +++++++++++=
++++
> > > =C2=A0drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |=C2=A0 5 ++-
> > > =C2=A0drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |=C2=A0 6 ++++
> > > =C2=A06 files changed, 94 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 4e39188a021a..74470f4d418d 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1434,6 +1434,51 @@ static bool
> > > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
> > > =C2=A0	return locked;
> > > =C2=A0}
> > > =C2=A0
> > > +static void xe_ttm_bo_release_clear(struct ttm_buffer_object
> > > *ttm_bo)
> > > +{
> > > +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> > > +	struct dma_fence *fence;
> > > +	int err, idx;
> > > +
> > > +	xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > > +
> > > +	if (ttm_bo->type !=3D ttm_bo_type_device)
> > > +		return;
> > > +
> > > +	if (xe_device_wedged(xe))
> > > +		return;
> > > +
> > > +	if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo-
> > > >resource-
> > > > mem_type))
> > > +		return;
> > > +
> > > +	if (!drm_dev_enter(&xe->drm, &idx))
> > > +		return;
> > > +
> > > +	if (!xe_pm_runtime_get_if_active(xe))
> > > +		goto unbind;
> > > +
> > > +	err =3D dma_resv_reserve_fences(&ttm_bo->base._resv, 1);
> > > +	if (err)
> > > +		goto put_pm;
> > > +
> > > +	fence =3D xe_migrate_clear(mem_type_to_migrate(xe, ttm_bo-
> > > > resource->mem_type),
> > > +				 ttm_to_xe_bo(ttm_bo), ttm_bo-
> > > > resource,
> >=20
> > We should be very careful with passing the xe_bo part here because
> > the
> > gem refcount is currently zero. So that any caller deeper down in
> > the
> > call chain might try to do an xe_bo_get() and blow up.
> >=20
> > Ideally we'd make xe_migrate_clear() operate only on the ttm_bo for
> > this to be safe.
> >=20
>=20
> It looks like bo->size and xe_bo_sg are the two uses of an Xe BO in
> xe_migrate_clear(). Let me see if I can refactor the arguments to
> avoid
> these + add some kernel doc.

Thanks,
Thomas


>=20
> Matt
>=20
> > /Thomas
> >=20
> >=20
> > > +				 XE_MIGRATE_CLEAR_FLAG_FULL |
> > > +				 XE_MIGRATE_CLEAR_NON_DIRTY);
> > > +	if (XE_WARN_ON(IS_ERR(fence)))
> > > +		goto put_pm;
> > > +
> > > +	xe_ttm_vram_mgr_resource_set_cleared(ttm_bo->resource);
> > > +	dma_resv_add_fence(&ttm_bo->base._resv, fence,
> > > +			=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> > > +	dma_fence_put(fence);
> > > +
> > > +put_pm:
> > > +	xe_pm_runtime_put(xe);
> > > +unbind:
> > > +	drm_dev_exit(idx);
> > > +}
> > > +
> > > =C2=A0static void xe_ttm_bo_release_notify(struct ttm_buffer_object
> > > *ttm_bo)
> > > =C2=A0{
> > > =C2=A0	struct dma_resv_iter cursor;
> > > @@ -1478,6 +1523,8 @@ static void xe_ttm_bo_release_notify(struct
> > > ttm_buffer_object *ttm_bo)
> > > =C2=A0	}
> > > =C2=A0	dma_fence_put(replacement);
> > > =C2=A0
> > > +	xe_ttm_bo_release_clear(ttm_bo);
> > > +
> > > =C2=A0	dma_resv_unlock(ttm_bo->base.resv);
> > > =C2=A0}
> > > =C2=A0
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 8f8e9fdfb2a8..39d7200cb366 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -1063,7 +1063,7 @@ struct dma_fence *xe_migrate_clear(struct
> > > xe_migrate *m,
> > > =C2=A0	struct xe_gt *gt =3D m->tile->primary_gt;
> > > =C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> > > =C2=A0	bool clear_only_system_ccs =3D false;
> > > -	struct dma_fence *fence =3D NULL;
> > > +	struct dma_fence *fence =3D dma_fence_get_stub();
> > > =C2=A0	u64 size =3D bo->size;
> > > =C2=A0	struct xe_res_cursor src_it;
> > > =C2=A0	struct ttm_resource *src =3D dst;
> > > @@ -1075,10 +1075,13 @@ struct dma_fence *xe_migrate_clear(struct
> > > xe_migrate *m,
> > > =C2=A0	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> > > =C2=A0		clear_only_system_ccs =3D true;
> > > =C2=A0
> > > -	if (!clear_vram)
> > > +	if (!clear_vram) {
> > > =C2=A0		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size,
> > > &src_it);
> > > -	else
> > > +	} else {
> > > =C2=A0		xe_res_first(src, 0, bo->size, &src_it);
> > > +		if (!(clear_flags & XE_MIGRATE_CLEAR_NON_DIRTY))
> > > +			size -=3D xe_res_next_dirty(&src_it);
> > > +	}
> > > =C2=A0
> > > =C2=A0	while (size) {
> > > =C2=A0		u64 clear_L0_ofs;
> > > @@ -1125,6 +1128,9 @@ struct dma_fence *xe_migrate_clear(struct
> > > xe_migrate *m,
> > > =C2=A0			emit_pte(m, bb, clear_L0_pt, clear_vram,
> > > clear_only_system_ccs,
> > > =C2=A0				 &src_it, clear_L0, dst);
> > > =C2=A0
> > > +		if (clear_vram && !(clear_flags &
> > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > +			size -=3D xe_res_next_dirty(&src_it);
> > > +
> > > =C2=A0		bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> > > =C2=A0		update_idx =3D bb->len;
> > > =C2=A0
> > > @@ -1146,7 +1152,7 @@ struct dma_fence *xe_migrate_clear(struct
> > > xe_migrate *m,
> > > =C2=A0		}
> > > =C2=A0
> > > =C2=A0		xe_sched_job_add_migrate_flush(job,
> > > flush_flags);
> > > -		if (!fence) {
> > > +		if (fence =3D=3D dma_fence_get_stub()) {
> > > =C2=A0			/*
> > > =C2=A0			 * There can't be anything userspace
> > > related
> > > at this
> > > =C2=A0			 * point, so we just need to respect any
> > > potential move
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > index fb9839c1bae0..58a7b747ef11 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct
> > > xe_migrate
> > > *m, struct xe_bo *bo,
> > > =C2=A0
> > > =C2=A0#define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> > > =C2=A0#define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> > > +#define XE_MIGRATE_CLEAR_NON_DIRTY		BIT(2)
> > > =C2=A0#define
> > > XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA |
> > > \
> > > =C2=A0					XE_MIGRATE_CLEAR_FLAG_CC
> > > S_DA
> > > TA)
> > > =C2=A0struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > index d1a403cfb628..630082e809ba 100644
> > > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > @@ -315,6 +315,32 @@ static inline void xe_res_next(struct
> > > xe_res_cursor *cur, u64 size)
> > > =C2=A0	}
> > > =C2=A0}
> > > =C2=A0
> > > +/**
> > > + * xe_res_next_dirty - advance the cursor to next dirty buddy
> > > block
> > > + *
> > > + * @cur: the cursor to advance
> > > + *
> > > + * Move the cursor until dirty buddy block is found.
> > > + *
> > > + * Return: Number of bytes cursor has been advanced
> > > + */
> > > +static inline u64 xe_res_next_dirty(struct xe_res_cursor *cur)
> > > +{
> > > +	struct drm_buddy_block *block =3D cur->node;
> > > +	u64 bytes =3D 0;
> > > +
> > > +	XE_WARN_ON(cur->mem_type !=3D XE_PL_VRAM0 &&
> > > +		=C2=A0=C2=A0 cur->mem_type !=3D XE_PL_VRAM1);
> > > +
> > > +	while (cur->remaining &&
> > > drm_buddy_block_is_clear(block)) {
> > > +		bytes +=3D cur->size;
> > > +		xe_res_next(cur, cur->size);
> > > +		block =3D cur->node;
> > > +	}
> > > +
> > > +	return bytes;
> > > +}
> > > +
> > > =C2=A0/**
> > > =C2=A0 * xe_res_dma - return dma address of cursor at current positio=
n
> > > =C2=A0 *
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > index 9e375a40aee9..120046941c1e 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct
> > > ttm_resource_manager *man,
> > > =C2=A0	if (place->fpfn || lpfn !=3D man->size >> PAGE_SHIFT)
> > > =C2=A0		vres->flags |=3D DRM_BUDDY_RANGE_ALLOCATION;
> > > =C2=A0
> > > +	if (tbo->type =3D=3D ttm_bo_type_device)
> > > +		vres->flags |=3D DRM_BUDDY_CLEAR_ALLOCATION;
> > > +
> > > =C2=A0	if (WARN_ON(!vres->base.size)) {
> > > =C2=A0		err =3D -EINVAL;
> > > =C2=A0		goto error_fini;
> > > @@ -187,7 +190,7 @@ static void xe_ttm_vram_mgr_del(struct
> > > ttm_resource_manager *man,
> > > =C2=A0	struct drm_buddy *mm =3D &mgr->mm;
> > > =C2=A0
> > > =C2=A0	mutex_lock(&mgr->lock);
> > > -	drm_buddy_free_list(mm, &vres->blocks, 0);
> > > +	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> > > =C2=A0	mgr->visible_avail +=3D vres->used_visible_size;
> > > =C2=A0	mutex_unlock(&mgr->lock);
> > > =C2=A0
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > index cc76050e376d..dfc0e6890b3c 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct
> > > ttm_resource
> > > *res)
> > > =C2=A0	return container_of(res, struct
> > > xe_ttm_vram_mgr_resource,
> > > base);
> > > =C2=A0}
> > > =C2=A0
> > > +static inline void
> > > +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource *res)
> > > +{
> > > +	to_xe_ttm_vram_mgr_resource(res)->flags |=3D
> > > DRM_BUDDY_CLEARED;
> > > +}
> > > +
> > > =C2=A0static inline struct xe_ttm_vram_mgr *
> > > =C2=A0to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> > > =C2=A0{
> >=20

