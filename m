Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82267CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 13:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4560A10E043;
	Fri, 16 Oct 2026 13:53:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE5B10E043
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 13:53:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C0E89600AA;
 Fri, 16 Oct 2026 13:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AAC41F000C4;
 Fri, 16 Oct 2026 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792158826;
 bh=WlylBtbOKWETmRXjVfjU1tu1cv9Psn90DOx9X7fHdTE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=kb/o3XI4ba64Q8Ay8k2i5u7KVU+KcR7G6+Bn09vBGH8iYqf2r/gMQipTmyJUgvrmb
 3CsxrtTx5AiDsZaYE2pJwG6zOqpu42CoUjpc0jnbM7WRO+/qoC84re44YULepZeYJ4
 Fy7l96QeDxMuaWLm7h40bDnyh+Zpfol+5DBR1WUcixbqVkm1nFlIzxSQ3mkatg+SQJ
 xAW7TrsK2DpgL2OYHj6cqjePkfLHfv7Tamt7bFqa8ReVPvjahTfeIs2esfmxRpiRIH
 pZ6vopj5jfj9ABT5kw1RoP8OZ6rcefpZ6RvMP6ehw+m3+iG8Yf3Pgy3Cm3nejqRzxV
 JgtjWid6XE1lw==
Message-ID: <sashiko-outbox-174414@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] drm/xe: Split the bo shrinker into purgeable and
 non-purgeable shrinkers
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261016133523.3622-4-thomas.hellstrom@linux.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
 <20261016133523.3622-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 13:53:46 +0000
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
- [High] drm/xe: Use-After-Free of shrinker during DRM device teardown
- [High] drm/xe: O(N^2) CPU lockup in purgeable shrinker due to uncounted L=
RU skips
--

commit 1e9348c2fe4768de2cf24e4dd9b6188400c84043
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Split the bo shrinker into purgeable and non-purgeable shrinkers

This commit splits the single xe_shrinker into two independent shrinker
instances: one for purgeable objects and another for non-purgeable
(shrinkable) objects. This allows the shrinker core to apply different
reclaim pressures based on the varying costs of reclaiming these object
types.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index 378022c37a57c..8e3fe675e0f34 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c

[ ... ]

> @@ -216,63 +238,52 @@ static bool xe_shrinker_runtime_pm_get(struct xe_sh=
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
> =20
>  	sc->nr_scanned =3D nr_scanned;

[Severity: High]
Can this cause an O(N^2) CPU lockup in the purgeable shrinker?

When the memory reclaim core (do_shrink_slab) calls this purgeable scan
routine under memory pressure, xe_shrinker_walk() iterates the LRU list.

However, non-purgeable BOs return -EBUSY and are skipped without advancing
the scanned counter:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink() {
    ...
    if (!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
        (flags.purge && !xe_tt->purgeable))
        return -EBUSY;
    ...
}

drivers/gpu/drm/xe/xe_shrinker.c:__xe_shrinker_walk() {
    ...
            lret =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
            /* Like the TTM LRU walk, skip bos we can't shrink now. */
            if (lret =3D=3D -EBUSY)
                continue;
    ...
}

Since the LRU cursor is initialized locally on each call and non-purgeable
BOs do not increment nr_scanned, every batch rescans all leading
non-purgeable BOs without significantly advancing sc->nr_scanned.

Will this force the shrinker core to repeatedly call this function,
processing the same leading non-purgeable BOs over and over again?

> -	if (nr_scanned >=3D nr_to_scan || !can_backup)
> -		goto out;
> =20
> -	/* If we didn't wake before, try to do it now if needed. */
> -	if (!runtime_pm)
> -		runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker, true, 0, can_backu=
p);
> +	return nr_scanned ? freed : SHRINK_STOP;
> +}

[ ... ]

> @@ -294,6 +305,7 @@ static void xe_shrinker_fini(struct drm_device *drm, =
void *arg)
>  	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
>  	xe_assert(shrinker->xe, !shrinker->populated_tts);
>  	shrinker_free(shrinker->shrink);
> +	shrinker_free(shrinker->purge_shrink);
>  	flush_work(&shrinker->pm_worker);
>  	kfree(shrinker);
>  }

[Severity: High]
Does this kfree(shrinker) leave xe->mem.shrinker as a dangling pointer?

Because drmm actions execute in LIFO order upon device release,
xe_shrinker_fini() is called before xe_device_destroy().=20

Later, xe_device_destroy() runs and calls xe_bo_dev_fini() which flushes
the async_free workqueue. Pending BOs in the workqueue will have their
final references dropped, leading to xe_ttm_tt_account_subtract():

drivers/gpu/drm/xe/xe_bo.c:xe_ttm_tt_account_subtract() {
    ...
    if (xe_tt->purgeable)
        xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_pages, -1=
);
    else
        xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0, -1=
);
    ...
}

Can this lead to a use-after-free and memory corruption when driver unloads?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016133523.3622=
-1-thomas.hellstrom@linux.intel.com?part=3D3
