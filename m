Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194C3FE51FD
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 10:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B992C10F4BD;
	Fri, 24 Apr 2026 10:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUXzNbpW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF3310F4BD;
 Fri, 24 Apr 2026 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777025187; x=1808561187;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=GalzSkCx6oiUKRgLUcXwWpeOK7K48P2Iu9s5M7pFroE=;
 b=SUXzNbpWle3cr7dWEUFUxd2HwPcMeu3ioMlqEOH6Ad2+Fy4SJQ+l2qu7
 STINVTKf8ZMZZZr2uPESDa468eE1b9fYheAE/BrcX/BdmRFqG50hPeZp1
 JpEG9KL28uEWURvzt1p4CKlr4IQdg5eaqwTbNDV5lax6FSDV84xL2NXCG
 YvDJNaiGYaLrtKQAUiw82Tyt+dCqsYjrh0fePtMrtesJ+Y4mEMbEKSAmZ
 o98FrMnT5PThANcfWS5YDsPb3BSU/bIednshKlj47C6bNiH6BiHqOGxov
 ds3O0fTp2QHNMTry/MbyzuVHlqGq1FP9iyk6uY+fZLtfRdF97S/i+fccV A==;
X-CSE-ConnectionGUID: /zHsrUZoQHm8PHRcGj+MKw==
X-CSE-MsgGUID: 6uJEmHOCSC+l/QnYuKgsRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="100656142"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="100656142"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 03:06:26 -0700
X-CSE-ConnectionGUID: KxLeXkytQzS6MHb5wquoIg==
X-CSE-MsgGUID: e/WKYEveRoSyc2t8TgsIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="231907677"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 03:06:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 08/16] drm/xe: Kill the fbdev vma reuse hack
In-Reply-To: <20260423165346.20884-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
 <20260423165346.20884-9-ville.syrjala@linux.intel.com>
Date: Fri, 24 Apr 2026 13:06:21 +0300
Message-ID: <1df276428f96fb4e6f316683d101c8807fc3a5fb@intel.com>
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
> This fbdev vma reuse hacks is a massive layering violation. It
> really does not belong in the fb pinning code. And it's in the
> way of properly abstracting this stuff, so kill it.

Might mention what the fallout is. Need to create a new vma etc.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index 487c092cd000..bbeb5c2a6c51 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -10,7 +10,6 @@
>  #include "intel_display_types.h"
>  #include "intel_fb.h"
>  #include "intel_fb_pin.h"
> -#include "intel_fbdev.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_display_vma.h"
> @@ -432,10 +431,7 @@ void intel_fb_unpin_vma(struct i915_vma *vma, int fe=
nce_id)
>  static bool reuse_vma(struct intel_plane_state *new_plane_state,
>  		      const struct intel_plane_state *old_plane_state)
>  {
> -	struct intel_framebuffer *fb =3D to_intel_framebuffer(new_plane_state->=
hw.fb);
>  	struct intel_plane *plane =3D to_intel_plane(new_plane_state->uapi.plan=
e);
> -	struct xe_device *xe =3D to_xe_device(fb->base.dev);
> -	struct intel_display *display =3D xe->display;
>  	struct i915_vma *vma;
>=20=20
>  	if (old_plane_state->hw.fb =3D=3D new_plane_state->hw.fb &&
> @@ -446,12 +442,6 @@ static bool reuse_vma(struct intel_plane_state *new_=
plane_state,
>  		goto found;
>  	}
>=20=20
> -	if (fb =3D=3D intel_fbdev_framebuffer(display->fbdev.fbdev)) {
> -		vma =3D intel_fbdev_vma_pointer(display->fbdev.fbdev);
> -		if (vma)
> -			goto found;
> -	}
> -
>  	return false;
>=20=20
>  found:

--=20
Jani Nikula, Intel
