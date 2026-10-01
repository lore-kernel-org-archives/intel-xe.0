Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45E1CA5FCB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 13:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B52810E3B2;
	Thu,  1 Oct 2026 13:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O52JFmOs";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C88E10E3B2
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 13:56:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 31FBF4147F;
 Thu,  1 Oct 2026 13:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95B41F000FF;
 Thu,  1 Oct 2026 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790862993;
 bh=TuQ81ztM4gfRMcohSJ10y5rO855ik4o2MNtHi73NWto=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=O52JFmOsmQzR56cFV8hRPb8Tl8qtp2NxlJn9JfdwmgJJZNyFPPcuSquJ6m7pXqp1L
 YA7hpMxt5JaAfdZadzAeFgAy750WGLAV22/+oZbLvUEIiWJR+o+smA9TsITwc+B/p1
 3jzk0lLNlNaG8kfANch1auAaNFWlY5+MJA5M/lfRcx5jop8pIgiz9wbP399DWAXsHv
 9vH+qT5+nNnnPPHVOUADolvwhLz548+5aaQidU+Tj+sUDWh9JyJKeNWXOrHFwcRYUV
 fDC+6chs8WVtwl3bd/KIK748lOBmdcBezr8V9ip/p0RF/NdPcDlcfjLbIe56XZI09i
 OwEJx0SCN0g4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] drm/xe: Fix shrinker accounting
 double-subtraction on nested external pins
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261001134018.111553-2-thomas.hellstrom@linux.intel.com>
References: <20261001134018.111553-1-thomas.hellstrom@linux.intel.com>
 <20261001134018.111553-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:56:32 +0000
Message-Id: <20261001135632.E95B41F000FF@smtp.kernel.org>
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
- [Medium] mm: permanent shrinker accounting leak for backup BOs
--

commit 816b78b38575a1b5008feed73113ef8809607017
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Fix shrinker accounting double-subtraction on nested external pins

This commit fixes a double-subtraction in the shrinker accounting when
handling nested external pins by introducing xe_bo_pin_account() and
xe_bo_unpin_account(). These wrappers ensure shrinker pages are only updated
during the initial pin and final unpin transitions.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index f2ab9bf43a864..2fbbba7cf4b00 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -465,6 +465,66 @@ static void xe_ttm_tt_account_subtract(struct xe_dev=
ice *xe, struct ttm_tt *tt)
>  		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
>  }
> =20
> +/*
> + * Account @bo's pages as pinned for the shrinker. Removes @bo's pages
> + * from the shrinker's shrinkable / purgeable counts on the transition
> + * from unpinned to pinned. Must be called with @bo's dma-resv held,
> + * after &ttm_buffer_object.pin_count has been incremented by
> + * ttm_bo_pin(). Safe to call unconditionally regardless of which pin
> + * path (kernel, external, framebuffer, backup object, ...) is pinning
> + * @bo, since it only acts on the true 0->1 pin_count transition.
> + */
> +static void xe_bo_account_pin(struct xe_bo *bo)
> +{
> +	struct xe_device *xe =3D xe_bo_device(bo);
> +
> +	if (bo->ttm.pin_count =3D=3D 1 && bo->ttm.ttm && ttm_tt_is_populated(bo=
->ttm.ttm))
> +		xe_ttm_tt_account_subtract(xe, bo->ttm.ttm);

[Severity: High]
This isn't a bug introduced by this patch, but does this logic cause a
shrinker accounting underflow when pinning imported dma-bufs?

When an imported dma-buf is pinned (for example, through framebuffer creati=
on
or external buffer sharing), xe_bo_pin_account() is called, which evaluates
ttm_tt_is_populated(). For imported dma-bufs, the TTM core sets this flag.

However, xe_ttm_tt_populate() returns early for imported dma-bufs:

xe_ttm_tt_populate() {
    if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
        !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
            return 0;
    ...
}

Because they return early, they are never added to the shrinker in the first
place.=20

Could subtracting them here unconditionally when ttm_tt_is_populated() is t=
rue
subtract pages that were never added, causing an unsigned underflow of
shrinkable_pages?

> +}
> +

[ ... ]

> @@ -1396,7 +1456,7 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
>  		}
> =20
>  		backup->parent_obj =3D xe_bo_get(bo); /* Released by bo_destroy */
> -		ttm_bo_pin(&backup->ttm);
> +		xe_bo_pin_account(backup);

[Severity: Medium]
Does this introduce a permanent shrinker accounting leak for backup BOs?

In xe_bo_notifier_prepare_pinned(), a new system memory backup BO is created
and immediately pinned here via the new xe_bo_pin_account() helper. At this
point, the BO's TT is not yet populated (as ttm_bo_move_null() defers it),
so xe_bo_account_pin() skips subtracting the pages:

xe_bo_account_pin() {
    if (bo->ttm.pin_count =3D=3D 1 && bo->ttm.ttm &&
        ttm_tt_is_populated(bo->ttm.ttm))
            xe_ttm_tt_account_subtract(xe, bo->ttm.ttm);
}

Later, when the BO is populated (for example, during eviction copy), it is
added to the shrinker via xe_ttm_tt_populate().

When the BO is eventually unpinned in xe_bo_restore_pinned() or
xe_bo_notifier_unprepare_pinned(), xe_bo_account_unpin() sees that it is now
populated and adds the pages to the shrinker again.=20

Can this double-addition permanently inflate the shrinkable_pages counter?

>  		bo->backup_obj =3D backup;
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001134018.1115=
53-1-thomas.hellstrom@linux.intel.com?part=3D1
