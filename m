Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15483F43689
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 09:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB25A10E9A7;
	Fri, 17 Apr 2026 09:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7PdDNEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054E110E9A7;
 Fri, 17 Apr 2026 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776419018; x=1807955018;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=FqjJKCbnzgeqlT34UcLwgANEhSGcwH+VNQfLrI/b65Q=;
 b=N7PdDNEWQCdnvHPJEGVZ77aPQrXVSz3vGSlPYDTaUuZpJpw+r75RNYPG
 a/BrPVMThvTOQfPNVynNxvmM3OUOmr5JMK/NeMOYg8U6QyM03MkCnLhD3
 OKE2i8ib1e/cos3G6cMecoMmHihVtwGZlNGXAIslecJdnL/ogSqgUN105
 LmLMU5qTjIHwdCFL4kco7U4QeVbVzgo3Wjv66ZnmkGzpEXyShY45neT2t
 a31TNnVbbI98jDhZPXisoVMu4wdm9Dz+Wz8OPhBASR00VGtYiHnLntuze
 aNLDE2PsQHpCvfZiQAZblVjXjbg2dxF0bu3bdX7o4VXHobLufNffIVFbl g==;
X-CSE-ConnectionGUID: CbZjLZYbSUSOC/lCRkJXsw==
X-CSE-MsgGUID: STsMVII0Tr+3urSsXWscZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="80022122"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="80022122"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 02:43:38 -0700
X-CSE-ConnectionGUID: Yuwwlm4RT9C/HdaydO72Zw==
X-CSE-MsgGUID: S0LEwKOHToaxgNdyf06GWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="232740658"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:43:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 05/11] drm/i915: Extract intel_plane_needs_low_address()
In-Reply-To: <20260416174448.28264-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416174448.28264-1-ville.syrjala@linux.intel.com>
 <20260416174448.28264-6-ville.syrjala@linux.intel.com>
Date: Fri, 17 Apr 2026 12:43:34 +0300
Message-ID: <84a494b55ca4f4d089056ba4c47df354fab6f971@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 16 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Extract the naked "gmch? -> need a low ggtt address" check into
> a more descriptive helper (intel_plane_needs_low_address()).
> The goal being to eliminate all display specific stuff from the
> low level pinning code.
>
> The actual implementation still abuses PIN_MAPPABLE to achieve
> this goal. I'm not entire convinced that this whole thing even
> needs to exist, and the original issue wasn't just caused by
> some other bug. But no time to dig into it right now, so let's
> keep going.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_plane.c | 13 +++++++++++++
>  drivers/gpu/drm/i915/display/intel_plane.h |  2 ++
>  drivers/gpu/drm/i915/i915_fb_pin.c         | 11 ++---------
>  3 files changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm=
/i915/display/intel_plane.c
> index f15dd9e91243..f41f4c2ac320 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -171,6 +171,19 @@ intel_plane_destroy_state(struct drm_plane *plane,
>  	kfree(plane_state);
>  }
>=20=20
> +bool intel_plane_needs_low_address(struct intel_display *display)
> +{
> +	/*
> +	 * Valleyview is definitely limited to scanning out the first
> +	 * 512MiB. Lets presume this behaviour was inherited from the
> +	 * g4x display engine and that all earlier gen are similarly
> +	 * limited. Testing suggests that it is a little more
> +	 * complicated than this. For example, Cherryview appears quite
> +	 * happy to scanout from anywhere within its global aperture.
> +	 */
> +	return HAS_GMCH(display);
> +}
> +
>  bool intel_plane_needs_physical(struct intel_plane *plane)
>  {
>  	struct intel_display *display =3D to_intel_display(plane);
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.h b/drivers/gpu/drm=
/i915/display/intel_plane.h
> index 5a8f2f3baab5..7fa7fbbb58dc 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.h
> +++ b/drivers/gpu/drm/i915/display/intel_plane.h
> @@ -15,6 +15,7 @@ struct drm_rect;
>  struct intel_atomic_state;
>  struct intel_crtc;
>  struct intel_crtc_state;
> +struct intel_display;
>  struct intel_dsb;
>  struct intel_plane;
>  struct intel_plane_state;
> @@ -79,6 +80,7 @@ int intel_plane_check_src_coordinates(struct intel_plan=
e_state *plane_state);
>  void intel_plane_set_invisible(struct intel_crtc_state *crtc_state,
>  			       struct intel_plane_state *plane_state);
>  void intel_plane_helper_add(struct intel_plane *plane);
> +bool intel_plane_needs_low_address(struct intel_display *display);
>  bool intel_plane_needs_physical(struct intel_plane *plane);
>  void intel_plane_init_cursor_vblank_work(struct intel_plane_state *old_p=
lane_state,
>  					 struct intel_plane_state *new_plane_state);
> diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i9=
15_fb_pin.c
> index 96ffc4b0d809..a3e5107c12f0 100644
> --- a/drivers/gpu/drm/i915/i915_fb_pin.c
> +++ b/drivers/gpu/drm/i915/i915_fb_pin.c
> @@ -140,16 +140,9 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *f=
b,
>=20=20
>  	atomic_inc(&i915->pending_fb_pin);
>=20=20
> -	/*
> -	 * Valleyview is definitely limited to scanning out the first
> -	 * 512MiB. Lets presume this behaviour was inherited from the
> -	 * g4x display engine and that all earlier gen are similarly
> -	 * limited. Testing suggests that it is a little more
> -	 * complicated than this. For example, Cherryview appears quite
> -	 * happy to scanout from anywhere within its global aperture.
> -	 */
>  	pinctl =3D 0;
> -	if (HAS_GMCH(display))
> +	/* PIN_MAPPABLE limits the address to GMADR size */
> +	if (intel_plane_needs_low_address(display))
>  		pinctl |=3D PIN_MAPPABLE;
>=20=20
>  	i915_gem_ww_ctx_init(&ww, true);

--=20
Jani Nikula, Intel
