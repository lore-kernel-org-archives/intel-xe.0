Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FC7C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2917F10F142;
	Wed,  9 Sep 2026 12:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NufTWQrT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8BF10F151
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788958743; x=1820494743;
 h=message-id:subject:from:to:cc:in-reply-to:references:
 content-transfer-encoding:mime-version:date;
 bh=Hn4IvQrKQ3bz+ilGo46m9fw63wNBosRZb/Hdz4Juq2U=;
 b=NufTWQrTwAlQKsG2IRStM0LL0H3rptLX9ae+Gd7XkOTADwrprjx/Q1cD
 uhQ0VZk2wWEs+ZBzcBF0PBsiTFUjHTxJw+VVjvWR57Ip8AQY97Hme3T6d
 36WYDJB7WTkY26KtKk0OJ4PysHCBs0PgB11vSf58DIpmkD0Ts+LHB/zkJ
 FqhBkSJMYobJYs5bd3Sbh+J/RtJyZCgB1r/GOH7oUpsND/0ccxyx9nRe6
 k89MinXNXuxJAvBIPh0KiKiW5wKjY/UrjUgyecpkU0o7cgp8OXdhUfQGm
 aIQKsQU83RXwyQNVVQ2DqC3Xo+h2um9+8gq4W+3PC9t+mMT2dHL4Rs7KV g==;
X-CSE-ConnectionGUID: LBXGsoF4SYiFB0nzUVhFQA==
X-CSE-MsgGUID: IU69oBd7QbeY7yBP376hsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89402069"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89402069"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:59:02 -0700
X-CSE-ConnectionGUID: kIfyczV6T7iOugxJRe6P3w==
X-CSE-MsgGUID: 5MfCYzLBRuWBZKhG0N58PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="267633480"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.112])
 ([10.245.245.112])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:59:01 -0700
