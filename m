Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C2C606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 17:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jV8IWNMA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9AF11263D;
	Thu, 26 Nov 2026 17:33:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD6811263D;
 Thu, 26 Nov 2026 17:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795714431; x=1827250431;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y96vikmvGRCevGKYQf6iqHovT+aZVcn2ygbpAWpamHA=;
 b=jV8IWNMAOJz3x3jsaQtr/K3kKw+R8OyayfcqTDLscJ/JhuZ6G4OqQM4V
 H1lF8QRqkB1X/SFhp/T7GExlUvp9XUv80SarYD5S0+2LDsci+xue3pzDZ
 Az4Is7P0rDQFhb0/X0DLSJxLNnf04aCH9wtsv3WgZhZvISXchXsmwb5Hl
 rBMWvVLqDsCOwySOdwNfF9vVH9XQTaTCyT/6XrEsMAZIWs+mxpOhVILKQ
 HxKVdHv2NBX13DM3bl1kdfa400hTNm0bApUurVDriyngAfonVNDTsHqt5
 I5Kammer6wfVxDILLy3ACnXr8G+WgLcM7ZHFB2MmBQFrgS5cW1gHPypcw g==;
X-CSE-ConnectionGUID: SgjXra88SfqkqaMHvRj5Sw==
X-CSE-MsgGUID: W6bkBRCXT+SKVNceQNb/fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4627467"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4627467"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 09:33:50 -0800
X-CSE-ConnectionGUID: SytKV+WHSm+0KzsCb4C+IQ==
X-CSE-MsgGUID: O+6kHNEwTG64MB6sWKv5Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12220173"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 09:33:48 -0800
Date: Thu, 26 Nov 2026 19:33:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Juha-Pekka =?iso-8859-1?Q?Heikkil=E4?= <juhapekka.heikkila@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 10/13] drm/i915/dpt: Cache DPTs in the gem object
Message-ID: <awhteeplmIyCsk6O@intel.com>
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
 <20261111112007.16790-11-ville.syrjala@linux.intel.com>
 <c8f03306-1b2b-4729-b9ed-7036d0f8ff44@gmail.com>
 <avxTbpT7T4Vkb_1A@intel.com>
 <f6154ac5-2dca-454b-9c24-f72efd18aa5c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6154ac5-2dca-454b-9c24-f72efd18aa5c@gmail.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 11:29:36AM +0200, Juha-Pekka Heikkilä wrote:
