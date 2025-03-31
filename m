Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE07CC3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 15:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AFF10E417;
	Mon, 31 Mar 2025 15:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hyFtTaVe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D23310E417
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743433659; x=1774969659;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fIqEGwEBatdl5OXpJBRQdUvuufOSO+9LplRql7akT2w=;
 b=hyFtTaVeeHdpfwNYeMfQriqkrknEwP9kmXG3oY/8xUdwoqGc8oYCx/aK
 eiUsqwJmeLDxY6enkO71hz5ah86uOrG9t74ysDyjhYYyj+UEQctp3sI7c
 5F6kz+Lj/hHpVShIJhOYThtJixZ4xtGAizD6CFyw6BH2UvfmjluVpnYso
 yfSFwE+r1wQ7QCT0ZkVH46t/br+Y3SJzrkdOUSWdoyBznP0wiSxEcpkMS
 TRT+bImC5g4IBYcEkxw72rT9qJOsNbZdgRqfOtB2fyPeOIJEz1brc00a5
 dBsnf6kHfQK4oQsam1c6KpiyNbhjAQt1X3a1/eFdsSm0lR/3I8jZL6Gwu Q==;
X-CSE-ConnectionGUID: jTRQaYGlS6iYHYN0ry9Wzg==
X-CSE-MsgGUID: fFcFIVidTuKyetN7lJX0BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55720203"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="55720203"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 08:07:39 -0700
X-CSE-ConnectionGUID: ea4uq51yRCOuSDqwlC9GRA==
X-CSE-MsgGUID: aMED2kdcRPC63ke5gLlSdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="126097854"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.213])
 ([10.245.246.213])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 08:07:37 -0700
Message-ID: <ba15e771bfdaa35cee0b4c49ea2da4437cd626da.camel@linux.intel.com>
Subject: Re: [PATCH v4 1/7] drm/xe: use backup object for pinned save/restore
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Date: Mon, 31 Mar 2025 17:07:21 +0200
In-Reply-To: <aacbb877-d8f1-4875-adc4-48a735c964c0@intel.com>
References: <20250326181908.124082-9-matthew.auld@intel.com>
 <20250326181908.124082-10-matthew.auld@intel.com>
 <6554231eb5595c1cdf5e869a6a5a450e366ccaa6.camel@linux.intel.com>
 <aacbb877-d8f1-4875-adc4-48a735c964c0@intel.com>
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

Hi,

On Mon, 2025-03-31 at 13:31 +0100, Matthew Auld wrote:
> Hi,
>=20
> On 28/03/2025 15:28, Thomas Hellstr=C3=B6m wrote:
> > Hi, Matthew, a partly unrelated question below.
> >=20
> > On Wed, 2025-03-26 at 18:19 +0000, Matthew Auld wrote:
> > > Currently we move pinned objects, relying on the fact that the
> > > lpfn/fpfn
> > > will force the placement to occupy the same pages when restoring.
> > > However this then limits all such pinned objects to be contig
> > > underneath. In addition it is likely a little fragile moving
> > > pinned
> > > objects in the first place. Rather than moving such objects
> > > rather
> > > copy
> > > the page contents to a secondary system memory object, that way
> > > the
> > > VRAM
> > > pages never move and remain pinned. This also opens the door for
> > > eventually having non-contig pinned objects that can also be
> > > saved/restored using blitter.
> > >=20
> > > v2:
> > > =C2=A0=C2=A0- Make sure to drop the fence ref.
> > > =C2=A0=C2=A0- Handle NULL bo->migrate.
> > > v3:
> > > =C2=A0=C2=A0- Ensure we add the copy fence to the BOs, otherwise back=
up_obj
> > > can
> > > =C2=A0=C2=A0=C2=A0 be freed before pipelined copy finishes.
> > > v4:
> > > =C2=A0=C2=A0 - Rebase on newly added apply-to-pinned infra.
> > >=20
> > > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1182
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> >=20
> > IMO a longer term goal is to move eviction on suspend and
> > hibernation
> > earlier, while swapout still works and, for hibernation, before
> > estimating the size of the hibernation image. If we do that, would
> > it
> > be easy to pre-populate the backup bos at that point, to avoid
> > memory
> > allocations late in the process? This would likely be in a PM
> > notifier.
>=20
> Yeah, I think this makes sense. So maybe something roughly like this
> (on=20
> top of this series):
>=20
> https://gitlab.freedesktop.org/mwa/kernel/-/commit/16bc0659764513088072f4=
7c21804985b5e0d86d
>=20
> So have evict-all-user and prepare-pinned called from the notifier
> for=20
> suspend. Not sure about the NOTIFY_BAD, or if we should ignore until=20
> real .suspend() for that prepare-pinned case. Or if we should keep
> the=20
> back object pinned until .suspend(). Also not sure if RPM also calls=20
> this notifier or not.

