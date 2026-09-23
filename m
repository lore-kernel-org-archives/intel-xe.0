Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A63C98302
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 14:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9910F07B;
	Wed, 23 Sep 2026 14:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UBSgrKQg";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06E610F073;
 Wed, 23 Sep 2026 14:00:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2325F601FB;
 Wed, 23 Sep 2026 14:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35151F000FF;
 Wed, 23 Sep 2026 14:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790172049;
 bh=XvxyEFyoChu1F3k7Sb1iEgshJdY6HiIn9V80Br1EJVM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UBSgrKQgTagCG6bKoHA8E2kTaWi2bE/gZJBcSpwsv0/YMVYpHsQEnSHlOfb/LoUSi
 RlwLqGJR9jmAajyR427wlBr+ZOA8DpFR/ofzr+AB8nLaqHffCANTqvFmzfzGPo3dMn
 Ppf/HtqhzWT6YmiVpqs6GnTJIa1lwdvnjtDSRwzdlW68z0i/04CVTz3n2xwUO0Dtqe
 tl45p7ZyywrVyuqYjJbJehvSaStVFab2+OtYCrAlsFnmpFB3KK/ChQWykrhh63xiP/
 DSWEMwYIzv+mA3IxkYYGIKoWgfHsxkSipUPV10S8SLqt165Ot/UMJ6M5XPavm5jIox
 x6SWO+AREV9rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/display: Update the CMN_SDP_TL in fastset path
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260923133307.323439-1-ankit.k.nautiyal@intel.com>
References: <20260923133307.323439-1-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 14:00:49 +0000
Message-Id: <20260923140049.B35151F000FF@smtp.kernel.org>
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
- [Medium] drm/i915: missing stagger values in cmn_sdp_changed() during fas=
tset
--

commit ff9e34489c7caadda60fd7bbc48f29b27fcbfe10
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/display: Update the CMN_SDP_TL in fastset path

Commit bfa597238073 ("drm/i915/dip: Enable Common SDP Transmission line")
enabled the CMN_SDP_TL for the modeset path, but missed to add it to the
fastset path. This commit updates the CMN_SDP_TL register during fastsets
if it has changed, similar to EMP_AS_SDP_TL.

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index e3e0d2f8faefd..01604c4e8615c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
[ ... ]
> @@ -999,6 +1000,12 @@ static bool cmrr_params_changed(const struct intel_=
crtc_state *old_crtc_state,
>  		old_crtc_state->vrr.cmrr.cmrr_n !=3D new_crtc_state->vrr.cmrr.cmrr_n;
>  }
> =20
> +static bool cmn_sdp_changed(const struct intel_crtc_state *old_crtc_stat=
e,
> +			    const struct intel_crtc_state *new_crtc_state)
> +{
> +	return old_crtc_state->dip.cmn_sdp_tl !=3D new_crtc_state->dip.cmn_sdp_=
tl;
> +}
> +

[Severity: Medium]
Should cmn_sdp_changed() in drivers/gpu/drm/i915/display/intel_display.c al=
so
check other transmission line fields like gmp_sdp_tl, pps_sdp_tl, and
vsc_ext_sdp_tl?

intel_dip_cmn_sdp_transmission_line_enable() programs the CMN_SDP_TL_STGR_C=
TL
register using these stagger values. During a fastset taking over from BIOS,
if the BIOS programmed non-default stagger values but left the base cmn_sdp=
_tl
identical to the driver's default, cmn_sdp_changed() will return false.

Since intel_pipe_config_compare() ignores differences in these stagger fiel=
ds,
intel_dip_cmn_sdp_transmission_line_enable() would never be called to update
CMN_SDP_TL_STGR_CTL, leaving the hardware operating with the inherited BIOS
values.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923133307.3234=
39-1-ankit.k.nautiyal@intel.com?part=3D1
