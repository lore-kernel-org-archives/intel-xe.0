Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3408ACA5FAC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 13:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB5E10E5CE;
	Wed, 30 Sep 2026 13:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYyk0VCB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936CC10E5CE;
 Wed, 30 Sep 2026 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790774962; x=1822310962;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=K3aOHdLeVsbNZCg7Y1vzty9cmvFWuvEkSZJoqargZ1g=;
 b=JYyk0VCBu3bAVbMUaN3EfB/pNPDnHslUNtSunqWVvJV5x5S156PLC6HX
 uWhTOyhfbfLwmCHFoXhV7g+3M2RUPn3mWtFa9uZBXHuzJiwJtl4BlUvOf
 x1hFEKIxVnZCq90olcZzL0r0EfPgOceYo9j3UQgjlD8x0OX1scR+Vdqbh
 lTJOrrUfHqZXvS0PzAgEthYW2aTqND3QYUh+EjWfxVIBj9CWdYou8yP7e
 Me+1gVASiGBR9UQoLF89xPEL+xlPSb/8Ox62k7g4F2nTWvmKN+Brr0AwQ
 27nhL63JBwPdo8XlEH4zLWaU6Wsn+BFv7oIpDtFALqwMcaUyoyxEJXjrY A==;
X-CSE-ConnectionGUID: 370MPQHqT2ayof3taAg8PA==
X-CSE-MsgGUID: BFdumkQzRE6RRhGeEIQRyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="113298719"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="113298719"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:29:22 -0700
X-CSE-ConnectionGUID: kUVmkVASTFeVzCBiNlWpog==
X-CSE-MsgGUID: y6qERbcXQKK2mZ7VSDe3iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="279486086"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:29:20 -0700
Date: Wed, 30 Sep 2026 16:29:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH v2] drm/i915/selftests: use intel_gtt_view_is_*() helpers
 more
Message-ID: <ar0OrBrFi-7dpcIR@intel.com>
References: <c626ae37eed76d8b94333ba0202fdfe34ec88dd5.1789502902.git.jani.nikula@intel.com>
 <20260930103427.883703-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930103427.883703-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Sep 30, 2026 at 01:34:27PM +0300, Jani Nikula wrote:
