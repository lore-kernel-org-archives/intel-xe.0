Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E17EF4368B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 09:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F84110E9B8;
	Fri, 17 Apr 2026 09:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKfX/Dy7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6282B10E9B7;
 Fri, 17 Apr 2026 09:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776419910; x=1807955910;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=CL/rmD4aNqCqQy/FBFwsoFfh0w1fXqFdcYcmHmZWjjI=;
 b=LKfX/Dy73zU1FRuMqxEcvB4zan2Io5cYUxhdoLNJijkS6umbp9gh4ena
 p24AnS/pkbkLU1ZteDVXMM345nYMhXm0MxMkhW6gUtN3gR5QpWb6U5NEA
 pWICmUsm/nFZbaTJtZ1eNDJS7FaAZuORIcK33A0szWHYFUri5gjDOxtVj
 IoCPLs+TTriDnmePQfZ+CFXjYEJqBdsxOJTVvqd+EwWOTByJYM1WPd4RO
 3iewkSq6waNG3pMT/sRH24cgvY/anKeeWdntwOOVSXW+8cahJbhsswu74
 Ws3tIItZ6a9X3GhAouK5dlG4+0DZqyiNw4ykAXLdOhdTvtUE/XKLSsYH+ A==;
X-CSE-ConnectionGUID: bgQ0a2u2QqKLVKZU/EuHnQ==
X-CSE-MsgGUID: LVxF/DONQTajTPP+0mVZ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77342404"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77342404"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 02:58:30 -0700
X-CSE-ConnectionGUID: ogxhJ1oMRnSuzeKzGwwaHw==
X-CSE-MsgGUID: +qtK/T09RISlDNhvzbT+Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="226650199"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:58:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 09/11] drm/i915: Introduce pin_params.needs_fence
In-Reply-To: <20260416174448.28264-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416174448.28264-1-ville.syrjala@linux.intel.com>
 <20260416174448.28264-10-ville.syrjala@linux.intel.com>
Date: Fri, 17 Apr 2026 12:58:26 +0300
Message-ID: <47a9626a4dcf354d2c30b1236b19b03126d57ec2@intel.com>
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
> Add a new flag pin_params.needs_fencel to inform the pinning

*needs_fence

> code that the display needs a fence for tiled scanout.
>
> The goal is to eliminate all display specific stuff from
> the low level pinning code.

Again, I find it just a little magical that .needs_fence is only
initialized in certain code paths, with the implementation detail
knowledge where the member is used. E.g. in this case out_fence_id !=3D
NULL.

Regardless,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb_pin.h | 1 +
>  drivers/gpu/drm/i915/i915_fb_pin.c          | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.h b/drivers/gpu/dr=
m/i915/display/intel_fb_pin.h
> index 3e37e9874f50..95f83bf7411f 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.h
> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.h
> @@ -22,6 +22,7 @@ struct intel_fb_pin_params {
>  	bool needs_cpu_lmem_access;
>  	bool needs_low_address;
>  	bool needs_physical;
> +	bool needs_fence;
>  };
>=20=20
>  struct i915_vma *
> diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i9=
15_fb_pin.c
> index a8ed888183cb..5060ec8c76ca 100644
> --- a/drivers/gpu/drm/i915/i915_fb_pin.c
> +++ b/drivers/gpu/drm/i915/i915_fb_pin.c
> @@ -112,7 +112,6 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
>  		     const struct intel_fb_pin_params *pin_params,
>  		     int *out_fence_id)
>  {
> -	struct intel_display *display =3D to_intel_display(fb->dev);
>  	struct drm_i915_private *i915 =3D to_i915(fb->dev);
>  	struct drm_gem_object *_obj =3D intel_fb_bo(fb);
>  	struct drm_i915_gem_object *obj =3D to_intel_bo(_obj);
> @@ -188,7 +187,7 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
>  		 * mode that matches the user configuration.
>  		 */
>  		ret =3D i915_vma_pin_fence(vma);
> -		if (ret !=3D 0 && intel_plane_needs_fence(display)) {
> +		if (ret !=3D 0 && pin_params->needs_fence) {
>  			i915_vma_unpin(vma);
>  			goto err_unpin;
>  		}
> @@ -272,6 +271,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plan=
e_state,
>  			.needs_cpu_lmem_access =3D intel_fb_needs_cpu_access(&fb->base),
>  			.needs_low_address =3D intel_plane_needs_low_address(display),
>  			.needs_physical =3D intel_plane_needs_physical(plane),
> +			.needs_fence =3D intel_plane_needs_fence(display),
>  		};
>  		int fence_id =3D -1;

--=20
Jani Nikula, Intel