> 
> 
> On 17/11/2026 15.15, Ville Syrjälä wrote:
> > On Tue, Nov 17, 2026 at 02:02:54PM +0200, Juha-Pekka Heikkilä wrote:
> >>
> >>
> >> On 11/11/2026 13.20, Ville Syrjala wrote:
> >>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>>
> >>> Currently DPTs are tracked in the framebuffer. Each new
> >>> framebuffer gets a fresh DPT. On first glance that seems fine,
> >>> but the problem is that your typical userspace doesn't
> >>> cache framebuffers at all. Each new frame gets a whole new
> >>> framebuffer, and we have to therefore start with a new DPT
> >>> as well and populate it (and its GGTT mapping) from scratch.
> >>> This is all rather expensive.
> >>>
> >>> Fix the situation by tracking the DPTs in the gem object instead.
> >>> The whole thing is somewhat modeled after the already existing
> >>> vma tracking. Each time a new framebuffer is created we first
> >>> look through the already existing DPTs on the gem object, and
> >>> if one with an identical gtt view is found it gets reused.
> >>>
> >>> The one major difference between this and the vma stuff is that
> >>> vmas can get unbound when not pinned, if there is sufficient
> >>> pressure on the address space. I didn't bother implementing
> >>> a similar mechanism for DPTs, and instead any created DPT will
> >>> simply stay around as long as the actual gem object will stay
> >>> around. I'm thinking large gem objects at least shouldn't stay
> >>> around long past their use as a framebuffer. Should that turn
> >>> out to be false we might need to add some kind of reaping stuff,
> >>> or perhaps just limit the number of cached DPTs per gem object.
> >>>
> >>> With this the display code no longer has to even see the
> >>> DPT object pointer. Though we do have to pass the obj+view
> >>> also the unpin functions so that we can find the right DPT
> >>> there. Technically we could now even stop passing around
> >>> the vma pointers through the display code, except that
> >>> would probably break the vma reuse hacks that xe has..
> >>>
> >>> As for some performance numbers, just a quick
> >>> 'vblank_mode=0 glxgears -fullscreen' run on MTL with a
> >>> debug heavy kernel used to spend ~20% of the time in
> >>> .prepare_fb(), and now it's about 5%. And an optimized
> >>> kernel on a DG2 shows approximately 6% -> 1%.
> >>>
> >>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>> ---
> >>>    .../drm/i915/display/intel_display_types.h    |   3 -
> >>>    drivers/gpu/drm/i915/display/intel_fb.c       |  16 +--
> >>>    drivers/gpu/drm/i915/display/intel_parent.c   |  26 ++--
> >>>    drivers/gpu/drm/i915/display/intel_parent.h   |  13 +-
> >>>    drivers/gpu/drm/i915/display/intel_plane.c    |  13 +-
> >>>    drivers/gpu/drm/i915/gem/i915_gem_object.c    |   6 +
> >>>    .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
> >>>    drivers/gpu/drm/i915/i915_dpt.c               | 119 +++++++++++++++---
> >>>    drivers/gpu/drm/i915/i915_dpt.h               |   7 ++
> >>>    drivers/gpu/drm/i915/i915_fb_pin.c            |  44 +++++--
> >>>    drivers/gpu/drm/xe/display/xe_fb_pin.c        |  12 +-
> >>>    include/drm/intel/display_parent_interface.h  |  11 +-
> >>>    12 files changed, 180 insertions(+), 96 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> >>> index 90a5d29169c6..afe0c6134534 100644
> >>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> >>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> >>> @@ -147,8 +147,6 @@ struct intel_framebuffer {
> >>>    		struct intel_fb_view remapped_view;
> >>>    	};
> >>>    
> >>> -	struct intel_dpt *dpt;
> >>> -
> >>>    	unsigned int min_alignment;
> >>>    	unsigned int vtd_guard;
> >>>    
> >>> @@ -690,7 +688,6 @@ struct intel_plane_state {
> >>>    	} hw;
> >>>    
> >>>    	struct i915_vma *ggtt_vma;
> >>> -	struct i915_vma *dpt_vma;
> >>>    
> >>>    	struct intel_fb_view view;
> >>>    
> >>> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> >>> index 35f1d5dd31d7..dba2d5ec6688 100644
> >>> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> >>> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> >>> @@ -2078,9 +2078,6 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
> >>>    
> >>>    	drm_framebuffer_cleanup(fb);
> >>>    
> >>> -	if (intel_fb_uses_dpt(fb))
> >>> -		intel_parent_dpt_destroy(display, intel_fb->dpt);
> >>> -
> >>>    	intel_bo_framebuffer_fini(intel_fb_bo(fb));
> >>>    
> >>>    	intel_parent_frontbuffer_put(display, intel_fb->frontbuffer);
> >>> @@ -2276,34 +2273,27 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
> >>>    	if (intel_fb_uses_dpt(fb)) {
> >>>    		struct drm_gem_object *obj = intel_fb_bo(&intel_fb->base);
> >>>    		const struct intel_gtt_view *view;
> >>> -		struct intel_dpt *dpt;
> >>>    
> >>>    		if (intel_fb_needs_pot_stride_remap(intel_fb))
> >>>    			view = &intel_fb->remapped_view.gtt;
> >>>    		else
> >>>    			view = &intel_fb->normal_view.gtt;
> >>>    
> >>> -		dpt = intel_parent_dpt_create(display, obj, view);
> >>> -		if (IS_ERR(dpt)) {
> >>> +		ret = intel_parent_dpt_create(display, obj, view);
> >>> +		if (ret) {
> >>>    			drm_dbg_kms(display->drm, "failed to create DPT\n");
> >>> -			ret = PTR_ERR(dpt);
> >>>    			goto err_bo_framebuffer_fini;
> >>>    		}
> >>> -
> >>> -		intel_fb->dpt = dpt;
> >>>    	}
> >>>    
> >>>    	ret = drm_framebuffer_init(display->drm, fb, &intel_fb_funcs);
> >>>    	if (ret) {
> >>>    		drm_err(display->drm, "framebuffer init failed %d\n", ret);
> >>> -		goto err_free_dpt;
> >>> +		goto err_bo_framebuffer_fini;
> >>>    	}
> >>>    
> >>>    	return 0;
> >>>    
> >>> -err_free_dpt:
> >>> -	if (intel_fb_uses_dpt(fb))
> >>> -		intel_parent_dpt_destroy(display, intel_fb->dpt);
> >>>    err_bo_framebuffer_fini:
> >>>    	intel_bo_framebuffer_fini(obj);
> >>>    err_frontbuffer_put:
> >>> diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
> >>> index 8497694b29d7..22be54098b3d 100644
> >>> --- a/drivers/gpu/drm/i915/display/intel_parent.c
> >>> +++ b/drivers/gpu/drm/i915/display/intel_parent.c
> >>> @@ -25,20 +25,14 @@
> >>>    #include "intel_parent.h"
> >>>    
> >>>    /* dpt */
> >>> -struct intel_dpt *intel_parent_dpt_create(struct intel_display *display,
> >>> -					  struct drm_gem_object *obj,
> >>> -					  const struct intel_gtt_view *view)
> >>> +int intel_parent_dpt_create(struct intel_display *display,
> >>> +			    struct drm_gem_object *obj,
> >>> +			    const struct intel_gtt_view *view)
> >>>    {
> >>>    	if (display->parent->dpt)
> >>>    		return display->parent->dpt->create(obj, view);
> >>>    
> >>> -	return NULL;
> >>> -}
> >>> -
> >>> -void intel_parent_dpt_destroy(struct intel_display *display, struct intel_dpt *dpt)
> >>> -{
> >>> -	if (display->parent->dpt)
> >>> -		display->parent->dpt->destroy(dpt);
> >>> +	return 0;
> >>>    }
> >>>    
> >>>    /* fb_pin */
> >>> @@ -62,22 +56,20 @@ void intel_parent_fb_pin_ggtt_unpin(struct intel_display *display,
> >>>    
> >>>    int intel_parent_fb_pin_dpt_pin(struct intel_display *display,
> >>>    				struct drm_gem_object *obj,
> >>> -				struct intel_dpt *dpt,
> >>>    				const struct intel_fb_pin_params *pin_params,
> >>> -				struct i915_vma **out_dpt_vma,
> >>>    				struct i915_vma **out_ggtt_vma,
> >>>    				u32 *out_offset)
> >>>    {
> >>> -	return display->parent->fb_pin->dpt_pin(obj, dpt, pin_params,
> >>> -						out_dpt_vma, out_ggtt_vma, out_offset);
> >>> +	return display->parent->fb_pin->dpt_pin(obj, pin_params,
> >>> +						out_ggtt_vma, out_offset);
> >>>    }
> >>>    
> >>>    void intel_parent_fb_pin_dpt_unpin(struct intel_display *display,
> >>> -				   struct intel_dpt *dpt,
> >>> -				   struct i915_vma *dpt_vma,
> >>> +				   struct drm_gem_object *obj,
> >>> +				   const struct intel_gtt_view *view,
> >>>    				   struct i915_vma *ggtt_vma)
> >>>    {
> >>> -	return display->parent->fb_pin->dpt_unpin(dpt, dpt_vma, ggtt_vma);
> >>> +	return display->parent->fb_pin->dpt_unpin(obj, view, ggtt_vma);
> >>>    }
> >>>    
> >>>    struct i915_vma *intel_parent_fb_pin_reuse_vma(struct intel_display *display,
> >>> diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
> >>> index b22f92404f65..e95710e115be 100644
> >>> --- a/drivers/gpu/drm/i915/display/intel_parent.h
> >>> +++ b/drivers/gpu/drm/i915/display/intel_parent.h
> >>> @@ -23,10 +23,9 @@ struct intel_stolen_node;
> >>>    struct iosys_map;
> >>>    
> >>>    /* dpt */
> >>> -struct intel_dpt *intel_parent_dpt_create(struct intel_display *display,
> >>> -					  struct drm_gem_object *obj,
> >>> -					  const struct intel_gtt_view *view);
> >>> -void intel_parent_dpt_destroy(struct intel_display *display, struct intel_dpt *dpt);
> >>> +int intel_parent_dpt_create(struct intel_display *display,
> >>> +			    struct drm_gem_object *obj,
> >>> +			    const struct intel_gtt_view *view);
> >>>    
> >>>    /* fb_pin */
> >>>    int intel_parent_fb_pin_ggtt_pin(struct intel_display *display,
> >>> @@ -40,14 +39,12 @@ void intel_parent_fb_pin_ggtt_unpin(struct intel_display *display,
> >>>    				    int fence_id);
> >>>    int intel_parent_fb_pin_dpt_pin(struct intel_display *display,
> >>>    				struct drm_gem_object *obj,
> >>> -				struct intel_dpt *dpt,
> >>>    				const struct intel_fb_pin_params *pin_params,
> >>> -				struct i915_vma **out_dpt_vma,
> >>>    				struct i915_vma **out_ggtt_vma,
> >>>    				u32 *out_offset);
> >>>    void intel_parent_fb_pin_dpt_unpin(struct intel_display *display,
> >>> -				   struct intel_dpt *dpt,
> >>> -				   struct i915_vma *dpt_vma,
> >>> +				   struct drm_gem_object *obj,
> >>> +				   const struct intel_gtt_view *view,
> >>>    				   struct i915_vma *ggtt_vma);
> >>>    struct i915_vma *intel_parent_fb_pin_reuse_vma(struct intel_display *display,
> >>>    					       struct i915_vma *old_ggtt_vma,
> >>> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
> >>> index d23de0f34e4b..40e9b1ac4e11 100644
> >>> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> >>> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> >>> @@ -137,7 +137,6 @@ intel_plane_duplicate_state(struct drm_plane *plane)
> >>>    	__drm_atomic_helper_plane_duplicate_state(plane, &intel_state->uapi);
> >>>    
> >>>    	intel_state->ggtt_vma = NULL;
> >>> -	intel_state->dpt_vma = NULL;
> >>>    	intel_state->fence_id = -1;
> >>>    	intel_state->damage = DRM_RECT_INIT(0, 0, 0, 0);
> >>>    	intel_state->psr2_sel_fetch_area = DRM_RECT_INIT(0, 0, 0, 0);
> >>> @@ -173,7 +172,6 @@ intel_plane_destroy_state(struct drm_plane *plane,
> >>>    	struct intel_plane_state *plane_state = to_intel_plane_state(state);
> >>>    
> >>>    	drm_WARN_ON(plane->dev, plane_state->ggtt_vma);
> >>> -	drm_WARN_ON(plane->dev, plane_state->dpt_vma);
> >>>    
> >>>    	__drm_atomic_helper_plane_destroy_state(&plane_state->uapi);
> >>>    	if (plane_state->hw.fb)
> >>> @@ -1371,7 +1369,6 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
> >>>    	const struct intel_framebuffer *old_fb =
> >>>    		to_intel_framebuffer(old_plane_state->hw.fb);
> >>>    	struct i915_vma *ggtt_vma = NULL;
> >>> -	struct i915_vma *dpt_vma = NULL;
> >>>    	int fence_id = -1;
> >>>    	u32 offset = 0;
> >>>    	int ret;
> >>> @@ -1410,14 +1407,12 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
> >>>    		};
> >>>    
> >>>    		ret = intel_parent_fb_pin_dpt_pin(display, intel_fb_bo(&fb->base),
> >>> -						  fb->dpt, &pin_params,
> >>> -						  &dpt_vma, &ggtt_vma, &offset);
> >>> +						  &pin_params, &ggtt_vma, &offset);
> >>>    	}
> >>>    	if (ret)
> >>>    		return ret;
> >>>    
> >>>    got_vma:
> >>> -	plane_state->dpt_vma = dpt_vma;
> >>>    	plane_state->ggtt_vma = ggtt_vma;
> >>>    	plane_state->fence_id = fence_id;
> >>>    
> >>> @@ -1440,11 +1435,11 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
> >>>    		old_plane_state->ggtt_vma = NULL;
> >>>    		old_plane_state->fence_id = -1;
> >>>    	} else {
> >>> -		intel_parent_fb_pin_dpt_unpin(display, fb->dpt,
> >>> -					      old_plane_state->dpt_vma,
> >>> +		intel_parent_fb_pin_dpt_unpin(display,
> >>> +					      intel_fb_bo(&fb->base),
> >>> +					      &old_plane_state->view.gtt,
> >>>    					      old_plane_state->ggtt_vma);
> >>>    
> >>> -		old_plane_state->dpt_vma = NULL;
> >>>    		old_plane_state->ggtt_vma = NULL;
> >>>    	}
> >>>    }
> >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> >>> index 9e01f8b2079a..f5873e59666b 100644
> >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> >>> @@ -32,6 +32,7 @@
> >>>    #include "display/intel_frontbuffer.h"
> >>>    #include "pxp/intel_pxp.h"
> >>>    
> >>> +#include "i915_dpt.h"
> >>>    #include "i915_drv.h"
> >>>    #include "i915_file_private.h"
> >>>    #include "i915_gem_clflush.h"
> >>> @@ -116,6 +117,9 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
> >>>    	INIT_LIST_HEAD(&obj->lut_list);
> >>>    	spin_lock_init(&obj->lut_lock);
> >>>    
> >>> +	INIT_LIST_HEAD(&obj->dpt_list);
> >>> +	spin_lock_init(&obj->dpt_lock);
> >>> +
> >>>    	spin_lock_init(&obj->mmo.lock);
> >>>    	obj->mmo.offsets = RB_ROOT;
> >>>    
> >>> @@ -402,6 +406,8 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
> >>>    	if (obj->shares_resv_from)
> >>>    		i915_vm_resv_put(obj->shares_resv_from);
> >>>    
> >>> +	i915_dpt_obj_free(obj);
> >>> +
> >>>    	__i915_gem_object_fini(obj);
> >>>    }
> >>>    
> >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> >>> index 969f6ea2b855..2a2735bfc7c9 100644
> >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> >>> @@ -288,6 +288,12 @@ struct drm_i915_gem_object {
> >>>    	struct list_head lut_list;
> >>>    	spinlock_t lut_lock; /* guards lut_list */
> >>>    
> >>> +	/**
> >>> +	 * @dpt_list: List of DPTs backed by this object
> >>> +	 */
> >>> +	struct list_head dpt_list;
> >>> +	spinlock_t dpt_lock; /* protects dpt_list */
> >>> +
> >>>    	/**
> >>>    	 * @obj_link: Link into @i915_gem_ww_ctx.obj_list
> >>>    	 *
> >>> diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
> >>> index e625ec293c5c..27f9a648bb26 100644
> >>> --- a/drivers/gpu/drm/i915/i915_dpt.c
> >>> +++ b/drivers/gpu/drm/i915/i915_dpt.c
> >>> @@ -20,16 +20,15 @@ struct intel_dpt {
> >>>    	struct drm_i915_gem_object *obj;
> >>>    	struct i915_vma *vma;
> >>>    	void __iomem *iomem;
> >>> +	struct intel_gtt_view view;
> >>> +	struct list_head obj_link;
> >>>    	struct list_head ggtt_link;
> >>>    };
> >>>    
> >>> -#define i915_is_dpt(vm) ((vm)->is_dpt)
> >>> -
> >>> -static inline struct intel_dpt *
> >>> -i915_vm_to_dpt(struct i915_address_space *vm)
> >>> +struct intel_dpt *i915_vm_to_dpt(struct i915_address_space *vm)
> >>>    {
> >>>    	BUILD_BUG_ON(offsetof(struct intel_dpt, vm));
> >>> -	drm_WARN_ON(&vm->i915->drm, !i915_is_dpt(vm));
> >>> +	drm_WARN_ON(&vm->i915->drm, !vm->is_dpt);
> >>>    	return container_of(vm, struct intel_dpt, vm);
> >>>    }
> >>>    
> >>> @@ -196,10 +195,66 @@ static void i915_dpt_free(struct intel_dpt *dpt)
> >>>    	i915_dpt_put(dpt);
> >>>    }
> >>>    
> >>> -static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj,
> >>> -					 const struct intel_gtt_view *view)
> >>> +static struct intel_dpt *__i915_dpt_lookup(struct drm_i915_gem_object *obj,
> >>> +					   const struct intel_gtt_view *view)
> >>> +{
> >>> +	struct intel_dpt *dpt;
> >>> +
> >>> +	lockdep_assert_held(&obj->dpt_lock);
> >>> +
> >>> +	list_for_each_entry(dpt, &obj->dpt_list, obj_link) {
> >>> +		if (!intel_gtt_view_compare(&dpt->view, view))
> >>> +			return dpt;
> >>> +	}
> >>> +
> >>> +	return NULL;
> >>> +}
> >>> +
> >>> +struct intel_dpt *i915_dpt_lookup(struct drm_i915_gem_object *obj,
> >>> +				  const struct intel_gtt_view *view)
> >>> +{
> >>> +	struct intel_dpt *dpt;
> >>> +
> >>> +	spin_lock(&obj->dpt_lock);
> >>> +	dpt = __i915_dpt_lookup(obj, view);
> >>> +	spin_unlock(&obj->dpt_lock);
> >>> +
> >>> +	return dpt;
> >>> +}
> >>> +
> >>> +static void i915_dpt_add(struct drm_i915_gem_object *obj,
> >>> +			 struct intel_dpt *new_dpt)
> >>> +{
> >>> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> >>> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
> >>> +	struct intel_dpt *old_dpt;
> >>> +
> >>> +	spin_lock(&obj->dpt_lock);
> >>> +
> >>> +	/*
> >>> +	 * If someone else inserted a suitable DPT in the
> >>> +	 * meantime we keep that and throw away the new one.
> >>> +	 */
> >>> +	old_dpt = __i915_dpt_lookup(obj, &new_dpt->view);
> >>> +	if (old_dpt) {
> >>> +		spin_unlock(&obj->dpt_lock);
> >>> +		i915_dpt_free(new_dpt);
> >>> +		return;
> >>> +	}
> >>> +
> >>> +	list_add_tail(&new_dpt->obj_link, &obj->dpt_list);
> >>> +
> >>> +	spin_unlock(&obj->dpt_lock);
> >>> +
> >>> +	spin_lock(&ggtt->dpt_lock);
> >>> +	list_add_tail(&new_dpt->ggtt_link, &ggtt->dpt_list);
> >>> +	spin_unlock(&ggtt->dpt_lock);
> >>> +}
> >>> +
> >>> +static struct intel_dpt *dpt_create(struct drm_i915_gem_object *obj,
> >>> +				    const struct intel_gtt_view *view)
> >>>    {
> >>> -	struct drm_i915_private *i915 = to_i915(obj->dev);
> >>> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> >>>    	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
> >>>    	struct drm_i915_gem_object *dpt_obj;
> >>>    	struct i915_address_space *vm;
> >>> @@ -211,7 +266,7 @@ static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj,
> >>>    		size = intel_remapped_info_size(&view->remapped);
> >>>    	} else {
> >>>    		drm_WARN_ON(&i915->drm, !intel_gtt_view_is_normal(view));
> >>> -		size = DIV_ROUND_UP_ULL(obj->size, I915_GTT_PAGE_SIZE);
> >>> +		size = DIV_ROUND_UP_ULL(obj->base.size, I915_GTT_PAGE_SIZE);
> >>>    	}
> >>>    
> >>>    	size = round_up(size * sizeof(gen8_pte_t), I915_GTT_PAGE_SIZE);
> >>> @@ -241,6 +296,8 @@ static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj,
> >>>    
> >>>    	vm = &dpt->vm;
> >>>    
> >>> +	dpt->view = *view;
> >>> +
> >>>    	vm->gt = to_gt(i915);
> >>>    	vm->i915 = i915;
> >>>    	vm->dma = i915->drm.dev;
> >>> @@ -262,22 +319,47 @@ static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj,
> >>>    	dpt->obj = dpt_obj;
> >>>    	dpt->obj->is_dpt = true;
> >>>    
> >>> -	spin_lock(&ggtt->dpt_lock);
> >>> -	list_add_tail(&dpt->ggtt_link, &ggtt->dpt_list);
> >>> -	spin_unlock(&ggtt->dpt_lock);
> >>> -
> >>>    	return dpt;
> >>>    }
> >>>    
> >>> -static void i915_dpt_destroy(struct intel_dpt *dpt)
> >>> +static int i915_dpt_create(struct drm_gem_object *_obj,
> >>> +			   const struct intel_gtt_view *view)
> >>>    {
> >>> -	struct i915_ggtt *ggtt = i915_dpt_to_vm(dpt)->gt->ggtt;
> >>> +	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
> >>> +	struct intel_dpt *dpt;
> >>> +
> >>> +	/* already have one? */
> >>> +	dpt = i915_dpt_lookup(obj, view);
> >>> +	if (dpt)
> >>> +		return 0;
> >>> +
> >>> +	dpt = dpt_create(obj, view);
> >>> +	if (IS_ERR(dpt))
> >>> +		return PTR_ERR(dpt);
> >>> +
> >>> +	i915_dpt_add(obj, dpt);
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>> +void i915_dpt_obj_free(struct drm_i915_gem_object *obj)
> >>> +{
> >>> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> >>> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
> >>> +	struct intel_dpt *dpt, *next;
> >>> +	LIST_HEAD(dpt_list);
> >>> +
> >>> +	spin_lock(&obj->dpt_lock);
> >>> +	list_splice_init(&obj->dpt_list, &dpt_list);
> >>> +	spin_unlock(&obj->dpt_lock);
> >>>    
> >>>    	spin_lock(&ggtt->dpt_lock);
> >>> -	list_del_init(&dpt->ggtt_link);
> >>> +	list_for_each_entry(dpt, &dpt_list, obj_link)
> >>> +		list_del_init(&dpt->ggtt_link);
> >>>    	spin_unlock(&ggtt->dpt_lock);
> >>>    
> >>> -	i915_dpt_free(dpt);
> >>> +	list_for_each_entry_safe(dpt, next, &dpt_list, obj_link)
> >>> +		i915_dpt_free(dpt);
> >>>    }
> >>>    
> >>>    void i915_dpt_suspend(struct i915_ggtt *ggtt)
> >>> @@ -321,7 +403,7 @@ void i915_dpt_resume(struct i915_ggtt *ggtt)
> >>>    
> >>>    	/*
> >>>    	 * i915_ggtt_resume_vm() with evict_all==true
> >>> -	 * only does a quick sanity check, so OK to call
> >>> +	 * only does a sanity check, so OK to call
> >>>    	 * with ggtt->dpt_lock held.
> >>>    	 */
> >>>    	spin_lock(&ggtt->dpt_lock);
> >>> @@ -339,5 +421,4 @@ u64 i915_dpt_offset(struct i915_vma *dpt_vma)
> >>>    
> >>>    const struct intel_display_dpt_interface i915_display_dpt_interface = {
> >>>    	.create = i915_dpt_create,
> >>> -	.destroy = i915_dpt_destroy,
> >>>    };
> >>> diff --git a/drivers/gpu/drm/i915/i915_dpt.h b/drivers/gpu/drm/i915/i915_dpt.h
> >>> index 51a497abb5e1..5e88d8881db1 100644
> >>> --- a/drivers/gpu/drm/i915/i915_dpt.h
> >>> +++ b/drivers/gpu/drm/i915/i915_dpt.h
> >>> @@ -6,10 +6,17 @@
> >>>    
> >>>    #include <linux/types.h>
> >>>    
> >>> +struct drm_i915_gem_object;
> >>>    struct i915_address_space;
> >>>    struct i915_ggtt;
> >>>    struct i915_vma;
> >>>    struct intel_dpt;
> >>> +struct intel_gtt_view;
> >>> +
> >>> +struct intel_dpt *i915_vm_to_dpt(struct i915_address_space *vm);
> >>> +void i915_dpt_obj_free(struct drm_i915_gem_object *obj);
> >>> +struct intel_dpt *i915_dpt_lookup(struct drm_i915_gem_object *obj,
> >>> +				  const struct intel_gtt_view *view);
> >>>    
> >>>    struct i915_address_space *i915_dpt_to_vm(struct intel_dpt *dpt);
> >>>    struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dpt *dpt, unsigned int alignment);
> >>> diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i915_fb_pin.c
> >>> index b5672b2cf5bd..91385c17e564 100644
> >>> --- a/drivers/gpu/drm/i915/i915_fb_pin.c
> >>> +++ b/drivers/gpu/drm/i915/i915_fb_pin.c
> >>> @@ -15,11 +15,10 @@
> >>>    #include "i915_vma.h"
> >>>    
> >>>    static struct i915_vma *
> >>> -intel_fb_pin_to_dpt(struct drm_gem_object *_obj, struct intel_dpt *dpt,
> >>> +intel_fb_pin_to_dpt(struct drm_i915_gem_object *obj, struct intel_dpt *dpt,
> >>>    		    const struct intel_fb_pin_params *pin_params)
> >>>    {
> >>> -	struct drm_i915_private *i915 = to_i915(_obj->dev);
> >>> -	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
> >>> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> >>>    	struct i915_address_space *vm = i915_dpt_to_vm(dpt);
> >>>    	struct i915_gem_ww_ctx ww;
> >>>    	struct i915_vma *vma;
> >>> @@ -225,6 +224,8 @@ static int i915_fb_pin_ggtt_pin(struct drm_gem_object *obj,
> >>>    	if (IS_ERR(ggtt_vma))
> >>>    		return PTR_ERR(ggtt_vma);
> >>>    
> >>> +	drm_WARN_ON(obj->dev, ggtt_vma->vm->is_dpt);
> >>> +
> >>>    	*out_ggtt_vma = ggtt_vma;
> >>>    
> >>>    	/*
> >>> @@ -244,18 +245,23 @@ static int i915_fb_pin_ggtt_pin(struct drm_gem_object *obj,
> >>>    static void i915_fb_pin_ggtt_unpin(struct i915_vma *ggtt_vma,
> >>>    				   int fence_id)
> >>>    {
> >>> +	WARN_ON(ggtt_vma->vm->is_dpt);
> >>> +
> >>>    	intel_fb_unpin_vma(ggtt_vma, fence_id);
> >>>    }
> >>>    
> >>> -static int i915_fb_pin_dpt_pin(struct drm_gem_object *obj, struct intel_dpt *dpt,
> >>> +static int i915_fb_pin_dpt_pin(struct drm_gem_object *_obj,
> >>>    			       const struct intel_fb_pin_params *pin_params,
> >>> -			       struct i915_vma **out_dpt_vma,
> >>>    			       struct i915_vma **out_ggtt_vma,
> >>>    			       u32 *out_offset)
> >>>    {
> >>> +	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
> >>>    	struct i915_vma *ggtt_vma, *dpt_vma;
> >>> +	struct intel_dpt *dpt;
> >>>    
> >>> -	WARN_ON(!dpt);
> >>> +	dpt = i915_dpt_lookup(obj, pin_params->view);
> >>> +	if (drm_WARN_ON(obj->base.dev, !dpt))
> >>> +		return -EINVAL;
> >>>    
> >>>    	ggtt_vma = i915_dpt_pin_to_ggtt(dpt, pin_params->alignment / 512);
> >>>    	if (IS_ERR(ggtt_vma))
> >>> @@ -267,20 +273,36 @@ static int i915_fb_pin_dpt_pin(struct drm_gem_object *obj, struct intel_dpt *dpt
> >>>    		return PTR_ERR(dpt_vma);
> >>>    	}
> >>>    
> >>> -	drm_WARN_ON(obj->dev, ggtt_vma == dpt_vma);
> >>> +	drm_WARN_ON(obj->base.dev, ggtt_vma == dpt_vma);
> >>> +	drm_WARN_ON(obj->base.dev, ggtt_vma->vm->is_dpt);
> >>> +	drm_WARN_ON(obj->base.dev, !dpt_vma->vm->is_dpt);
> >>>    
> >>>    	*out_ggtt_vma = ggtt_vma;
> >>> -	*out_dpt_vma = dpt_vma;
> >>> -
> >>>    	*out_offset = i915_ggtt_offset(ggtt_vma);
> >>>    
> >>>    	return 0;
> >>>    }
> >>>    
> >>> -static void i915_fb_pin_dpt_unpin(struct intel_dpt *dpt,
> >>> -				  struct i915_vma *dpt_vma,
> >>> +static void i915_fb_pin_dpt_unpin(struct drm_gem_object *_obj,
> >>> +				  const struct intel_gtt_view *view,
> >>>    				  struct i915_vma *ggtt_vma)
> >>>    {
> >>> +	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
> >>> +	struct i915_vma *dpt_vma;
> >>> +	struct intel_dpt *dpt;
> >>> +
> >>> +	dpt = i915_dpt_lookup(obj, view);
> >>> +	if (drm_WARN_ON(obj->base.dev, !dpt))
> >>> +		return;
> >>> +
> >>> +	dpt_vma = i915_vma_lookup(obj, i915_dpt_to_vm(dpt), view);
> >>> +	if (drm_WARN_ON(obj->base.dev, !dpt_vma))
> >>> +		return;
> >>> +
> >>> +	drm_WARN_ON(obj->base.dev, ggtt_vma == dpt_vma);
> >>> +	drm_WARN_ON(obj->base.dev, ggtt_vma->vm->is_dpt);
> >>> +	drm_WARN_ON(obj->base.dev, !dpt_vma->vm->is_dpt);
> >>> +
> >>>    	intel_fb_unpin_vma(dpt_vma, -1);
> >>>    	i915_dpt_unpin_from_ggtt(dpt);
> >>
> >> Later in series here dpt is changed to be ggtt_vma which is unpinned.
> >> If those lookups above failed this will leave ggtt_vma pinned?
> > 
> > That would be a bug in the implementation and we get the WARN.
> > 
> > I was actually considering hiding the vmas completely from the
> > display driver. On i915 we can always look them up like this,
> > but xe can't handle that since its vmas aren't real. For that
> > reason alone we still have to pass the ggtt_vma via the display
> > code. If anyone ever implements things properly in xe then we
> > can completely remove the remaining vmas from the parent
> > interface.
> > 
> > I suppose I could already change the i915 implementation to also
> > look up the ggtt_vma on the unpin() side, and just WARN if it
> > doesn't match what came over the parent interface. Then the i915
> > patch for dropping the vmas from the parent interface
> > (assuming we can get xe fixed at some point) wouldn't have to
> > do any anything but delete a few lines of code.
> > 
> 
> Agreed that view mismatch would be bug, but WARN doesn't release the pin 
> and early returns skip ggtt unpin. I'd make ggtt_vma unpin unconditional 
> and use lookups only for the dpt_vma unpin and comparison WARN. I think 
> that still fits dropping the vmas from the parent interface when xe 
> supports it

A partial unpin doesn't seem like it it would do that much good.
The rest would still remain pinned and eventually eat up your
memory. But I suppose we might end up limping along a bit longer
if we don't exhaust the GGTT so quickly. Shrug.

But if we remove the vmas from the fb_unpin interface then we
can't do such a partial unpin because we will not have a vma
to unpin if the lookups fail.

-- 
Ville Syrjälä
Intel
