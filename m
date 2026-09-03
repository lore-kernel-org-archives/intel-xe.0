Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D40C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F89B10F6A2;
	Thu,  3 Sep 2026 16:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E+hBHBMC";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5674F10F6A2;
 Thu,  3 Sep 2026 16:14:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 15BC54354A;
 Thu,  3 Sep 2026 16:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B818A1F000E9;
 Thu,  3 Sep 2026 16:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788452044;
 bh=v7RRaTcD0SkKI+BP+26ixaUvBt7ntNaFPYl8HXmU7Js=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=E+hBHBMCZBo9hmqRzSqOOTslXc6Q52R1qOrOs3dlm9do6OwFojpA8bHEJlBUcjcGP
 L1nKSr/kf4/oEBty/BW/7gXLU/2lv/mZQljaRiQiNQctu7pPid68gCDnxVfEyL1A+P
 afBWVnegaPwZpKTU0DSgKY6rSDqFMCLSTuMyPXlalimHHGJm9Jr4JgZ/PzXC9jC04j
 g0WVsXOuacW5YzOowd0+4PGFHmrOuw+A+KOQpN3wvtz3V/kqxoWPN9f+QFNIGgZqAb
 TiKp42v7SFXSThqR1mpRYVxEyXAVQX7snIIpopqItYQupGeLWkkfey5dpKD3oe2s23
 9wtAKvcGgp+Rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/i915/alpm: Add a quirk to keep the fast wake
 ahead of the IO buffer wake
To: "Jake Steinman" <j@metarealtyinc.ca>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260903131724.49496-1-j@metarealtyinc.ca>
References: <20260902162531.73598-1-j@metarealtyinc.ca>
 <20260903131724.49496-1-j@metarealtyinc.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 16:14:03 +0000
Message-Id: <20260903161403.B818A1F000E9@smtp.kernel.org>
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
- [Medium] LOBF guardband and vblank checks do not account for fast_wake_li=
nes, contrary to commit claims.
--

commit 7252754a9cb3de5dc35455a120dc90a19c62a9a4
Author: Jake Steinman <j@metarealtyinc.ca>
Subject: drm/i915/alpm: Add a quirk to keep the fast wake ahead of the IO b=
uffer wake

This commit introduces a DPCD quirk for the LG panel on Dell XPS 14/16
(Panther Lake) to ensure the ALPM fast wake starts strictly before the IO
buffer wake. It modifies the wake time formulas and updates PSR vblank
and guardband checks to account for the larger of the two wake times.

Link: https://lore.kernel.org/intel-gfx/20260902162150.58778-1-j@metarealty=
inc.ca/
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7521

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index f1383764b7028..79cce5b1fe9f2 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
[ ... ]
> @@ -238,8 +239,29 @@ bool intel_alpm_compute_params(struct intel_dp *inte=
l_dp,
[ ... ]
> +	if (DISPLAY_VER(display) >=3D 20 &&
> +	    intel_has_dpcd_quirk(intel_dp, QUIRK_ALPM_FAST_WAKE_AHEAD) &&
> +	    fast_wake_lines <=3D io_wake_lines) {
> +		if (io_wake_lines < max_wake_lines)
> +			fast_wake_lines =3D io_wake_lines + 1;
> +		else
> +			io_wake_lines =3D fast_wake_lines - 1;
> +	}
> +
> +	crtc_state->alpm_state.io_wake_lines =3D io_wake_lines;
> +	crtc_state->alpm_state.fast_wake_lines =3D fast_wake_lines;

[Severity: Medium]
Do the LOBF checks in intel_alpm.c also need to be updated to account for
fast_wake_lines when it exceeds io_wake_lines due to this quirk?

The commit message states we account for the larger of the two wake times
in the vblank and guardband checks, and the PSR checks in intel_psr.c
were successfully updated.

However, looking at intel_alpm_lobf_min_guardband() in intel_alpm.c:

    waketime_in_lines =3D max(crtc_state->alpm_state.io_wake_lines,
                            crtc_state->alpm_state.aux_less_wake_lines);

And similarly in intel_alpm_lobf_compute_config_late():

    if (intel_alpm_aux_less_wake_supported(intel_dp))
        waketime_in_lines =3D crtc_state->alpm_state.io_wake_lines;
    else
        waketime_in_lines =3D crtc_state->alpm_state.aux_less_wake_lines;

Could this underestimate the ALPM wake time requirements by 1 scanline for
LOBF on the quirked hardware, potentially allowing LOBF to be enabled when
the guardband or vblank duration is insufficient?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903131724.4949=
6-1-j@metarealtyinc.ca?part=3D1
