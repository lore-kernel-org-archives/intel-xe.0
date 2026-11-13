Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72198606A33D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wp3pgp+R
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313B51124C6;
	Fri, 13 Nov 2026 13:22:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7BD1124D0;
 Fri, 13 Nov 2026 13:22:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id EC4C161200;
 Fri, 13 Nov 2026 13:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCCF1F000C4;
 Fri, 13 Nov 2026 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794576135;
 bh=DJeuSlhylQgIOPYycpwEGeSC2h6qTSLX7wlb7kqeIAk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Wp3pgp+RK9pL4e/gm1S9TVOwXTPZ8Ezbj1uuHD9e4/t6merwxbN0lpoO/j7OERmMz
 zl+GdEkpjWt9LEpxEhnAB6nT7w9UIBUG7gmgBa+QAbjacAi4/p0/3zJUzjI7g4/nPo
 D6PdDT88f+NYPB80glpv0Ty/Ak/7MMfhG9DNbU9p3/SvSSOelImFw0JRAGGzoBTBo1
 4CI2fLeCPQHJKSeFZN3GuXzQ/0FhKtAtQv4nEVWnvY9kXo2xBeOmVEMl4C7Dp/enED
 PxDP8idTF++68txCRM9qWT1GdkLz+OJEQ3S8wnC5mbweK9dLBaDOGk02CStz9ZGeOy
 3us8FLWI2JG7g==
Message-ID: <sashiko-outbox-212844@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] drm/i915: Introduce
 intel_bo_fbdev_bios_fb_takeover()
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20261113124453.144408-12-dev@lankhorst.se>
References: <20261113124453.144408-7-dev@lankhorst.se>
 <20261113124453.144408-12-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 13:22:10 +0000
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

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] drm/xe: NULL dereference in xe_migrate_copy() on pre-12.70
  stolen BO
- [Medium] drm/xe: unconditional return false in
  xe_display_bo_fbdev_prefer_stolen()
- [Medium] drm/i915: deferred BIOS FB takeover in bios_fb_pick() breaks
  FBC and drm_panic
- [Medium] drm/i915/fbdev: double unpin on error in
  __intel_fbdev_fb_realloc()
--

commit 4b91f1cbc821e07604b613317e6ff23539bcbdbd
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()

This commit defers the decision of whether to keep a BIOS framebuffer in
stolen memory from initial plane readout to fbdev probing via a new
intel_bo_fbdev_bios_fb_takeover() helper, copying the framebuffer to system
memory on Xe when stolen memory is not preferred.

> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm=
/i915/display/intel_fbdev.c
> index 219ee17de3f68..97d5e1279dbc1 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -228,8 +228,8 @@ __intel_fbdev_fb_alloc(struct intel_display *display,
>  		       struct drm_fb_helper_surface_size *sizes)
>  {
>  	struct drm_mode_fb_cmd2 mode_cmd =3D {};
> -	struct drm_framebuffer *fb;
>  	struct drm_gem_object *obj;
> +	struct drm_framebuffer *fb;
>  	int size;
> =20
>  	intel_fbdev_fill_mode_cmd(display, sizes, &mode_cmd);
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
Can this error path unpin obj twice on Xe when intel_framebuffer_create()
fails after intel_bo_framebuffer_init()?

In xe_display_bo_fbdev_bios_fb_takeover(), copy_bo is allocated with
xe_bo_create_pin_map_novm(), which sets XE_BO_FLAG_PINNED and pins the BO
once.  Inside intel_framebuffer_init(), xe_display_bo_framebuffer_init()
only takes a GEM reference, but if a later step in intel_framebuffer_init()
fails, its error unwind calls xe_display_bo_framebuffer_fini(), which sees
XE_BO_FLAG_PINNED and calls xe_bo_unpin().  Calling intel_bo_fbdev_destroy()
-> xe_bo_unpin_map_no_vm() here then unpins copy_bo a second time when
pin_count is already zero, triggering an xe_assert() failure and a
WARN_ON_ONCE(!bo->pin_count) in ttm_bo_unpin().

> +
> +	drm_gem_object_put(obj);
> +	return to_intel_framebuffer(new_fb);
> +}
> +
> +static struct intel_framebuffer *bios_fb_pick(struct intel_framebuffer *=
fb,
> +					      const struct drm_fb_helper_surface_size *sizes)
>  {
>  	struct intel_display *display =3D to_intel_display(fb->base.dev);
>  	int width =3D fb->base.width;
>  	int height =3D fb->base.height;
>  	int depth =3D fb->base.format->depth;
>  	int bpp =3D fb->base.format->cpp[0] * 8;
> +	struct drm_gem_object *new;
> =20
>  	if (sizes->fb_width > width || sizes->fb_height > height) {
>  		drm_dbg_kms(display->drm,
>  			    "BIOS fb too small (%dx%d), we require (%dx%d), releasing it\n",
>  			    width, height, sizes->fb_width, sizes->fb_height);
> -		return false;
> +		return NULL;
>  	}
> =20
>  	if (sizes->surface_depth !=3D depth || sizes->surface_bpp !=3D bpp) {
>  		drm_dbg_kms(display->drm,
>  			    "BIOS fb using wrong depth/bpp (%d/%d), we require (%d/%d), relea=
sing it\n",
>  			    depth, bpp, sizes->surface_depth, sizes->surface_bpp);
> -		return false;
> +		return NULL;
>  	}
> =20
> -	return true;
> +	new =3D intel_bo_fbdev_bios_fb_takeover(fb->base.obj[0]);
> +	if (IS_ERR(new))
> +		return ERR_CAST(new);
> +	if (fb->base.obj[0] =3D=3D new)
> +		return fb;
> +
> +	/* Different object, re-create an intel_framebuffer around it */
> +	return __intel_fbdev_fb_realloc(display, &fb->base, new);
>  }
> =20
> +
>  int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>  				   struct drm_fb_helper_surface_size *sizes)
>  {
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
Does deferring the stolen memory check from initial_plane_vma() and
initial_plane_bo() to bios_fb_pick() regress FBC CFB allocation and
drm_panic?

Because the initial BIOS framebuffer in stolen memory is now kept across
intel_initial_commit() (and only unpinned after the later fbcon modeset
commit completes), intel_fbc_alloc_cfb() runs while the BIOS FB still
occupies more than half of stolen memory.  When a 1:1 CFB no longer fits in
the remaining stolen space, find_compression_limit() either degrades FBC to
a reduced compression ratio that intel_fbc_is_cfb_ok() never upgrades after
the BIOS FB is freed, or fails with -ENOSPC.

In addition, drm_framebuffer_put(&fb->base) here only drops ifbdev's
reference while the original stolen FB remains active on
plane_state->hw.fb until fbcon performs a modeset.  When console takeover is
deferred (CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=3Dy during a quiet
boot) or CONFIG_FRAMEBUFFER_CONSOLE=3Dn, the primary plane continues scanni=
ng
out the stolen BIOS FB while ifbdev->fb points to the new system memory FB.
If a panic occurs before takeover, intel_get_scanout_buffer() sees
plane_state->hw.fb !=3D intel_fbdev_framebuffer(display->fbdev.fbdev) and
calls intel_parent_panic_setup() on the stolen BO, which fails on both i915
and Xe.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm=
/xe/display/xe_display_bo.c
> index d78d893210c4f..43d05a58bcb47 100644
> --- a/drivers/gpu/drm/xe/display/xe_display_bo.c
> +++ b/drivers/gpu/drm/xe/display/xe_display_bo.c

[ ... ]

> @@ -152,6 +153,64 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_dev=
ice *xe, unsigned int size)
>  	return stolen->size >=3D (size * 2) >> PAGE_SHIFT;
>  }
> =20
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

[Severity: Medium]
Does xe_display_bo_fbdev_prefer_stolen() still contain an unconditional
"return false;" right before the stolen->size check from commit "HACK:
Always fallback"?

drivers/gpu/drm/xe/display/xe_display_bo.c:xe_display_bo_fbdev_prefer_stole=
n() {
    ...
	/* machine hang when doing lots of LMEMBAR accesses */
	if (XE_DEVICE_WA(xe, 22019338487_display))
		return false;

	return false;

	/*
	 * If the FB is too big, just don't use it since fbdev is not very
	 * important and we should probably use that space with FBC or other
	 * features.
	 */
	return stolen->size >=3D (size * 2) >> PAGE_SHIFT;
}

That makes the size check unreachable and forces
xe_display_bo_fbdev_bios_fb_takeover() to always copy the BIOS framebuffer
out of stolen memory on every integrated Xe platform.

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
Does xe_migrate_copy() dereference a NULL pointer when copying a stolen
orig_bo on integrated platforms with GRAPHICS_VERx100(xe) < 1270 (such as
Tiger Lake, Rocket Lake, Alder Lake, and Raptor Lake)?

On integrated platforms, initial_plane_bo() allocates orig_bo in
XE_PL_STOLEN, where the manager has use_tt =3D false and orig_bo->ttm.ttm is
NULL.  Inside __xe_migrate_copy(), src_is_vram is determined by
is_devmem(), which calls xe_bo_is_stolen_devmem() and returns false when
GRAPHICS_VERx100(xe) < 1270:

drivers/gpu/drm/xe/xe_migrate.c:__xe_migrate_copy() {
    ...
	bool src_is_vram =3D is_devmem(src_bo, src);
    ...
	if (!src_is_vram)
		xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
	else
		xe_res_first(src, 0, size, &src_it);
    ...
}

Taking the !src_is_vram branch calls xe_bo_sg(orig_bo), which dereferences
orig_bo->ttm.ttm.  In addition, emit_pte() gates adding
vram_region_gpu_offset(res) on is_vram alongside setting devmem =3D true,
whereas pre-12.70 stolen memory needs the stolen GPU offset added without
setting the devmem PTE bit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113124453.1444=
08-7-dev@lankhorst.se?part=3D5
