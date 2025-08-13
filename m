Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72CECA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 12:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6F010E705;
	Wed, 13 Aug 2025 12:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fula0u17";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9669E10E705
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 12:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755088253; x=1786624253;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ObaQ5sO9NN445I8ChogVLgGexWWbCKFz1P0JtO+jUps=;
 b=fula0u1735aWYWlU7rzPq5L2p1G/1HRGN++qaS87HOydkTREonjMIgOM
 VOUlRsjmgAdLJuN9RsJDXJrf+ui/aAt+22Ra4rRksKMtqRWUIoQX2+AKi
 Y8g4oibaiGKBmaer2Vdrc+jEXR4kYk+jt0+3O+Cs9E5yV6/3whBNEzhgH
 bbz79ytlhcrPqpMwJFtyx7s5ALM/cM50xuJYpMcFU3DzFxa22ET+S0Ror
 DZ6n/HrJJjY8V/KmkFryvBrmSqIr8cKV1pG1PVHBrMXPROffdQ/XtP9og
 K+8kVeCtoEdU4wUGJSoxCOipsodX1yo93oELBLqq3SVy4/msaeRrTK3Nx Q==;
X-CSE-ConnectionGUID: fywc/rAKTFOybMvjZiFdmA==
X-CSE-MsgGUID: Q1HqOvf5QcqGesBfCm7xHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56403687"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="56403687"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 05:30:45 -0700
X-CSE-ConnectionGUID: ntqWVuepQqKXdWsQPjc7jw==
X-CSE-MsgGUID: 9z3ZULavSCq031auQahBTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="170671079"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.245.245.199])
 ([10.245.245.199])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 05:30:43 -0700
Message-ID: <bdf454972b01f15a6144336f623df20fcd66d83c.camel@linux.intel.com>
Subject: Re: [PATCH 15/15] drm/xe: Convert pinned suspend eviction for
 exhaustive eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Wed, 13 Aug 2025 14:30:40 +0200
In-Reply-To: <bce1c846-bdf9-4bf8-ba92-1baa896e2f70@intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-16-thomas.hellstrom@linux.intel.com>
 <bce1c846-bdf9-4bf8-ba92-1baa896e2f70@intel.com>
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

