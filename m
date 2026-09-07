Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5104BC79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 04:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE26510E5DD;
	Mon,  7 Sep 2026 04:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S8n+V2QQ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DF110E5DD;
 Mon,  7 Sep 2026 04:32:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8A3954078B;
 Mon,  7 Sep 2026 04:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446601F00A3A;
 Mon,  7 Sep 2026 04:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788755526;
 bh=90P3nh68ElzjdHncuCro4wjyyHliux1Xcp60FItWhHc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=S8n+V2QQMc7lj1I6gwazkZC7K5jzox/WzOEWT/5djoZ26obLk5UQQqqJGZ/lsmmgy
 Auy2xV46Fgsg2SkzTKGA7UBIEy5L4KEDJlvMZmAeSpxJAttWlaTqPTSKt5w+caBVgu
 MCDdq2Nt47DYP6IQadmFv90jPyEkq3i0Q/oH1OkwooQiBAV/OGxTgzXGzvDZB143I4
 KbV6fOTdGaQEfEAUboAtlKcYPq9ZoaA9vYA3IA52e6LgYyUEgPiJMFaYkkGdgxYohp
 RHCl+X6rcWNylVZzayP1bt3zyPde+izKlhK/ICxO06MZYDnetb0r27dYQQww46kjdW
 UoSMvr9vThkiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/i915/display: Limit SEL_FETCH clear to supported
 pipes
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260907042142.3114009-1-nemesa.garg@intel.com>
References: <20260907042142.3114009-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 04:32:05 +0000
Message-Id: <20260907043206.446601F00A3A@smtp.kernel.org>
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
- [Low] The patch introduces a build failure by using an undeclared variabl=
e `crtc_state` in function bodies without updating their signatures.
--

commit abf33fb81864e3a646619421c587c1bc7e6b1f3d
Author: Nemesa Garg <nemesa.garg@intel.com>

drm/i915/display: Limit SEL_FETCH clear to supported pipes

This commit limits the clearing of selective fetch registers to pipes that
actually support them. It avoids unclaimed register access warnings by
checking the selective fetch enable state before clearing.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16876

> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/dr=
m/i915/display/intel_cursor.c
> index cce041e1da51d..aa662b2cdf42b 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -536,13 +536,7 @@ static void i9xx_cursor_disable_sel_fetch_arm(struct=
 intel_dsb *dsb,
>  	struct intel_display *display =3D to_intel_display(plane);
>  	enum pipe pipe =3D plane->pipe;
> =20
> -	/*
> -	 * Clear this whenever the hardware has selective fetch, not just when
> -	 * the current state uses it. The cursor may have been enabled with
> -	 * selective fetch earlier and had its enable bit orphaned when the
> -	 * feature was switched off.
> -	 */
> -	if (!HAS_PSR2_SEL_FETCH(display))
> +	if (!crtc_state->enable_psr2_sel_fetch)

[Severity: Low]
Does this cause a build failure? The variable crtc_state is used here but
isn't declared in the function signature for
i9xx_cursor_disable_sel_fetch_arm(). While the callers were updated to pass
crtc_state as a third argument, the function signature itself wasn't update=
d.

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers=
/gpu/drm/i915/display/skl_universal_plane.c
> index 5cda1ab90e40f..a7e2f44ebfca6 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -884,13 +884,7 @@ static void icl_plane_disable_sel_fetch_arm(struct i=
ntel_dsb *dsb,
>  	struct intel_display *display =3D to_intel_display(plane);
>  	enum pipe pipe =3D plane->pipe;
> =20
> -	/*
> -	 * Clear this whenever the hardware has selective fetch, not just when
> -	 * the current state uses it. The plane may have been enabled with
> -	 * selective fetch earlier and had its enable bit orphaned when the
> -	 * feature was switched off.
> -	 */
> -	if (!HAS_PSR2_SEL_FETCH(display))
> +	if (!crtc_state->enable_psr2_sel_fetch)

[Severity: Low]
Does this also cause a build failure? Similar to the cursor code above, the
function signature for icl_plane_disable_sel_fetch_arm() is missing the
crtc_state parameter, leading to an undeclared identifier error here and a
"too many arguments" error at the callers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907042142.3114=
009-1-nemesa.garg@intel.com?part=3D1
