Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0236BCA5FED
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 08:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B432F10FF5F;
	Fri,  9 Oct 2026 08:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGE7tffI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C5F10FF5F
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 08:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791532841; x=1823068841;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ok8uvWN/g76K0l0aSxtuWgu9tIqI/liV8beFeRRiU24=;
 b=jGE7tffIMgH/ubq3MqbzAiLMWS8vqdmtfsmyIy0PvizUjD7gxTIJ7+WX
 7p5cNxc6FwU/UN3F5anJN186Z96fKE6Lh6QWyh4GleX8EfwkatcV6lgcb
 tHNe/6pQIxvEcw2VpKjG7hz55TYQfDdFKWKg933ojW6TjapIP1SY7P95Q
 AYGqj/3+SYPfj+ujFl8h07HRqrqlXOsDxUB/ZVLFWL8H0zCWsKEQRlpvi
 nEB+Tv6srPey7laBAVZVFuHBxGr6v9imkyVmvlAxDm2FMcckg+zU2y2H9
 rQfXnTjVmtjC4WVnYWGepZfqopRr4uVIOirIg2xkEE/q5FoNwwspJOpdQ A==;
X-CSE-ConnectionGUID: QTdiRaNSSl641ecUZySPSA==
X-CSE-MsgGUID: yXF+sh9qRIezCiFnHYxAIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="336057"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="336057"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 01:00:41 -0700
X-CSE-ConnectionGUID: skn3/HeGSIqqEwIrVKHmqw==
X-CSE-MsgGUID: y6//OTRFTcuqJAjCrqLzrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="243143"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.245.243])
 ([10.245.245.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 01:00:40 -0700
Message-ID: <462e2015a1c00a13c5fe74f215a2af8723d3b55e.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Don't transfer shrinker pages for pinned bos on
 purgeable state change
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Oct 2026 10:00:30 +0200
In-Reply-To: <sashiko-outbox-164983@kernel.org>
References: <20261009070053.7790-1-thomas.hellstrom@linux.intel.com>
 <sashiko-outbox-164983@kernel.org>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
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

On Fri, 2026-10-09 at 07:13 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [High] drm/xe: Shrinker accounting underflow for display BOs on
> MADV_DONTNEED
> --
>=20
> commit d5c4a3b2c7860c46686f096832d7c3684f902103
> Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> =C2=A0=C2=A0=C2=A0 drm/xe: Don't transfer shrinker pages for pinned bos o=
n purgeable
> state change
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 Pinned bos have their pages removed from the shrinker'=
s
> shrinkable /
> =C2=A0=C2=A0=C2=A0 purgeable counts on pin, and added back on unpin accor=
ding to the
> =C2=A0=C2=A0=C2=A0 bo's purgeable state at that time.
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 6921b6967330d..a752e01efbd75 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> [ ... ]
> > @@ -876,7 +878,8 @@ static void xe_bo_set_purgeable_shrinker(struct
> > xe_bo *bo,
> > =C2=A0		return;
> > =C2=A0
> > =C2=A0	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> > -	tt_pages =3D tt->num_pages;
> > +	/* Pinned bos are not accounted. Only update the purgeable
> > flag. */
> > +	tt_pages =3D xe_bo_is_pinned(bo) ? 0 : tt->num_pages;
>=20
> [Severity: High]
> Could this introduce a regression leading to a shrinker accounting
> underflow
> for native display BOs?
>=20
> Native display framebuffers are pinned for scanout via
> __xe_pin_fb_vma().
> Unlike imported BOs, this function calls ttm_bo_pin() directly
> without calling
> xe_ttm_tt_account_subtract():
>=20
> drivers/gpu/drm/xe/display/xe_fb_pin.c:__xe_pin_fb_vma() {
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_pin(&bo->ttm);
> =C2=A0=C2=A0=C2=A0 ...
> }

This is no longer the case. This issue is fixed in drm-tip.

/Thomas




>=20
> Because of this, their pages appear to remain actively accounted in
> the
> shrinker's shrinkable_pages bucket while pinned.
>=20
> If userspace sets MADV_DONTNEED on a display BO while it is pinned,
> won't this
> new check skip the page transfer from shrinkable_pages to
> purgeable_pages
> since xe_bo_is_pinned(bo) is true?
>=20
> It seems this skips the page transfer but still sets xe_tt->purgeable
> =3D true.
> When the display BO is later unpinned via __xe_unpin_fb_vma(), it
> calls
> ttm_bo_unpin() directly without adding pages back to the shrinker:
>=20
> drivers/gpu/drm/xe/display/xe_fb_pin.c:__xe_unpin_fb_vma() {
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 ttm_bo_unpin(&vma->bo->ttm);
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> When the BO is eventually unpopulated or destroyed, wouldn't
> xe_ttm_tt_account_subtract() see xe_tt->purgeable =3D=3D true and
> subtract the
> pages from the purgeable_pages bucket?
>=20
> Since the pages were never transferred, does this cause
> purgeable_pages to
> underflow and shrinkable_pages to remain permanently inflated?
