Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7552CCF2DA
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 10:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AC810E97C;
	Mon, 19 Oct 2026 10:12:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B35310E987
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 10:12:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 75C606020A;
 Mon, 19 Oct 2026 10:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4251F000C5;
 Mon, 19 Oct 2026 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792404733;
 bh=iZQ3KiufRrY6rXBT0DjHUjqHz1whHNRyto8D8RwzYLs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=WzKkvoVAFQ7quAfSboMRyKlmiQVFicCo/JK1NFVyxixQyfkjIXUUaIyrL2PsWLJHI
 kV43EpI4FOklaV+MYPReldNSW4pDicYX6uYv5V+3SoGlyuGPslFC9058PqaBLJKTvf
 c5tRSjvVjJT/U3F6eSp/2OuN2Ca7bgqw9mt8Elc/Ya1wzdsITbAmrhoX3uKj5ow6oO
 qkN05Yaqrt5JOuQSS0fIehINEwpVy50bYC8sPBXD1rnL/mUYvrTF5zD71hjkQxOTI3
 ODsCjWfCSeIEJ2bVLyveSVVy/SL3pEmnhhLPvrG2CJw3TZ44hCWSg//eqdJrO1eU52
 Q6AkL8pKhIhJQ==
Message-ID: <sashiko-outbox-176960@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] drm/xe: Don't abort the shrinker walk on -EBUSY
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261019095655.3501-2-thomas.hellstrom@linux.intel.com>
References: <20261019095655.3501-1-thomas.hellstrom@linux.intel.com>
 <20261019095655.3501-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:12:12 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: inflated scanned count and unbounded walk on -EBUSY in x=
e_bo_shrink()
--

commit 34f5fe95935fcbebfbfa95c987f4c6fb159c03dd
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Don't abort the shrinker walk on -EBUSY

This commit updates __xe_shrinker_walk() to continue the LRU walk when
xe_bo_shrink() returns -EBUSY so that a single unshrinkable buffer object
does not abort reclaim for objects behind it on the LRU.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index deb4378c1ec15..4e4da76936f49 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -113,6 +113,9 @@ static int __xe_shrinker_walk(struct xe_shrinker *shr=
inker,
>  				continue;
> =20
>  			lret =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
> +			/* Like the TTM LRU walk, skip bos we can't shrink now. */
> +			if (lret =3D=3D -EBUSY)
> +				continue;
>  			if (lret < 0) {
>  				ret =3D lret;
>  				goto out;

[Severity: Medium]
What happens to *scanned and the walk termination when xe_bo_shrink() (or
xe_bo_shrink_purge()) fails inside ttm_bo_shrink() with -EBUSY?

In both xe_bo_shrink() and xe_bo_shrink_purge() in
drivers/gpu/drm/xe/xe_bo.c, *scanned is incremented by the BO's page count
before calling ttm_bo_shrink():

drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink() {
	...
	*scanned +=3D tt->num_pages;
	lret =3D ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
			     {.purge =3D false,
			      .writeback =3D flags.writeback,
			      .allow_move =3D true});
}

drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink_purge() {
	...
	*scanned +=3D bo->ttm->num_pages;
	lret =3D ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
			     {.purge =3D true,
			      .writeback =3D false,
			      .allow_move =3D false});
}

If ttm_bo_shrink() fails in ttm_bo_validate(), times out (or hits
no_wait_gpu) in ttm_bo_wait_ctx(), or fails in ttm_tt_backup() (for
example, -ENOMEM when writeback is false or -EBUSY when swap is full), it
returns -EBUSY after *scanned has already been incremented.

Could this cause two issues?

First, in __xe_shrinker_walk(), continuing on -EBUSY skips the
*scanned >=3D to_scan check:

drivers/gpu/drm/xe/xe_shrinker.c:__xe_shrinker_walk() {
	...
			lret =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
			/* Like the TTM LRU walk, skip bos we can't shrink now. */
			if (lret =3D=3D -EBUSY)
				continue;
			if (lret < 0) {
				ret =3D lret;
				goto out;
			}

			*freed +=3D lret;
			if (*scanned >=3D to_scan)
				goto out;
}

When multiple BOs fail ttm_bo_shrink() with -EBUSY (such as during the
first two passes where writeback is false, or when swap space is full),
__xe_shrinker_walk() will walk the entire XE_PL_SYSTEM and XE_PL_TT LRUs
without bound, moving XE_PL_TT BOs to XE_PL_SYSTEM and unmapping them
along the way while inflating sc->nr_scanned and draining do_shrink_slab()
scan budgets.

Second, if a single BO of size >=3D to_scan fails ttm_bo_shrink() with
-EBUSY, *scanned already reaches to_scan with 0 pages freed. As soon as a
subsequent BO returns >=3D 0 (or after the walk returns), the
*scanned >=3D to_scan checks in __xe_shrinker_walk(), xe_shrinker_walk(),
and xe_shrinker_scan() will still trigger and skip the remaining shrinker
passes (the GPU-wait pass, the writeback pass, and the non-purgeable
pass):

drivers/gpu/drm/xe/xe_shrinker.c:xe_shrinker_walk() {
	...
	ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan, scanned,
				 freed);
	swap(no_wait_gpu, ctx->no_wait_gpu);
	if (ret || *scanned >=3D to_scan)
		return ret;

	if (!ctx->no_wait_gpu) {
		ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan, scanned,
					 freed);
		if (ret || *scanned >=3D to_scan)
			return ret;
	}
}

Should *scanned only be incremented when ttm_bo_shrink() succeeds, or how
should *scanned be accounted when ttm_bo_shrink() returns -EBUSY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019095655.3501=
-1-thomas.hellstrom@linux.intel.com?part=3D1