Yes, exactly something like this.

We need to sort out the above. And also perhaps the hibernation
sequence so that we ensure we do this before the size calculation of
the hibernation image. Also I have a vague recollection that the
notifiers should be symmetric in the sense that everything done pre-
hibernation needs to be undone in a notifier post-hibernation, in case
the hibernation itself fails.

/Thomas


>=20
> >=20
> > /Thomas
> >=20
> >=20
> >=20
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 339 ++++++++++++++++--------
> > > -----
> > > --
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_bo_evict.c |=C2=A0=C2=A0 2 -
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_bo_types.h |=C2=A0=C2=A0 2 +
> > > =C2=A0=C2=A03 files changed, 179 insertions(+), 164 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 64f9c936eea0..362f08f8e743 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -898,79 +898,44 @@ static int xe_bo_move(struct
> > > ttm_buffer_object
> > > *ttm_bo, bool evict,
> > > =C2=A0=C2=A0		xe_pm_runtime_get_noresume(xe);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
> > > -		/*
> > > -		 * Kernel memory that is pinned should only be
> > > moved
> > > on suspend
> > > -		 * / resume, some of the pinned memory is
> > > required
> > > for the
> > > -		 * device to resume / use the GPU to move other
> > > evicted memory
> > > -		 * (user memory) around. This likely could be
> > > optimized a bit
> > > -		 * further where we find the minimum set of
> > > pinned
> > > memory
> > > -		 * required for resume but for simplity doing a
> > > memcpy for all
> > > -		 * pinned memory.
> > > -		 */
> > > -		ret =3D xe_bo_vmap(bo);
> > > -		if (!ret) {
> > > -			ret =3D ttm_bo_move_memcpy(ttm_bo, ctx,
> > > new_mem);
> > > +	if (move_lacks_source) {
> > > +		u32 flags =3D 0;
> > > =C2=A0=20
> > > -			/* Create a new VMAP once kernel BO back
> > > in
> > > VRAM */
> > > -			if (!ret && resource_is_vram(new_mem)) {
> > > -				struct xe_vram_region *vram =3D
> > > res_to_mem_region(new_mem);
> > > -				void __iomem *new_addr =3D vram-
> > > > mapping +
> > > -					(new_mem->start <<
> > > PAGE_SHIFT);
> > > +		if (mem_type_is_vram(new_mem->mem_type))
> > > +			flags |=3D XE_MIGRATE_CLEAR_FLAG_FULL;
> > > +		else if (handle_system_ccs)
> > > +			flags |=3D XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
> > > =C2=A0=20
> > > -				if (XE_WARN_ON(new_mem->start =3D=3D
> > > XE_BO_INVALID_OFFSET)) {
> > > -					ret =3D -EINVAL;
> > > -					xe_pm_runtime_put(xe);
> > > -					goto out;
> > > -				}
> > > -
> > > -				xe_assert(xe, new_mem->start =3D=3D
> > > -					=C2=A0 bo->placements->fpfn);
> > > -
> > > -				iosys_map_set_vaddr_iomem(&bo-
> > > >vmap,
> > > new_addr);
> > > -			}
> > > +		fence =3D xe_migrate_clear(migrate, bo, new_mem,
> > > flags);
> > > +	} else {
> > > +		fence =3D xe_migrate_copy(migrate, bo, bo,
> > > old_mem,
> > > new_mem,
> > > +					handle_system_ccs);
> > > +	}
> > > +	if (IS_ERR(fence)) {
> > > +		ret =3D PTR_ERR(fence);
> > > +		xe_pm_runtime_put(xe);
> > > +		goto out;
> > > +	}
> > > +	if (!move_lacks_source) {
> > > +		ret =3D ttm_bo_move_accel_cleanup(ttm_bo, fence,
> > > evict, true,
> > > +						new_mem);
> > > +		if (ret) {
> > > +			dma_fence_wait(fence, false);
> > > +			ttm_bo_move_null(ttm_bo, new_mem);
> > > +			ret =3D 0;
> > > =C2=A0=C2=A0		}
> > > =C2=A0=C2=A0	} else {
> > > -		if (move_lacks_source) {
> > > -			u32 flags =3D 0;
> > > -
> > > -			if (mem_type_is_vram(new_mem->mem_type))
> > > -				flags |=3D
> > > XE_MIGRATE_CLEAR_FLAG_FULL;
> > > -			else if (handle_system_ccs)
> > > -				flags |=3D
> > > XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
> > > -
> > > -			fence =3D xe_migrate_clear(migrate, bo,
> > > new_mem, flags);
> > > -		}
> > > -		else
> > > -			fence =3D xe_migrate_copy(migrate, bo, bo,
> > > old_mem,
> > > -						new_mem,
> > > handle_system_ccs);
> > > -		if (IS_ERR(fence)) {
> > > -			ret =3D PTR_ERR(fence);
> > > -			xe_pm_runtime_put(xe);
> > > -			goto out;
> > > -		}
> > > -		if (!move_lacks_source) {
> > > -			ret =3D ttm_bo_move_accel_cleanup(ttm_bo,
> > > fence, evict,
> > > -							true,
> > > new_mem);
> > > -			if (ret) {
> > > -				dma_fence_wait(fence, false);
> > > -				ttm_bo_move_null(ttm_bo,
> > > new_mem);
> > > -				ret =3D 0;
> > > -			}
> > > -		} else {
> > > -			/*
> > > -			 * ttm_bo_move_accel_cleanup() may blow
> > > up
> > > if
> > > -			 * bo->resource =3D=3D NULL, so just attach
> > > the
> > > -			 * fence and set the new resource.
> > > -			 */
> > > -			dma_resv_add_fence(ttm_bo->base.resv,
> > > fence,
> > > -					=C2=A0=C2=A0
> > > DMA_RESV_USAGE_KERNEL);
> > > -			ttm_bo_move_null(ttm_bo, new_mem);
> > > -		}
> > > -
> > > -		dma_fence_put(fence);
> > > +		/*
> > > +		 * ttm_bo_move_accel_cleanup() may blow up if
> > > +		 * bo->resource =3D=3D NULL, so just attach the
> > > +		 * fence and set the new resource.
> > > +		 */
> > > +		dma_resv_add_fence(ttm_bo->base.resv, fence,
> > > +				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> > > +		ttm_bo_move_null(ttm_bo, new_mem);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > +	dma_fence_put(fence);
> > > =C2=A0=C2=A0	xe_pm_runtime_put(xe);
> > > =C2=A0=20
> > > =C2=A0=C2=A0out:
> > > @@ -1107,59 +1072,90 @@ long xe_bo_shrink(struct
> > > ttm_operation_ctx
> > > *ctx, struct ttm_buffer_object *bo,
> > > =C2=A0=C2=A0 */
> > > =C2=A0=C2=A0int xe_bo_evict_pinned(struct xe_bo *bo)
> > > =C2=A0=C2=A0{
> > > -	struct ttm_place place =3D {
> > > -		.mem_type =3D XE_PL_TT,
> > > -	};
> > > -	struct ttm_placement placement =3D {
> > > -		.placement =3D &place,
> > > -		.num_placement =3D 1,
> > > -	};
> > > -	struct ttm_operation_ctx ctx =3D {
> > > -		.interruptible =3D false,
> > > -		.gfp_retry_mayfail =3D true,
> > > -	};
> > > -	struct ttm_resource *new_mem;
> > > -	int ret;
> > > +	struct xe_device *xe =3D ttm_to_xe_device(bo->ttm.bdev);
> > > +	struct xe_bo *backup;
> > > +	bool unmap =3D false;
> > > +	int ret =3D 0;
> > > =C2=A0=20
> > > -	xe_bo_assert_held(bo);
> > > +	xe_bo_lock(bo, false);
> > > =C2=A0=20
> > > -	if (WARN_ON(!bo->ttm.resource))
> > > -		return -EINVAL;
> > > -
> > > -	if (WARN_ON(!xe_bo_is_pinned(bo)))
> > > -		return -EINVAL;
> > > -
> > > -	if (!xe_bo_is_vram(bo))
> > > -		return 0;
> > > -
> > > -	ret =3D ttm_bo_mem_space(&bo->ttm, &placement, &new_mem,
> > > &ctx);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > -	if (!bo->ttm.ttm) {
> > > -		bo->ttm.ttm =3D xe_ttm_tt_create(&bo->ttm, 0);
> > > -		if (!bo->ttm.ttm) {
> > > -			ret =3D -ENOMEM;
> > > -			goto err_res_free;
> > > -		}
> > > +	if (WARN_ON(!bo->ttm.resource)) {
> > > +		ret =3D -EINVAL;
> > > +		goto out_unlock_bo;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	ret =3D ttm_bo_populate(&bo->ttm, &ctx);
> > > +	if (WARN_ON(!xe_bo_is_pinned(bo))) {
> > > +		ret =3D -EINVAL;
> > > +		goto out_unlock_bo;
> > > +	}
> > > +
> > > +	if (!xe_bo_is_vram(bo))
> > > +		goto out_unlock_bo;
> > > +
> > > +	backup =3D xe_bo_create_locked(xe, NULL, NULL, bo->size,
> > > ttm_bo_type_kernel,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> > > XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_PINNED);
> > > +	if (IS_ERR(backup)) {
> > > +		ret =3D PTR_ERR(backup);
> > > +		goto out_unlock_bo;
> > > +	}
> > > +
> > > +	if (xe_bo_is_user(bo)) {
> > > +		struct xe_migrate *migrate;
> > > +		struct dma_fence *fence;
> > > +
> > > +		if (bo->tile)
> > > +			migrate =3D bo->tile->migrate;
> > > +		else
> > > +			migrate =3D mem_type_to_migrate(xe, bo-
> > > > ttm.resource->mem_type);
> > > +
> > > +		ret =3D dma_resv_reserve_fences(bo->ttm.base.resv,
> > > 1);
> > > +		if (ret)
> > > +			goto out_backup;
> > > +
> > > +		ret =3D dma_resv_reserve_fences(backup-
> > > >ttm.base.resv,
> > > 1);
> > > +		if (ret)
> > > +			goto out_backup;
> > > +
> > > +		fence =3D xe_migrate_copy(migrate, bo, backup, bo-
> > > > ttm.resource,
> > > +					backup->ttm.resource,
> > > false);
> > > +		if (IS_ERR(fence)) {
> > > +			ret =3D PTR_ERR(fence);
> > > +			goto out_backup;
> > > +		}
> > > +
> > > +		dma_resv_add_fence(bo->ttm.base.resv, fence,
> > > +				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> > > +		dma_resv_add_fence(backup->ttm.base.resv, fence,
> > > +				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> > > +		dma_fence_put(fence);
> > > +	} else {
> > > +		ret =3D xe_bo_vmap(backup);
> > > +		if (ret)
> > > +			goto out_backup;
> > > +
> > > +		if (iosys_map_is_null(&bo->vmap)) {
> > > +			ret =3D xe_bo_vmap(bo);
> > > +			if (ret)
> > > +				goto out_backup;
> > > +			unmap =3D true;
> > > +		}
> > > +
> > > +		xe_map_memcpy_from(xe, backup->vmap.vaddr, &bo-
> > > > vmap, 0,
> > > +				=C2=A0=C2=A0 bo->size);
> > > +	}
> > > +
> > > +	bo->backup_obj =3D backup;
> > > +
> > > +out_backup:
> > > +	xe_bo_vunmap(backup);
> > > +	xe_bo_unlock(backup);
> > > =C2=A0=C2=A0	if (ret)
> > > -		goto err_res_free;
> > > -
> > > -	ret =3D dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> > > -	if (ret)
> > > -		goto err_res_free;
> > > -
> > > -	ret =3D xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
> > > -	if (ret)
> > > -		goto err_res_free;
> > > -
> > > -	return 0;
> > > -
> > > -err_res_free:
> > > -	ttm_resource_free(&bo->ttm, &new_mem);
> > > +		xe_bo_put(backup);
> > > +out_unlock_bo:
> > > +	if (unmap)
> > > +		xe_bo_vunmap(bo);
> > > +	xe_bo_unlock(bo);
> > > =C2=A0=C2=A0	return ret;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > @@ -1180,47 +1176,82 @@ int xe_bo_restore_pinned(struct xe_bo
> > > *bo)
> > > =C2=A0=C2=A0		.interruptible =3D false,
> > > =C2=A0=C2=A0		.gfp_retry_mayfail =3D false,
> > > =C2=A0=C2=A0	};
> > > -	struct ttm_resource *new_mem;
> > > -	struct ttm_place *place =3D &bo->placements[0];
> > > +	struct xe_device *xe =3D ttm_to_xe_device(bo->ttm.bdev);
> > > +	struct xe_bo *backup =3D bo->backup_obj;
> > > +	bool unmap =3D false;
> > > =C2=A0=C2=A0	int ret;
> > > =C2=A0=20
> > > -	xe_bo_assert_held(bo);
> > > -
> > > -	if (WARN_ON(!bo->ttm.resource))
> > > -		return -EINVAL;
> > > -
> > > -	if (WARN_ON(!xe_bo_is_pinned(bo)))
> > > -		return -EINVAL;
> > > -
> > > -	if (WARN_ON(xe_bo_is_vram(bo)))
> > > -		return -EINVAL;
> > > -
> > > -	if (WARN_ON(!bo->ttm.ttm && !xe_bo_is_stolen(bo)))
> > > -		return -EINVAL;
> > > -
> > > -	if (!mem_type_is_vram(place->mem_type))
> > > +	if (!backup)
> > > =C2=A0=C2=A0		return 0;
> > > =C2=A0=20
> > > -	ret =3D ttm_bo_mem_space(&bo->ttm, &bo->placement,
> > > &new_mem,
> > > &ctx);
> > > +	xe_bo_lock(backup, false);
> > > +
> > > +	ret =3D ttm_bo_validate(&backup->ttm, &backup->placement,
> > > &ctx);
> > > =C2=A0=C2=A0	if (ret)
> > > -		return ret;
> > > +		goto out_backup;
> > > =C2=A0=20
> > > -	ret =3D ttm_bo_populate(&bo->ttm, &ctx);
> > > -	if (ret)
> > > -		goto err_res_free;
> > > +	if (WARN_ON(!dma_resv_trylock(bo->ttm.base.resv))) {
> > > +		ret =3D -EBUSY;
> > > +		goto out_backup;
> > > +	}
> > > =C2=A0=20
> > > -	ret =3D dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> > > -	if (ret)
> > > -		goto err_res_free;
> > > +	if (xe_bo_is_user(bo)) {
> > > +		struct xe_migrate *migrate;
> > > +		struct dma_fence *fence;
> > > =C2=A0=20
> > > -	ret =3D xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
> > > -	if (ret)
> > > -		goto err_res_free;
> > > +		if (bo->tile)
> > > +			migrate =3D bo->tile->migrate;
> > > +		else
> > > +			migrate =3D mem_type_to_migrate(xe, bo-
> > > > ttm.resource->mem_type);
> > > =C2=A0=20
> > > -	return 0;
> > > +		ret =3D dma_resv_reserve_fences(bo->ttm.base.resv,
> > > 1);
> > > +		if (ret)
> > > +			goto out_unlock_bo;
> > > =C2=A0=20
> > > -err_res_free:
> > > -	ttm_resource_free(&bo->ttm, &new_mem);
> > > +		ret =3D dma_resv_reserve_fences(backup-
> > > >ttm.base.resv,
> > > 1);
> > > +		if (ret)
> > > +			goto out_unlock_bo;
> > > +
> > > +		fence =3D xe_migrate_copy(migrate, backup, bo,
> > > +					backup->ttm.resource,
> > > bo-
> > > > ttm.resource,
> > > +					false);
> > > +		if (IS_ERR(fence)) {
> > > +			ret =3D PTR_ERR(fence);
> > > +			goto out_unlock_bo;
> > > +		}
> > > +
> > > +		dma_resv_add_fence(bo->ttm.base.resv, fence,
> > > +				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> > > +		dma_resv_add_fence(backup->ttm.base.resv, fence,
> > > +				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> > > +		dma_fence_put(fence);
> > > +	} else {
> > > +		ret =3D xe_bo_vmap(backup);
> > > +		if (ret)
> > > +			goto out_unlock_bo;
> > > +
> > > +		if (iosys_map_is_null(&bo->vmap)) {
> > > +			ret =3D xe_bo_vmap(bo);
> > > +			if (ret)
> > > +				goto out_unlock_bo;
> > > +			unmap =3D true;
> > > +		}
> > > +
> > > +		xe_map_memcpy_to(xe, &bo->vmap, 0, backup-
> > > > vmap.vaddr,
> > > +				 bo->size);
> > > +	}
> > > +
> > > +	bo->backup_obj =3D NULL;
> > > +
> > > +out_unlock_bo:
> > > +	if (unmap)
> > > +		xe_bo_vunmap(bo);
> > > +	xe_bo_unlock(bo);
> > > +out_backup:
> > > +	xe_bo_vunmap(backup);
> > > +	xe_bo_unlock(backup);
> > > +	if (!bo->backup_obj)
> > > +		xe_bo_put(backup);
> > > =C2=A0=C2=A0	return ret;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > @@ -2149,22 +2180,6 @@ int xe_bo_pin(struct xe_bo *bo)
> > > =C2=A0=C2=A0	if (err)
> > > =C2=A0=C2=A0		return err;
> > > =C2=A0=20
> > > -	/*
> > > -	 * For pinned objects in on DGFX, which are also in
> > > vram, we
> > > expect
> > > -	 * these to be in contiguous VRAM memory. Required
> > > eviction
> > > / restore
> > > -	 * during suspend / resume (force restore to same
> > > physical
> > > address).
> > > -	 */
> > > -	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
> > > -	=C2=A0=C2=A0=C2=A0 bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
> > > -		if (mem_type_is_vram(place->mem_type)) {
> > > -			xe_assert(xe, place->flags &
> > > TTM_PL_FLAG_CONTIGUOUS);
> > > -
> > > -			place->fpfn =3D (xe_bo_addr(bo, 0,
> > > PAGE_SIZE)
> > > -
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > vram_region_gpu_offset(bo-
> > > > ttm.resource)) >> PAGE_SHIFT;
> > > -			place->lpfn =3D place->fpfn + (bo->size >>
> > > PAGE_SHIFT);
> > > -		}
> > > -	}
> > > -
> > > =C2=A0=C2=A0	if (mem_type_is_vram(place->mem_type) || bo->flags &
> > > XE_BO_FLAG_GGTT) {
> > > =C2=A0=C2=A0		spin_lock(&xe->pinned.lock);
> > > =C2=A0=C2=A0		list_add_tail(&bo->pinned_link, &xe-
> > > > pinned.kernel_bo_present);
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
> > > b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > index 1eeb3910450b..6e6a5d7a5617 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > @@ -31,14 +31,12 @@ static int xe_bo_apply_to_pinned(struct
> > > xe_device
> > > *xe,
> > > =C2=A0=C2=A0		list_move_tail(&bo->pinned_link,
> > > &still_in_list);
> > > =C2=A0=C2=A0		spin_unlock(&xe->pinned.lock);
> > > =C2=A0=20
> > > -		xe_bo_lock(bo, false);
> > > =C2=A0=C2=A0		ret =3D pinned_fn(bo);
> > > =C2=A0=C2=A0		if (ret && pinned_list !=3D new_list) {
> > > =C2=A0=C2=A0			spin_lock(&xe->pinned.lock);
> > > =C2=A0=C2=A0			list_move(&bo->pinned_link,
> > > pinned_list);
> > > =C2=A0=C2=A0			spin_unlock(&xe->pinned.lock);
> > > =C2=A0=C2=A0		}
> > > -		xe_bo_unlock(bo);
> > > =C2=A0=C2=A0		xe_bo_put(bo);
> > > =C2=A0=C2=A0		spin_lock(&xe->pinned.lock);
> > > =C2=A0=C2=A0	}
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > > b/drivers/gpu/drm/xe/xe_bo_types.h
> > > index 15a92e3d4898..81396181aaea 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > @@ -28,6 +28,8 @@ struct xe_vm;
> > > =C2=A0=C2=A0struct xe_bo {
> > > =C2=A0=C2=A0	/** @ttm: TTM base buffer object */
> > > =C2=A0=C2=A0	struct ttm_buffer_object ttm;
> > > +	/** @backup_obj: The backup object when pinned and
> > > suspended
> > > (vram only) */
> > > +	struct xe_bo *backup_obj;
> > > =C2=A0=C2=A0	/** @size: Size of this buffer object */
> > > =C2=A0=C2=A0	size_t size;
> > > =C2=A0=C2=A0	/** @flags: flags for this buffer object */
> >=20
>=20

