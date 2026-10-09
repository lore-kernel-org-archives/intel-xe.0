Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C35CA5FED
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 07:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8EC10FEEC;
	Fri,  9 Oct 2026 07:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IyJsGt46";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3615710FEE1
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 07:13:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D17A602C3;
 Fri,  9 Oct 2026 07:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB9D1F000FF;
 Fri,  9 Oct 2026 07:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791530022;
 bh=83hFzyEJf0hIAUC4YJ13BB8LQ4AaCaDX6Rum6gGSOpQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=IyJsGt46uw79eCA0LxF8XKmZyLvMAolFCjSlnSwXefUt+f8UjS8/gSO4LMczvd0kO
 RJS4bAgjOfrwgbG+PUszxroiFZ4USLqciQI7ZeNl1SVYNo6pAny62N9a0XoGaLkpgo
 DsFk9MG4rr1mvK2cy3o3VEm6dUMnUjulb5rsJ3JPL0gHgMlBFckaiAb3NKnOE36NN9
 mHlBdHcAO4yPhGe1LqgJJYRLWtY0fqgMlelDV0DZfYLfYPJazPOjCYXAYiQ8Z8tZ3q
 8t8vAvjgFcR05hGpgoyXT0O+RQa5CNt2O60O17HHzXA6AGXb6St+dWgV/b4JKlzdaB
 v9DSUJSrlM+kQ==
Message-ID: <sashiko-outbox-164983@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Don't transfer shrinker pages for pinned bos on
 purgeable state change
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009070053.7790-1-thomas.hellstrom@linux.intel.com>
References: <20261009070053.7790-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:13:42 +0000
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
- [High] drm/xe: Shrinker accounting underflow for display BOs on MADV_DONT=
NEED
--

commit d5c4a3b2c7860c46686f096832d7c3684f902103
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

    drm/xe: Don't transfer shrinker pages for pinned bos on purgeable state=
 change
   =20
    Pinned bos have their pages removed from the shrinker's shrinkable /
    purgeable counts on pin, and added back on unpin according to the
    bo's purgeable state at that time.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6921b6967330d..a752e01efbd75 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
[ ... ]
> @@ -876,7 +878,8 @@ static void xe_bo_set_purgeable_shrinker(struct xe_bo=
 *bo,
>  		return;
> =20
>  	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> -	tt_pages =3D tt->num_pages;
> +	/* Pinned bos are not accounted. Only update the purgeable flag. */
> +	tt_pages =3D xe_bo_is_pinned(bo) ? 0 : tt->num_pages;

[Severity: High]
Could this introduce a regression leading to a shrinker accounting underflow
for native display BOs?

Native display framebuffers are pinned for scanout via __xe_pin_fb_vma().
Unlike imported BOs, this function calls ttm_bo_pin() directly without call=
ing
xe_ttm_tt_account_subtract():

drivers/gpu/drm/xe/display/xe_fb_pin.c:__xe_pin_fb_vma() {
    ...
    ret =3D ttm_bo_pin(&bo->ttm);
    ...
}

Because of this, their pages appear to remain actively accounted in the
shrinker's shrinkable_pages bucket while pinned.

If userspace sets MADV_DONTNEED on a display BO while it is pinned, won't t=
his
new check skip the page transfer from shrinkable_pages to purgeable_pages
since xe_bo_is_pinned(bo) is true?

It seems this skips the page transfer but still sets xe_tt->purgeable =3D t=
rue.
When the display BO is later unpinned via __xe_unpin_fb_vma(), it calls
ttm_bo_unpin() directly without adding pages back to the shrinker:

drivers/gpu/drm/xe/display/xe_fb_pin.c:__xe_unpin_fb_vma() {
    ...
    ttm_bo_unpin(&vma->bo->ttm);
    ...
}

When the BO is eventually unpopulated or destroyed, wouldn't
xe_ttm_tt_account_subtract() see xe_tt->purgeable =3D=3D true and subtract =
the
pages from the purgeable_pages bucket?

Since the pages were never transferred, does this cause purgeable_pages to
underflow and shrinkable_pages to remain permanently inflated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009070053.7790=
-1-thomas.hellstrom@linux.intel.com?part=3D1
