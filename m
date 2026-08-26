Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195EAC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 08:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A959310EC56;
	Wed, 26 Aug 2026 08:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ed07KGle";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6364210EC4B
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787731259; x=1819267259;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=4IOfAvfWGgUdWTLD2gn4RfpOVYV/8Eia1Se+q7Lw5eM=;
 b=Ed07KGlecDhCbzUU1a6DqanVBkGPCDwvy3/xRJNI9Wc8MYc/J9TQ8EUA
 bVeMAKhXufdigwHHyKUeTgeYti93H5vpymC3uX2n+hhOfaymkaMCwiG87
 /BZPIRYJ8xrIykxMKxzjXgA1WlC2Hny2XARwZMwm70wo9672UWzlLDX9E
 fPuHUBFf8nKoMEv/3daRzi4XnzEWhSS6c/J7Cwa06EDuaLOC9KQNUQGTf
 Qt/zP2ea6r/yzOUrQW+UGKkbyLteMOdZWNwnqtEKML35y2jhU+HNLtSNn
 b/FwiPYFipbC08AbvI6bkiON7AEOigW1DgaDQiqe6VVTvBM1RNPXYSIrt g==;
X-CSE-ConnectionGUID: s/a9V3yTQmO4HazYv4zpiw==
X-CSE-MsgGUID: jroTUG4CRTOe736RFVjMJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="99366955"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="99366955"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 01:00:37 -0700
X-CSE-ConnectionGUID: ISR86LBFRKSeQRVrik1BdA==
X-CSE-MsgGUID: YPwrMadlQU2dP0RutRrYSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="264915403"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.166])
 ([10.245.245.166])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 01:00:36 -0700
Message-ID: <ebc4797204a5aec94f122094e2fbe2fb1d0536c1.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/bo: Take a runtime PM ref when shrinking a bo
 needing invalidation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 26 Aug 2026 10:00:33 +0200
In-Reply-To: <20260825224819.2182540-1-shuicheng.lin@intel.com>
References: <20260825224819.2182540-1-shuicheng.lin@intel.com>
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

On Tue, 2026-08-25 at 22:48 +0000, Shuicheng Lin wrote:
> xe_bo_shrink() only took a runtime PM reference for the System CCS
> backup case, and only after the purgeable branch had already
> returned.
> That branch calls xe_bo_move_notify(), which reaches
> xe_bo_trigger_rebind() -> xe_vm_invalidate_vma() and submits a TLB
> invalidation over GuC CT.=C2=A0 The non-purgeable branch reaches the same
> code through ttm_bo_shrink(.allow_move =3D true) -> xe_bo_move().
>=20
> When the device is runtime suspended the CT is disabled and the send
> returns -ENODEV, tripping the XE_WARN_ON() in xe_bo_trigger_rebind():
>=20
> =C2=A0 WARNING: drivers/gpu/drm/xe/xe_bo.c:770 at
> xe_bo_move_notify+0x1fc/0x450 [xe], CPU#2: xe_madvise/21389
> =C2=A0=C2=A0 xe_bo_shrink+0x20f/0x2b0 [xe]
> =C2=A0=C2=A0 __xe_shrinker_walk+0x174/0x410 [xe]
> =C2=A0=C2=A0 xe_shrinker_walk+0x56/0xf0 [xe]
> =C2=A0=C2=A0 xe_shrinker_scan+0x10c/0x1e0 [xe]
> =C2=A0=C2=A0 do_shrink_slab+0x176/0x7e0
> =C2=A0=C2=A0 shrink_slab+0x137/0x990
> =C2=A0=C2=A0 drop_slab+0x7f/0x130
> =C2=A0=C2=A0 drop_caches_sysctl_handler+0x9c/0xf0
>=20
> The invalidation is always issued for a fault-mode vm; since commit
> 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines
> manually")
> it is also issued for a non-fault-mode vm on hardware with an
> optimized
> L2 flush, which is how this surfaced.
>=20
> Add bo_needs_invalidate(), mirroring that condition, and use it in
> xe_bo_shrink() to compute needs_rpm ahead of both branches.=C2=A0 The
> reference is then held across xe_bo_move_notify() in either path, and
> is
> not taken for a bo whose mappings would not have been invalidated.
>=20
> Shrinking can run in reclaim contexts where the device may not be
> resumed, so a bo is skipped when the reference cannot be acquired.=C2=A0
> Have
> that skip queue the shrinker PM worker: xe_shrinker_runtime_pm_get()
> is
> gated on the needs of its own backup pass rather than on this one,
> and
> on DGFX it returns before queueing anything, so without this a scan
> where every candidate is skipped makes no progress, reports nothing
> scanned and returns SHRINK_STOP with nothing arranging a wake.
>=20
> Also gate the System CCS term on !xe_tt->purgeable, since
> xe_bo_shrink_purge() frees the pages without a GPU copy.
>=20
> Reproduced with igt@xe_madvise@dontneed-before-exec while the GPU is
> runtime suspended.
>=20
> Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
> Assisted-by: Claude:claude-opus-5
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Nice catch.

