Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBE7F459EF
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 15:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940BD10E981;
	Fri, 10 Apr 2026 15:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XW4YzwM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2008E10E251;
 Fri, 10 Apr 2026 15:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775835827; x=1807371827;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tl6eRv6VTgfwZFy7bjfuADW3CAoZNbD8Um1nZyotCcQ=;
 b=XW4YzwM0+F37NraYVFHaoCXtSYyzKK5xE79xS76bMnsdyJANg/OqwV6s
 yeVhP4Scv7bhwgodB5FwRmi99QutiuOY1qxI3g09EFxixivcikB1gEgOJ
 olBeV9wGHHkxU+C62aPCCMKInCQ2yMcjWC2QFEJL0pVn7WdTel/ldkYgz
 O5jJgvup3ttq4CJoWknyAQOJMqQYRXbVtEh5KVYX8+QUIzslJqPEOwyhH
 IvDagVGa81JJfZXBtT1o0bCRgNvod/1ATbEBPSDZj37jvh8xFyuQGyu/I
 r6eKV1wKuqE2zOoYS71fuzSTIUhdqEbhITfO7rNbqI3cexuYGZKUgo2yX Q==;
X-CSE-ConnectionGUID: NFjm8yVcT7my8ufDEpq0iw==
X-CSE-MsgGUID: VYenHCXGSbu7h7v0zLVgvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="75896737"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="75896737"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 08:43:46 -0700
X-CSE-ConnectionGUID: WLzQ6zd3T26QgrWWe7Cphg==
X-CSE-MsgGUID: vEZCChYsTBq02QF/OSm+Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="229387392"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 08:43:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 02/10] drm/i915: Remove 'mem' and 'phy_base' from struct
 intel_initial_plane_config
In-Reply-To: <20260410150449.9699-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260410150449.9699-1-ville.syrjala@linux.intel.com>
 <20260410150449.9699-3-ville.syrjala@linux.intel.com>
Date: Fri, 10 Apr 2026 18:43:41 +0300
Message-ID: <8bb4a7be25ff9d2e6aa6c24f4c00ae5a48ce8dc4@intel.com>
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

On Fri, 10 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The 'mem' and 'phy_base' members or struct intel_initial_plane_config

*of

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> only exist to be passed from initial_plane_phys() to its sole caller.
> Just return them via function arguments.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h |  2 --
>  drivers/gpu/drm/i915/i915_initial_plane.c          | 13 ++++++-------
>  2 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index ca2581fb7bbd..eaa37b8d9584 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -756,8 +756,6 @@ struct intel_plane_state {
>=20=20
>  struct intel_initial_plane_config {
>  	struct intel_framebuffer *fb;
> -	struct intel_memory_region *mem;
> -	resource_size_t phys_base;
>  	struct i915_vma *vma;
>  	int size;
>  	u32 base;
> diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/=
i915/i915_initial_plane.c
> index c1a12bf6b66c..060aa0388c39 100644
> --- a/drivers/gpu/drm/i915/i915_initial_plane.c
> +++ b/drivers/gpu/drm/i915/i915_initial_plane.c
> @@ -34,7 +34,9 @@ initial_plane_memory_type(struct drm_i915_private *i915)
>=20=20
>  static bool
>  initial_plane_phys(struct drm_i915_private *i915,
> -		   struct intel_initial_plane_config *plane_config)
> +		   struct intel_initial_plane_config *plane_config,
> +		   resource_size_t *out_phys_base,
> +		   struct intel_memory_region **out_mem)
>  {
>  	struct i915_ggtt *ggtt =3D to_gt(i915)->ggtt;
>  	struct intel_memory_region *mem;
> @@ -77,8 +79,8 @@ initial_plane_phys(struct drm_i915_private *i915,
>  	drm_dbg(&i915->drm, "Using dma_addr=3D%pa, based on initial plane progr=
amming\n",
>  		&dma_addr);
>=20=20
> -	plane_config->phys_base =3D dma_addr - mem->region.start;
> -	plane_config->mem =3D mem;
> +	*out_phys_base =3D dma_addr - mem->region.start;
> +	*out_mem =3D mem;
>=20=20
>  	return true;
>  }
> @@ -99,12 +101,9 @@ initial_plane_vma(struct drm_i915_private *i915,
>  	if (plane_config->size =3D=3D 0)
>  		return NULL;
>=20=20
> -	if (!initial_plane_phys(i915, plane_config))
> +	if (!initial_plane_phys(i915, plane_config, &phys_base, &mem))
>  		return NULL;
>=20=20
> -	phys_base =3D plane_config->phys_base;
> -	mem =3D plane_config->mem;
> -
>  	base =3D round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
>  	size =3D round_up(plane_config->base + plane_config->size,
>  			mem->min_page_size);

--=20
Jani Nikula, Intel
