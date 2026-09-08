Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF10C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 07:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BB210EA74;
	Tue,  8 Sep 2026 07:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QY7kQdPG";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDBA10EA72;
 Tue,  8 Sep 2026 07:12:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id EDE6260A98;
 Tue,  8 Sep 2026 07:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661D91F00A3A;
 Tue,  8 Sep 2026 07:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788851524;
 bh=eBEkdTe3QQkVrKGrKcARzsQPuxXs+3jIclrXekB0tuU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=QY7kQdPGrJiGOEt1aqq1Rpp4BIg6Ywz10UcsnLCuTaYCrUEKGozI/xVvs+uWieBSi
 1DeI4Ti7Ka6kEKNi0Rb9Dsro5dybOJsAvV1/zbFFYIo3NkVUOBS55kBD8ZArl1WrZF
 vBOLuMgYLZRDCWzWPJqO9sc8/7z+e1uuQ3kVWjq3qeYA7vUVIgHquNNkQfD/wGpvtz
 lRjlRlSIP0wMqAUwOAzx9LVIHtBZhKAYIC4iHXvoOhIYi0R3oDGCB3VWYdnPDlWJOx
 eHdzAq0vbss1meZfVv5Lb7FrpkLnmUrBOVw83nKxCM3Dco3YEynFBoBhtNtl+/lS0h
 pdUGJ6PvRhxIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/12] drm/i915/dp: Introduce helpers to
 enable/disable CMN SDP Transmission line
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260908062224.2897987-11-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
 <20260908062224.2897987-11-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 07:12:03 +0000
Message-Id: <20260908071204.661D91F00A3A@smtp.kernel.org>
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
- [High] Using cmn_sdp_tl =3D=3D 0 as a condition to skip hardware programm=
ing incorrectly disables valid configurations where the base transmission l=
ine is exactly 0.
--

commit add857e2d6bd573b97121b3d862f0f6816f3b50e
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dp: Introduce helpers to enable/disable CMN SDP Transmission line

This commit introduces helper functions to enable and disable the Common SDP
Transmission Line (CMN_SDP_TL) and its stagger registers based on the
configuration stored in crtc_state.

> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i=
915/display/intel_dip.c
> index d1acc7eb5a391..0c80d6305feca 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
[ ... ]
> @@ -61,3 +63,57 @@ void intel_dip_sdp_transmission_line_get_config(struct=
 intel_crtc_state *crtc_st
> +void intel_dip_cmn_sdp_transmission_line_enable(const struct intel_crtc_=
state *crtc_state)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +	enum transcoder cpu_transcoder =3D crtc_state->cpu_transcoder;
> +	int gmp_stagger;
> +	int pps_stagger;
> +	int vsc_ext_stagger;
> +
> +	if (!crtc_state->dip.cmn_sdp_tl)
> +		return;

[Severity: High]
Does this incorrectly skip hardware programming for a valid configuration?

Since the transmission line can be computed as crtc_state->vrr.guardband - =
1,
if guardband evaluates to 1, cmn_sdp_tl becomes 0. Since 0 is a
mathematically valid 0-based register index, this early return will
incorrectly treat a valid base transmission line of 0 as disabled, skipping
the register programming entirely.

[ ... ]
> +void intel_dip_cmn_sdp_transmission_line_disable(const struct intel_crtc=
_state *old_crtc_state)
> +{
> +	struct intel_display *display =3D to_intel_display(old_crtc_state);
> +	enum transcoder cpu_transcoder =3D old_crtc_state->cpu_transcoder;
> +
> +	if (!old_crtc_state->dip.cmn_sdp_tl)
> +		return;

[Severity: High]
Similarly, does this skip disabling the transmission line if the valid
configured base transmission line was exactly 0?=20

If the base transmission line was initially programmed as 0, this early
return prevents the register from being cleared on disable.

> +
> +	intel_de_write(display, CMN_SDP_TL(display, cpu_transcoder), 0);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908062224.2897=
987-1-ankit.k.nautiyal@intel.com?part=3D10
