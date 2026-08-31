Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17947C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 12:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03CC10E79F;
	Mon, 31 Aug 2026 12:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M8JOYpm5";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084EF10E279;
 Mon, 31 Aug 2026 12:52:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C90D843D76;
 Mon, 31 Aug 2026 12:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF4C1F000E9;
 Mon, 31 Aug 2026 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788180760;
 bh=EnAG3PY1YyLtLuqbjX0xy1wQZbgJpKf8yP1hh99Xgz0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=M8JOYpm5JbyEflnprIuctiAnaOY0U2uHV3M+h87kun18/MUSzlMYNEhZ6a433pkXW
 tm7LlkATlfHeIvjo9p9cXVnhB6q5ZJy//smFs8xnnD4OV7zI+O63JFHegHSvvKUIIv
 yCXHOXNuwDzXs4SCqbMo8aUziTNsQweZiftw/2i/TR4r/vvL+w6NlVt9xPaJgOOjNK
 2mrxErE3MyhT/xOYkPGLInYlFMdjd1YtBfjR8xCRmu2+E3mqmQoGc8qgT+i1KP2Vkm
 uSAoY7qD0TynSJ99yCpQaYTHEYfzJiSOmt8UtqXPydPTT9e5wNb4FDiPyE0N4oE1iD
 iQDN+x6s9S20g==
From: sashiko-bot@kernel.org
Subject: Re: [v3 4/4] drm/i915/display: Gate periodic AS SDP skip frames
 behind a module parameter
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260831125914.1736501-5-uma.shankar@intel.com>
References: <20260831125914.1736501-1-uma.shankar@intel.com>
 <20260831125914.1736501-5-uma.shankar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:52:39 +0000
Message-Id: <20260831125240.8DF4C1F000E9@smtp.kernel.org>
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
- [Medium] Time-Of-Check to Time-Of-Use (TOCTOU) race condition due to eval=
uating a writable module parameter (`periodic_assdp_enable`) dynamically du=
ring both the `atomic_check` and `atomic_commit` phases.
--

commit c6beee35e1043bf1a9c47428a8b14e66a470f378
Author: Uma Shankar <uma.shankar@intel.com>

drm/i915/display: Gate periodic AS SDP skip frames behind a module parameter

This commit adds a periodic_assdp_enable module parameter to optionally ena=
ble
periodic AS SDP (skip frames) for Panel Replay. The feature is disabled by
default and gated dynamically inside intel_pr_as_sdp_skip_frames().

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c

[ ... ]

> @@ -392,11 +392,16 @@ static u32 get_pr_alpm_as_sdp_transmission_time(con=
st struct intel_crtc_state *c
>   */
>  static u32 intel_pr_as_sdp_skip_frames(struct intel_dp *intel_dp)
>  {
> +	struct intel_display *display =3D to_intel_display(intel_dp);
>  	const struct drm_display_info *info =3D
>  		&intel_dp->attached_connector->base.display_info;
>  	int max_vrefresh =3D info->monitor_range.max_vfreq;
>  	int min_vrefresh =3D info->monitor_range.min_vfreq;
> =20
> +	/* Off by default; gated by the periodic_assdp_enable module parameter.=
 */
> +	if (!display->params.periodic_assdp_enable)
> +		return 0;

[Severity: Medium]
Since the module parameter is writable at runtime (0600), could reading it
dynamically here introduce a race condition between the atomic_check and
atomic_commit phases?

The commit message notes this function serves as a choke point for both the
DC3co force-disable predicate (evaluated during check phase in=20
intel_display_power_dc3co_compute()) and PR_ALPM_CTL programming (evaluated
during commit phase in intel_alpm_configure_pr_as_sdp()).

If a user with root privileges changes the sysfs parameter from 0 to 1 after
the check phase completes but before hardware programming begins, could
the driver program the hardware inconsistently? For example, by keeping DC3=
co
enabled but also enabling AS SDP skip frames, which are documented as
incompatible?

Should this parameter be read once during the atomic check phase and cached
in the crtc_state to guarantee consistency across the DRM atomic pipeline?

> +
>  	if (min_vrefresh <=3D 0 || max_vrefresh <=3D min_vrefresh)
>  		return 0;
> =20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/driver=
s/gpu/drm/i915/display/intel_display_params.c
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c

[ ... ]

> @@ -139,6 +139,12 @@ intel_display_param_named_unsafe(enable_dmc_wl, int,=
 0400,
>  	"(-1=3Duse per-chip default, 0=3Ddisabled, 1=3Denabled, 2=3Dmatch any r=
egister, 3=3Dalways locked) "
>  	"Default: -1");
> =20
> +intel_display_param_named_unsafe(periodic_assdp_enable, bool, 0600,
> +	"Enable periodic Adaptive-Sync SDP (AS SDP skip frames) for Panel Repla=
y "
> +	"to drive the panel down to its minimum refresh rate "
> +	"(0=3Ddisabled, 1=3Denabled) "
> +	"Default: 0");

[Severity: Medium]
Is it intentional to expose this as a writable parameter with 0600=20
permissions given the potential time-of-check to time-of-use issues=20
mentioned above?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831125914.1736=
501-1-uma.shankar@intel.com?part=3D4
