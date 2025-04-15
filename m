Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94E0C369B4
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 09:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E4D10E6C2;
	Tue, 15 Apr 2025 09:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZXHJnZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BF010E6C2
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744711048; x=1776247048;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=hHrd7fTT1rEOfMzK0v6NRQdradnGGPWf2svPQtWUgVY=;
 b=AZXHJnZ8kZF6G/3XshU6vNftrHluKPuFRijN6t1qNPNBmWrTG0MHMCjo
 /eC5cSbEZshsCxdgjsxBPc1VtChO6MchZFGDWnUI4/9ytp/tUmSSUyFrf
 nNBbxd/NAhqOquv48LjGk83rvvw7Oa2HbeHQlHbCIQcQez9OhdH8nhd6H
 hu5hYx6Lmo4CislP2bBXeKmbl1GbKvd3aDtcJhcw5G0WuRfR/pggf86AC
 RPdmbLxBSoepiChspnKSdBpyfhCuWmF7xxpMpKv3HEaHWq8jUcNKg7UEX
 UD7ManMHoxuNUuWjO5s4GoDxncEjDPlqeV/p55cWKhEa1yTkk3Jl6F8f6 A==;
X-CSE-ConnectionGUID: wZz1Rr7fQ+KUPaor4qVd4w==
X-CSE-MsgGUID: 1m6VdE5lRbW+xmf17h+X+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="68702805"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="68702805"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:57:28 -0700
X-CSE-ConnectionGUID: tasn8P99RPKo1cfsxPXeGA==
X-CSE-MsgGUID: Sh2RTPvxS4W3Y2SQvj7N9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="153275316"
Received: from monicael-mobl3 (HELO [10.245.246.24]) ([10.245.246.24])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:57:26 -0700
Message-ID: <d376f20fa198489ce11e740ff52f8b2bedf5eff3.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/xe: handle pinned memory in PM notifier
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 11:57:23 +0200
In-Reply-To: <20250410162016.158474-8-matthew.auld@intel.com>
References: <20250410162016.158474-5-matthew.auld@intel.com>
 <20250410162016.158474-8-matthew.auld@intel.com>
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

