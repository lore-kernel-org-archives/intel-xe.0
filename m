Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D282EC98312
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C68D10E8EB;
	Thu, 24 Sep 2026 06:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jQX+LoGg";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEC310E8EB;
 Thu, 24 Sep 2026 06:05:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 70C33600AA;
 Thu, 24 Sep 2026 06:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81611F000FF;
 Thu, 24 Sep 2026 06:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790229936;
 bh=YIRM5Nf9BZiLpog3f8NaNJfrXysbiM+BMBzysLQVTPs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jQX+LoGgM9tVcmNOHbOqg7sAZliodZE1WxISu8DEV+wGmuXq+Tm31848P7rvBMfdm
 Jqnm+Qsjdts41/SzV+2rGuuLg/xMxQ2LhYDV+pEC5au809Oz3fQ14+z1c2iQlGEUaJ
 fMfU1ybHrjN6NnGyF1+XW8ptsV86CvNS6d/WGS6WiBwelljr4VqGHzEIKwb/KNxEIx
 djrKs8G3SllzBLtYsZeWmktRXKAY80o/GkqljGk5tScOazHCBAEyU7kxNgilW5dwgp
 /Y3pKfIuA0BjewRmfofFc4YUxTj4J/bBEATkb2vuVB5JAMXYzQluY/0oS6ODIL1M19
 5Ob0maZEkIv7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/i915/display: Don't require a 1:1 pipe to port
 mapping for DC3co
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260924055734.2138787-3-suraj.kandpal@intel.com>
References: <20260924055734.2138787-1-suraj.kandpal@intel.com>
 <20260924055734.2138787-3-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 06:05:35 +0000
Message-Id: <20260924060535.E81611F000FF@smtp.kernel.org>
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
- [Medium] drm/i915/display: DC3CO accidentally disabled for DISPLAY_VER > =
35
--

commit fe8edcc01c82523ff83cda52b4cdaab761f57f66
Author: Suraj Kandpal <suraj.kandpal@intel.com>

drm/i915/display: Don't require a 1:1 pipe to port mapping for DC3co

This commit relaxes the strict 1:1 pipe-to-port mapping requirement for DC3=
co
on Xe3p_LPD (DISPLAY_VER 35). It replaces the previous if/else conditional
with a simplified check to allow DC3co on eDP panels wired to non-matching
ports.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers=
/gpu/drm/i915/display/intel_display_power.c
> index 2e534ddb73479..d475e62e8f40b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -428,18 +428,14 @@ void intel_display_power_dc3co_update(struct intel_=
display *display, u32 trigger
>  static bool intel_dc3co_port_pipe_compatible(struct intel_dp *intel_dp,
>  					     const struct intel_crtc_state *crtc_state)
>  {
> +	struct intel_display *display =3D to_intel_display(intel_dp);
>  	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
>  	enum pipe pipe =3D to_intel_crtc(crtc_state->uapi.crtc)->pipe;
>  	enum port port =3D dig_port->base.port;
>  	int num_pipes =3D intel_crtc_num_joined_pipes(crtc_state);
> =20
> -	/* Need to follow 1:1 mapping because of CMTG restriction */
> -	if (DISPLAY_VER(to_intel_display(crtc_state)) =3D=3D 35)
> -		return num_pipes =3D=3D 1 &&
> -		       ((pipe =3D=3D PIPE_A && port =3D=3D PORT_A) ||
> -			(pipe =3D=3D PIPE_B && port =3D=3D PORT_B));
> -	else
> -		return num_pipes =3D=3D 1 && pipe <=3D PIPE_B && port <=3D PORT_B;
> +	return DISPLAY_VER(display) =3D=3D 35 && num_pipes =3D=3D 1 && pipe <=
=3D PIPE_B &&
> +		port <=3D PORT_B;

[Severity: Medium]
Will this inadvertently disable DC3co for platforms where DISPLAY_VER is
greater than 35?

By replacing the entire if/else block with a single return statement that
explicitly checks DISPLAY_VER(display) =3D=3D 35, it appears
intel_dc3co_port_pipe_compatible() will now unconditionally return false for
any future hardware with a version > 35.

Since the HAS_DC3CO() macro usually guards entry into DC3co paths for
platforms where DISPLAY_VER >=3D 35, does it make sense to drop the strict
version equality check here so that future platforms aren't unintentionally
restricted?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924055734.2138=
787-1-suraj.kandpal@intel.com?part=3D2
