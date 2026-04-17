Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF3FF43683
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 09:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEAD10E9AF;
	Fri, 17 Apr 2026 09:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRjmWJUk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1E410E9B0;
 Fri, 17 Apr 2026 09:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776419634; x=1807955634;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=eJHb0APK9BSueDkVdc0NXYn1d6NycAy2gyfrJuWEUsY=;
 b=iRjmWJUk0i0wZhSzi8gYSZMeH7PCkjB58BBqGCfzQLFKPrKpUbsIvIyW
 7AKkZFmXCC/mT/BsqQ/7sR6Jqi3B9RyuYazxtZB2LlkHZd09AixuWuN5L
 2dg+F0frF+pzdKg3/kDkP/k+whEtbjC8HPE2lCcj2rBD+VIbLOqW1hDkc
 tjNM0cuUb/qMoWEYgF4aRsR8aRnjxFYNxc8vmCqdNQZiDAUjv0qaupyCe
 9l/euU2RdT/XI6QF1lDQsGY2JgpCZHB0QvsUcEkVJ7YpbeMsb8c/vk0m8
 pl/QEne293y11xBgQ20pJWtgTxa3vQLVN37fg+SAkgblYajxY0SGuqa9/ w==;
X-CSE-ConnectionGUID: VgCAlzRBQFGIg196Tzourw==
X-CSE-MsgGUID: wGiOVYf+RTOHJfuzA+VVPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="100081239"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="100081239"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 02:53:53 -0700
X-CSE-ConnectionGUID: zbwTSwKIRjSvhUip5aim3A==
X-CSE-MsgGUID: tG/am9OYRa+TnnMBghhaWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="226315345"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:53:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 08/11] drm/i915: Extract intel_plane_needs_fence()
In-Reply-To: <20260416174448.28264-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416174448.28264-1-ville.syrjala@linux.intel.com>
 <20260416174448.28264-9-ville.syrjala@linux.intel.com>
Date: Fri, 17 Apr 2026 12:53:49 +0300
Message-ID: <152cb351e44f2e6362267b24709f7461e8f76a31@intel.com>
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
> Extract the naked DISPLA_VER<4 checks into a descriptive little
> helper (intel_plane_needs_fence()).

*DISPLAY_VER

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> And while at it document the reason why the check is what it is.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb.c    | 2 +-
>  drivers/gpu/drm/i915/display/intel_plane.c | 9 +++++++++
>  drivers/gpu/drm/i915/display/intel_plane.h | 1 +
>  drivers/gpu/drm/i915/i915_fb_pin.c         | 2 +-
>  4 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index cbeb39ebdb73..1c0859d5f829 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -1287,7 +1287,7 @@ bool intel_plane_uses_fence(const struct intel_plan=
e_state *plane_state)
>  	struct intel_display *display =3D to_intel_display(plane_state);
>  	struct intel_plane *plane =3D to_intel_plane(plane_state->uapi.plane);
>=20=20
> -	return DISPLAY_VER(display) < 4 ||
> +	return intel_plane_needs_fence(display) ||
>  		(plane->fbc && !plane_state->no_fbc_reason &&
>  		 i915_gtt_view_is_normal(&plane_state->view.gtt));
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm=
/i915/display/intel_plane.c
> index f41f4c2ac320..c2b58d3b9c23 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -192,6 +192,15 @@ bool intel_plane_needs_physical(struct intel_plane *=
plane)
>  		DISPLAY_INFO(display)->cursor_needs_physical;
>  }
>=20=20
> +bool intel_plane_needs_fence(struct intel_display *display)
> +{
> +	/*
> +	 * pre-i965 planes use the fence for tiled scanout.
> +	 * i965+ planes have their own tiled scanout control bit.
> +	 */
> +	return DISPLAY_VER(display) < 4;
> +}
> +
>  bool intel_plane_can_async_flip(struct intel_plane *plane,
>  				const struct drm_format_info *info,
>  				u64 modifier)
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.h b/drivers/gpu/drm=
/i915/display/intel_plane.h
> index 7fa7fbbb58dc..7b5456f56f42 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.h
> +++ b/drivers/gpu/drm/i915/display/intel_plane.h
> @@ -82,6 +82,7 @@ void intel_plane_set_invisible(struct intel_crtc_state =
*crtc_state,
>  void intel_plane_helper_add(struct intel_plane *plane);
>  bool intel_plane_needs_low_address(struct intel_display *display);
>  bool intel_plane_needs_physical(struct intel_plane *plane);
> +bool intel_plane_needs_fence(struct intel_display *display);
>  void intel_plane_init_cursor_vblank_work(struct intel_plane_state *old_p=
lane_state,
>  					 struct intel_plane_state *new_plane_state);
>  int intel_plane_add_affected(struct intel_atomic_state *state,
> diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i9=
15_fb_pin.c
> index bfe9a5342e13..a8ed888183cb 100644
> --- a/drivers/gpu/drm/i915/i915_fb_pin.c
> +++ b/drivers/gpu/drm/i915/i915_fb_pin.c
> @@ -188,7 +188,7 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
>  		 * mode that matches the user configuration.
>  		 */
>  		ret =3D i915_vma_pin_fence(vma);
> -		if (ret !=3D 0 && DISPLAY_VER(display) < 4) {
> +		if (ret !=3D 0 && intel_plane_needs_fence(display)) {
>  			i915_vma_unpin(vma);
>  			goto err_unpin;
>  		}

--=20
Jani Nikula, Intel
