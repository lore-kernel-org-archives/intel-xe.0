Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F329CA600B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 12:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D45510E830;
	Thu,  8 Oct 2026 12:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="buDm5L7W";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB2A10E830
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 12:46:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 98F9460252;
 Thu,  8 Oct 2026 12:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FA71F000FF;
 Thu,  8 Oct 2026 12:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791463562;
 bh=bQGzmrJBXlzaPeisfP1yDiyUMHSMsfwY34o/4sfceQs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=buDm5L7WfGPQ6/1oXSUEitMHLe28EEVslIAUncinEkZK4EDQ7cNDxboG8pt/krOP0
 TlLN3SnlmUWiManVc8sA6ipf25doAYzUGT2VLcI5cfgbaWdEQfj2aTiDOMDoh9Ss/x
 fTaOHURHPDBhSzNOYxTWKjXtw4k2ch975ZxcDuIPL+YveWPZpNXXYv04naksHVUd5T
 Ea5dFtb+KlUc3ShiINdlWLxPmTpraqv19H1obHoe5pxwA/jun5nvjfECSX9YUiS0lS
 mgKvJOcfplW1bqkx1M/U19sXRCeaYKbac1OkxilJ563+9Ch112D0tfBspFhF/AT/v3
 U0kWV2YVO6jVg==
Message-ID: <sashiko-outbox-164172@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] drm/xe: Split the bo shrinker into purgeable and
 non-purgeable shrinkers
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261008123024.38522-3-thomas.hellstrom@linux.intel.com>
References: <20261008123024.38522-1-thomas.hellstrom@linux.intel.com>
 <20261008123024.38522-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 12:46:01 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/xe: split shrinkers fail to isolate purgeable objects
- [High] drm/xe: purgeable shrinker permanently stalls on non-purgeable LRU=
 objects
--

commit 03a2b4c22a7c807ab5b2d97ec7177c503b0367aa
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

    drm/xe: Split the bo shrinker into purgeable and non-purgeable shrinkers
   =20
    Purgeable objects are reclaimed by simply discarding their pages, with
    no writeback required. They are therefore much cheaper to shrink than
    regular shrinkable (non-purgeable) objects, whose reclaim may need to
    wait for the GPU or write dirty compressed contents back to a backup
    store, and whose contents need to be read back on next use.
   =20
    Split the single xe_shrinker into two independent struct shrinker
    instances registered against the shrinker core, sharing the same
    underlying accounting (shrinkable_pages, purgeable_pages,
    populated_tts) and locking:

[ ... ]

> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -213,63 +235,52 @@ static bool xe_shrinker_runtime_pm_get(struct xe_sh=
rinker *shrinker, bool force,

[ ... ]

> -static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct sh=
rink_control *sc)
> +static unsigned long xe_shrinker_scan_purgeable(struct shrinker *shrink,
> +						struct shrink_control *sc)
>  {
>  	struct xe_shrinker *shrinker =3D to_xe_shrinker(shrink);
>  	struct ttm_operation_ctx ctx =3D {
>  		.interruptible =3D false,
>  		.no_wait_gpu =3D ttm_bo_shrink_avoid_wait(),
>  	};
> -	unsigned long nr_to_scan, nr_scanned =3D 0, freed =3D 0;
> +	unsigned long nr_to_scan =3D sc->nr_to_scan, nr_scanned =3D 0, freed =
=3D 0;
>  	struct xe_bo_shrink_flags shrink_flags =3D {
>  		.purge =3D true,
> -		/* Don't request writeback without __GFP_IO. */
> -		.writeback =3D !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
>  	};
> -	bool runtime_pm;
> -	bool purgeable;
> -	bool can_backup =3D !!(sc->gfp_mask & __GFP_FS);
> -
> -	nr_to_scan =3D sc->nr_to_scan;
> -
> -	read_lock(&shrinker->lock);
> -	purgeable =3D !!shrinker->purgeable_pages;
> -	read_unlock(&shrinker->lock);
> =20
> -	/* Might need runtime PM. Try to wake early if it looks like it. */
> -	runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, =
can_backup);
> -
> -	if (purgeable && nr_scanned < nr_to_scan)
> -		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> -				 nr_to_scan, &nr_scanned, &freed);
> +	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan, &nr_scanned,=
 &freed);

