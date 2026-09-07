Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BC6C79F9F
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 17:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1492F10E04F;
	Mon,  7 Sep 2026 17:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kvs5a7z+";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5112A10E035;
 Mon,  7 Sep 2026 17:59:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DF8EE40E44;
 Mon,  7 Sep 2026 17:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865941F00A3A;
 Mon,  7 Sep 2026 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788803944;
 bh=QDdsYy8Y5oRtO8dimv0U6stgwX/nujHZjFKAMQdmJTQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=kvs5a7z+6D+KaphoCyGw6PwO10SsQqaB+H2lStKpB/1Sz6oOBiXZNWESu0sTOKl59
 G3iPiwZosuMnnNzAjkq0mZbGiLiumI6hAOxiq/FzCwtWjcQvfGjj4xUaLyWqv1cyBH
 xbMtcX8yRqnD/Jr+5Bq//oAVqYrqQh2bPRUi2wGTDOxlt+bmi9k0KLib+/MyrdxTHE
 dGC+u1dK6mc4/nGAOPDe/r4Gflu3TEwP3dOFmXMLFE9n5oD+AKJPQhTH/obcYzUKdd
 Pp6Ytam2p4elI5SVQDUOpmbmz/o0cSz+fLYwWup83BNWj0X8tkLh6DwEYKwJ4WSJro
 IdJFOF+AYYAeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/i915/dp_mst: Fix configuring TUs for a
 disconnected stream
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260907174413.741851-2-imre.deak@intel.com>
References: <20260907174413.741851-1-imre.deak@intel.com>
 <20260907174413.741851-2-imre.deak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 17:59:04 +0000
Message-Id: <20260907175904.865941F00A3A@smtp.kernel.org>
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
- [High] NULL pointer dereference when accessing `crtc_state` for disconnec=
ted MST streams during a partial atomic commit.
--

commit 2c1463a6e51d57b066fd631411fc6eb110086a46
Author: Imre Deak <imre.deak@intel.com>

drm/i915/dp_mst: Fix configuring TUs for a disconnected stream

This commit fixes the TU configuration for a disconnected MST stream by reu=
sing
the maximum link BPP limit from the stream's old state. This ensures the li=
nk's
sum of TUs stays within limits instead of destroying the link state complet=
ely,
as userspace may disable them one-by-one in a deferred way.

Cc: stable@vger.kernel.org # v6.10+
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16073
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16384

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.c b/drivers/gpu/d=
rm/i915/display/intel_link_bw.c
> index b47474a3e9fec..e71e76d6fd3e0 100644
> --- a/drivers/gpu/drm/i915/display/intel_link_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_link_bw.c
> @@ -64,7 +64,8 @@ void intel_link_bw_init_limits(struct intel_atomic_stat=
e *state,
>  			intel_atomic_get_new_crtc_state(state, crtc);
>  		int forced_bpp_x16 =3D get_forced_link_bpp_x16(state, crtc);
> =20
> -		if (state->base.duplicated && crtc_state) {
> +		if ((state->base.duplicated && crtc_state) ||
> +		    intel_dp_mst_stream_disconnected(state, crtc)) {
>  			limits->max_bpp_x16[pipe] =3D crtc_state->max_link_bpp_x16;

[Severity: High]
Could this lead to a NULL pointer dereference in intel_link_bw_init_limits()
if crtc_state is NULL?

If userspace issues an atomic commit that modifies a non-routing property
on a disconnected connector, the connector is added to the atomic state
but its CRTC might not be. In this scenario, intel_atomic_get_new_crtc_stat=
e()
returns NULL.

Since intel_dp_mst_stream_disconnected() evaluates to true when the connect=
or
is unregistered, this block is entered even when crtc_state is NULL.

This results in an unconditional dereference of crtc_state when assigning
crtc_state->max_link_bpp_x16, which is reachable from unprivileged userspace
via the DRM atomic ioctl and could crash the system.

>  			if (intel_dsc_enabled_on_link(crtc_state))
>  				limits->link_dsc_pipes |=3D BIT(pipe);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907174413.7418=
51-1-imre.deak@intel.com?part=3D2