> Prefer using the intel_gtt_view_is_*() helpers instead of comparing the
> view type directly.
> 
> v2: Use view, not vma->gtt_view at the end (Sashiko)
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_vma.c | 34 +++++++++++------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
> index b16297a6a4e8..f918ae18c4e1 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
> @@ -51,7 +51,7 @@ static bool assert_vma(struct i915_vma *vma,
>  		ok = false;
>  	}
>  
> -	if (vma->gtt_view.type != I915_GTT_VIEW_NORMAL) {
> +	if (!intel_gtt_view_is_normal(&vma->gtt_view)) {
>  		pr_err("VMA created with wrong type [%d]\n",
>  		       vma->gtt_view.type);
>  		ok = false;
> @@ -533,12 +533,12 @@ assert_remapped(struct drm_i915_gem_object *obj,
>  	return sg;
>  }
>  
> -static unsigned int remapped_size(enum intel_gtt_view_type view_type,
> +static unsigned int remapped_size(const struct intel_gtt_view *view,
>  				  const struct intel_remapped_plane_info *a,
>  				  const struct intel_remapped_plane_info *b)
>  {
>  
> -	if (view_type == I915_GTT_VIEW_ROTATED)
> +	if (intel_gtt_view_is_rotated(view))
>  		return a->dst_stride * a->width + b->dst_stride * b->width;
>  	else
>  		return a->dst_stride * a->height + b->dst_stride * b->height;
> @@ -606,11 +606,11 @@ static int igt_vma_rotate_remap(void *arg)
>  			max_offset = max_pages - max_offset;
>  
>  			if (!plane_info[0].dst_stride)
> -				plane_info[0].dst_stride = view.type == I915_GTT_VIEW_ROTATED ?
> +				plane_info[0].dst_stride = intel_gtt_view_is_rotated(&view) ?
>  									plane_info[0].height :
>  									plane_info[0].width;
>  			if (!plane_info[1].dst_stride)
> -				plane_info[1].dst_stride = view.type == I915_GTT_VIEW_ROTATED ?
> +				plane_info[1].dst_stride = intel_gtt_view_is_rotated(&view) ?
>  									plane_info[1].height :
>  									plane_info[1].width;
>  
> @@ -632,9 +632,9 @@ static int igt_vma_rotate_remap(void *arg)
>  						goto out_object;
>  					}
>  
> -					expected_pages = remapped_size(view.type, &plane_info[0], &plane_info[1]);
> +					expected_pages = remapped_size(&view, &plane_info[0], &plane_info[1]);
>  
> -					if (view.type == I915_GTT_VIEW_ROTATED &&
> +					if (intel_gtt_view_is_rotated(&view) &&
>  					    vma->size != expected_pages * PAGE_SIZE) {
>  						pr_err("VMA is wrong size, expected %lu, found %llu\n",
>  						       PAGE_SIZE * expected_pages, vma->size);
> @@ -642,7 +642,7 @@ static int igt_vma_rotate_remap(void *arg)
>  						goto out_object;
>  					}
>  
> -					if (view.type == I915_GTT_VIEW_REMAPPED &&
> +					if (intel_gtt_view_is_remapped(&view) &&
>  					    vma->size > expected_pages * PAGE_SIZE) {
>  						pr_err("VMA is wrong size, expected %lu, found %llu\n",
>  						       PAGE_SIZE * expected_pages, vma->size);
> @@ -672,13 +672,13 @@ static int igt_vma_rotate_remap(void *arg)
>  
>  					sg = vma->pages->sgl;
>  					for (n = 0; n < ARRAY_SIZE(view.rotated.plane); n++) {
> -						if (view.type == I915_GTT_VIEW_ROTATED)
> +						if (intel_gtt_view_is_rotated(&view))
>  							sg = assert_rotated(obj, &view.rotated, n, sg);
>  						else
>  							sg = assert_remapped(obj, &view.remapped, n, sg);
>  						if (IS_ERR(sg)) {
>  							pr_err("Inconsistent %s VMA pages for plane %d: [(%d, %d, %d, %d, %d), (%d, %d, %d, %d, %d)]\n",
> -							       view.type == I915_GTT_VIEW_ROTATED ?
> +							       intel_gtt_view_is_rotated(&view) ?
>  							       "rotated" : "remapped", n,
>  							       plane_info[0].width,
>  							       plane_info[0].height,
> @@ -763,7 +763,7 @@ static bool assert_pin(struct i915_vma *vma,
>  		ok = false;
>  	}
>  
> -	if (view && view->type != I915_GTT_VIEW_NORMAL) {
> +	if (view && !intel_gtt_view_is_normal(view)) {
>  		if (memcmp(&vma->gtt_view, view, sizeof(*view))) {
>  			pr_err("(%s) VMA mismatch upon creation!\n",
>  			       name);
> @@ -776,7 +776,7 @@ static bool assert_pin(struct i915_vma *vma,
>  			ok = false;
>  		}
>  	} else {
> -		if (vma->gtt_view.type != I915_GTT_VIEW_NORMAL) {
> +		if (!intel_gtt_view_is_normal(&vma->gtt_view)) {
>  			pr_err("Not the normal ggtt view! Found %d\n",
>  			       vma->gtt_view.type);
>  			ok = false;
> @@ -1017,7 +1017,7 @@ static int igt_vma_remapped_gtt(void *arg)
>  				goto out;
>  
>  			if (!plane_info[0].dst_stride)
> -				plane_info[0].dst_stride = *t == I915_GTT_VIEW_ROTATED ?
> +				plane_info[0].dst_stride = intel_gtt_view_is_rotated(&view) ?
>  								 p->height : p->width;
>  
>  			vma = i915_gem_object_ggtt_pin(obj, &view, 0, 0, PIN_MAPPABLE);
> @@ -1040,7 +1040,7 @@ static int igt_vma_remapped_gtt(void *arg)
>  					unsigned int offset;
>  					u32 val = y << 16 | x;
>  
> -					if (*t == I915_GTT_VIEW_ROTATED)
> +					if (intel_gtt_view_is_rotated(&vma->gtt_view))

Better use 'view' here too instead of 'vma->gtt_view'. Yes, the two
should be identical here, but I think it's clearer if the test logic
always uses the local data instead of digging into the vma internals.

>  						offset = (x * plane_info[0].dst_stride + y) * PAGE_SIZE;
>  					else
>  						offset = (y * plane_info[0].dst_stride + x) * PAGE_SIZE;
> @@ -1057,7 +1057,7 @@ static int igt_vma_remapped_gtt(void *arg)
>  				goto out;
>  			}
>  
> -			GEM_BUG_ON(vma->gtt_view.type != I915_GTT_VIEW_NORMAL);
> +			GEM_BUG_ON(!intel_gtt_view_is_normal(&vma->gtt_view));
>  
>  			map = i915_vma_pin_iomap(vma);
>  			i915_vma_unpin(vma);
> @@ -1072,7 +1072,7 @@ static int igt_vma_remapped_gtt(void *arg)
>  					u32 exp = y << 16 | x;
>  					u32 val;
>  
> -					if (*t == I915_GTT_VIEW_ROTATED)
> +					if (intel_gtt_view_is_rotated(&view))
>  						src_idx = rotated_index(&view.rotated, 0, x, y);
>  					else
>  						src_idx = remapped_index(&view.remapped, 0, x, y);
> @@ -1081,7 +1081,7 @@ static int igt_vma_remapped_gtt(void *arg)
>  					val = ioread32(&map[offset / sizeof(*map)]);
>  					if (val != exp) {
>  						pr_err("%s VMA write test failed, expected 0x%x, found 0x%x\n",
> -						       *t == I915_GTT_VIEW_ROTATED ? "Rotated" : "Remapped",
> +						       intel_gtt_view_is_rotated(&view) ? "Rotated" : "Remapped",
>  						       exp, val);
>  						i915_vma_unpin_iomap(vma);
>  						err = -EINVAL;
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