Message-ID: <28d3f2154b716bd76c63d4bb3199681b24db7439.camel@linux.intel.com>
Subject: Re: [PATCH v6 1/2] drm/xe/shrinker: Return the freed page count
 through a parameter
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
In-Reply-To: <20260904215049.543535-2-shuicheng.lin@intel.com>
References: <20260904215049.543535-1-shuicheng.lin@intel.com>
 <20260904215049.543535-2-shuicheng.lin@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 14:58:22 +0200
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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
> __xe_shrinker_walk() and xe_shrinker_walk() return either the number
> of
> pages freed or a negative error, so the two cannot be reported at
> once.
> On error the pages already freed are dropped, and since
> xe_shrinker_scan()
> only accumulates non-negative returns while *scanned is updated by
> pointer, the shrinker tells mm that it scanned without freeing.
>=20
> Accumulate the count into a caller-provided counter and return only
> the
> status, so an error no longer discards what the walk had freed.
>=20
> Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_shrinker.c | 62 ++++++++++++++---------------=
-
> --
> =C2=A01 file changed, 26 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> b/drivers/gpu/drm/xe/xe_shrinker.c
> index 83374cd57660..89445cd20238 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -54,13 +54,14 @@ xe_shrinker_mod_pages(struct xe_shrinker
> *shrinker, long shrinkable, long purgea
> =C2=A0	write_unlock(&shrinker->lock);
> =C2=A0}
> =C2=A0
> -static s64 __xe_shrinker_walk(struct xe_device *xe,
> +static int __xe_shrinker_walk(struct xe_device *xe,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct xe_bo_shrink_flags f=
lags,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned long
> *scanned)
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned long
> *scanned,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *freed)
> =C2=A0{
> =C2=A0	unsigned int mem_type;
> -	s64 freed =3D 0, lret;
> +	s64 lret;
> =C2=A0
> =C2=A0	for (mem_type =3D XE_PL_SYSTEM; mem_type <=3D XE_PL_TT;
> ++mem_type) {
> =C2=A0		struct ttm_resource_manager *man =3D
> ttm_manager_type(&xe->ttm, mem_type);
> @@ -82,7 +83,7 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
> =C2=A0			if (lret < 0)
> =C2=A0				return lret;
> =C2=A0
> -			freed +=3D lret;
> +			*freed +=3D lret;
> =C2=A0			if (*scanned >=3D to_scan)
> =C2=A0				break;
> =C2=A0		}
> @@ -90,7 +91,7 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
> =C2=A0		xe_assert(xe, !IS_ERR(ttm_bo));
> =C2=A0	}
> =C2=A0
> -	return freed;
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -99,40 +100,35 @@ static s64 __xe_shrinker_walk(struct xe_device
> *xe,
> =C2=A0 * add writeback. This avoids stalls and explicit writebacks with
> light or
> =C2=A0 * moderate memory pressure.
> =C2=A0 */
> -static s64 xe_shrinker_walk(struct xe_device *xe,
> +static int xe_shrinker_walk(struct xe_device *xe,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0 const struct xe_bo_shrink_flags flags,
> -			=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned long
> *scanned)
> +			=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned long
> *scanned,
> +			=C2=A0=C2=A0=C2=A0 unsigned long *freed)
> =C2=A0{
> =C2=A0	bool no_wait_gpu =3D true;
> =C2=A0	struct xe_bo_shrink_flags save_flags =3D flags;
> -	s64 lret, freed;
> +	int ret;
> =C2=A0
> =C2=A0	swap(no_wait_gpu, ctx->no_wait_gpu);
> =C2=A0	save_flags.writeback =3D false;
> -	lret =3D __xe_shrinker_walk(xe, ctx, save_flags, to_scan,
> scanned);
> +	ret =3D __xe_shrinker_walk(xe, ctx, save_flags, to_scan,
> scanned, freed);
> =C2=A0	swap(no_wait_gpu, ctx->no_wait_gpu);
> -	if (lret < 0 || *scanned >=3D to_scan)
> -		return lret;
> +	if (ret || *scanned >=3D to_scan)
> +		return ret;
> =C2=A0
> -	freed =3D lret;
> =C2=A0	if (!ctx->no_wait_gpu) {
> -		lret =3D __xe_shrinker_walk(xe, ctx, save_flags,
> to_scan, scanned);
> -		if (lret < 0)
> -			return lret;
> -		freed +=3D lret;
> -		if (*scanned >=3D to_scan)
> -			return freed;
> +		ret =3D __xe_shrinker_walk(xe, ctx, save_flags,
> to_scan, scanned,
> +					 freed);
> +		if (ret || *scanned >=3D to_scan)
> +			return ret;
> =C2=A0	}
> =C2=A0
> -	if (flags.writeback) {
> -		lret =3D __xe_shrinker_walk(xe, ctx, flags, to_scan,
> scanned);
> -		if (lret < 0)
> -			return lret;
> -		freed +=3D lret;
> -	}
> +	if (flags.writeback)
> +		ret =3D __xe_shrinker_walk(xe, ctx, flags, to_scan,
> scanned,
> +					 freed);
> =C2=A0
> -	return freed;
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static unsigned long
> @@ -214,7 +210,6 @@ static unsigned long xe_shrinker_scan(struct
> shrinker *shrink, struct shrink_con
> =C2=A0	bool runtime_pm;
> =C2=A0	bool purgeable;
> =C2=A0	bool can_backup =3D !!(sc->gfp_mask & __GFP_FS);
> -	s64 lret;
> =C2=A0
> =C2=A0	nr_to_scan =3D sc->nr_to_scan;
> =C2=A0
> @@ -225,12 +220,9 @@ static unsigned long xe_shrinker_scan(struct
> shrinker *shrink, struct shrink_con
> =C2=A0	/* Might need runtime PM. Try to wake early if it looks like
> it. */
> =C2=A0	runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker, false,
> nr_to_scan, can_backup);
> =C2=A0
> -	if (purgeable && nr_scanned < nr_to_scan) {
> -		lret =3D xe_shrinker_walk(shrinker->xe, &ctx,
> shrink_flags,
> -					nr_to_scan, &nr_scanned);
> -		if (lret >=3D 0)
> -			freed +=3D lret;
> -	}
> +	if (purgeable && nr_scanned < nr_to_scan)
> +		xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
> +				 nr_to_scan, &nr_scanned, &freed);
> =C2=A0
> =C2=A0	sc->nr_scanned =3D nr_scanned;
> =C2=A0	if (nr_scanned >=3D nr_to_scan || !can_backup)
> @@ -242,10 +234,8 @@ static unsigned long xe_shrinker_scan(struct
> shrinker *shrink, struct shrink_con
> =C2=A0
> =C2=A0	shrink_flags.purge =3D false;
> =C2=A0
> -	lret =3D xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
> -				nr_to_scan, &nr_scanned);
> -	if (lret >=3D 0)
> -		freed +=3D lret;
> +	xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
> +			 nr_to_scan, &nr_scanned, &freed);
> =C2=A0
> =C2=A0	sc->nr_scanned =3D nr_scanned;
> =C2=A0out:
