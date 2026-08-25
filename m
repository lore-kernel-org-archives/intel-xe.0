Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF31C61DB4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A689610E90C;
	Tue, 25 Aug 2026 06:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bWGd7LJi";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6733310E90B;
 Tue, 25 Aug 2026 06:38:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D275F6011F;
 Tue, 25 Aug 2026 06:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E111F000E9;
 Tue, 25 Aug 2026 06:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787639932;
 bh=6Eqzmble42tQqU3F0h6NVX4YUKtchuZ0UAgfry1cEQM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bWGd7LJi/iqGfstHea67jywyvs+XJ33u/O5z1lNUayiZ7wXbUV5QtA2ol1/pvSlh+
 s+2eTR9RGOePopN3RD4bh0doYvY4JIie68FTXLZ000lS3YDqUd3X4B0AeCsu1yZ4Q7
 43tNUVRp5YKgpL9tQi21BfFGguM4vD7546tMpFJoDACP7gPJaI23UDaHA1QV2QJoXa
 Fdf+v752U1F2rxQvGGXPPUcy0uOI6TX5u8jfM52oh3tb/OKTibvW//+k62FNcS8t+4
 hvCygyR6zhao/i1uCOtMeV9DlDEo56EqBLrGu0ZNPIAZZOB4W1sMobaqQL6S8mhY5U
 tRgniILJQ9jUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/15] drm/i915/alpm: Enable debugfs for DP2.1
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260825054536.3455704-5-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-5-animesh.manna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:38:51 +0000
Message-Id: <20260825063852.53E111F000E9@smtp.kernel.org>
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

New issues:
- [Critical] Unconditional dereference of `connector->encoder` in ALPM debu=
gfs operations leads to a kernel crash on inactive DP MST connectors.

Pre-existing issues:
- [High] Use-After-Free of CRTC state and unsafe hardware register access i=
n `i915_edp_lobf_info_show`.
--

--- Patch [4]: [PATCH v5 04/15] drm/i915/alpm: Enable debugfs for DP2.1 ---
commit 92b26450255b1614cb8fb75394a055699100a23e
Author: Animesh Manna <animesh.manna@intel.com>

drm/i915/alpm: Enable debugfs for DP2.1

The commit enables ALPM debug information through LOBF debug info.
It replaces the DISPLAY_VER and DRM_MODE_CONNECTOR_eDP checks with a
common api check instead.

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 08ad77cd32f8c..8cfcda97cf588 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -617,11 +617,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_edp_lobf_debug_fops,
> =20
>  void intel_alpm_lobf_debugfs_add(struct intel_connector *connector)
>  {
> -	struct intel_display *display =3D to_intel_display(connector);
>  	struct dentry *root =3D connector->base.debugfs_entry;
> =20
> -	if (DISPLAY_VER(display) < 20 ||
> -	    connector->base.connector_type !=3D DRM_MODE_CONNECTOR_eDP)
> +	if (!intel_alpm_source_supported(connector))
>  		return;
> =20

[Severity: Critical]
Does relaxing this condition allow debugfs files to be created for dynamic =
MST
connectors?

If so, could this lead to a NULL pointer dereference in
i915_edp_lobf_debug_get() and i915_edp_lobf_debug_set()?

For MST connectors, connector->encoder is NULL until a mode is set. If the
debugfs files are accessed on an inactive MST connector, the unconditional
dereference:

drivers/gpu/drm/i915/display/intel_alpm.c:i915_edp_lobf_debug_get() {
    ...
    struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
    ...
}

would crash the kernel.

[Severity: High]
This is a pre-existing issue, but I noticed a potential use-after-free and
unsafe hardware register access in i915_edp_lobf_info_show().

When reading the debugfs file, i915_edp_lobf_info_show() accesses
crtc->base.state and ALPM_CTL:

drivers/gpu/drm/i915/display/intel_alpm.c:i915_edp_lobf_info_show() {
    ...
    crtc_state =3D to_intel_crtc_state(crtc->base.state);
    cpu_transcoder =3D crtc_state->cpu_transcoder;
    alpm_ctl =3D intel_de_read(display, ALPM_CTL(display, cpu_transcoder));
    ...
}

If this is read concurrently with a non-routing atomic commit (which can sw=
ap
and free crtc->state without connection_mutex), could this result in a
use-after-free?

Additionally, is it safe to read from the ALPM_CTL register without first
checking if the CRTC is active and acquiring a display power domain wakeref?

>  	debugfs_create_file("i915_edp_lobf_debug", 0644, root,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054536.3455=
704-1-animesh.manna@intel.com?part=3D4
