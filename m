Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BAECD4F21
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 10:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D10C10E2F8;
	Tue, 12 May 2026 10:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMFOUaoe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EECB10E26F;
 Tue, 12 May 2026 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778582418; x=1810118418;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=A3KLKg4zRZ44pBfX9Kl4/0XBmhYtZQYGoHat5M7ySxs=;
 b=nMFOUaoe7gvt2IBaqi/ECxr698yuG23Q1a1Coh/7PngpzIy64qgvrTRj
 J/pDsbU7NGbhOFH4dM8X3pJAJ2GcJ6RYg7X4Mw08TkftRUJwZHxpIm8xj
 rTZT4WzjLGaZ0K6KlDFA+Ae21IKuD/72kxkpPCTTPMLHLIooX8O5h8fT2
 KXY1stH1qvKF9Z9P0kfEX7MLxyx9jUHMfmA0YFjGnYPKydGISI6R1PkO4
 W8qqXJKjwXAJlTuKu4XYzzJ2GhThbtEzuF9mzRRmTaY5bcvR3ZfCL/6dW
 Qiin+XNI/m2OppH5l6D35rCc2ePKvF5TXzTQAbo2c0hbIGaFdrj+gTVLo g==;
X-CSE-ConnectionGUID: ItXSjSS+RYy3Jpa8cJfZTA==
X-CSE-MsgGUID: eCkK4p8mToyUSQqnLK+SeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79470973"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79470973"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 03:40:17 -0700
X-CSE-ConnectionGUID: Pl5/qfXHQ/6+Zwj9wzx5Vg==
X-CSE-MsgGUID: S2vpPP9zTMuGUkBcOZReug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="242083944"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.203])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 03:40:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 05/14] drm/i915: Use drm_dbg_kms() for initial FB debugs
In-Reply-To: <20260511214122.8468-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
 <20260511214122.8468-6-ville.syrjala@linux.intel.com>
Date: Tue, 12 May 2026 13:40:11 +0300
Message-ID: <09373911927701c841c50d91716bc2371c6f5283@intel.com>
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
> The initial FB stuff is ultimately about display stuff, so
> use the proper display specific debug level for it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_initial_plane.c     |  4 ++--
>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 12 ++++++------
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/=
i915/i915_initial_plane.c
> index 56d31f83707b..62365ba1ff97 100644
> --- a/drivers/gpu/drm/i915/i915_initial_plane.c
> +++ b/drivers/gpu/drm/i915/i915_initial_plane.c
> @@ -68,8 +68,8 @@ initial_plane_phys(struct drm_i915_private *i915,
>  		return false;
>  	}
>=20=20
> -	drm_dbg(&i915->drm, "Using dma_addr=3D%pa, based on initial plane progr=
amming\n",
> -		&dma_addr);
> +	drm_dbg_kms(&i915->drm, "Using dma_addr=3D%pa, based on initial plane p=
rogramming\n",
> +		    &dma_addr);
>=20=20
>  	*out_phys_base =3D dma_addr - mem->region.start;
>  	*out_mem =3D mem;
> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/=
drm/xe/display/xe_initial_plane.c
> index 1f2919797f6f..37cfc8a55031 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -59,9 +59,9 @@ initial_plane_bo(struct xe_device *xe,
>  			return NULL;
>  		}
>=20=20
> -		drm_dbg(&xe->drm,
> -			"Using phys_base=3D%pa, based on initial plane programming\n",
> -			&phys_base);
> +		drm_dbg_kms(&xe->drm,
> +			    "Using phys_base=3D%pa, based on initial plane programming\n",
> +			    &phys_base);
>  	} else {
>  		struct ttm_resource_manager *stolen =3D ttm_manager_type(&xe->ttm, XE_=
PL_STOLEN);
>=20=20
> @@ -78,9 +78,9 @@ initial_plane_bo(struct xe_device *xe,
>  	bo =3D xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
>  					  ttm_bo_type_kernel, flags, 0, false);
>  	if (IS_ERR(bo)) {
> -		drm_dbg(&xe->drm,
> -			"Failed to create bo phys_base=3D%pa size %u with flags %x: %li\n",
> -			&phys_base, size, flags, PTR_ERR(bo));
> +		drm_dbg_kms(&xe->drm,
> +			    "Failed to create bo phys_base=3D%pa size %u with flags %x: %li\n=
",
> +			    &phys_base, size, flags, PTR_ERR(bo));
>  		return NULL;
>  	}

--=20
Jani Nikula, Intel
