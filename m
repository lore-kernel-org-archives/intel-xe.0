Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791F3C61DC6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 09:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C2B10F305;
	Fri, 28 Aug 2026 09:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nWNaAb8V";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E1910F305;
 Fri, 28 Aug 2026 09:07:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F276E411B1;
 Fri, 28 Aug 2026 09:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF641F000E9;
 Fri, 28 Aug 2026 09:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787908040;
 bh=EEEy1iOpNZjEFkc9zBP01BftB84fShafMMH9zDjHKt4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nWNaAb8V0RVEjiGsXu099/tfClO4CDKv7qsNM313S6ixel0AyhkH+ehNuRCKr+HDD
 VHPojzXx1AkVah2Mu2Hx+rychif4S8mpfnU2tnuFGE4iWsCVVS35JwQv3Hsyo86Fiq
 nfyMdMFeYXMLUmZTYDu8HJ+XKPBC3+gVS6BObz/9Mp4TLKwUkUoJBY2RR2GBuwAMpN
 PM+k7onvIcB+p2I3OzEdSO5UCjQw5seOEjYZm8KrdoVIKtGjWCBekTtJykUjV6JJyA
 7UMFDdW4EcZqZzunguVas11LrqdkbTBFLa1k/RdUL9T5gapdEGv8e93jNLpPEy1cU0
 jgo6YpWliYaEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] drm/i915/display: Add command line param for DC balance
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 09:07:20 +0000
Message-Id: <20260828090720.9FF641F000E9@smtp.kernel.org>
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
- [Medium] The `enable_dc_balance` module parameter is initialized to `fals=
e` (0), unintentionally disabling the VRR DC balancing feature by default a=
nd contradicting the intended default behavior.
--

commit ce08e2bbe0ea201e24fac54e608cc7792b588403
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

drm/i915/display: Add command line param for DC balance

This commit adds a new module parameter enable_dc_balance to allow enabling
or disabling the VRR DC balance feature at runtime. The DC balance
computation in intel_vrr_dc_balance_compute_config() is updated to honor
this parameter.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/driver=
s/gpu/drm/i915/display/intel_display_params.c
> index 2aed110c5b090..ed3aa84c5d43d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> @@ -120,6 +120,9 @@ intel_display_param_named_unsafe(enable_psr, int, 040=
0,
[ ... ]
> +intel_display_param_named_unsafe(enable_dc_balance, int, 0400,
> +	"Enable DC Balance (0=3Ddisabled, 1=3Denable). Default: 1 (use per-chip=
 default)");

[Severity: Medium]
The parameter documentation in intel_display_param_named_unsafe() states
that the default value is 1, but the underlying parameter definition sets
it to false.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/driver=
s/gpu/drm/i915/display/intel_display_params.h
> index b95ecf728daab..8c28c27e2c46c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> @@ -46,6 +46,7 @@ struct drm_printer;
[ ... ]
>  	param(int, enable_psr, -1, 0600) \
> +	param(int, enable_dc_balance, false, 0600) \

[Severity: Medium]
Does this unintentionally disable the VRR DC balance feature by default?
The macro initializes enable_dc_balance to false (0), contradicting the
intended default documented above.

> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index 51e4f3309b8b1..cfc0cfbff017a 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -386,10 +386,12 @@ static bool intel_vrr_dc_balance_possible(const str=
uct intel_crtc_state *crtc_st
>  static void
>  intel_vrr_dc_balance_compute_config(struct intel_crtc_state *crtc_state)
>  {
[ ... ]
> -	if (!intel_vrr_dc_balance_possible(crtc_state) || !crtc_state->vrr.enab=
le)
> +	if (!intel_vrr_dc_balance_possible(crtc_state) ||
> +	    !crtc_state->vrr.enable || !display->params.enable_dc_balance)
>  		return;

[Severity: Medium]
Because the parameter defaults to 0, !display->params.enable_dc_balance
evaluates to true here. Can this cause intel_vrr_dc_balance_compute_config()
to silently bail out early, disabling the feature by default on all
configurations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828085037.1430=
881-1-mitulkumar.ajitkumar.golani@intel.com?part=3D1
