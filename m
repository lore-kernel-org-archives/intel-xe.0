Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8182FD5F99
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 09:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9680810E5C7;
	Wed,  8 Apr 2026 09:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0t2zN8H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1E510E5C3;
 Wed,  8 Apr 2026 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775639367; x=1807175367;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=h5N3llxzif1LrIKAZsRK1Mn4fNTe4FDiP8ndj3BUjVw=;
 b=b0t2zN8HvZAuYL/497euBJAuev1ATxsXa9nuYu+M+igoZPwv7ZK661LE
 Mig7l87sybHmThJKIdrjfH4Tx1jRml+qcZNiOV+jzOSEslgOulbrV3n3y
 B/dHYh1YYX2TgvK86RsjR3q1A1gOIf/H36y2YxJF9oxaTmduvvHUHE/YR
 t4W3sb9Dy1GxLY+GvoAGXI1omBdyAdoX/PDp5uckPYryWe9hHzHmHQ0Ah
 ud9UxLyoQoZpGOMEpJHbcyU3FUQFZL64PEUnXO7P4PeBs4FJVoahZKlN3
 nJf5NvVWfD8+bE8xFiLs8bSzGxOWdMgfPpWJwP2Q0LFxSXn5N/IlkMpfW w==;
X-CSE-ConnectionGUID: P54jC5m2Tk62xJyMz2OJFA==
X-CSE-MsgGUID: VoQuw2JXS9yl+6TWhiC6sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="88001355"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="88001355"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:09:26 -0700
X-CSE-ConnectionGUID: Epv0wivNQo6QKBD0Uhy7GA==
X-CSE-MsgGUID: JclxXdwcQD+1vA9xBowzlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="233293341"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:09:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 12/12] drm/i915/fb: Use
 intel_fb_needs_pot_stride_remap() in intel_fb_view_init()
In-Reply-To: <20260407155053.32156-13-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
 <20260407155053.32156-13-ville.syrjala@linux.intel.com>
Date: Wed, 08 Apr 2026 12:09:22 +0300
Message-ID: <535ff3f898555517d3ea6f8b47422a07290cf91f@intel.com>
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

On Tue, 07 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace the open coded intel_fb_needs_pot_stride_remap() check
> inside intel_fb_view_init() with the real thing.
>
> The current check doesn't have the intel_fb_uses_dpt() in there, but
> that is the only situation when we use the remapped view, and thus
> was always implied.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fb.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index ceed695d3ad4..c4af368deffd 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -1627,13 +1627,14 @@ calc_plane_normal_size(const struct intel_framebu=
ffer *fb, int color_plane,
>=20=20
>  static void intel_fb_view_init(struct intel_display *display,
>  			       struct intel_fb_view *view,
> -			       enum i915_gtt_view_type view_type)
> +			       enum i915_gtt_view_type view_type,
> +			       const struct intel_framebuffer *fb)
>  {
>  	memset(view, 0, sizeof(*view));
>  	view->gtt.type =3D view_type;
>=20=20
>  	if (i915_gtt_view_is_remapped(&view->gtt) &&
> -	    (display->platform.alderlake_p || DISPLAY_VER(display) >=3D 14))
> +	    intel_fb_needs_pot_stride_remap(fb))
>  		view->gtt.remapped.plane_alignment =3D SZ_2M / PAGE_SIZE;
>  }
>=20=20
> @@ -1699,16 +1700,19 @@ int intel_fill_fb_info(struct intel_display *disp=
lay, struct intel_framebuffer *
>  	int i, num_planes =3D fb->base.format->num_planes;
>  	unsigned int tile_size =3D intel_tile_size(display);
>=20=20
> -	intel_fb_view_init(display, &fb->normal_view, I915_GTT_VIEW_NORMAL);
> +	intel_fb_view_init(display, &fb->normal_view,
> +			   I915_GTT_VIEW_NORMAL, fb);
>=20=20
>  	drm_WARN_ON(display->drm,
>  		    intel_fb_supports_90_270_rotation(fb) &&
>  		    intel_fb_needs_pot_stride_remap(fb));
>=20=20
>  	if (intel_fb_supports_90_270_rotation(fb))
> -		intel_fb_view_init(display, &fb->rotated_view, I915_GTT_VIEW_ROTATED);
> +		intel_fb_view_init(display, &fb->rotated_view,
> +				   I915_GTT_VIEW_ROTATED, fb);
>  	if (intel_fb_needs_pot_stride_remap(fb))
> -		intel_fb_view_init(display, &fb->remapped_view, I915_GTT_VIEW_REMAPPED=
);
> +		intel_fb_view_init(display, &fb->remapped_view,
> +				   I915_GTT_VIEW_REMAPPED, fb);
>=20=20
>  	for (i =3D 0; i < num_planes; i++) {
>  		struct fb_plane_view_dims view_dims;
> @@ -1835,8 +1839,9 @@ static void intel_plane_remap_gtt(struct intel_plan=
e_state *plane_state)
>  	u32 gtt_offset =3D 0;
>=20=20
>  	intel_fb_view_init(display, &plane_state->view,
> -			   drm_rotation_90_or_270(rotation) ? I915_GTT_VIEW_ROTATED :
> -							      I915_GTT_VIEW_REMAPPED);
> +			   drm_rotation_90_or_270(rotation) ?
> +			   I915_GTT_VIEW_ROTATED : I915_GTT_VIEW_REMAPPED,
> +			   intel_fb);
>=20=20
>  	src_x =3D plane_state->uapi.src.x1 >> 16;
>  	src_y =3D plane_state->uapi.src.y1 >> 16;

--=20
Jani Nikula, Intel