On Thu, 2025-04-10 at 17:20 +0100, Matthew Auld wrote:
> Userspace is still alive and kicking at this point so actually moving
> pinned stuff here is tricky. However, we can instead pre-allocate the
> backup storage upfront from the notifier, such that we scoop up as
> much
> as we can, and then leave the final .suspend() to do the actual copy
> (or
> allocate anything that we missed). That way the bulk of our
> allocations
> will hopefully be done outside the more restrictive .suspend().
>=20
> We do need to be extra careful though, since the pinned handling can
> now
> race with PM notifier, like something becoming unpinned after we
> prepare
> it from the notifier.
>=20
> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11=
5 +++++++++++++++++++++++++++--
> --
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_bo_evict.c |=C2=A0 49 ++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_bo_evict.h |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_pm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 17 ++++-
> =C2=A05 files changed, 167 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3eab6352d9dc..2509f3d8954d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1084,6 +1084,77 @@ long xe_bo_shrink(struct ttm_operation_ctx
> *ctx, struct ttm_buffer_object *bo,
> =C2=A0	return lret;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_bo_notifier_prepare_pinned() - Prepare a pinned VRAM object to
> be backed
> + * up in system memory.
> + * @bo: The buffer object to prepare.
> + *
> + * On successful completion, the object backup pages are allocated.
> Expectation
> + * is that this is called from the PM notifier, prior to
> suspend/hibernation.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
> +{
> +	struct xe_device *xe =3D ttm_to_xe_device(bo->ttm.bdev);
> +	struct xe_bo *backup;
> +	int ret =3D 0;
> +
> +	xe_bo_lock(bo, false);
> +
> +	xe_assert(xe, !bo->backup_obj);
> +
> +	/*
> +	 * Since this is called from the PM notifier we might have
> raced with
> +	 * someone unpinning this after we dropped the pinned list
> lock and
> +	 * grabbing the above bo lock.
> +	 */
> +	if (!xe_bo_is_pinned(bo))
> +		goto out_unlock_bo;
> +
> +	if (!xe_bo_is_vram(bo))
> +		goto out_unlock_bo;
> +
> +	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> +		goto out_unlock_bo;
> +
> +	backup =3D ___xe_bo_create_locked(xe, NULL, NULL, bo-
> >ttm.base.resv, NULL, bo->size,
> +					DRM_XE_GEM_CPU_CACHING_WB,
> ttm_bo_type_kernel,
> +					XE_BO_FLAG_SYSTEM |
> XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +					XE_BO_FLAG_PINNED);
> +	if (IS_ERR(backup)) {
> +		ret =3D PTR_ERR(backup);
> +		goto out_unlock_bo;
> +	}
> +
> +	ttm_bo_pin(&backup->ttm);
> +	bo->backup_obj =3D backup;
> +
> +out_unlock_bo:
> +	xe_bo_unlock(bo);
> +	return ret;
> +}
> +
> +/**
> + * xe_bo_notifier_unprepare_pinned() - Undo the previous prepare
> operation.
> + * @bo: The buffer object to undo the prepare for.
> + *
> + * Always returns 0. The backup object is removed, if still present.
> Expectation
> + * it that this called from the PM notifier when undoing the prepare
> step.

Nit: Return:

> + */
> +int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo)
> +{
> +	xe_bo_lock(bo, false);
> +	if (bo->backup_obj) {
> +		ttm_bo_unpin(&bo->backup_obj->ttm);
> +		xe_bo_put(bo->backup_obj);
> +		bo->backup_obj =3D NULL;
> +	}
> +	xe_bo_unlock(bo);
> +
> +	return 0;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_bo_evict_pinned() - Evict a pinned VRAM object to system
> memory
> =C2=A0 * @bo: The buffer object to move.
> @@ -1098,7 +1169,8 @@ long xe_bo_shrink(struct ttm_operation_ctx
> *ctx, struct ttm_buffer_object *bo,
> =C2=A0int xe_bo_evict_pinned(struct xe_bo *bo)
> =C2=A0{
> =C2=A0	struct xe_device *xe =3D ttm_to_xe_device(bo->ttm.bdev);
> -	struct xe_bo *backup;
> +	struct xe_bo *backup =3D bo->backup_obj;
> +	bool backup_created =3D false;
> =C2=A0	bool unmap =3D false;
> =C2=A0	int ret =3D 0;
> =C2=A0
> @@ -1120,13 +1192,16 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> =C2=A0	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> =C2=A0		goto out_unlock_bo

Should we drop the pinning of the backup object at this point, thinking
that on memory pressure we might want to shrink it. Or perhaps reclaim
is already turned off at this point?

> ;
> =C2=A0
> -	backup =3D ___xe_bo_create_locked(xe, NULL, NULL, bo-
> >ttm.base.resv, NULL, bo->size,
> -					DRM_XE_GEM_CPU_CACHING_WB,
> ttm_bo_type_kernel,
> -					XE_BO_FLAG_SYSTEM |
> XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -					XE_BO_FLAG_PINNED);
> -	if (IS_ERR(backup)) {
> -		ret =3D PTR_ERR(backup);
> -		goto out_unlock_bo;
> +	if (!backup) {
> +		backup =3D ___xe_bo_create_locked(xe, NULL, NULL, bo-
> >ttm.base.resv, NULL, bo->size,
> +						DRM_XE_GEM_CPU_CACHI
> NG_WB, ttm_bo_type_kernel,
> +						XE_BO_FLAG_SYSTEM |
> XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +						XE_BO_FLAG_PINNED);
> +		if (IS_ERR(backup)) {
> +			ret =3D PTR_ERR(backup);
> +			goto out_unlock_bo;
> +		}
> +		backup_created =3D true;
> =C2=A0	}
> =C2=A0
> =C2=A0	if (xe_bo_is_user(bo) || (bo->flags &
> XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> @@ -1174,11 +1249,12 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> =C2=A0				=C2=A0=C2=A0 bo->size);
> =C2=A0	}
> =C2=A0
> -	bo->backup_obj =3D backup;
> +	if (!bo->backup_obj)
> +		bo->backup_obj =3D backup;

> =C2=A0
> =C2=A0out_backup:
> =C2=A0	xe_bo_vunmap(backup);
> -	if (ret)
> +	if (ret && backup_created)
> =C2=A0		xe_bo_put(backup);
> =C2=A0out_unlock_bo:
> =C2=A0	if (unmap)
> @@ -1214,9 +1290,11 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> =C2=A0
> =C2=A0	xe_bo_lock(bo, false);
> =C2=A0
> -	ret =3D ttm_bo_validate(&backup->ttm, &backup->placement,
> &ctx);
> -	if (ret)
> -		goto out_backup;
> +	if (!xe_bo_is_pinned(backup)) {
> +		ret =3D ttm_bo_validate(&backup->ttm, &backup-
> >placement, &ctx);
> +		if (ret)
> +			goto out_unlock_bo;
> +	}
> =C2=A0
> =C2=A0	if (xe_bo_is_user(bo) || (bo->flags &
> XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> =C2=A0		struct xe_migrate *migrate;
> @@ -1256,7 +1334,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> =C2=A0		if (iosys_map_is_null(&bo->vmap)) {
> =C2=A0			ret =3D xe_bo_vmap(bo);
> =C2=A0			if (ret)
> -				goto out_unlock_bo;
> +				goto out_backup;
> =C2=A0			unmap =3D true;
> =C2=A0		}
> =C2=A0
> @@ -1264,7 +1342,8 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> =C2=A0				 bo->size);
> =C2=A0	}
> =C2=A0
> -	bo->backup_obj =3D NULL;
> +	if (!xe_bo_is_pinned(backup))
> +		bo->backup_obj =3D NULL;

This is deferring the unpinning + freeing of the backup object to the
notifier, right? If so, can we do it here instead to free up memory as
early as possible?

Otherwise LGTM.
Thomas



> =C2=A0
> =C2=A0out_backup:
> =C2=A0	xe_bo_vunmap(backup);
> @@ -2300,6 +2379,12 @@ void xe_bo_unpin(struct xe_bo *bo)
> =C2=A0		xe_assert(xe, !list_empty(&bo->pinned_link));
> =C2=A0		list_del_init(&bo->pinned_link);
> =C2=A0		spin_unlock(&xe->pinned.lock);
> +
> +		if (bo->backup_obj) {
> +			ttm_bo_unpin(&bo->backup_obj->ttm);
> +			xe_bo_put(bo->backup_obj);
> +			bo->backup_obj =3D NULL;
> +		}
> =C2=A0	}
> =C2=A0	ttm_bo_unpin(&bo->ttm);
> =C2=A0	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 0a19b50045b2..8bc449c78cc7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -277,6 +277,8 @@ int xe_bo_migrate(struct xe_bo *bo, u32
> mem_type);
> =C2=A0int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
> =C2=A0
> =C2=A0int xe_bo_evict_pinned(struct xe_bo *bo);
> +int xe_bo_notifier_prepare_pinned(struct xe_bo *bo);
> +int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo);
> =C2=A0int xe_bo_restore_pinned(struct xe_bo *bo);
> =C2=A0
> =C2=A0int xe_bo_dma_unmap_pinned(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
> b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 748360fd2439..fa318fdb4d9d 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -34,7 +34,13 @@ static int xe_bo_apply_to_pinned(struct xe_device
> *xe,
> =C2=A0		ret =3D pinned_fn(bo);
> =C2=A0		if (ret && pinned_list !=3D new_list) {
> =C2=A0			spin_lock(&xe->pinned.lock);
> -			list_move(&bo->pinned_link, pinned_list);
> +			/*
> +			 * We might no longer be pinned, since PM
> notifier can
> +			 * call this. If the pinned link is now
> empty, keep it
> +			 * that way.
> +			 */
> +			if (!list_empty(&bo->pinned_link))
> +				list_move(&bo->pinned_link,
> pinned_list);
> =C2=A0			spin_unlock(&xe->pinned.lock);
> =C2=A0		}
> =C2=A0		xe_bo_put(bo);
> @@ -46,6 +52,47 @@ static int xe_bo_apply_to_pinned(struct xe_device
> *xe,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_bo_notifier_prepare_all_pinned() - Pre-allocate the backing
> pages for all
> + * pinned VRAM objects which need to be saved.
> + * @xe: xe device
> + *
> + * Should be called from PM notifier when preparing for s3/s4.
> + */
> +int xe_bo_notifier_prepare_all_pinned(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	ret =3D xe_bo_apply_to_pinned(xe, &xe-
> >pinned.early.kernel_bo_present,
> +				=C2=A0=C2=A0=C2=A0 &xe-
> >pinned.early.kernel_bo_present,
> +				=C2=A0=C2=A0=C2=A0 xe_bo_notifier_prepare_pinned);
> +	if (!ret)
> +		ret =3D xe_bo_apply_to_pinned(xe, &xe-
> >pinned.late.kernel_bo_present,
> +					=C2=A0=C2=A0=C2=A0 &xe-
> >pinned.late.kernel_bo_present,
> +					=C2=A0=C2=A0=C2=A0
> xe_bo_notifier_prepare_pinned);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_bo_notifier_unprepare_all_pinned() - Remove the backing pages
> for all
> + * pinned VRAM objects which have been restored.
> + * @xe: xe device
> + *
> + * Should be called from PM notifier after exiting s3/s4 (either on
> success or
> + * failure).
> + */
> +void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe)
> +{
> +	(void)xe_bo_apply_to_pinned(xe, &xe-
> >pinned.early.kernel_bo_present,
> +				=C2=A0=C2=A0=C2=A0 &xe-
> >pinned.early.kernel_bo_present,
> +				=C2=A0=C2=A0=C2=A0
> xe_bo_notifier_unprepare_pinned);
> +
> +	(void)xe_bo_apply_to_pinned(xe, &xe-
> >pinned.late.kernel_bo_present,
> +				=C2=A0=C2=A0=C2=A0 &xe-
> >pinned.late.kernel_bo_present,
> +				=C2=A0=C2=A0=C2=A0
> xe_bo_notifier_unprepare_pinned);
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_bo_evict_all_user - evict all non-pinned user BOs from VRAM
> =C2=A0 * @xe: xe device
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h
> b/drivers/gpu/drm/xe/xe_bo_evict.h
> index e7f048634b32..e8385cb7f5e9 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.h
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
> @@ -10,6 +10,8 @@ struct xe_device;
> =C2=A0
> =C2=A0int xe_bo_evict_all(struct xe_device *xe);
> =C2=A0int xe_bo_evict_all_user(struct xe_device *xe);
> +int xe_bo_notifier_prepare_all_pinned(struct xe_device *xe);
> +void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe);
> =C2=A0int xe_bo_restore_early(struct xe_device *xe);
> =C2=A0int xe_bo_restore_late(struct xe_device *xe);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index e7ea4003dbf8..cf9f1fdd83e4 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -293,9 +293,22 @@ static int xe_pm_notifier_callback(struct
> notifier_block *nb,
> =C2=A0	case PM_SUSPEND_PREPARE:
> =C2=A0		xe_pm_runtime_get(xe);
> =C2=A0		err =3D xe_bo_evict_all_user(xe);
> -		xe_pm_runtime_put(xe);
> -		if (err)
> +		if (err) {
> =C2=A0			drm_dbg(&xe->drm, "Notifier evict user
> failed (%d)\n", err);
> +			xe_pm_runtime_put(xe);
> +			break;
> +		}
> +
> +		err =3D xe_bo_notifier_prepare_all_pinned(xe);
> +		if (err) {
> +			drm_dbg(&xe->drm, "Notifier prepare pin
> failed (%d)\n", err);
> +			xe_pm_runtime_put(xe);
> +		}
> +		break;
> +	case PM_POST_HIBERNATION:
> +	case PM_POST_SUSPEND:
> +		xe_bo_notifier_unprepare_all_pinned(xe);
> +		xe_pm_runtime_put(xe);
> =C2=A0		break;
> =C2=A0	}
> =C2=A0

