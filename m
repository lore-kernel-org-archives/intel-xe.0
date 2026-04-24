Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA05FE51FB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 10:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A8610F4CC;
	Fri, 24 Apr 2026 10:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUcs7JVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A47D10F4C8;
 Fri, 24 Apr 2026 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777025261; x=1808561261;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TqSUPnd6+/JWnbFgdxdNrFVDPsp3KfNssrjqLHZerEA=;
 b=aUcs7JVayLsvpmc9oVC6+A9bz1j4UIZh/yBeX5fXkRcWnyp+rfOkPVqp
 wl92PkOzhM+0jwBrGGP97if5umf46MdsV57yX4/Wty/yUMQVRzompkF2n
 LRfudlGkeaGJqew60PEMZxRx/TzeI2SXF8BsFKr1xhiZPvv567BaAR50f
 HBjU+va3F965lZIOhI34Lz/OoXmiuUKRdTi2D4XXFXAbkSBTJJcEdTj+o
 FYJB5eXDpUnmlOBrY5L6cew7WyvvE+pZHqgraH5RUkfWatK4xlk/G809S
 0jKyVOra9eyiuIyEqNWpsYyUFkWh04R4JWdj7ehZLGKSX/7g7LyWZKaUC w==;
X-CSE-ConnectionGUID: gURnaq5aSOOQlH9dCoWL6w==
X-CSE-MsgGUID: 22gi5gJ9QqiBmfURnANqaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77169110"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="77169110"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 03:07:41 -0700
X-CSE-ConnectionGUID: pB8+KKJrTHONIomVF24/jw==
X-CSE-MsgGUID: GOLSm+p6SF+u2SK3sIJyWg==
X-ExtLoop1: 1
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 03:07:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 09/16] drm/xe: Reorganize intel_plane_pin_fb() a bit
In-Reply-To: <20260423165346.20884-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
 <20260423165346.20884-10-ville.syrjala@linux.intel.com>
Date: Fri, 24 Apr 2026 13:07:37 +0300
Message-ID: <fdb6886d454a2fbe44f98b69bd03da2b073254b3@intel.com>
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

On Thu, 23 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Move most of the plane state stuff out from the inner parts
> of intel_plane_pin_fb(). The plan is to take those inner parts and
> abstract them into the new fb_pin parent interface, and we don't
> want any plane_state stuff there.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index bbeb5c2a6c51..9774089ee75c 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -459,26 +459,30 @@ int intel_plane_pin_fb(struct intel_plane_state *ne=
w_plane_state,
>  {
>  	struct drm_framebuffer *fb =3D new_plane_state->hw.fb;
>  	struct drm_gem_object *obj =3D intel_fb_bo(fb);
> -	struct i915_vma *vma;
>  	struct intel_plane *plane =3D to_intel_plane(new_plane_state->uapi.plan=
e);
>  	struct intel_fb_pin_params pin_params =3D {
>  		.view =3D &new_plane_state->view.gtt,
>  		.alignment =3D plane->min_alignment(plane, fb, 0),
>  		.needs_cpu_lmem_access =3D intel_fb_needs_cpu_access(fb),
>  	};
> +	struct i915_vma *ggtt_vma =3D NULL;
> +	struct i915_vma *dpt_vma =3D NULL;
> +	int fence_id =3D -1;
> +	u32 offset;
>=20=20
>  	if (reuse_vma(new_plane_state, old_plane_state))
>  		return 0;
>=20=20
> -	vma =3D __xe_pin_fb_vma(obj, intel_fb_uses_dpt(fb), &pin_params);
> +	ggtt_vma =3D __xe_pin_fb_vma(obj, intel_fb_uses_dpt(fb), &pin_params);
> +	if (IS_ERR(ggtt_vma))
> +		return PTR_ERR(ggtt_vma);
>=20=20
> -	if (IS_ERR(vma))
> -		return PTR_ERR(vma);
> +	offset =3D xe_ggtt_node_addr(ggtt_vma->node);
>=20=20
> -	new_plane_state->ggtt_vma =3D vma;
> -
> -	new_plane_state->surf =3D xe_ggtt_node_addr(new_plane_state->ggtt_vma->=
node) +
> -		plane->surf_offset(new_plane_state);
> +	new_plane_state->dpt_vma =3D dpt_vma;
> +	new_plane_state->ggtt_vma =3D ggtt_vma;
> +	new_plane_state->fence_id =3D fence_id;
> +	new_plane_state->surf =3D offset + plane->surf_offset(new_plane_state);
>=20=20
>  	return 0;
>  }

--=20
Jani Nikula, Intel
