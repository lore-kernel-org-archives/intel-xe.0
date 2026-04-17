Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB5AF43688
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 09:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1431210E9A7;
	Fri, 17 Apr 2026 09:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DpiefilB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5068310E9A7;
 Fri, 17 Apr 2026 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776419302; x=1807955302;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=rMYq6CrMTYWHCOTTLWXMyve9Bj5Y0ywkyLHOlWJwciU=;
 b=DpiefilBFVWC5JM3T1BT8OPlGUgiZlmha1TzqUCzouR4KsjSvl08XZ9d
 g7Mr/+4R70Sh3G2wx73/UDiO+VAhCg0i1d/jSugSFzIxKRLR/99zgbEcb
 9T0FzR4TB93VWbrOD+wyGshhnSM8qut/eBU47mATKSJiPRySlJl+uBXyf
 5UEIKiNwQzPFy06PNuTLIQlMn1tMz6VeIiUZLNpKPKmNJrkFGBLPJScyu
 LqNHwKrv+GlENZCb/x+HiYZ//E9PoUBMR0Y/HegmWwxYknG/fP6pmKieG
 H9KHQHjS3o0SmEVKHlTWRma/PYDyNNdpAg9k4JANQYYUch14Vb43B1Jsh A==;
X-CSE-ConnectionGUID: Erk39gLOTGSszP7xwIAkNg==
X-CSE-MsgGUID: Z9HAETT6SnGKePUvMvbOmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77303062"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77303062"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 02:48:22 -0700
X-CSE-ConnectionGUID: 9TcUNJc1RnenLYZuRWsKWA==
X-CSE-MsgGUID: QhZKiZsKSo6fCysmAmgZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="261403180"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:48:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 06/11] drm/i915: Introduce pin_params.needs_low_address
In-Reply-To: <20260416174448.28264-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416174448.28264-1-ville.syrjala@linux.intel.com>
 <20260416174448.28264-7-ville.syrjala@linux.intel.com>
Date: Fri, 17 Apr 2026 12:48:17 +0300
Message-ID: <db254fe20493c0ffa701db55c0233a6f75323338@intel.com>
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
> Add a new flag pin_params.needs_low_address to inform the pinning
> code that the display needs a low ggtt address.
>
> The goal is to eliminate all display specific stuff from
> the low level pinning code (the direct intel_plane_needs_low_addres())
> call in this case).

So this one initializes .needs_low_address only where needed. I guess my
main concern is that the calling code does need to know the low-level
implementation detail of when you do need to initialize it.

Regardless, I think overall this is going in the right direction.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb_pin.h | 1 +
>  drivers/gpu/drm/i915/display/intel_fbdev.c  | 2 ++
>  drivers/gpu/drm/i915/i915_fb_pin.c          | 4 +++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.h b/drivers/gpu/dr=
m/i915/display/intel_fb_pin.h
> index bcf5a1f46092..cf54a96569de 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.h
> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.h
> @@ -20,6 +20,7 @@ struct intel_fb_pin_params {
>  	unsigned int phys_alignment;
>  	unsigned int vtd_guard;
>  	bool needs_cpu_lmem_access;
> +	bool needs_low_address;
>  };
>=20=20
>  struct i915_vma *
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm=
/i915/display/intel_fbdev.c
> index 136fa827c8f0..4c3e54acde81 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -55,6 +55,7 @@
>  #include "intel_fb_pin.h"
>  #include "intel_fbdev.h"
>  #include "intel_frontbuffer.h"
> +#include "intel_plane.h"
>=20=20
>  struct intel_fbdev {
>  	struct intel_framebuffer *fb;
> @@ -314,6 +315,7 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_help=
er *helper,
>  	pin_params.vtd_guard =3D intel_fb_view_vtd_guard(&fb->base,
>  						       &fb->normal_view,
>  						       DRM_MODE_ROTATE_0);
> +	pin_params.needs_low_address =3D intel_plane_needs_low_address(display);
>=20=20
>  	vma =3D intel_fb_pin_to_ggtt(&fb->base, &pin_params, NULL);
>  	if (IS_ERR(vma)) {
> diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i9=
15_fb_pin.c
> index a3e5107c12f0..97e4cdfd2447 100644
> --- a/drivers/gpu/drm/i915/i915_fb_pin.c
> +++ b/drivers/gpu/drm/i915/i915_fb_pin.c
> @@ -142,7 +142,7 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
>=20=20
>  	pinctl =3D 0;
>  	/* PIN_MAPPABLE limits the address to GMADR size */
> -	if (intel_plane_needs_low_address(display))
> +	if (pin_params->needs_low_address)
>  		pinctl |=3D PIN_MAPPABLE;
>=20=20
>  	i915_gem_ww_ctx_init(&ww, true);
> @@ -256,6 +256,7 @@ intel_plane_fb_vtd_guard(const struct intel_plane_sta=
te *plane_state)
>  int intel_plane_pin_fb(struct intel_plane_state *plane_state,
>  		       const struct intel_plane_state *old_plane_state)
>  {
> +	struct intel_display *display =3D to_intel_display(plane_state);
>  	struct drm_i915_private *i915 =3D to_i915(plane_state->uapi.plane->dev);
>  	struct intel_plane *plane =3D to_intel_plane(plane_state->uapi.plane);
>  	const struct intel_framebuffer *fb =3D
> @@ -269,6 +270,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plan=
e_state,
>  			.phys_alignment =3D intel_plane_fb_min_phys_alignment(plane_state),
>  			.vtd_guard =3D intel_plane_fb_vtd_guard(plane_state),
>  			.needs_cpu_lmem_access =3D intel_fb_needs_cpu_access(&fb->base),
> +			.needs_low_address =3D intel_plane_needs_low_address(display),
>  		};
>  		int fence_id =3D -1;

--=20
Jani Nikula, Intel
