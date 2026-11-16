Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A64B606A884
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+msHCWp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE27F10F1F0;
	Mon, 16 Nov 2026 13:59:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC87310EA07;
 Mon, 16 Nov 2026 13:59:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D4790433EE;
 Mon, 16 Nov 2026 13:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E96B1F000C4;
 Mon, 16 Nov 2026 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794837550;
 bh=B4r7obWrBshz8/ij81t0z5VobX7siIhhNRXwTONmOKI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=G+msHCWpxZX6a+NNYV/hOKf4AX97/ShHJSKRi1+0LcNoYOJi9sm8VqyyI3TU7uLth
 mmBHrpxEJURURotjFLkUW1iZC8LEGC/0hP5YMvBufiqYPLaX3GUmBOLQv9rnRA7d07
 L3BMi0qZGadvsNJZkX4NET5bunoll6NNNh1o+mp4VCDDZoqbwV3yFzb+vV9aflN2O6
 yagk6+dW5KY++nsGkqfC8w/BjwHcOYhd6AB9GUISO8tl0ViJMne5RwNraWNZ3tXnlP
 g1yK2i8Bk2CLgc5tuLx8opKhRiqCYoADkqItg/XkUSJ19gyAR5Ek9PTOyX+6szAbSs
 DqdMDzjF5ongA==
Message-ID: <sashiko-outbox-217123@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] drm/i915: Introduce
 intel_bo_fbdev_bios_fb_takeover()
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20261116131349.333818-12-dev@lankhorst.se>
References: <20261116131349.333818-7-dev@lankhorst.se>
 <20261116131349.333818-12-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 13:59:10 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] drm/xe: unmasked PTE PAT bits and stolen underflow in
  initial_plane_bo()
- [High] drm/xe: emit_pte() omits stolen base offset for pre-12.70
  stolen BOs
- [Medium] drm/xe: unconditional return false in
  xe_display_bo_fbdev_prefer_stolen()
- [Medium] drm/i915: deferred BIOS FB takeover in bios_fb_pick() breaks
  FBC and drm_panic
- [Medium] drm/i915/fbdev: double unpin on error in
  __intel_fbdev_fb_realloc()
- [Medium] drm/xe/display: missing fence wait in
  xe_display_bo_fbdev_bios_fb_takeover()
- [Low] drm/i915: commit message mismatch on bios_fb_pick() and
  initial_plane_bo()
--

commit 9503bd0192927fbc3fe3b1c40cd72de52b1ba89d
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()

This commit defers the stolen-memory suitability check for the BIOS
framebuffer from initial plane readout to fbdev probing via a new
intel_bo_fbdev_bios_fb_takeover() callback, and copies the stolen BIOS
framebuffer to system memory on Xe when stolen memory is not preferred.

> Additionally, bios_fb_ok() was renamed
> to bios_fb_takeover() with a different function signature.

[Severity: Low]
This isn't a bug, but the patch renames bios_fb_ok() to bios_fb_pick()
(while introducing intel_bo_fbdev_bios_fb_takeover() as the BO helper),
and the changelog also does not mention the phys_base calculation change
in initial_plane_bo().

> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm=
/i915/display/intel_fbdev.c
> index 219ee17de3f68..97d5e1279dbc1 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c

[ ... ]

