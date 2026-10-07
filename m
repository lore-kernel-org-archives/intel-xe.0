Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0D3CA5FF1
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 07:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0C410E505;
	Wed,  7 Oct 2026 07:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ogSpH9UG";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF6A10E502;
 Wed,  7 Oct 2026 07:17:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A1B784188F;
 Wed,  7 Oct 2026 07:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7E21F0089B;
 Wed,  7 Oct 2026 07:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791357453;
 bh=oru6efE/yTSl+Dykgr1ufj/8/mo1DiRzrSrQE2tU7oU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ogSpH9UG50gw4byFfOsUI3PzirVCMtfgFXmTsAutNFAO0mX8kFCwjfUJp+H1YCUpK
 HckCjQxWe0u5g3URZL6zB62BXxBpeWKwuP+z3WwxHdL2L99qy2CB0JzH/wbY7F6JIk
 iUx+CD/fTH26G5P4dMIF39uS4uvzplgEdJxE6r5FYpcHxQkI6ozSTnOHjo5oKYh6oY
 XkoHMIUQqpEVpkNOHVI9rs+1q23xH1Hp9VimfRTnhaQ1LyALg5x0Wjw3SB+J/lnwO+
 wkl6izGKje0QfZrKhfaDDBDSL3yJLfCWwztKaA1+2X7mxiLlw2C7Bu3C+oVDsp4ulu
 qp+4EFeCq4SSA==
Message-ID: <sashiko-outbox-162702@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/scaler: Prune YUV420 modes against the max
 source width
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20261007070601.3611674-1-arun.r.murthy@intel.com>
References: <20261007070601.3611674-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 07:17:32 +0000
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
- [Medium] drm/i915/scaler: missing vertical limit check for YUV420 modes
- [Medium] drm/i915/scaler: invalid joined pipe modes exposed due to skippe=
d scaler limit check
--

commit 59a282a072c72ed078bc3b442b7aded1b908a674
Author: Arun R Murthy <arun.r.murthy@intel.com>

drm/i915/scaler: Prune YUV420 modes against the max source width

This commit updates the YUV420 mode validation in skl_scaler_mode_valid to
check the horizontal dimension against max_w instead of max_h. This fixes an
issue where single-pipe YUV420 modes were being evaluated against the verti=
cal
scaler limits.

> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/=
i915/display/skl_scaler.c
> index 7994b983d509d..7e65c4fffbc0c 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -145,7 +145,7 @@ skl_scaler_mode_valid(struct intel_display *display,
> =20
>  	if (num_joined_pipes < 2 && output_format =3D=3D INTEL_OUTPUT_FORMAT_YC=
BCR420) {

[Severity: Medium]
By restricting this check to num_joined_pipes < 2, does this bypass the
scaler limit check for joined pipe modes?

When using Bigjoiner or Ultrajoiner (num_joined_pipes >=3D 2), the effective
per-pipe source width is mode->hdisplay / num_joined_pipes. If this effecti=
ve
width still exceeds max_w, the mode will pass mode_valid but fail later
during the atomic_check phase in skl_update_scaler, potentially causing a
failed modeset or black screen.

>  		skl_scaler_max_src_size(display, &max_w, &max_h);
> -		if (mode->hdisplay > max_h)
> +		if (mode->hdisplay > max_w)

[Severity: Medium]
Does this code also need to validate the vertical dimension against max_h?

The function skl_scaler_max_src_size populates both max_w and max_h, but on=
ly
the horizontal dimension is checked. On Display 11, a maximum height up to
4320 is allowed by intel_mode_valid_max_plane_size, but the scaler's max_h
limit is 4096.

If a YUV420 mode with a vdisplay greater than 4096 is evaluated, it will pa=
ss
this check but could fail with -EINVAL during atomic commit in
skl_update_scaler when src_h exceeds the scaler limits.

>  			return MODE_NO_420;
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007070601.3611=
674-1-arun.r.murthy@intel.com?part=3D1