On Wed, 2025-08-13 at 13:13 +0100, Matthew Auld wrote:
> Hi,
>=20
> On 13/08/2025 11:51, Thomas Hellstr=C3=B6m wrote:
> > Pinned suspend eviction and preparation for eviction validates
> > system memory for eviction buffers. Do that under a
> > validation exclusive lock to avoid interfering with other
> > processes validating system graphics memory.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c | 205 +++++++++++++++++++------------=
-
> > -----
> > =C2=A0 1 file changed, 108 insertions(+), 97 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 82bf158426ad..efb9c88b6aa7 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1139,43 +1139,47 @@ long xe_bo_shrink(struct ttm_operation_ctx
> > *ctx, struct ttm_buffer_object *bo,
> > =C2=A0 int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct xe_device *xe =3D ttm_to_xe_device(bo->ttm.bdev);
> > -	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > +	struct xe_validation_ctx ctx;
> > +	struct drm_exec exec;
> > =C2=A0=C2=A0	struct xe_bo *backup;
> > =C2=A0=C2=A0	int ret =3D 0;
> > =C2=A0=20
> > -	xe_bo_lock(bo, false);
> > +	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, true) {
>=20
> Ah, this reminded me of=20
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4288
>=20
> Could this help with that? If you could maybe keep the exlusive mode=20
> turned on for the entire prepare/unprepare stage, to ensure other=20
> execs/validates back off until we are done?


I have a fix in the pipe for that, but I reverted it just before
sending since the whole suspend / resume stuff needs some interface
additions. I'm seeing some false lockdep errors.

Basically xe_validation_guard is set to block on an interruptible
struct completion if we're suspending. We can only do this on freezable
tasks allowing interruptible waits ATM, otherwise these tasks will
block on the completion until freezing time and then never freeze.

Otherwise when freezing the wait is interrupted and an -ERESTARTSYS is
returned, and the task will be frozen in the signal delivery code. This
part I have verified to work.

This should take care of most validations during suspend, but not the
rebind worker. I figure we can handle it as well by using a freezable
workqueue and if the worker receives an -EINTR or -ERESTARTSYS it
doesn't error but simply requeues itself as newly added work items
aren't run until the wqs are thawed. This part I haven't verified,
though.

Finally this assumes that all validations under uninterruptible context
are too few to cause any problems during suspend.

/Thomas




>=20
> > +		ret =3D drm_exec_lock_obj(&exec, &bo->ttm.base);
> > +		drm_exec_retry_on_contention(&exec);
> > +		xe_assert(xe, !ret);
> > +		xe_assert(xe, !bo->backup_obj);
> > =C2=A0=20
> > -	xe_assert(xe, !bo->backup_obj);
> > +		/*
> > +		 * Since this is called from the PM notifier we
> > might have raced with
> > +		 * someone unpinning this after we dropped the
> > pinned list lock and
> > +		 * grabbing the above bo lock.
> > +		 */
> > +		if (!xe_bo_is_pinned(bo))
> > +			break;
> > =C2=A0=20
> > -	/*
> > -	 * Since this is called from the PM notifier we might have
> > raced with
> > -	 * someone unpinning this after we dropped the pinned list
> > lock and
> > -	 * grabbing the above bo lock.
> > -	 */
> > -	if (!xe_bo_is_pinned(bo))
> > -		goto out_unlock_bo;
> > +		if (!xe_bo_is_vram(bo))
> > +			break;
> > =C2=A0=20
> > -	if (!xe_bo_is_vram(bo))
> > -		goto out_unlock_bo;
> > +		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> > +			break;
> > =C2=A0=20
> > -	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> > -		goto out_unlock_bo;
> > +		backup =3D xe_bo_init_locked(xe, NULL, NULL, bo-
> > >ttm.base.resv, NULL, xe_bo_size(bo),
> > +					=C2=A0=C2=A0
> > DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> > +					=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> > XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > +					=C2=A0=C2=A0 XE_BO_FLAG_PINNED,
> > &exec);
> > +		if (IS_ERR(backup)) {
> > +			drm_exec_retry_on_contention(&exec);
> > +			ret =3D PTR_ERR(backup);
> > +			xe_validation_retry_on_oom(&ctx, &ret);
> > +			break;
> > +		}
> > =C2=A0=20
> > -	backup =3D xe_bo_init_locked(xe, NULL, NULL, bo-
> > >ttm.base.resv, NULL, xe_bo_size(bo),
> > -				=C2=A0=C2=A0 DRM_XE_GEM_CPU_CACHING_WB,
> > ttm_bo_type_kernel,
> > -				=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> > XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > -				=C2=A0=C2=A0 XE_BO_FLAG_PINNED, exec);
> > -	if (IS_ERR(backup)) {
> > -		ret =3D PTR_ERR(backup);
> > -		goto out_unlock_bo;
> > +		backup->parent_obj =3D xe_bo_get(bo); /* Released by
> > bo_destroy */
> > +		ttm_bo_pin(&backup->ttm);
> > +		bo->backup_obj =3D backup;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	backup->parent_obj =3D xe_bo_get(bo); /* Released by
> > bo_destroy */
> > -	ttm_bo_pin(&backup->ttm);
> > -	bo->backup_obj =3D backup;
> > -
> > -out_unlock_bo:
> > -	xe_bo_unlock(bo);
> > =C2=A0=C2=A0	return ret;
> > =C2=A0 }
> > =C2=A0=20
> > @@ -1215,99 +1219,106 @@ int xe_bo_notifier_unprepare_pinned(struct
> > xe_bo *bo)
> > =C2=A0 int xe_bo_evict_pinned(struct xe_bo *bo)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct xe_device *xe =3D ttm_to_xe_device(bo->ttm.bdev);
> > -	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > +	struct xe_validation_ctx ctx;
> > +	struct drm_exec exec;
> > =C2=A0=C2=A0	struct xe_bo *backup =3D bo->backup_obj;
> > =C2=A0=C2=A0	bool backup_created =3D false;
> > =C2=A0=C2=A0	bool unmap =3D false;
> > =C2=A0=C2=A0	int ret =3D 0;
> > =C2=A0=20
> > -	xe_bo_lock(bo, false);
> > +	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, true) {
> > +		ret =3D drm_exec_lock_obj(&exec, &bo->ttm.base);
> > +		drm_exec_retry_on_contention(&exec);
> > +		xe_assert(xe, !ret);
> > =C2=A0=20
> > -	if (WARN_ON(!bo->ttm.resource)) {
> > -		ret =3D -EINVAL;
> > -		goto out_unlock_bo;
> > -	}
> > +		if (WARN_ON(!bo->ttm.resource)) {
> > +			ret =3D -EINVAL;
> > +			break;
> > +		}
> > =C2=A0=20
> > -	if (WARN_ON(!xe_bo_is_pinned(bo))) {
> > -		ret =3D -EINVAL;
> > -		goto out_unlock_bo;
> > -	}
> > +		if (WARN_ON(!xe_bo_is_pinned(bo))) {
> > +			ret =3D -EINVAL;
> > +			break;
> > +		}
> > =C2=A0=20
> > -	if (!xe_bo_is_vram(bo))
> > -		goto out_unlock_bo;
> > +		if (!xe_bo_is_vram(bo))
> > +			break;
> > =C2=A0=20
> > -	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> > -		goto out_unlock_bo;
> > +		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> > +			break;
> > =C2=A0=20
> > -	if (!backup) {
> > -		backup =3D xe_bo_init_locked(xe, NULL, NULL, bo-
> > >ttm.base.resv, NULL, xe_bo_size(bo),
> > -					=C2=A0=C2=A0
> > DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> > -					=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> > XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > -					=C2=A0=C2=A0 XE_BO_FLAG_PINNED,
> > exec);
> > -		if (IS_ERR(backup)) {
> > -			ret =3D PTR_ERR(backup);
> > -			goto out_unlock_bo;
> > +		if (!backup) {
> > +			backup =3D xe_bo_init_locked(xe, NULL, NULL,
> > bo->ttm.base.resv, NULL,
> > +						=C2=A0=C2=A0 xe_bo_size(bo),
> > +						=C2=A0=C2=A0
> > DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> > +						=C2=A0=C2=A0
> > XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > +						=C2=A0=C2=A0
> > XE_BO_FLAG_PINNED, &exec);
> > +			if (IS_ERR(backup)) {
> > +				drm_exec_retry_on_contention(&exec
> > );
> > +				ret =3D PTR_ERR(backup);
> > +				xe_validation_retry_on_oom(&ctx,
> > &ret);
> > +				break;
> > +			}
> > +			backup->parent_obj =3D xe_bo_get(bo); /*
> > Released by bo_destroy */
> > +			backup_created =3D true;
> > =C2=A0=C2=A0		}
> > -		backup->parent_obj =3D xe_bo_get(bo); /* Released by
> > bo_destroy */
> > -		backup_created =3D true;
> > -	}
> > =C2=A0=20
> > -	if (xe_bo_is_user(bo) || (bo->flags &
> > XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> > -		struct xe_migrate *migrate;
> > -		struct dma_fence *fence;
> > -
> > -		if (bo->tile)
> > -			migrate =3D bo->tile->migrate;
> > -		else
> > -			migrate =3D mem_type_to_migrate(xe, bo-
> > >ttm.resource->mem_type);
> > +		if (xe_bo_is_user(bo) || (bo->flags &
> > XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> > +			struct xe_migrate *migrate;
> > +			struct dma_fence *fence;
> > =C2=A0=20
> > -		ret =3D dma_resv_reserve_fences(bo->ttm.base.resv,
> > 1);
> > -		if (ret)
> > -			goto out_backup;
> > +			if (bo->tile)
> > +				migrate =3D bo->tile->migrate;
> > +			else
> > +				migrate =3D mem_type_to_migrate(xe,
> > bo->ttm.resource->mem_type);
> > =C2=A0=20
> > -		ret =3D dma_resv_reserve_fences(backup-
> > >ttm.base.resv, 1);
> > -		if (ret)
> > -			goto out_backup;
> > +			ret =3D dma_resv_reserve_fences(bo-
> > >ttm.base.resv, 1);
> > +			if (ret)
> > +				goto out_backup;
> > =C2=A0=20
> > -		fence =3D xe_migrate_copy(migrate, bo, backup, bo-
> > >ttm.resource,
> > -					backup->ttm.resource,
> > false);
> > -		if (IS_ERR(fence)) {
> > -			ret =3D PTR_ERR(fence);
> > -			goto out_backup;
> > -		}
> > +			ret =3D dma_resv_reserve_fences(backup-
> > >ttm.base.resv, 1);
> > +			if (ret)
> > +				goto out_backup;
> > =C2=A0=20
> > -		dma_resv_add_fence(bo->ttm.base.resv, fence,
> > -				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> > -		dma_resv_add_fence(backup->ttm.base.resv, fence,
> > -				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> > -		dma_fence_put(fence);
> > -	} else {
> > -		ret =3D xe_bo_vmap(backup);
> > -		if (ret)
> > -			goto out_backup;
> > +			fence =3D xe_migrate_copy(migrate, bo,
> > backup, bo->ttm.resource,
> > +						backup-
> > >ttm.resource, false);
> > +			if (IS_ERR(fence)) {
> > +				ret =3D PTR_ERR(fence);
> > +				goto out_backup;
> > +			}
> > =C2=A0=20
> > -		if (iosys_map_is_null(&bo->vmap)) {
> > -			ret =3D xe_bo_vmap(bo);
> > +			dma_resv_add_fence(bo->ttm.base.resv,
> > fence,
> > +					=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> > +			dma_resv_add_fence(backup->ttm.base.resv,
> > fence,
> > +					=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> > +			dma_fence_put(fence);
> > +		} else {
> > +			ret =3D xe_bo_vmap(backup);
> > =C2=A0=C2=A0			if (ret)
> > =C2=A0=C2=A0				goto out_backup;
> > -			unmap =3D true;
> > -		}
> > =C2=A0=20
> > -		xe_map_memcpy_from(xe, backup->vmap.vaddr, &bo-
> > >vmap, 0,
> > -				=C2=A0=C2=A0 xe_bo_size(bo));
> > -	}
> > +			if (iosys_map_is_null(&bo->vmap)) {
> > +				ret =3D xe_bo_vmap(bo);
> > +				if (ret)
> > +					goto out_vunmap;
> > +				unmap =3D true;
> > +			}
> > =C2=A0=20
> > -	if (!bo->backup_obj)
> > -		bo->backup_obj =3D backup;
> > +			xe_map_memcpy_from(xe, backup->vmap.vaddr,
> > &bo->vmap, 0,
> > +					=C2=A0=C2=A0 xe_bo_size(bo));
> > +		}
> > =C2=A0=20
> > +		if (!bo->backup_obj)
> > +			bo->backup_obj =3D backup;
> > +out_vunmap:
> > +		xe_bo_vunmap(backup);
> > =C2=A0 out_backup:
> > -	xe_bo_vunmap(backup);
> > -	if (ret && backup_created)
> > -		xe_bo_put(backup);
> > -out_unlock_bo:
> > -	if (unmap)
> > -		xe_bo_vunmap(bo);
> > -	xe_bo_unlock(bo);
> > +		if (ret && backup_created)
> > +			xe_bo_put(backup);
> > +		if (unmap)
> > +			xe_bo_vunmap(bo);
> > +	}
> > +
> > =C2=A0=C2=A0	return ret;
> > =C2=A0 }
> > =C2=A0=20
>=20