> @@ -262,32 +262,68 @@ __intel_fbdev_fb_alloc(struct intel_display *displa=
y,
> =20
>  }
> =20
> -static bool bios_fb_ok(const struct intel_framebuffer *fb,
> -		       const struct drm_fb_helper_surface_size *sizes)
> +static struct intel_framebuffer *
> +__intel_fbdev_fb_realloc(struct intel_display *display,
> +			 const struct drm_framebuffer *orig_fb,
> +			 struct drm_gem_object *obj)
> +{
> +	struct drm_framebuffer *new_fb;
> +	struct drm_mode_fb_cmd2 mode_cmd =3D {
> +		.flags =3D DRM_MODE_FB_MODIFIERS,
> +		.width =3D orig_fb->width,
> +		.height =3D orig_fb->height,
> +		.pitches[0] =3D orig_fb->pitches[0],
> +		.offsets[0] =3D orig_fb->offsets[0],
> +		.pixel_format =3D orig_fb->format->format,
> +		.modifier[0] =3D orig_fb->modifier,
> +	};
> +
> +	new_fb =3D intel_framebuffer_create(obj, orig_fb->format, &mode_cmd);
> +
> +	if (IS_ERR(new_fb)) {
> +		intel_bo_fbdev_destroy(obj);
> +		return ERR_CAST(new_fb);
> +	}

[Severity: Medium]
Can intel_bo_fbdev_destroy(obj) double-unpin obj on Xe if
intel_framebuffer_create() fails after intel_bo_framebuffer_init()?

On Xe, xe_display_bo_fbdev_bios_fb_takeover() creates copy_bo with
XE_BO_FLAG_PINNED (pin_count =3D=3D 1).  If intel_framebuffer_init() fails =
at
a later step such as drm_framebuffer_init(), its error unwind calls
intel_bo_framebuffer_fini() -> xe_display_bo_framebuffer_fini(), which
sees XE_BO_FLAG_PINNED and calls xe_bo_unpin(bo) even though
xe_display_bo_framebuffer_init() only took a reference:

drivers/gpu/drm/xe/display/xe_display_bo.c:xe_display_bo_framebuffer_fini()=
 {
	struct xe_bo *bo =3D gem_to_xe_bo(obj);

	if (bo->flags & XE_BO_FLAG_PINNED) {
		/* Unpin our kernel fb first */
		xe_bo_lock(bo, false);
		xe_bo_unpin(bo);
		xe_bo_unlock(bo);
	}
	xe_bo_put(bo);
}

Calling intel_bo_fbdev_destroy(obj) -> xe_bo_unpin_map_no_vm(copy_bo)
then unpins copy_bo a second time when pin_count is already 0, triggering
xe_assert() and WARN_ON_ONCE(!bo->pin_count) in ttm_bo_unpin().

[ ... ]

> @@ -305,13 +341,23 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_he=
lper *helper,
> =20
>  	ifbdev->fb =3D NULL;
> =20
> -	if (fb && !bios_fb_ok(fb, sizes)) {
> -		drm_framebuffer_put(&fb->base);
> -		fb =3D NULL;
> -	}
> -
>  	wakeref =3D intel_display_rpm_get(display);
> =20
> +	if (fb) {
> +		struct intel_framebuffer *bios_fb =3D
> +			bios_fb_pick(fb, sizes);
> +
> +		if (IS_ERR(bios_fb)) {
> +			drm_dbg_kms(display->drm, "Re-using BIOS fb failed (%pe).", bios_fb);
> +			bios_fb =3D NULL;
> +		}
> +
> +		if (fb !=3D bios_fb) {
> +			drm_framebuffer_put(&fb->base);
> +			fb =3D bios_fb;
> +		}
> +	}

[Severity: Medium]
Does deferring the prefer_stolen check to intel_fbdev_driver_fbdev_probe()
break FBC allocation during initial commit and leave the stolen BIOS
framebuffer active on the hardware plane when fbcon takeover does not run
immediately?

First, removing the prefer_stolen check from initial_plane_vma() and
initial_plane_bo() keeps the BIOS framebuffer allocated in stolen memory
across intel_initial_commit(), which runs before intel_fbdev_setup().
When the BIOS framebuffer occupies more than half of stolen memory,
intel_fbc_alloc_cfb() -> find_compression_limit() during initial commit
either fails with -ENOSPC or permanently degrades the FBC compression
ratio (as intel_fbc_is_cfb_ok() does not reallocate a 1:1 CFB once the
initial FB is freed).

Second, when fb !=3D bios_fb here, drm_framebuffer_put(&fb->base) only drops
ifbdev's reference while the primary plane's plane_state->hw.fb still
scans out the original stolen framebuffer until a modeset commit flips the
plane.  When CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=3Dy (during a
quiet boot) or CONFIG_FRAMEBUFFER_CONSOLE=3Dn, register_framebuffer() does
not immediately call fb_set_par(), so the hardware plane continues
scanning out the stolen BO while ifbdev->fb points to the new system
memory FB.  Aside from keeping the stolen BO active despite workarounds
(such as Wa_22018444074 on MTL and Wa_22019338487_display on Xe), a panic
in that window causes intel_get_scanout_buffer() to see
plane_state->hw.fb !=3D intel_fbdev_framebuffer() and call
intel_parent_panic_setup() on the stolen BIOS BO, which fails on both
i915 (-EOPNOTSUPP) and Xe (ttm_bo_kmap_try_from_panic() returns NULL for
stolen memory).

> diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm=
/xe/display/xe_display_bo.c
> index d78d893210c4f..43d05a58bcb47 100644
> --- a/drivers/gpu/drm/xe/display/xe_display_bo.c
> +++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
> @@ -120,7 +121,7 @@ static u32 xe_display_bo_fbdev_pitch_align(u32 stride)
>  	return ALIGN(stride, XE_PAGE_SIZE);
>  }
> =20
> -bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned in=
t size)
> +static bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsi=
gned int size)
>  {
>  	struct ttm_resource_manager *stolen;
> =20
> @@ -152,6 +153,64 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_dev=
ice *xe, unsigned int size)
>  	return stolen->size >=3D (size * 2) >> PAGE_SHIFT;
>  }

