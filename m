Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5B1C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8F010ED55;
	Wed, 26 Aug 2026 13:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jqDfthw1";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AC610ED53;
 Wed, 26 Aug 2026 13:52:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1B626600C4;
 Wed, 26 Aug 2026 13:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9162B1F000E9;
 Wed, 26 Aug 2026 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787752371;
 bh=aYf+75P6fj3zvzbXcq+smPqt1bwMMz9r02tPaFnYzBo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jqDfthw1SgMJti4U5LiEVGnqpUcwP+WuJ5SHowpf1+1Zy7Dmuhv8voLPdWwVvSvdL
 zr9bGDfGJUJoWKIZCtlKjWyA9PkSP7Y2wB1I+ieYu4d7ba6BZyY5XiPUZW7cw7UYPS
 /84v53t0iOCIalpDecLuz9Mf7FBLf9/vMwYJyoagOEKWa0vxo4F2cJjIKrgkVlZl0i
 xZOeXr5jJ5ase2xn9fE+QEo56U6XgoePri7gacxmwuHxx7/w4G+DZOaEotOctEmwDf
 XNAv0/P1kCD0rfeplo2N2AxUnDCvXynHtZvhtI8lhKS5zcem1g3FfkUvtURwDcPSty
 Ts1I5rnJXttrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/14] drm/i915/dg2: s/intel_/dg2_/ for DG2 specific
 stuff
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260826134033.13976-8-ville.syrjala@linux.intel.com>
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
 <20260826134033.13976-8-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 13:52:51 +0000
Message-Id: <20260826135251.9162B1F000E9@smtp.kernel.org>
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

Pre-existing issues:
- [High] The function `dg2_power_well_count` calculates the number of activ=
e pipes using `hweight8`, but incorrectly returns a `bool` instead of an in=
teger type. This silently truncates multi-pipe counts (e.g., 2, 3, 4) to 1 =
(`true`), breaking change detection logic and passing incorrect active pipe=
 counts to PCODE.
--

commit 2a634fe51c790d63b4660ef53fd78180cce30920
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/dg2: s/intel_/dg2_/ for DG2 specific stuff

This commit renames DG2-specific functions in intel_cdclk.c to use the dg2_
namespace. It updates intel_pcode_*notify() functions to
dg2_cdclk_pcode_notify() and its pre/post variants.

> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index 1712ddea87dee..d59b187ef5365 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
[ ... ]
> @@ -2715,7 +2712,7 @@ static bool dg2_power_well_count(struct intel_displ=
ay *display,
>  	return display->platform.dg2 ? hweight8(cdclk_state->active_pipes) : 0;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but is it intentional that
dg2_power_well_count returns a bool rather than an integer type?

Since the function uses hweight8 to count the active pipes, returning a bool
silently truncates multi-pipe counts (e.g., 2, 3, 4) to 1 (true). This seems
to break change detection logic and pass incorrect active pipe counts to
PCODE.

Because the pipe count is coerced to a boolean, transitions from 1 pipe to 2
pipes evaluate as true =3D=3D true (causing the driver to incorrectly skip
notifying PCODE of the change) and true > true evaluates to false.
Furthermore, when PCODE is notified, it receives a maximum pipe count of 1.

Could this failure to notify PCODE of additional active pipes result in
display power starvation, hardware hangs, or malfunctioning multi-display
configurations on DG2 hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826134033.1397=
6-1-ville.syrjala@linux.intel.com?part=3D7
