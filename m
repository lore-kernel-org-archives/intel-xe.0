Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E33C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6064610E6CC;
	Mon,  7 Sep 2026 08:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTf/XMFq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8096710E6CC
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788769432; x=1820305432;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eOi11PKSm5047/Ad620jaj+gRDN8t8b7lwYyMJ859mw=;
 b=jTf/XMFq3loFDukHVy6ehqr/0IFPbQYs1PY+ucvwOFxUNFNxA2SSJWhq
 K7Uja+KrUWUhibWFK3ZZeTCfJjwoKBe5GiS8pko2Nsl6yPy54J6qlk88C
 zdmAhRKMS9+nLpsbYHANCMtRIMEb5FtqAHzbojivn5sG8LHS5fHFt/MXz
 gVIjA5IquKgrgSWvZ1ObaqnO6J2mcikPKydpQX5QZD70Vze8cDVkHNXvq
 Xpb9MQy4q+NcAuw3P7Mv6gaOw0Y6hq5uti1URCVOciFsTXsBD/gZ7b3yY
 hLZPppC21bXFrhYnicdrqAq7P6tT2kwDHo2jisF7Jw2oHwER2BYk7fpvy Q==;
X-CSE-ConnectionGUID: Nifqx/1tQ5OA9z6KP+JX6Q==
X-CSE-MsgGUID: G+HP+F2mTgq4NnXKzkJ4uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106685602"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="106685602"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:23:52 -0700
X-CSE-ConnectionGUID: EF2Ne75+T6Sj0wWgT8hjEw==
X-CSE-MsgGUID: J8/Xnrj7SvqMqQBk6T5sKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="272580861"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.245.240])
 ([10.245.245.240])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:23:51 -0700
Message-ID: <4fd1fca025af55962a5b58b1f5b7e970ac0c51f4.camel@linux.intel.com>
Subject: Re: [PATCH v6 2/2] drm/xe/shrinker: Take a runtime PM ref before
 shrinking non-system memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Date: Mon, 07 Sep 2026 10:23:49 +0200
In-Reply-To: <20260904215049.543535-3-shuicheng.lin@intel.com>
References: <20260904215049.543535-1-shuicheng.lin@intel.com>
 <20260904215049.543535-3-shuicheng.lin@intel.com>
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

