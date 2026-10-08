Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36D1CA6002
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 04:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F54310FC24;
	Thu,  8 Oct 2026 04:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C9ubJLI0";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E93E10E72E;
 Thu,  8 Oct 2026 04:30:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DA34143F83;
 Thu,  8 Oct 2026 04:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A261F00893;
 Thu,  8 Oct 2026 04:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791433819;
 bh=/HHVk5HnDsPWhDZcZ8iRjQlrITxer2HpUHmDNbMlT6U=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=C9ubJLI01FeU6NzAFOdvJm1jtmLktoe9sAS1Ki4ODuv66gvUC06KHaTgXicpH+3YA
 Zql8znRuWqahXHRCXCsQjqpOpjBUETm3Z76/AKPSTvYoY5cmNt3P2kyLl2lk/vTKsD
 1k/MRa/5jRWdO0pZ5DTfXMa6HJsLiAq3oRp2iDgDDJkvsW6zcn5ymTy59FqdBbgggP
 ubPTCUsYyOo+z9nY0sUHSn7lrN6Q/h2ts81qOUayEh4XWgWglZ6t+T47cmNcfbtqq+
 W8mR3KHkHrBMYPRcH0ulqi+fcT/OFEaZs0nsreBMxnRc8wXdzWv32IdZOvu/WDu8wI
 IHeK8FlUsvefw==
Message-ID: <sashiko-outbox-163611@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/scaler: Prune YUV420 modes against the max
 source width
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261008041809.3674538-1-arun.r.murthy@intel.com>
References: <20261008041809.3674538-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 04:30:19 +0000
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
- [Low] drm/i915/scaler: missing vdisplay check against scaler max_h for YU=
V420
--

commit 3cf07aa18b1a8b7c70fe1209cb20db9d2d636b86
Author: Arun R Murthy <arun.r.murthy@intel.com>

drm/i915/scaler: Prune YUV420 modes against the max source width

This commit fixes skl_scaler_mode_valid() to compare the mode's horizontal
resolution against the scaler's maximum width instead of the maximum height.
This prevents single-pipe YUV420 modes from being improperly pruned against
the wrong limit.

> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/=
i915/display/skl_scaler.c
> index 7994b983d509d..7e65c4fffbc0c 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -145,7 +145,7 @@ skl_scaler_mode_valid(struct intel_display *display,
> =20
>  	if (num_joined_pipes < 2 && output_format =3D=3D INTEL_OUTPUT_FORMAT_YC=
BCR420) {
>  		skl_scaler_max_src_size(display, &max_w, &max_h);
> -		if (mode->hdisplay > max_h)
> +		if (mode->hdisplay > max_w)
>  			return MODE_NO_420;
>  	}

[Severity: Low]
Does this code also need to validate the vertical display size? It looks li=
ke
max_h is fetched from skl_scaler_max_src_size() but never validated against
mode->vdisplay.

If a YCbCr420 mode has a vdisplay that exceeds the scaler's maximum support=
ed
height, it appears it would pass early mode pruning here, but any attempt to
set it would fail later with -EINVAL during the atomic commit phase in
skl_update_scaler(). For example, on Gen11 platforms, max_h is capped at
4096, but intel_mode_valid_max_plane_size() permits vdisplay up to 4320.
Should a check against max_h be added here as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008041809.3674=
538-1-arun.r.murthy@intel.com?part=3D1