[Severity: Medium]
Does xe_display_bo_fbdev_prefer_stolen() still have an unconditional
"return false;" right above the size check (introduced in earlier series
commit "HACK: Always fallback")?  That makes the stolen->size check
unreachable and forces xe_display_bo_fbdev_bios_fb_takeover() to always
reject stolen memory and copy the BIOS framebuffer to system memory on
every integrated platform.

> +
> +static struct drm_gem_object *xe_display_bo_fbdev_bios_fb_takeover(struc=
t drm_gem_object *obj)
> +{
> +	struct xe_bo *orig_bo =3D gem_to_xe_bo(obj), *copy_bo;
> +	struct xe_device *xe =3D xe_bo_device(orig_bo);
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	int err;
> +
> +	if (IS_DGFX(xe) ||
> +	    xe_display_bo_fbdev_prefer_stolen(xe, xe_bo_size(orig_bo)))
> +		return obj;
> +
> +	copy_bo =3D xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), =
xe_bo_size(orig_bo),
> +					    ttm_bo_type_kernel,
> +					    XE_BO_FLAG_FORCE_WC | XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT,
> +					    false);
> +	if (IS_ERR(copy_bo))
> +		return ERR_CAST(copy_bo);
> +
> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, er=
r) {
> +		struct dma_fence *fence;
> +
> +		err =3D drm_exec_lock_obj(&exec, &orig_bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err)
> +			break;
> +
> +		err =3D drm_exec_lock_obj(&exec, &copy_bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err)
> +			break;
> +
> +		err =3D dma_resv_reserve_fences(orig_bo->ttm.base.resv, 1);
> +		if (err)
> +			break;
> +
> +		err =3D dma_resv_reserve_fences(copy_bo->ttm.base.resv, 1);
> +		if (err)
> +			break;
> +
> +		fence =3D xe_migrate_copy(xe_device_get_root_tile(xe)->migrate, orig_b=
o, copy_bo,
> +					orig_bo->ttm.resource, copy_bo->ttm.resource, false);

[Severity: High]
Does xe_migrate_copy() copy from physical address 0 instead of stolen
memory when orig_bo is in XE_PL_STOLEN on pre-12.70 integrated platforms
(such as TGL, ADL, or RPL)?

In __xe_migrate_copy(), src_is_vram is determined by is_devmem(), which
returns false for XE_PL_STOLEN when
xe_ttm_stolen_cpu_access_needs_ggtt(xe) is true (GRAPHICS_VERx100(xe) <
1270):

drivers/gpu/drm/xe/xe_migrate.c:is_devmem() {
	if (res->mem_type !=3D XE_PL_STOLEN ||
	    xe_ttm_stolen_cpu_access_needs_ggtt(xe_bo_device(bo)))
		return false;
	return true;
}

When is_vram is false, emit_pte() uses xe_res_dma(cur) & PAGE_MASK
(which is the 0-based offset within stolen memory) and skips adding
vram_region_gpu_offset(res) (xe_ttm_stolen_gpu_offset(xe)):

drivers/gpu/drm/xe/xe_migrate.c:emit_pte() {
    ...
			addr =3D xe_res_dma(cur) & PAGE_MASK;
			if (is_vram) {
    ...
				addr +=3D vram_region_gpu_offset(res);
				devmem =3D true;
			}
    ...
}

As a result, the migration PTEs map physical address 0x0 + offset instead
of stolen_base + offset, causing an IOMMU fault or copying low host RAM
into the fbdev framebuffer.

> +		if (IS_ERR(fence)) {
> +			err =3D PTR_ERR(fence);
> +			break;
> +		}
> +
> +		dma_resv_add_fence(copy_bo->ttm.base.resv, fence, DMA_RESV_USAGE_KERNE=
L);
> +		dma_resv_add_fence(orig_bo->ttm.base.resv, fence, DMA_RESV_USAGE_BOOKK=
EEP);
> +		dma_fence_put(fence);
> +
> +		return &copy_bo->ttm.base;

[Severity: Medium]
Can CPU accesses to info->screen_base race with the asynchronous
xe_migrate_copy() blit when &copy_bo->ttm.base is returned without waiting
for fence to signal?

In intel_fbdev_driver_fbdev_probe(), intel_bo_fbdev_fill_info() exposes
copy_bo->vmap.vaddr_iomem as info->screen_base without waiting on
copy_bo's reservation fences.  If fb_set_par()'s modeset commit does not
run before CPU access (for instance under deferred console takeover or
when a DRM master is active), CPU writes to info->screen_base can be
overwritten by the in-flight GPU copy from orig_bo.

> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/=
drm/xe/display/xe_initial_plane.c
> index 0f86b73036d03..1c70ade960e86 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -100,15 +99,8 @@ initial_plane_bo(struct xe_device *xe,
>  			return NULL;
>  		}
> =20
> -		phys_base =3D base;
> +		phys_base =3D (pte - xe_ttm_stolen_gpu_offset(xe)) & PAGE_MASK;
>  		flags |=3D XE_BO_FLAG_STOLEN;

[Severity: High]
Does masking with PAGE_MASK leave the upper GGTT PTE PAT bits (bits 52:53)
set in phys_base on Xe_LPG+ platforms?

On 64-bit kernels, PAGE_MASK is GENMASK_ULL(63, 12), whereas GGTT PTEs on
GRAPHICS_VERx100(xe) >=3D 1270 store XELPG_GGTT_PTE_PAT0 (BIT_ULL(52)) and
XELPG_GGTT_PTE_PAT1 (BIT_ULL(53)) above the physical address in
XE_PAGE_ADDR_MASK(PAGE_SHIFT) (GENMASK_ULL(51, 12)).  When the BIOS/GOP
sets a non-zero PAT index in the GGTT PTE, phys_base retains bits 52:53,
and passing it as start to xe_bo_create_pin_map_at_novm() ->
__xe_bo_create_locked() calls:

drivers/gpu/drm/xe/xe_bo.c:__xe_bo_create_locked() {
    ...
			if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
				err =3D xe_ggtt_insert_bo_at(t->mem.ggtt, bo,
							   start + xe_bo_size(bo), U64_MAX,
							   exec);
			}
    ...
}

Because start >=3D BIT_ULL(52) exceeds the GGTT size, xe_ggtt_insert_bo_at()
fails with -ENOSPC and breaks BIOS framebuffer takeover.  In addition,
pte is not checked against XE_PAGE_PRESENT or bounds-checked against
xe_ttm_stolen_gpu_offset(xe) before subtraction (which can underflow
phys_base on pre-12.70 platforms where need_pte_local(xe) is false), and
passing the stolen offset phys_base (often 0) as start to
__xe_bo_create_locked() no longer tells xe_ggtt_insert_bo_at() to avoid
the active BIOS GGTT range at plane_config->base.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116131349.3338=
18-7-dev@lankhorst.se?part=3D5