[Severity: High]
Does this standalone purgeable shrinker permanently stall when it encounters
non-purgeable LRU objects?

When the core mm invokes scan_objects for the purgeable shrinker, it
traverses the TTM LRU list which mixes both purgeable and non-purgeable
objects. If a non-purgeable object is encountered, xe_bo_shrink returns
-EBUSY:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink() {
    ...
	if (!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
	    (flags.purge && !xe_tt->purgeable))
		return -EBUSY;
    ...
}

The LRU walk in __xe_shrinker_walk treats this negative return as a fatal
error and aborts the entire scan:

drivers/gpu/drm/xe/xe_shrinker.c:__xe_shrinker_walk() {
    ...
			lret =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
			if (lret < 0) {
				ret =3D lret;
				goto out;
			}
    ...
}

Because the shrinkers are now decoupled, this shrinker can no longer rely
on the non-purgeable shrinker running immediately afterwards in the same
context to clear the obstruction. Any memory pressure triggering the shrink=
er
when a non-purgeable object happens to be at the LRU head might cause this
to abort without freeing any pages.

> =20
>  	sc->nr_scanned =3D nr_scanned;
> -	if (nr_scanned >=3D nr_to_scan || !can_backup)
> -		goto out;
> =20
> -	/* If we didn't wake before, try to do it now if needed. */
> -	if (!runtime_pm)
> -		runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker, true, 0, can_backu=
p);
> +	return nr_scanned ? freed : SHRINK_STOP;
> +}
> =20
> -	shrink_flags.purge =3D false;
> +static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct sh=
rink_control *sc)
> +{
> +	struct xe_shrinker *shrinker =3D to_xe_shrinker(shrink);
> +	struct ttm_operation_ctx ctx =3D {
> +		.interruptible =3D false,
> +		.no_wait_gpu =3D ttm_bo_shrink_avoid_wait(),
> +	};
> +	unsigned long nr_to_scan =3D sc->nr_to_scan, nr_scanned =3D 0, freed =
=3D 0;
> +	struct xe_bo_shrink_flags shrink_flags =3D {
> +		.purge =3D false,
> +		/* Don't request writeback without __GFP_IO. */
> +		.writeback =3D !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
> +	};

[Severity: High]
Does the non-purgeable shrinker fail to isolate purgeable objects?

Since this shrinker scans with flags.purge =3D false, xe_bo_shrink does not
skip purgeable objects:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink() {
    ...
	if (xe_tt->purgeable) {
		if (bo->resource->mem_type !=3D XE_PL_SYSTEM)
			lret =3D xe_bo_move_notify(xe_bo, ctx);
		if (!lret)
			lret =3D xe_bo_shrink_purge(ctx, bo, scanned);
    ...
}

Will this cause the non-purgeable shrinker, which has a higher scan target
due to higher seeks, to fulfill its scan quota by stealing cheap purgeable
objects instead of forcing writeback on non-purgeable objects? If so, the
proportional reclaim mechanism might be defeated.

> +	bool runtime_pm;
> +
> +	/* Might need runtime PM to access backed-up or CCS-compressed data. */
> +	runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker);
> =20
> -	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> -			 nr_to_scan, &nr_scanned, &freed);
> +	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan, &nr_scanned,=
 &freed);
> =20
>  	sc->nr_scanned =3D nr_scanned;
> -out:
>  	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
> +
>  	return nr_scanned ? freed : SHRINK_STOP;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008123024.3852=
2-1-thomas.hellstrom@linux.intel.com?part=3D2
