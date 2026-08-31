Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70037C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 07:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D3510E661;
	Mon, 31 Aug 2026 07:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQc3aVYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6CD10E661
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 07:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788161132; x=1819697132;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OXfSYkK6IGZnRvtPe1eKc858nEVUaZhJ9RiEvuoGRsY=;
 b=VQc3aVYDF4gCJpVOxUibIhblPixhq/C4ao7/K+EWMCCMa3FQmTpitBM/
 iZbXSE6ygcNa+qul8Ct3FHY/C6GPkxVYK0coQiCIzVhMtNM/Bp0E5fcym
 eozzdi0/OFLzSdZdcaZo+XpDBRayzCnd474JeQrv/JY3tygymc4FYIBAL
 ZO898GpS3qYwyK7VAUJgvHjy6ueiW1nj2nmkxN6BtRUreA3QVTz77Dhmp
 kgH9briMdBvqRup3knc7nQhc/SYWLFzzzNrXXTky/+dVKBda+ajMP9zX2
 WRP/lwmxJ+bVRnwwBImPEGrV9Z2uvAn8cfxZ9PUgT2/nrLf+oEMh2K+Oh Q==;
X-CSE-ConnectionGUID: YejrgeiwT5OVrkAUQwZvGw==
X-CSE-MsgGUID: stbSZ9ATRk2tSCYIhrG4Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99160117"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="99160117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 00:25:32 -0700
X-CSE-ConnectionGUID: pfcdUlN5Qb6AL0xBnhKgjg==
X-CSE-MsgGUID: T0AtdU6+Qdyb3+7ndS4Etg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272236709"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.41])
 ([10.245.244.41])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 00:25:31 -0700
Message-ID: <12ef3036e8ae668ec0ff939b5c06c6f2a50dc7cf.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/bo: Take a runtime PM ref when shrinking a
 non-system bo
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Date: Mon, 31 Aug 2026 09:25:29 +0200
In-Reply-To: <20260828182819.86841-1-shuicheng.lin@intel.com>
References: <20260828182819.86841-1-shuicheng.lin@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Fri, 2026-08-28 at 18:28 +0000, Shuicheng Lin wrote:
> xe_bo_shrink() only took a runtime PM reference for the System CCS
> backup case, and only after the purgeable branch had already
> returned.
> That branch calls xe_bo_move_notify(), which reaches
> xe_vm_invalidate_vma(): it zaps the page table entries and submits a
> TLB
> invalidation over GuC CT.=C2=A0 The non-purgeable branch reaches the same
> code
> through ttm_bo_shrink() -> xe_bo_move().
>=20
> With the device runtime suspended the zap trips the assert in
> xe_map_memset(), and the CT is disabled so the invalidation returns
> -ENODEV:
>=20
> =C2=A0 Assertion `!xe_pm_runtime_suspended(xe)` failed!
> =C2=A0=C2=A0 xe_pt_zap_ptes_entry+0xb8/0x120 [xe]
> =C2=A0=C2=A0 xe_vm_invalidate_vma_submit+0xb1/0x770 [xe]
>=20
> =C2=A0 WARNING: drivers/gpu/drm/xe/xe_bo.c:770 at
> xe_bo_move_notify+0x1fc/0x450 [xe]
> =C2=A0=C2=A0 xe_bo_shrink+0x20f/0x2b0 [xe]
> =C2=A0=C2=A0 __xe_shrinker_walk+0x174/0x410 [xe]
> =C2=A0=C2=A0 xe_shrinker_scan+0x10c/0x1e0 [xe]
> =C2=A0=C2=A0 do_shrink_slab+0x176/0x7e0
> =C2=A0=C2=A0 drop_caches_sysctl_handler+0x9c/0xf0
>=20
> Compute needs_rpm ahead of both branches so the reference is held
> across
> xe_bo_move_notify() in either path.=C2=A0 A bo already in XE_PL_SYSTEM
> needs
> neither the invalidation nor the CCS copy, so it stays reclaimable
> while
> the device is suspended.
>=20
> A bo is skipped when the reference cannot be acquired, since resuming
> is
> not allowed from every reclaim context.=C2=A0 Queue the shrinker PM worke=
r
> from there: xe_shrinker_runtime_pm_get() is gated on the needs of its
> own
> backup pass and returns early on DGFX, so otherwise a scan that skips
> every candidate returns SHRINK_STOP with nothing arranging a wake.
>=20
> Only a non-fault-mode vm can reach this.=C2=A0 A fault-mode vm requires L=
R
> mode, which holds a runtime PM reference for the vm's lifetime, so
> the
> device cannot be suspended while one exists.
>=20
> Reproduced with igt@xe_madvise@dontneed-after-exec while the GPU is
> runtime suspended.
>=20
> v2: simplify needs_rpm check. (Matt)
> =C2=A0=C2=A0=C2=A0 retarget Fixes tag since issue occurs with non-fault-m=
ode path
> added
> =C2=A0=C2=A0=C2=A0 by 4e7ebff69aed.
>=20
> Fixes: 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines
> manually")
> Assisted-by: Claude:claude-opus-5
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 28=
 +++++++++++++++++++---------
