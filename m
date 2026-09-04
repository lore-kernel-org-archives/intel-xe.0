Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC9EC79F87
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 15:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F2B10F9F9;
	Fri,  4 Sep 2026 15:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cq5wWfBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D979D10F9F9
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 15:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788534200; x=1820070200;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=grz/OL2N+P4aXETFVOeKGGfisBdrWQRpxOxHJy1Qu+c=;
 b=cq5wWfBRq4YbDzM4KdpuxISPDFugIHqY3QO6QuA4Nh0D60Eaq8glrZ5T
 XszT1UHRxsRNBOK51QWndVq0PHstennvBO3iDXg1gj0IWJSFOvodExMPK
 6lNLDHmyZC0uJsULCgd8TU4vVEjTsgng88WKVIu3Dc9PwOXMSJrQzy5oA
 aLmDemg1FFe/eaF9cXlLQy3VzJVU6GzpyA2fSSHQPW86nNSS4Appw43Or
 hgHwk+BZOQGVY8NHgYmmd7kZphcadzyJgozNPWJJT89CMPZ0Ryd9xBDhk
 AkmGvv5K8yG+ID+Wbk+P8sq+iVvZcu0v9n06fIw11fcIe5rKT7ScbYn/E Q==;
X-CSE-ConnectionGUID: /aRQ6Cu1TGmgu14wxsChtw==
X-CSE-MsgGUID: tve7+WmvTU2u+/ETkcs/7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="87975602"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="87975602"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 08:03:19 -0700
X-CSE-ConnectionGUID: foZPwrEcQQKfR09VN3w8dw==
X-CSE-MsgGUID: e2NT7IluQiq/dbu3Z9hAdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="269534521"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.233])
 ([10.245.244.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 08:03:18 -0700
Message-ID: <da977e02df3f538c2df4b3c934e2a3a96484646c.camel@linux.intel.com>
Subject: Re: [PATCH v5] drm/xe/shrinker: Take a runtime PM ref before
 shrinking non-system memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Date: Fri, 04 Sep 2026 17:03:15 +0200
In-Reply-To: <20260901213331.458982-1-shuicheng.lin@intel.com>
References: <20260901213331.458982-1-shuicheng.lin@intel.com>
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

On Tue, 2026-09-01 at 21:33 +0000, Shuicheng Lin wrote:
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
> and stop there if the device is not active, queueing the shrinker PM
> worker so a later scan can pick those bos up.=C2=A0 Stop the walk once th=
e
> scan target is met, so a satisfied scan does not wake the device.
> System memory is still reclaimed while the device is suspended.
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
> v5: drop the freed page accounting patch from the series. (Sashiko)
>=20
> Fixes: 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines
> manually")
> Assisted-by: Claude:claude-opus-5
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_shrinker.c | 39 ++++++++++++++++++++++++-----=
-
> --
> =C2=A01 file changed, 30 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> b/drivers/gpu/drm/xe/xe_shrinker.c
> index 83374cd57660..db4d11f0a156 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -54,12 +54,14 @@ xe_shrinker_mod_pages(struct xe_shrinker
> *shrinker, long shrinkable, long purgea
> =C2=A0	write_unlock(&shrinker->lock);
> =C2=A0}
> =C2=A0
> -static s64 __xe_shrinker_walk(struct xe_device *xe,
> +static s64 __xe_shrinker_walk(struct xe_shrinker *shrinker,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct xe_bo_shrink_flags f=
lags,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned l=
ong
> *scanned)
> =C2=A0{
> +	struct xe_device *xe =3D shrinker->xe;
> =C2=A0	unsigned int mem_type;
> +	bool rpm =3D false;
> =C2=A0	s64 freed =3D 0, lret;
> =C2=A0
> =C2=A0	for (mem_type =3D XE_PL_SYSTEM; mem_type <=3D XE_PL_TT;
> ++mem_type) {
> @@ -71,16 +73,31 @@ static s64 __xe_shrinker_walk(struct xe_device
> *xe,
> =C2=A0			.trylock_only =3D true,
> =C2=A0		};
> =C2=A0
> +		if (*scanned >=3D to_scan)
> +			break;

Consider adding this at the end of the loop instead. Also, those pre-
existing errors that Sashiko reported mandates a separate -fixes patch,
preferrably as the first patch of this series.

> +
> =C2=A0		if (!man || !man->use_tt)
> =C2=A0			continue;
> =C2=A0
> +		if (mem_type !=3D XE_PL_SYSTEM && !rpm &&
> +		=C2=A0=C2=A0=C2=A0 xe_device_is_l2_flush_optimized(xe)) {
> +			if (!xe_pm_runtime_get_if_active(xe)) {
> +				queue_work(xe->unordered_wq,
> +					=C2=A0=C2=A0 &shrinker->pm_worker);
> +				break;
> +			}
> +			rpm =3D true;
> +		}
> +

This is the actual new functionality. I think we actually have a chance
here to get runtime pm sync, avoiding queuing a work. Perhaps consider
breaking out the following block of xe_shrinker_runtime_pm_get() into a
separate helper function:


	if (!xe_pm_runtime_get_if_active(xe)) {
		if (xe_rpm_reclaim_safe(xe) &&
!ttm_bo_shrink_avoid_wait()) {
			xe_pm_runtime_get(xe);
			return true;
		}
		queue_work(xe->unordered_wq, &shrinker->pm_worker);
		return false;
	}


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
> +				freed =3D lret;
> +				goto out;
> +			}

This was a pre-existing, issue right? Belongs in a separate patch.

Thanks,
Thomas


> =C2=A0
> =C2=A0			freed +=3D lret;
> =C2=A0			if (*scanned >=3D to_scan)
> @@ -90,6 +107,10 @@ static s64 __xe_shrinker_walk(struct xe_device
> *xe,
> =C2=A0		xe_assert(xe, !IS_ERR(ttm_bo));
> =C2=A0	}
> =C2=A0
> +out:
> +	if (rpm)
> +		xe_pm_runtime_put(xe);
> +
> =C2=A0	return freed;
> =C2=A0}
> =C2=A0
> @@ -99,7 +120,7 @@ static s64 __xe_shrinker_walk(struct xe_device
> *xe,
> =C2=A0 * add writeback. This avoids stalls and explicit writebacks with
> light or
> =C2=A0 * moderate memory pressure.
> =C2=A0 */
> -static s64 xe_shrinker_walk(struct xe_device *xe,
> +static s64 xe_shrinker_walk(struct xe_shrinker *shrinker,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0 const struct xe_bo_shrink_flags flags,
> =C2=A0			=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned long
> *scanned)
> @@ -110,14 +131,14 @@ static s64 xe_shrinker_walk(struct xe_device
> *xe,
> =C2=A0
> =C2=A0	swap(no_wait_gpu, ctx->no_wait_gpu);
> =C2=A0	save_flags.writeback =3D false;
> -	lret =3D __xe_shrinker_walk(xe, ctx, save_flags, to_scan,
> scanned);
> +	lret =3D __xe_shrinker_walk(shrinker, ctx, save_flags,
> to_scan, scanned);
> =C2=A0	swap(no_wait_gpu, ctx->no_wait_gpu);
> =C2=A0	if (lret < 0 || *scanned >=3D to_scan)
> =C2=A0		return lret;
> =C2=A0
> =C2=A0	freed =3D lret;
> =C2=A0	if (!ctx->no_wait_gpu) {
> -		lret =3D __xe_shrinker_walk(xe, ctx, save_flags,
> to_scan, scanned);
> +		lret =3D __xe_shrinker_walk(shrinker, ctx, save_flags,
> to_scan, scanned);
> =C2=A0		if (lret < 0)
> =C2=A0			return lret;
> =C2=A0		freed +=3D lret;
> @@ -126,7 +147,7 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
> =C2=A0	}
> =C2=A0
> =C2=A0	if (flags.writeback) {
> -		lret =3D __xe_shrinker_walk(xe, ctx, flags, to_scan,
> scanned);
> +		lret =3D __xe_shrinker_walk(shrinker, ctx, flags,
> to_scan, scanned);
> =C2=A0		if (lret < 0)
> =C2=A0			return lret;
> =C2=A0		freed +=3D lret;
> @@ -226,7 +247,7 @@ static unsigned long xe_shrinker_scan(struct
> shrinker *shrink, struct shrink_con
> =C2=A0	runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker, false,
> nr_to_scan, can_backup);
> =C2=A0
> =C2=A0	if (purgeable && nr_scanned < nr_to_scan) {
> -		lret =3D xe_shrinker_walk(shrinker->xe, &ctx,
> shrink_flags,
> +		lret =3D xe_shrinker_walk(shrinker, &ctx,
> shrink_flags,
> =C2=A0					nr_to_scan, &nr_scanned);
> =C2=A0		if (lret >=3D 0)
> =C2=A0			freed +=3D lret;
> @@ -242,7 +263,7 @@ static unsigned long xe_shrinker_scan(struct
> shrinker *shrink, struct shrink_con
> =C2=A0
> =C2=A0	shrink_flags.purge =3D false;
> =C2=A0
> -	lret =3D xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
> +	lret =3D xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> =C2=A0				nr_to_scan, &nr_scanned);
> =C2=A0	if (lret >=3D 0)
> =C2=A0		freed +=3D lret;
