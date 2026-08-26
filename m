Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74B0C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9333010E08A;
	Wed, 26 Aug 2026 13:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VTqnxgkI";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACE110E08A;
 Wed, 26 Aug 2026 13:58:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9B0C7600C4;
 Wed, 26 Aug 2026 13:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296981F000E9;
 Wed, 26 Aug 2026 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787752694;
 bh=4IojL/QOaGX7vSEPcNz75KZfhSbL0zzGR/sog/fZgIg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=VTqnxgkIEi/6BP1fUuUYl8EfpxwQEvkyl06az+REEw5E6mFbF4wH+AzbVdP3yA0nB
 wtkgdTvR9MzB9pke0vUiC/LoSZzET2gEhheypNjJK2y+wDzyq6yErL0XPoLLCQ+P53
 8CACjXCrDS98/2Dwnm+xMJnPDd27Kq/+y10zMqTH3/Nmg7/BtVZMfDPgzGqpv48Nqn
 7WLkjYcUsbmyJ8PdUHhKq1S7Xhd5EgwNMKPzMlUwAfnGr3YlsoXxAKxMUTauMt+sng
 t0iF74ZHxkq1/hV8ReT3gUIqv093zdAYt6r7VuPgwU9nSvJi1UleV+eS3R0Be4SAz/
 l4Atr1YPIbgWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/14] drm/i915/cdclk: Notify DG2 pcode about pipe
 power wells regardless of CDCLK
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260826134033.13976-5-ville.syrjala@linux.intel.com>
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
 <20260826134033.13976-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 13:58:13 +0000
Message-Id: <20260826135814.296981F000E9@smtp.kernel.org>
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
- [High] The function `dg2_power_well_count` incorrectly returns a `bool` i=
nstead of an integer type, causing the active pipe count to be silently tru=
ncated to 1 for any multi-pipe configuration. This breaks the new equality =
checks introduced in this patch, preventing PCODE notifications during mult=
i-pipe display transitions.
--

commit fcc366768f01016ec317b427777b27612fa4fe66
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/cdclk: Notify DG2 pcode about pipe power wells regardless of CDCLK

This patch updates the early return logic in CDCLK pre/post plane update
functions. It ensures DG2 pcode notifications are sent when pipe power well
counts change, even if the actual CDCLK remains unchanged.

> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index d96067d7346b7..570c257626066 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2841,7 +2841,9 @@ intel_set_cdclk_pre_plane_update(struct intel_atomi=
c_state *state)
>  		return;
> =20
>  	if (!intel_cdclk_changed(&old_cdclk_state->actual,
> -				 &new_cdclk_state->actual))
> +				 &new_cdclk_state->actual) &&
> +	    dg2_power_well_count(display, old_cdclk_state) =3D=3D
> +	    dg2_power_well_count(display, new_cdclk_state))

[Severity: High]
This isn't a bug introduced by this patch, but does this new equality check
work correctly given the return type of dg2_power_well_count()?

Looking at dg2_power_well_count() in intel_cdclk.c:

static bool dg2_power_well_count(struct intel_display *display,
				 const struct intel_cdclk_state *cdclk_state)
{
	return display->platform.dg2 ? hweight8(cdclk_state->active_pipes) : 0;
}

Because it returns a bool instead of an integer type, any non-zero pipe cou=
nt
returned by hweight8() will be truncated to 1 (true).

If a user transitions between non-zero active pipe counts (for example, goi=
ng
from 1 to 2 pipes during a hotplug), the check will evaluate to true =3D=3D=
 true.

Could this falsely trigger the early return and skip the required pcode
notification on DG2?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826134033.1397=
6-1-ville.syrjala@linux.intel.com?part=3D4