> =C2=A0drivers/gpu/drm/xe/xe_shrinker.c | 18 +++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_shrinker.h |=C2=A0 2 ++
> =C2=A03 files changed, 38 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 2eb5d6aac523..95c168f6eb48 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1361,6 +1361,20 @@ long xe_bo_shrink(struct ttm_operation_ctx
> *ctx, struct ttm_buffer_object *bo,
> =C2=A0	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> =C2=A0		return xe_bo_shrink_purge(ctx, bo, scanned);
> =C2=A0
> +	/* Both the invalidation and the System CCS copy need the
> device. */
> +	needs_rpm =3D bo->resource->mem_type !=3D XE_PL_SYSTEM;
> +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe)) {
> +		/*
> +		 * Resuming is not allowed from all reclaim
> contexts, so leave
> +		 * this bo alone and ask for the device to be woken
> up outside
> +		 * of reclaim. xe_shrinker_runtime_pm_get() is gated
> on the
> +		 * needs of its own backup pass rather than on ours,
> and on
> +		 * DGFX it returns before queueing anything, so ask
> here.
> +		 */
> +		xe_shrinker_queue_pm(xe->mem.shrinker);
> +		goto out_unref;
> +	}
> +

Rather than scheduling a waking work within the xe_bo code, I'd like to
keep all the waking logic within xe_shrinker.c. Could we look at
modifying / simplifying xe_shrinker_runtime_pm_get() instead?=20

Also note that there is a possibility since we have a loop over memory
types in __xe_shrinker_walk() to defer wakeup until we actually hit a
non-system memory type.

Also please avoid in-function comments unless they are really
necessesary. Claude has a tendency to sprinkle these all over the code
so I typically ask it as a follow up pass to look at all added comments
focusing on "What rather than How" and remove all in-function comment
unless they are crucial for code clarity.

Thanks,
Thomas



> =C2=A0	if (xe_tt->purgeable) {
> =C2=A0		if (bo->resource->mem_type !=3D XE_PL_SYSTEM)
> =C2=A0			lret =3D xe_bo_move_notify(xe_bo, ctx);
> @@ -1369,28 +1383,24 @@ long xe_bo_shrink(struct ttm_operation_ctx
> *ctx, struct ttm_buffer_object *bo,
> =C2=A0		if (lret > 0 && xe_bo_madv_is_dontneed(xe_bo))
> =C2=A0			xe_bo_set_purgeable_state(xe_bo,
> =C2=A0						=C2=A0
> XE_MADV_PURGEABLE_PURGED);
> -		goto out_unref;
> +		goto out_put_rpm;
> =C2=A0	}
> =C2=A0
> -	/* System CCS needs gpu copy when moving PL_TT -> PL_SYSTEM
> */
> -	needs_rpm =3D (!IS_DGFX(xe) && bo->resource->mem_type !=3D
> XE_PL_SYSTEM &&
> -		=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_needs_ccs_pages(xe_bo));
> -	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> -		goto out_unref;
> -
> =C2=A0	*scanned +=3D tt->num_pages;
> =C2=A0	lret =3D ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 {.purge =3D false,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .writeback =3D flags.writeback,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .allow_move =3D true});
> -	if (needs_rpm)
> -		xe_pm_runtime_put(xe);
> =C2=A0
> =C2=A0	if (lret > 0) {
> =C2=A0		xe_ttm_tt_account_subtract(xe, tt);
> =C2=A0		update_global_total_pages(bo->bdev, -(long)tt-
> >num_pages);
> =C2=A0	}
> =C2=A0
> +out_put_rpm:
> +	if (needs_rpm)
> +		xe_pm_runtime_put(xe);
> +
> =C2=A0out_unref:
> =C2=A0	xe_bo_put(xe_bo);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> b/drivers/gpu/drm/xe/xe_shrinker.c
> index 83374cd57660..fb6ec77972a5 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -54,6 +54,22 @@ xe_shrinker_mod_pages(struct xe_shrinker
> *shrinker, long shrinkable, long purgea
> =C2=A0	write_unlock(&shrinker->lock);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_shrinker_queue_pm() - Ask for the device to be woken up for
> shrinking
> + * @shrinker: Pointer to the struct xe_shrinker.
> + *
> + * Queue a worker that takes and drops a runtime PM reference.
> Shrinking can
> + * be called from reclaim context, where resuming the device is not
> always
> + * allowed, so a caller that needs the device resumed but could not
> acquire a
> + * reference uses this to have it woken up outside of reclaim. The
> current
> + * scan makes no progress on the affected buffer objects, but a
> subsequent one
> + * can.
> + */
> +void xe_shrinker_queue_pm(struct xe_shrinker *shrinker)
> +{
> +	queue_work(shrinker->xe->unordered_wq, &shrinker-
> >pm_worker);
> +}
> +
> =C2=A0static s64 __xe_shrinker_walk(struct xe_device *xe,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct xe_bo_shrink_flags f=
lags,
> @@ -185,7 +201,7 @@ static bool xe_shrinker_runtime_pm_get(struct
> xe_shrinker *shrinker, bool force,
> =C2=A0			xe_pm_runtime_get(xe);
> =C2=A0			return true;
> =C2=A0		}
> -		queue_work(xe->unordered_wq, &shrinker->pm_worker);
> +		xe_shrinker_queue_pm(shrinker);
> =C2=A0		return false;
> =C2=A0	}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.h
> b/drivers/gpu/drm/xe/xe_shrinker.h
> index 5132ae5192e1..86d2a322cadd 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.h
> +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> @@ -11,6 +11,8 @@ struct xe_device;
> =C2=A0
> =C2=A0void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long
> shrinkable, long purgeable);
> =C2=A0
> +void xe_shrinker_queue_pm(struct xe_shrinker *shrinker);
> +
> =C2=A0int xe_shrinker_create(struct xe_device *xe);
> =C2=A0
> =C2=A0#endif