I wonder, however, can we skip the TLB flush if runtime PM is not
available at TLB flush time (runtime_pm_get_if_active()?) Assuming that
if runtime PM is not available, no contexts can be active and they will
flush TLB implicitly when becoming active?

IIRC It's not totally clear whether this would work for
"has_ctx_tlb_inval" hardware, and if so we might need to add something
similar to this for that hardware.

Thanks,
Thomas

> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 62=
 +++++++++++++++++++++++++++---
> --
> =C2=A0drivers/gpu/drm/xe/xe_shrinker.c | 18 +++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_shrinker.h |=C2=A0 2 ++
> =C2=A03 files changed, 72 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 2eb5d6aac523..274ff97d8542 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -734,6 +734,32 @@ static int xe_ttm_io_mem_reserve(struct
> ttm_device *bdev,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/*
> + * Whether xe_bo_move_notify() will invalidate the GPU mappings of
> @bo, and
> + * therefore needs the device resumed to reach the GuC.
> + *
> + * This mirrors the condition under which xe_bo_trigger_rebind()
> below calls
> + * xe_vm_invalidate_vma(): always for a fault-mode vm, and for any
> bound vm on
> + * hardware where the L2 flush is optimized. Keep the two in sync.
> + *
> + * Context: Caller must hold the BO's dma-resv lock.
> + */
> +static bool bo_needs_invalidate(struct xe_bo *bo)
> +{
> +	struct drm_gpuvm_bo *vm_bo;
> +
> +	if (xe_device_is_l2_flush_optimized(xe_bo_device(bo)))
> +		return xe_bo_is_vm_bound(bo);
> +
> +	xe_bo_assert_held(bo);
> +
> +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base)
> +		if (xe_vm_in_fault_mode(gpuvm_to_vm(vm_bo->vm)))
> +			return true;
> +
> +	return false;
> +}
> +
> =C2=A0static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo
> *bo,
> =C2=A0				const struct ttm_operation_ctx *ctx)
> =C2=A0{
> @@ -1361,6 +1387,28 @@ long xe_bo_shrink(struct ttm_operation_ctx
> *ctx, struct ttm_buffer_object *bo,
> =C2=A0	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> =C2=A0		return xe_bo_shrink_purge(ctx, bo, scanned);
> =C2=A0
> +	/*
> +	 * Moving this bo out of a non-system placement makes
> +	 * xe_bo_move_notify() invalidate its GPU mappings over GuC
> CT, and
> +	 * System CCS needs a gpu copy when moving PL_TT ->
> PL_SYSTEM. Both
> +	 * need the device resumed.
> +	 */
> +	needs_rpm =3D bo->resource->mem_type !=3D XE_PL_SYSTEM &&
> +		(bo_needs_invalidate(xe_bo) ||
> +		 (!xe_tt->purgeable && !IS_DGFX(xe) &&
> +		=C2=A0 xe_bo_needs_ccs_pages(xe_bo)));
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
> =C2=A0	if (xe_tt->purgeable) {
> =C2=A0		if (bo->resource->mem_type !=3D XE_PL_SYSTEM)
> =C2=A0			lret =3D xe_bo_move_notify(xe_bo, ctx);
> @@ -1369,28 +1417,24 @@ long xe_bo_shrink(struct ttm_operation_ctx
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
