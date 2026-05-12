Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A50DCD4F21
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 10:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B5D10E09D;
	Tue, 12 May 2026 10:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UyHBP+BT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BC010E09D;
 Tue, 12 May 2026 10:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778581791; x=1810117791;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=lrBcZHIGPmn7EU99aSM17iQZr9Xy6ZmPB9UxNt+LWOg=;
 b=UyHBP+BT+Ng0UQpBKynYRTqmZKGyZpnhGyQG7XP3Df/mSC8s5MEmo8Q1
 rJzzBb4dCD3ytIx9aBFSk9ckTVTKSLzt61GBRxaAfXIOGVYR2k6GgT1w4
 vonZWp9wV0TBSEu/Fs4H9BWSDyWuWopY3yU0HcXv6eRnNLeq1D/wyfnxL
 /BQLWgfIIRxnzlFCQAcG1DWgI6fLQBcFfntThFizdrbNXcFT2QzDA/7sc
 yYbyea3BcDFBNS+om3ZyDTs/w95cjve2auAd8KAduSbvEYhE74MlLrSyx
 VBpN+A07T95zXNoLPutdlhvIf5JsYSvyUKerEPeWekHgh/5SGRen4LinI w==;
X-CSE-ConnectionGUID: 2I/nbpH4T/WzwnflHdrgMw==
X-CSE-MsgGUID: 8MC+AMdqTXyROJXPdd44uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90869572"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="90869572"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 03:29:50 -0700
X-CSE-ConnectionGUID: iLNe98UgRnK21yihZkM+YQ==
X-CSE-MsgGUID: fEeydMW6RouhGA4W8Jq75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="237972307"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 03:29:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 02/14] drm/i915/fbdev: Extract bios_fb_ok()
In-Reply-To: <20260511214122.8468-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
 <20260511214122.8468-3-ville.syrjala@linux.intel.com>
Date: Tue, 12 May 2026 13:29:44 +0300
Message-ID: <b4cd01b6b2eff29d1d4a7194d329612db9abd515@intel.com>
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

On Tue, 12 May 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Pull the "is the BIOS FB OK?" checks to a helper function. We'll
> add other relevant checks there later.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 26 +++++++++++++++-------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm=
/i915/display/intel_fbdev.c
> index df1d3d9dc3e5..f9c135400453 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -262,6 +262,23 @@ __intel_fbdev_fb_alloc(struct intel_display *display,
>=20=20
>  }
>=20=20
> +static bool bios_fb_ok(const struct intel_framebuffer *fb,
> +		       const struct drm_fb_helper_surface_size *sizes)
> +{
> +	struct intel_display *display =3D to_intel_display(fb->base.dev);
> +	int width =3D fb->base.width;
> +	int height =3D fb->base.height;
> +
> +	if (sizes->fb_width > width || sizes->fb_height > height) {
> +		drm_dbg_kms(display->drm,
> +			    "BIOS fb too small (%dx%d), we require (%dx%d), releasing it\n",
> +			    width, height, sizes->fb_width, sizes->fb_height);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  				   struct drm_fb_helper_surface_size *sizes)
>  {
> @@ -279,14 +296,7 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_hel=
per *helper,
>=20=20
>  	ifbdev->fb =3D NULL;
>=20=20
> -	if (fb &&
> -	    (sizes->fb_width > fb->base.width ||
> -	     sizes->fb_height > fb->base.height)) {
> -		drm_dbg_kms(display->drm,
> -			    "BIOS fb too small (%dx%d), we require (%dx%d),"
> -			    " releasing it\n",
> -			    fb->base.width, fb->base.height,
> -			    sizes->fb_width, sizes->fb_height);
> +	if (fb && !bios_fb_ok(fb, sizes)) {
>  		drm_framebuffer_put(&fb->base);
>  		fb =3D NULL;
>  	}

--=20
Jani Nikula, Intel
