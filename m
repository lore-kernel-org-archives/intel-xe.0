Return-Path: <intel-xe-bounces@lists.freedesktop.org>
Date: Tue, 24 Jan 2023 10:43:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <Y8/8ixt3/0bSEfJP@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-19-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230112222538.2000142-19-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH 18/37] drm/xe: Implement initial hw readout
 for framebuffer
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
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com, maarten.lankhorst@linux.intel.com, philippe.lecluse@intel.com, mchehab@kernel.org

On Thu, Jan 12, 2023 at 05:25:19PM -0500, Rodrigo Vivi wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

commit msg needed on this one as well.

>=20
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb.c       |   9 +
>  drivers/gpu/drm/i915/display/intel_fbdev.c    |  11 +-
>  drivers/gpu/drm/xe/display/xe_plane_initial.c | 224 ++++++------------
>  3 files changed, 89 insertions(+), 155 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index e0a8d9e9df9a..cf047353fd84 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -1847,6 +1847,15 @@ static void intel_user_framebuffer_destroy(struct =
drm_framebuffer *fb)
>  #ifdef I915
>  	if (intel_fb_uses_dpt(fb))
>  		intel_dpt_destroy(intel_fb->dpt_vm);
> +#else
> +	if (intel_fb_obj(fb)->flags & XE_BO_CREATE_PINNED_BIT) {
> +		struct xe_bo *bo =3D intel_fb_obj(fb);
> +
> +		/* Unpin our kernel fb first */
> +		xe_bo_lock_no_vm(bo, NULL);
> +		xe_bo_unpin(bo);
> +		xe_bo_unlock_no_vm(bo);
> +	}
>  #endif
> =20
>  	drm_gem_object_put(fb->obj[0]);
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm=
/i915/display/intel_fbdev.c
> index 52dc33c5f6d8..d1e5b730433d 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -415,17 +415,8 @@ static void intel_fbdev_destroy(struct intel_fbdev *=
ifbdev)
>  	if (ifbdev->vma)
>  		intel_unpin_fb_vma(ifbdev->vma, ifbdev->vma_flags);
> =20
> -	if (ifbdev->fb) {
> -#ifndef I915
> -		struct xe_bo *bo =3D intel_fb_obj(&ifbdev->fb->base);
> -
> -		/* Unpin our kernel fb first */
> -		xe_bo_lock_no_vm(bo, NULL);
> -		xe_bo_unpin(bo);
> -		xe_bo_unlock_no_vm(bo);
> -#endif
> +	if (ifbdev->fb)
>  		drm_framebuffer_remove(&ifbdev->fb->base);
> -	}
> =20
>  	kfree(ifbdev);
>  }
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/=
drm/xe/display/xe_plane_initial.c
> index 0b3ad417d607..c442733d34b1 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -3,29 +3,24 @@
>   * Copyright =EF=BF=BD 2021 Intel Corporation
>   */
> =20
> -#ifdef I915
> -#include "gem/i915_gem_region.h"
> -#endif
> +/* for ioread64 */
> +#include <linux/io-64-nonatomic-lo-hi.h>
> +
> +#include "xe_ggtt.h"
> +
>  #include "i915_drv.h"
>  #include "intel_atomic_plane.h"
>  #include "intel_display.h"
>  #include "intel_display_types.h"
>  #include "intel_fb.h"
> +#include "intel_fb_pin.h"
>  #include "intel_frontbuffer.h"
>  #include "intel_plane_initial.h"
> =20
> -#if 0
> -#ifndef I915
> -typedef u64 gen8_pte_t;
> -#define I915_GTT_PAGE_SIZE SZ_4K
> -#define I915_GTT_PAGE_MASK ~(SZ_4K - 1)
> -#endif
> -
>  static bool
>  intel_reuse_initial_plane_obj(struct drm_i915_private *i915,
>  			      const struct intel_initial_plane_config *plane_config,
> -			      struct drm_framebuffer **fb,
> -			      struct i915_vma **vma)
> +			      struct drm_framebuffer **fb)
>  {
>  	struct intel_crtc *crtc;
> =20
> @@ -45,7 +40,6 @@ intel_reuse_initial_plane_obj(struct drm_i915_private *=
i915,
> =20
>  		if (intel_plane_ggtt_offset(plane_state) =3D=3D plane_config->base) {
>  			*fb =3D plane_state->hw.fb;
> -			*vma =3D plane_state->ggtt_vma;
>  			return true;
>  		}
>  	}
> @@ -53,118 +47,84 @@ intel_reuse_initial_plane_obj(struct drm_i915_privat=
e *i915,
>  	return false;
>  }
> =20
> -static struct i915_vma *
> -initial_plane_vma(struct drm_i915_private *i915,
> -		  struct intel_initial_plane_config *plane_config)
> +static struct xe_bo *
> +initial_plane_bo(struct xe_device *xe,
> +		 struct intel_initial_plane_config *plane_config)
>  {
> -	struct intel_memory_region *mem;
> -	struct drm_i915_gem_object *obj;
> -	struct i915_vma *vma;
> +	struct xe_gt *gt0 =3D xe_device_get_gt(xe, 0);
> +	struct xe_bo *bo;
>  	resource_size_t phys_base;
> -	u32 base, size;
> -	u64 pinctl;
> +	u32 base, size, flags;
> +	u64 page_size =3D xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K =
: SZ_4K;
> =20
>  	if (plane_config->size =3D=3D 0)
>  		return NULL;
> =20
> -	base =3D round_down(plane_config->base, I915_GTT_PAGE_SIZE);
> -	if (IS_DGFX(i915)) {
> -		gen8_pte_t __iomem *gte =3D to_gt(i915)->ggtt->gsm;
> -		gen8_pte_t pte;
> +	flags =3D XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT;
> =20
> -		gte +=3D base / I915_GTT_PAGE_SIZE;
> +	base =3D round_down(plane_config->base, page_size);
> +	if (IS_DGFX(xe)) {
> +		u64 __iomem *gte =3D gt0->mem.ggtt->gsm;
> +		u64 pte;
> +
> +		gte +=3D base / GEN8_PAGE_SIZE;
> =20
>  		pte =3D ioread64(gte);
>  		if (!(pte & GEN12_GGTT_PTE_LM)) {
> -			drm_err(&i915->drm,
> +			drm_err(&xe->drm,
>  				"Initial plane programming missing PTE_LM bit\n");
>  			return NULL;
>  		}
> =20
> -		phys_base =3D pte & I915_GTT_PAGE_MASK;
> -		mem =3D i915->mm.regions[INTEL_REGION_LMEM_0];
> +		phys_base =3D pte & ~(page_size - 1);
> +		flags |=3D XE_BO_CREATE_VRAM0_BIT;
> =20
>  		/*
>  		 * We don't currently expect this to ever be placed in the
>  		 * stolen portion.
>  		 */
> -		if (phys_base >=3D resource_size(&mem->region)) {
> -			drm_err(&i915->drm,
> +		if (phys_base >=3D gt0->mem.vram.size) {
> +			drm_err(&xe->drm,
>  				"Initial plane programming using invalid range, phys_base=3D%pa\n",
>  				&phys_base);
>  			return NULL;
>  		}
> =20
> -		drm_dbg(&i915->drm,
> +		drm_dbg(&xe->drm,
>  			"Using phys_base=3D%pa, based on initial plane programming\n",
>  			&phys_base);
>  	} else {
> +		struct ttm_resource_manager *stolen =3D ttm_manager_type(&xe->ttm, XE_=
PL_STOLEN);
> +
> +		if (!stolen)
> +			return NULL;
>  		phys_base =3D base;
> -		mem =3D i915->mm.stolen_region;
> -	}
> +		flags |=3D XE_BO_CREATE_STOLEN_BIT;
> =20
> -	if (!mem)
> -		return NULL;
> +		/*
> +		 * If the FB is too big, just don't use it since fbdev is not very
> +		 * important and we should probably use that space with FBC or other
> +		 * features.
> +		 */
> +		if (!stolen || (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
> +				plane_config->size * 2 >> PAGE_SHIFT >=3D stolen->size))
> +			return NULL;
> +	}
> =20
>  	size =3D round_up(plane_config->base + plane_config->size,
> -			mem->min_page_size);
> +			page_size);
>  	size -=3D base;
> =20
> -	/*
> -	 * If the FB is too big, just don't use it since fbdev is not very
> -	 * important and we should probably use that space with FBC or other
> -	 * features.
> -	 */
> -	if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
> -	    mem =3D=3D i915->mm.stolen_region &&
> -	    size * 2 > i915->stolen_usable_size)
> +	bo =3D xe_bo_create_pin_map_at(xe, gt0, NULL, size, phys_base,
> +				     ttm_bo_type_kernel, flags);
> +	if (IS_ERR(bo)) {
> +		drm_dbg(&xe->drm,
> +			"Failed to create bo phys_base=3D%pa size %u with flags %x: %li\n",
> +			&phys_base, size, flags, PTR_ERR(bo));
>  		return NULL;
> -
> -	obj =3D i915_gem_object_create_region_at(mem, phys_base, size, 0);
> -	if (IS_ERR(obj))
> -		return NULL;
> -
> -	/*
> -	 * Mark it WT ahead of time to avoid changing the
> -	 * cache_level during fbdev initialization. The
> -	 * unbind there would get stuck waiting for rcu.
> -	 */
> -	i915_gem_object_set_cache_coherency(obj, HAS_WT(i915) ?
> -					    I915_CACHE_WT : I915_CACHE_NONE);
> -
> -	switch (plane_config->tiling) {
> -	case I915_TILING_NONE:
> -		break;
> -	case I915_TILING_X:
> -	case I915_TILING_Y:
> -		obj->tiling_and_stride =3D
> -			plane_config->fb->base.pitches[0] |
> -			plane_config->tiling;
> -		break;
> -	default:
> -		MISSING_CASE(plane_config->tiling);
> -		goto err_obj;
>  	}
> =20
> -	vma =3D i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
> -	if (IS_ERR(vma))
> -		goto err_obj;
> -
> -	pinctl =3D PIN_GLOBAL | PIN_OFFSET_FIXED | base;
> -	if (HAS_GMCH(i915))
> -		pinctl |=3D PIN_MAPPABLE;
> -	if (i915_vma_pin(vma, 0, 0, pinctl))
> -		goto err_obj;
> -
> -	if (i915_gem_object_is_tiled(obj) &&
> -	    !i915_vma_is_map_and_fenceable(vma))
> -		goto err_obj;
> -
> -	return vma;
> -
> -err_obj:
> -	i915_gem_object_put(obj);
> -	return NULL;
> +	return bo;
>  }
> =20
>  static bool
> @@ -175,7 +135,7 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
>  	struct drm_mode_fb_cmd2 mode_cmd =3D { 0 };
>  	struct drm_framebuffer *fb =3D &plane_config->fb->base;
> -	struct i915_vma *vma;
> +	struct xe_bo *bo;
> =20
>  	switch (fb->modifier) {
>  	case DRM_FORMAT_MOD_LINEAR:
> @@ -197,21 +157,20 @@ intel_alloc_initial_plane_obj(struct intel_crtc *cr=
tc,
>  	mode_cmd.modifier[0] =3D fb->modifier;
>  	mode_cmd.flags =3D DRM_MODE_FB_MODIFIERS;
> =20
> -	vma =3D initial_plane_vma(dev_priv, plane_config);
> -	if (!vma)
> +	bo =3D initial_plane_bo(dev_priv, plane_config);
> +	if (!bo)
>  		return false;
> =20
>  	if (intel_framebuffer_init(to_intel_framebuffer(fb),
> -				   vma->obj, &mode_cmd)) {
> +				   bo, &mode_cmd)) {
>  		drm_dbg_kms(&dev_priv->drm, "intel fb init failed\n");
> -		goto err_vma;
> +		goto err_bo;
>  	}
> =20
> -	plane_config->vma =3D vma;
>  	return true;
> =20
> -err_vma:
> -	i915_vma_put(vma);
> +err_bo:
> +	xe_bo_unpin_map_no_vm(bo);
>  	return false;
>  }
> =20
> @@ -236,43 +195,21 @@ intel_find_initial_plane_obj(struct intel_crtc *crt=
c,
>  	if (!plane_config->fb)
>  		return;
> =20
> -	if (intel_alloc_initial_plane_obj(crtc, plane_config)) {
> +	if (intel_alloc_initial_plane_obj(crtc, plane_config))
>  		fb =3D &plane_config->fb->base;
> -		vma =3D plane_config->vma;
> -		goto valid_fb;
> -	}
> +	else if (!intel_reuse_initial_plane_obj(dev_priv, plane_config, &fb))
> +		goto nofb;
> =20
> -	/*
> -	 * Failed to alloc the obj, check to see if we should share
> -	 * an fb with another CRTC instead
> -	 */
> -	if (intel_reuse_initial_plane_obj(dev_priv, plane_config, &fb, &vma))
> -		goto valid_fb;
> -
> -	/*
> -	 * We've failed to reconstruct the BIOS FB.  Current display state
> -	 * indicates that the primary plane is visible, but has a NULL FB,
> -	 * which will lead to problems later if we don't fix it up.  The
> -	 * simplest solution is to just disable the primary plane now and
> -	 * pretend the BIOS never had it enabled.
> -	 */
> -	intel_plane_disable_noatomic(crtc, plane);
> -
> -	return;
> -
> -valid_fb:
>  	plane_state->uapi.rotation =3D plane_config->rotation;
>  	intel_fb_fill_view(to_intel_framebuffer(fb),
>  			   plane_state->uapi.rotation, &plane_state->view);
> =20
> -	__i915_vma_pin(vma);
> -	plane_state->ggtt_vma =3D i915_vma_get(vma);
> -#ifdef I915
> -	if (intel_plane_uses_fence(plane_state) &&
> -	    i915_vma_pin_fence(vma) =3D=3D 0 && vma->fence)
> -		plane_state->flags |=3D PLANE_HAS_FENCE;
> -#endif
> +	vma =3D intel_pin_and_fence_fb_obj(fb, false, &plane_state->view.gtt,
> +					 false, &plane_state->flags);
> +	if (IS_ERR(vma))
> +		goto nofb;
> =20
> +	plane_state->ggtt_vma =3D vma;
>  	plane_state->uapi.src_x =3D 0;
>  	plane_state->uapi.src_y =3D 0;
>  	plane_state->uapi.src_w =3D fb->width << 16;
> @@ -283,11 +220,6 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
>  	plane_state->uapi.crtc_w =3D fb->width;
>  	plane_state->uapi.crtc_h =3D fb->height;
> =20
> -#ifdef I915
> -	if (plane_config->tiling)
> -		dev_priv->preserve_bios_swizzle =3D true;
> -#endif
> -
>  	plane_state->uapi.fb =3D fb;
>  	drm_framebuffer_get(fb);
> =20
> @@ -295,6 +227,19 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
>  	intel_plane_copy_uapi_to_hw_state(plane_state, plane_state, crtc);
> =20
>  	atomic_or(plane->frontbuffer_bit, &to_intel_framebuffer(fb)->bits);
> +	return;
> +
> +nofb:
> +	/*
> +	 * We've failed to reconstruct the BIOS FB.  Current display state
> +	 * indicates that the primary plane is visible, but has a NULL FB,
> +	 * which will lead to problems later if we don't fix it up.  The
> +	 * simplest solution is to just disable the primary plane now and
> +	 * pretend the BIOS never had it enabled.
> +	 */
> +	intel_plane_disable_noatomic(crtc, plane);
> +
> +	return;
>  }
> =20
>  static void plane_config_fini(struct intel_initial_plane_config *plane_c=
onfig)
> @@ -308,16 +253,11 @@ static void plane_config_fini(struct intel_initial_=
plane_config *plane_config)
>  		else
>  			kfree(fb);
>  	}
> -
> -	if (plane_config->vma)
> -		i915_vma_put(plane_config->vma);
>  }
> -#endif
> =20
>  void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
>  {
> -#if 0
> -	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> +	struct xe_device *xe =3D to_xe_device(crtc->base.dev);
>  	struct intel_initial_plane_config plane_config =3D {};
> =20
>  	/*
> @@ -327,7 +267,7 @@ void intel_crtc_initial_plane_config(struct intel_crt=
c *crtc)
>  	 * can even allow for smooth boot transitions if the BIOS
>  	 * fb is large enough for the active pipe configuration.
>  	 */
> -	dev_priv->display.funcs.crtc->get_initial_plane_config(crtc, &plane_con=
fig);
> +	xe->display.funcs.display->get_initial_plane_config(crtc, &plane_config=
);
> =20
>  	/*
>  	 * If the fb is shared between multiple heads, we'll
> @@ -336,10 +276,4 @@ void intel_crtc_initial_plane_config(struct intel_cr=
tc *crtc)
>  	intel_find_initial_plane_obj(crtc, &plane_config);
> =20
>  	plane_config_fini(&plane_config);
> -#else
> -	struct intel_plane *plane =3D to_intel_plane(crtc->base.primary);
> -
> -	/* No support for stolen memory yet, just disable all, worry about smoo=
thness later! */
> -	intel_plane_disable_noatomic(crtc, plane);
> -#endif
>  }
> --=20
> 2.38.1
>=20

