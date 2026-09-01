Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B823DC624D6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 17:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1F210EDFE;
	Tue,  1 Sep 2026 17:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bb78nSa6";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAD910EDFE
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 17:42:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A81D46022D;
 Tue,  1 Sep 2026 17:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BE51F000E9;
 Tue,  1 Sep 2026 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788284563;
 bh=D865w3kO5m9WuWPU5QyCkQwgqAf5T3Xuta5qMW1hMbQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Bb78nSa6zgtDZafvD4dD+PAtAXN4cvYotbwck6NAh+Wo4TriaVMYBoOXf7xExgl81
 8RxfcaxtEW/QyMPD5WH1W0oMBFv8uS+pOHS/AcbxTkNAd685sa6FM8sOfNjPbTpnrY
 I4fFxdJ/z2T9hXjEwNETOGFKV6tDLGDxy5MjMJ95gkUsVupJpC26gyBSHH3UfW/55J
 2vB6hA3aPwqPS4ffZrAEQI2m/RhDnKoSH3BiV++RxK4AZ9r0WaSqyxiUskx9xnGSjj
 BTZ8Wao7LetbRXuU/GEt8ZYDmJnXhjwFjVSef7jf5GZHMKapA+6Pm+9nI879CQ8gem
 whI4wSwAN28Kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] drm/xe/shrinker: Do not discard freed pages on
 error
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901173059.455469-2-shuicheng.lin@intel.com>
References: <20260901173059.455469-1-shuicheng.lin@intel.com>
 <20260901173059.455469-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 17:42:42 +0000
Message-Id: <20260901174243.32BE51F000E9@smtp.kernel.org>
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

New issues:
- [Medium] Returning `freed ? freed : lret` on error masks the error code i=
f pages were freed, causing the shrinker to inconsistently escalate to heav=
ier, blocking passes based on LRU object ordering.

Pre-existing issues:
- [High] The shrinker LRU walk aborts entirely upon encountering a single b=
usy or unshrinkable buffer object, rendering the reclaim process highly ine=
ffective and prone to starvation.
--

commit 79c697e63c32fe35a147fb885eb857cd09a270e8
Author: Shuicheng Lin <shuicheng.lin@intel.com>
drm/xe/shrinker: Do not discard freed pages on error

The patch updates the drm/xe shrinker to report the number of pages freed=20
when an error is encountered during the walk, instead of immediately=20
returning the error code. This aims to prevent the shrinker from incorrectl=
y=20
telling mm that it scanned without freeing any pages.

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -80,7 +80,7 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
> =20
>  			lret =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
>  			if (lret < 0)
> -				return lret;
> +				return freed ? freed : lret;

[Severity: High]
This isn't a bug introduced by this patch, but doesn't aborting the LRU=20
iteration entirely upon encountering an error cause the shrinker to starve?

If xe_bo_shrink() returns a benign error like -EBUSY on an unshrinkable=20
buffer object, the loop aborts and the unshrinkable buffer object remains=20
at the front of the LRU. Subsequent shrinker scans will repeatedly hit this=
=20
same buffer object and abort again under memory pressure, effectively=20
preventing the shrinker from reaching other eligible objects further down=20
the list.

Could __xe_shrinker_walk() handle benign errors like -EBUSY by using=20
continue instead of returning?

[ ... ]

> @@ -119,7 +119,7 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
>  	if (!ctx->no_wait_gpu) {
>  		lret =3D __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned);
>  		if (lret < 0)
> -			return lret;
> +			return freed ? freed : lret;

[Severity: Medium]
Does masking the inner walk error disrupt the shrinker's escalation logic?

By returning a positive value when freed > 0 despite hitting an internal=20
error, xe_shrinker_walk() interprets the result as a pure success. Since=20
*scanned < to_scan in this scenario, this causes the shrinker to=20
unpredictably escalate to heavier, blocking passes (like waiting for the=20
GPU or writebacks).=20

Conversely, if the exact same error is encountered before any pages are=20
freed (freed =3D=3D 0), the function returns a negative error and correctly=
=20
skips the heavier phases.=20

Does this create inconsistent reclaim behavior based entirely on whether=20
the error happened before or after freeing at least one page?

>  		freed +=3D lret;
>  		if (*scanned >=3D to_scan)
>  			return freed;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901173059.4554=
69-1-shuicheng.lin@intel.com?part=3D1