On Fri, 2026-09-04 at 21:50 +0000, Shuicheng Lin wrote:
> __xe_shrinker_walk() walks the SYSTEM and TT LRUs without a runtime
> PM
> reference.=C2=A0 Shrinking a bo outside system memory invalidates its GPU
> mappings, which needs the device resumed, so while it is runtime
> suspended the page table zap trips an assert and the TLB invalidation
> returns -ENODEV:
>=20
> =C2=A0 WARNING: drivers/gpu/drm/xe/xe_bo.c:770 at
> xe_bo_move_notify+0x1fc/0x450 [xe]
> =C2=A0=C2=A0 xe_bo_shrink+0x20f/0x2b0 [xe]
> =C2=A0=C2=A0 __xe_shrinker_walk+0x174/0x410 [xe]
> =C2=A0=C2=A0 xe_shrinker_scan+0x10c/0x1e0 [xe]
> =C2=A0=C2=A0 do_shrink_slab+0x176/0x7e0
> =C2=A0=C2=A0 drop_caches_sysctl_handler+0x9c/0xf0
>=20
> Take a reference before walking a memory type other than XE_PL_SYSTEM
> and stop there if it cannot be acquired.=C2=A0 Reuse the shrinker's
> existing
> acquire path, which resumes the device directly where reclaim allows
> that and otherwise queues the PM worker for a later scan.=C2=A0 Stop the
> walk
> once the scan target is met, so a satisfied scan does not wake the
> device.=C2=A0 System memory is still reclaimed while the device is
> suspended.
>=20
> Gate this on xe_device_is_l2_flush_optimized(), the same condition
> under
> which xe_bo_trigger_rebind() issues the invalidation for a non-fault-
> mode
> vm, so reclaim is unaffected elsewhere.=C2=A0 The System CCS copy already
> has
> its own reference in xe_bo_shrink().
>=20
> Only a non-fault-mode vm can reach this, since a fault-mode vm
> requires
> LR mode and that holds a runtime PM reference for the vm's lifetime.
>=20
> Reproduced with igt@xe_madvise@dontneed-before-exec while the GPU is
> runtime suspended.
>=20
> v2: simplify needs_rpm check. (Matt)
> =C2=A0=C2=A0=C2=A0 retarget Fixes tag since the issue occurs with the non=
-fault-mode
> =C2=A0=C2=A0=C2=A0 path added by 4e7ebff69aed.
> v3: handle this in xe_shrinker.c instead of xe_bo.c (Thomas)
> v4: stop the walk once the scan target is met. (Sashiko)
> v5: rebase on the freed page accounting fix. (Sashiko)
> v6: reuse the shrinker acquire path so runtime pm can be resumed
> =C2=A0=C2=A0=C2=A0 directly instead of always queueing a worker. (Thomas)
>=20
> Fixes: 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines
> manually")
> Assisted-by: Claude:claude-opus-5
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_shrinker.c | 67 ++++++++++++++++++++++-------=
-
> --
> =C2=A01 file changed, 46 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> b/drivers/gpu/drm/xe/xe_shrinker.c
> index 89445cd20238..13f49ac873b4 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -54,13 +54,33 @@ xe_shrinker_mod_pages(struct xe_shrinker
> *shrinker, long shrinkable, long purgea
> =C2=A0	write_unlock(&shrinker->lock);
> =C2=A0}
> =C2=A0
> -static int __xe_shrinker_walk(struct xe_device *xe,
> +static bool __xe_shrinker_runtime_pm_get(struct xe_shrinker
> *shrinker)
> +{
> +	struct xe_device *xe =3D shrinker->xe;
> +
> +	if (xe_pm_runtime_get_if_active(xe))
> +		return true;
> +
> +	if (xe_rpm_reclaim_safe(xe) && !ttm_bo_shrink_avoid_wait())
> {
> +		xe_pm_runtime_get(xe);
> +		return true;
> +	}
> +
> +	queue_work(xe->unordered_wq, &shrinker->pm_worker);
> +
> +	return false;
> +}
> +
> +static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct xe_bo_shrink_flags f=
lags,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned l=
ong
> *scanned,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *freed)
> =C2=A0{
> +	struct xe_device *xe =3D shrinker->xe;
> =C2=A0	unsigned int mem_type;
> +	bool rpm =3D false;
> +	int ret =3D 0;
> =C2=A0	s64 lret;
> =C2=A0
> =C2=A0	for (mem_type =3D XE_PL_SYSTEM; mem_type <=3D XE_PL_TT;
> ++mem_type) {
> @@ -75,23 +95,36 @@ static int __xe_shrinker_walk(struct xe_device
> *xe,
> =C2=A0		if (!man || !man->use_tt)
> =C2=A0			continue;
> =C2=A0
> +		if (mem_type !=3D XE_PL_SYSTEM && !rpm &&
> +		=C2=A0=C2=A0=C2=A0 xe_device_is_l2_flush_optimized(xe)) {
> +			if (!__xe_shrinker_runtime_pm_get(shrinker))
> +				break;
> +			rpm =3D true;
> +		}
> +
> =C2=A0		ttm_bo_lru_for_each_reserved_guarded(&curs, man,
> &arg, ttm_bo) {
> =C2=A0			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
> =C2=A0				continue;
> =C2=A0
> =C2=A0			lret =3D xe_bo_shrink(ctx, ttm_bo, flags,
> scanned);
> -			if (lret < 0)
> -				return lret;
> +			if (lret < 0) {
> +				ret =3D lret;
> +				goto out;
> +			}
> =C2=A0
> =C2=A0			*freed +=3D lret;
> =C2=A0			if (*scanned >=3D to_scan)
> -				break;
> +				goto out;
> =C2=A0		}
> =C2=A0		/* Trylocks should never error, just fail. */
> =C2=A0		xe_assert(xe, !IS_ERR(ttm_bo));
> =C2=A0	}
> =C2=A0
> -	return 0;
> +out:
> +	if (rpm)
> +		xe_pm_runtime_put(xe);

xe_shrinker_runtime_pm_put()

With that
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> +
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -100,7 +133,7 @@ static int __xe_shrinker_walk(struct xe_device
> *xe,
> =C2=A0 * add writeback. This avoids stalls and explicit writebacks with
> light or
> =C2=A0 * moderate memory pressure.
> =C2=A0 */
> -static int xe_shrinker_walk(struct xe_device *xe,
> +static int xe_shrinker_walk(struct xe_shrinker *shrinker,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0 const struct xe_bo_shrink_flags flags,
> =C2=A0			=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned long
> *scanned,
> @@ -112,20 +145,21 @@ static int xe_shrinker_walk(struct xe_device
> *xe,
> =C2=A0
> =C2=A0	swap(no_wait_gpu, ctx->no_wait_gpu);
> =C2=A0	save_flags.writeback =3D false;
> -	ret =3D __xe_shrinker_walk(xe, ctx, save_flags, to_scan,
> scanned, freed);
> +	ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan,
> scanned,
> +				 freed);
> =C2=A0	swap(no_wait_gpu, ctx->no_wait_gpu);
> =C2=A0	if (ret || *scanned >=3D to_scan)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	if (!ctx->no_wait_gpu) {
> -		ret =3D __xe_shrinker_walk(xe, ctx, save_flags,
> to_scan, scanned,
> +		ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags,
> to_scan, scanned,
> =C2=A0					 freed);
> =C2=A0		if (ret || *scanned >=3D to_scan)
> =C2=A0			return ret;
> =C2=A0	}
> =C2=A0
> =C2=A0	if (flags.writeback)
> -		ret =3D __xe_shrinker_walk(xe, ctx, flags, to_scan,
> scanned,
> +		ret =3D __xe_shrinker_walk(shrinker, ctx, flags,
> to_scan, scanned,
> =C2=A0					 freed);
> =C2=A0
> =C2=A0	return ret;
> @@ -176,16 +210,7 @@ static bool xe_shrinker_runtime_pm_get(struct
> xe_shrinker *shrinker, bool force,
> =C2=A0			return false;
> =C2=A0	}
> =C2=A0
> -	if (!xe_pm_runtime_get_if_active(xe)) {
> -		if (xe_rpm_reclaim_safe(xe) &&
> !ttm_bo_shrink_avoid_wait()) {
> -			xe_pm_runtime_get(xe);
> -			return true;
> -		}
> -		queue_work(xe->unordered_wq, &shrinker->pm_worker);
> -		return false;
> -	}
> -
> -	return true;
> +	return __xe_shrinker_runtime_pm_get(shrinker);
> =C2=A0}
> =C2=A0
> =C2=A0static void xe_shrinker_runtime_pm_put(struct xe_shrinker *shrinker=
,
> bool runtime_pm)
> @@ -221,7 +246,7 @@ static unsigned long xe_shrinker_scan(struct
> shrinker *shrink, struct shrink_con
> =C2=A0	runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker, false,
> nr_to_scan, can_backup);
> =C2=A0
> =C2=A0	if (purgeable && nr_scanned < nr_to_scan)
> -		xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
> +		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> =C2=A0				 nr_to_scan, &nr_scanned, &freed);
> =C2=A0
> =C2=A0	sc->nr_scanned =3D nr_scanned;
> @@ -234,7 +259,7 @@ static unsigned long xe_shrinker_scan(struct
> shrinker *shrink, struct shrink_con
> =C2=A0
> =C2=A0	shrink_flags.purge =3D false;
> =C2=A0
> -	xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
> +	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> =C2=A0			 nr_to_scan, &nr_scanned, &freed);
> =C2=A0
> =C2=A0	sc->nr_scanned =3D nr_scanned;
