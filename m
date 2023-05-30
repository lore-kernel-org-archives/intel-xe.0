Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E1BC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 14:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF9110E0B4;
	Tue, 30 May 2023 14:01:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D151910E0B4
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685455284; x=1716991284;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=y0Xn9uXcadQo0IN5CbcJKlEj7mwLpGSYM136jLRFyBc=;
 b=QlNILiduTzLnIEyyl6RNtCEeEmow6jeW8QSfM1W+i2OceWR2xXoCAg3r
 39BLzU3JmHmSj502arLgAsf1m84DT/qRdfj1nZKuFrT6P6j70dcAXoVk/
 pUmMmT2jD+V5TYQ5kpinDsnF4IQiIkIvMch9ehZWQiE6ivj2EwBUF4DXX
 EDsJO8lk9Q3V2TSzg0hepYVB6v0aximdKhySUtkMFLVbnq8HxWVy2+/50
 RWw0TkuFr9TGrVFI+dXCL2u6pwUf5HfUqbH7LghSxhMtP2Bka5oOR1gNv
 SADl4/G3y41rFEFoxrgIV6YDKo0R5xIFojMFL16qb6nnR+pkXnTG3sBWk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354931452"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="354931452"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 07:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="700634939"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="700634939"
Received: from bclindho-mobl.ger.corp.intel.com (HELO [10.252.53.6])
 ([10.252.53.6])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 07:01:17 -0700
Message-ID: <280ba021-269c-6123-a2be-b12031c138db@linux.intel.com>
Date: Tue, 30 May 2023 16:01:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230530104713.2570554-1-jouni.hogander@intel.com>
 <20230530104713.2570554-10-jouni.hogander@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230530104713.2570554-10-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 9/9] Add new fence_id and fence count
 functions
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

Hey,

Instead of fence_count, wouldn't support_legacy_fencing make more sense?

I think on i915 you would probably want to disable it on new platforms anyway.

~Maarten

On 2023-05-30 12:47, Jouni Högander wrote:
> Add new fence id and fence count functions and use them instead of directly
> accessing struct members
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c         | 16 +++++-----------
>  drivers/gpu/drm/i915/i915_vma.h                  |  5 +++++
>  .../gpu/drm/xe/compat-i915-headers/i915_vma.h    |  2 ++
>  3 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index 2cb537504c2f..7e4dcd747c02 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -47,6 +47,7 @@
>  #include "i915_reg.h"
>  #include "i915_utils.h"
>  #include "i915_vgpu.h"
> +#include "i915_vma.h"
>  #include "intel_cdclk.h"
>  #include "intel_de.h"
>  #include "intel_display_trace.h"
> @@ -988,17 +989,14 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
>  
>  	/* FBC1 compression interval: arbitrary choice of 1 second */
>  	fbc_state->interval = drm_mode_vrefresh(&crtc_state->hw.adjusted_mode);
> -#ifdef I915
>  	fbc_state->fence_y_offset = intel_plane_fence_y_offset(plane_state);
>  
>  	drm_WARN_ON(&i915->drm, plane_state->flags & PLANE_HAS_FENCE &&
> -		    !plane_state->ggtt_vma->fence);
> +		    !intel_gt_fence_count(to_gt(i915)));
>  
> -	if (plane_state->flags & PLANE_HAS_FENCE &&
> -	    plane_state->ggtt_vma->fence)
> -		fbc_state->fence_id = plane_state->ggtt_vma->fence->id;
> +	if (plane_state->flags & PLANE_HAS_FENCE)
> +		fbc_state->fence_id =  i915_vma_fence_id(plane_state->ggtt_vma);
>  	else
> -#endif
>  		fbc_state->fence_id = -1;
>  
>  	fbc_state->cfb_stride = intel_fbc_cfb_stride(plane_state);
> @@ -1008,7 +1006,6 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
>  
>  static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
>  {
> -#ifdef I915
>  	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
>  
>  	/*
> @@ -1025,10 +1022,7 @@ static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
>  	 */
>  	return DISPLAY_VER(i915) >= 9 ||
>  		(plane_state->flags & PLANE_HAS_FENCE &&
> -		 plane_state->ggtt_vma->fence);
> -#else
> -	return true;
> -#endif
> +		 i915_vma_fence_id(plane_state->ggtt_vma) != -1);
>  }
>  
>  static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index ed5c9d682a1b..06e613752c55 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -418,6 +418,11 @@ i915_vma_unpin_fence(struct i915_vma *vma)
>  		__i915_vma_unpin_fence(vma);
>  }
>  
> +static inline int i915_vma_fence_id(const struct i915_vma *vma)
> +{
> +	return vma->fence ? vma->fence->id : -1;
> +}
> +
>  void i915_vma_parked(struct intel_gt *gt);
>  
>  static inline bool i915_vma_is_scanout(const struct i915_vma *vma)
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> index c40bb27ac72a..45ea0e44073d 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> @@ -11,4 +11,6 @@ struct i915_vma {
>  	struct drm_mm_node node;
>  };
>  
> +#define i915_vma_fence_id(vma) -1
> +
>  #endif
