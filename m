Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5E9C624C6
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 12:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B8B10E279;
	Mon, 31 Aug 2026 12:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JQi+5vKw";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB8B10E279;
 Mon, 31 Aug 2026 12:52:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 83B4043C06;
 Mon, 31 Aug 2026 12:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F951F000E9;
 Mon, 31 Aug 2026 12:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788180761;
 bh=EfsSWZU8tfbdEm3gpRV51YCM+EYBKgdHZCiczKN6qYQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JQi+5vKwZYSmKKFvzCqovKr5U5wX4erfr+0VhXQEqBvO8/3meGG2Fvma7Ow+rAd+8
 QsY94akUkC0xPLRzJCSUEXx9dSJKsp6dTKCWw4Qu3W5TLQIpEc06sR3BioQxBWW32O
 45CtXg7+4nkWsqRMQQLOh9BVhK2FIDrF+laW+YOWf3/BBJ5c5aNYBAfnjJ/Yhm5c+m
 QFoScSw2pjDD50ZRhGhp1ypNa7c7QtYAFkUE2EMtFj2ZCc+yvew3HNybD830mYLYZr
 O6/aO70aueBGdTMlkzfDNwjvqcuSlMmwpkNKa8PaE9HE4yhKeof7UYiQHtlIf+BnSy
 Kvel6bYda45XA==
From: sashiko-bot@kernel.org
Subject: Re: [v3 1/4] drm/i915/display: Enable periodic AS SDP skip frames
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260831125914.1736501-2-uma.shankar@intel.com>
References: <20260831125914.1736501-1-uma.shankar@intel.com>
 <20260831125914.1736501-2-uma.shankar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:52:40 +0000
Message-Id: <20260831125241.38F951F000E9@smtp.kernel.org>
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
- [Medium] Mismatch between commit message/comments and display version che=
ck for Xe3LPD platforms.
--

commit e8820000c4c1f603b4949f4796b99e1267661c09
Author: Uma Shankar <uma.shankar@intel.com>

drm/i915/display: Enable periodic AS SDP skip frames

This commit enables periodic Adaptive-Sync SDP (AS SDP) skip frames to allow
the transcoder to drive the panel down to its minimum refresh rate when Pan=
el
Replay is active. It programs a hardware skip-frame counter in PR_ALPM_CTL
so that one AS SDP is followed by a number of idle frames based on the pane=
l's
refresh rate range.

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index f1383764b7028..d1f6bb82e35ef 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c

[ ... ]

> @@ -399,16 +428,37 @@ static void lnl_alpm_configure(struct intel_dp *int=
el_dp,
> =20
>  		if (intel_dp->as_sdp_supported) {
>  			u32 pr_alpm_ctl =3D get_pr_alpm_as_sdp_transmission_time(crtc_state);
> +			u32 skip_frames =3D 0;
> +
> +			/*
> +			 * AS SDP skip frames field only exists on Xe3LPD+, and
> +			 * periodic AS SDP is only used when VRR is not actively
> +			 * driving the refresh rate.
> +			 */
> +			if (DISPLAY_VER(display) >=3D 35 && !crtc_state->vrr.enable)
> +				skip_frames =3D intel_pr_as_sdp_skip_frames(intel_dp);

[Severity: Medium]
Does this code inadvertently disable the feature on Xe3LPD hardware?

The comment explicitly mentions that the AS SDP skip frames field exists on
Xe3LPD+, which has a display version of 30. However, lnl_alpm_configure()
checks if DISPLAY_VER(display) >=3D 35.

This mismatch means the skip frame calculation will be bypassed for Xe3LPD
devices (Panther Lake), disabling the optimization on the platform it was
intended for.

Should this version check be updated to 30 instead of 35 to match the comme=
nt?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831125914.1736=
501-1-uma.shankar@intel.com?part=3D1
