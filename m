Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C5C606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 17:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TCbFxNb0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DFB10E021;
	Thu,  5 Nov 2026 17:04:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E705010E021
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 17:04:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6A20E42E9A;
 Thu,  5 Nov 2026 17:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFAB1F000C1;
 Thu,  5 Nov 2026 17:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793898254;
 bh=rhvsE+fenM73HtTLOjO7Q2pXpqwtMSGLu0rVAklhAlM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=TCbFxNb0qji7q4pzMnwN/0HARh5CogSUnIE1yr6FGVREsb9pYwEf0z3Kpw2URL63Q
 mjxcGsYEBbAws2JbbThFrksLaccsSwvgtkr8ba7reIF+lx26NkNOLTeH9NGGzqmgB0
 IXSRuSz9n5AiPQjOshM5CI2SSllNoyHbnRwITKiGf/A6BUz+HLF3OxXMK45dKRNEEk
 JEizWN5J9WbVjLdJTmlm3LKIQhJapUpatM2ES0d8WzAJJJRbZoOV9jacgyhrV4AqJS
 Rm0d/gNjECUP+Oz81mVHmuWzIYRzYOz28DoDoLelBgSq+61MYxbsBjERoJ52ElHhYI
 9jNjUKYpVbYKQ==
Message-ID: <sashiko-outbox-199572@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] drm/i915: Introduce
 intel_bo_fbdev_bios_fb_takeover()
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261105161444.593259-12-dev@lankhorst.se>
References: <20261105161444.593259-7-dev@lankhorst.se>
 <20261105161444.593259-12-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 17:04:13 +0000
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

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] drm/xe/display: unchecked drm_exec_lock_obj() in bios fb takeover
- [High] drm/xe: invalid XE_PPGTT_PTE_DM bit for stolen memory in xe_migrat=
e_copy()
- [High] drm/xe: missing fence put and wait in xe_display_bo_fbdev_bios_fb_=
takeover()
- [Medium] drm/xe/display: dma_fence leak in xe_display_bo_fbdev_bios_fb_ta=
keover()
- [Medium] drm/xe: unconditional return false in xe_display_bo_fbdev_prefer=
_stolen()
- [Medium] drm/i915/fbdev: missing runtime PM ref around bios_fb_pick()
- [Low] drm/i915/fbdev: unused parameters in __intel_fbdev_fb_alloc() and r=
ealloc
--

commit 1492b8e8d567ba63a9e11c639a3b16b1f1bc88dc
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()

This commit introduces the intel_bo_fbdev_bios_fb_takeover() helper to
defer the decision of whether to keep a stolen-memory BIOS framebuffer
until fbdev probe time. In Xe, when stolen memory is not preferred, it
allocates a system memory buffer object and uses the migration engine to
copy the BIOS framebuffer contents.

> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm=
/i915/display/intel_fbdev.c
> index 219ee17de3f68..318b10dcea52c 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -225,11 +225,11 @@ static void intel_fbdev_fill_mode_cmd(struct intel_=
display *display,
> =20
>  static struct intel_framebuffer *
>  __intel_fbdev_fb_alloc(struct intel_display *display,
> -		       struct drm_fb_helper_surface_size *sizes)
> +		       struct drm_fb_helper_surface_size *sizes,
> +		       struct drm_gem_object *obj)
>  {
>  	struct drm_mode_fb_cmd2 mode_cmd =3D {};
>  	struct drm_framebuffer *fb;
> -	struct drm_gem_object *obj;
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

[Severity: Low]
This isn't a bug, but in __intel_fbdev_fb_alloc() the local variable obj
was converted into a function parameter that is passed as NULL by its only
caller in intel_fbdev_driver_fbdev_probe() and immediately overwritten by
obj =3D intel_bo_fbdev_create(display, size) without being read. Similarly,
the display parameter in __intel_fbdev_fb_realloc() is never used. Could
these unused parameters be dropped?

[ ... ]

> @@ -305,9 +341,19 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_hel=
per *helper,
> =20
>  	ifbdev->fb =3D NULL;
> =20
> -	if (fb && !bios_fb_ok(fb, sizes)) {
> -		drm_framebuffer_put(&fb->base);
> -		fb =3D NULL;
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
>  	}
> =20
>  	wakeref =3D intel_display_rpm_get(display);

[Severity: Medium]
Should wakeref =3D intel_display_rpm_get(display) be acquired before calling
bios_fb_pick(fb, sizes) in intel_fbdev_driver_fbdev_probe()?

Previously, only bios_fb_ok() ran before intel_display_rpm_get(), which was
a software-only check of the framebuffer dimensions and depth/bpp. Now,
bios_fb_pick() calls intel_bo_fbdev_bios_fb_takeover() ->
xe_display_bo_fbdev_bios_fb_takeover(), which calls
xe_bo_create_pin_map_novm() and xe_migrate_copy(). Both paths call
xe_pm_runtime_get_noresume() (via __xe_ggtt_insert_bo_at() and
xe_sched_job_create()) and access hardware (GGTT PTE writes and GPU blit
submission).

If initial fbdev setup is deferred when no outputs are connected (leaving
ifbdev->fb populated while CRTCs are disabled) and
intel_fbdev_driver_fbdev_probe() is later invoked from a hotplug event
after the initial runtime PM reference has been dropped, won't running
bios_fb_pick() before intel_display_rpm_get() trigger a missing outer
runtime PM warning in xe_pm_runtime_get_noresume() and access the device
while runtime-suspended?

[ ... ]

> diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm=
/xe/display/xe_display_bo.c
> index d78d893210c4f..188796ae85933 100644
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
> @@ -152,6 +153,58 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_dev=
ice *xe, unsigned int size)
>  	return stolen->size >=3D (size * 2) >> PAGE_SHIFT;
>  }

[Severity: Medium]
In xe_display_bo_fbdev_prefer_stolen(), there is an unconditional
"return false;" right before the stolen size check:

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

Does that unconditional return false make the stolen->size check dead code
and force xe_display_bo_fbdev_bios_fb_takeover() to always reject stolen
memory and reallocate the BIOS framebuffer into system memory on all
integrated platforms?

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
> +		drm_exec_lock_obj(&exec, &orig_bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +
> +		drm_exec_lock_obj(&exec, &copy_bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);

[Severity: High]
As reported by Sashiko on v2 [1], in xe_display_bo_fbdev_bios_fb_takeover(),
the return values of both drm_exec_lock_obj() calls are ignored.

If drm_exec_lock_obj() fails with a non-contention error such as -ENOMEM
(for example when kvrealloc() fails in drm_exec_obj_locked()), it unlocks
obj->resv and returns the error without setting exec->contended:

drivers/gpu/drm/drm_exec.c:drm_exec_lock_obj() {
    ...
	ret =3D drm_exec_obj_locked(exec, obj);
	if (ret)
		dma_resv_unlock(obj->resv);

	return ret;
}

Because exec->contended is NULL, drm_exec_retry_on_contention(&exec) will
not retry, and execution will continue into dma_resv_reserve_fences(),
xe_migrate_copy(), and dma_resv_add_fence() without holding the reservation
lock on orig_bo or copy_bo. Should err =3D drm_exec_lock_obj(...) be checked
after drm_exec_retry_on_contention(&exec) on both calls?

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
When xe_display_bo_fbdev_bios_fb_takeover() calls xe_migrate_copy() for an
initial plane BO in stolen memory (XE_PL_STOLEN) on integrated platforms
with GRAPHICS_VERx100(xe) < 1270 (such as Tiger Lake, Rocket Lake, or Alder
Lake), does xe_migrate_copy() program an invalid XE_PPGTT_PTE_DM bit in the
page tables?

In drivers/gpu/drm/xe/xe_migrate.c, __xe_migrate_copy() determines
src_is_vram via is_devmem(), which returns true for all XE_PL_STOLEN
resources:

drivers/gpu/drm/xe/xe_migrate.c:is_devmem() {
	if (mem_type_is_vram(res->mem_type) || res->mem_type =3D=3D XE_PL_STOLEN)
		return true;

	return false;
}

emit_pte() then unconditionally sets devmem =3D true when is_vram is true a=
nd
passes it to vm->pt_ops->pte_encode_addr(), which sets XE_PPGTT_PTE_DM in
the PTEs. However, stolen memory only uses the DM bit on platforms where
GRAPHICS_VERx100(xe) >=3D 1270, as seen in xe_bo_is_stolen_devmem():

drivers/gpu/drm/xe/xe_bo.c:xe_bo_is_stolen_devmem() {
	return xe_bo_is_stolen(bo) &&
		GRAPHICS_VERx100(xe_bo_device(bo)) >=3D 1270;
}

Won't setting XE_PPGTT_PTE_DM when migrating from stolen memory on pre-12.70
platforms cause GPU page faults or corrupted copies during BIOS framebuffer
takeover?

> +		if (IS_ERR(fence)) {
> +			err =3D PTR_ERR(fence);
> +			break;
> +		}
> +
> +		dma_resv_add_fence(copy_bo->ttm.base.resv, fence, DMA_RESV_USAGE_KERNE=
L);
> +		dma_resv_add_fence(orig_bo->ttm.base.resv, fence, DMA_RESV_USAGE_BOOKK=
EEP);
> +		return &copy_bo->ttm.base;
> +	}

[Severity: Medium]
As reported by Sashiko on v2 [1], does xe_display_bo_fbdev_bios_fb_takeover=
()
leak the struct dma_fence reference returned by xe_migrate_copy()?

xe_migrate_copy() returns fence with a reference acquired for the caller,
and each call to dma_resv_add_fence() takes its own reference via
dma_fence_get(fence), but dma_fence_put(fence) is never called before
returning &copy_bo->ttm.base.

[Severity: High]
As reported by Sashiko on v2 [1], in addition to leaking the fence
reference, could returning copy_bo from xe_display_bo_fbdev_bios_fb_takeove=
r()
without waiting for fence to complete allow CPU accesses to info->screen_ba=
se
to race with the in-flight GPU migration blit?

In intel_fbdev_driver_fbdev_probe(), intel_parent_fb_pin_ggtt_pin() ->
__xe_pin_fb_vma() calls xe_bo_validate(), which returns immediately without
waiting on fences because copy_bo was already pinned by
xe_bo_create_pin_map_novm(). Then intel_bo_fbdev_fill_info() exposes
copy_bo->vmap.vaddr_iomem as info->screen_base.

If fb_set_par() is not run immediately during register_framebuffer() (for
example when CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=3Dy is active,
CONFIG_FRAMEBUFFER_CONSOLE=3Dn, or when /dev/fb0 is accessed before fbcon_i=
nit()
runs), nothing waits on copy_bo's reservation fences before CPU reads or
writes hit info->screen_base. Should xe_display_bo_fbdev_bios_fb_takeover()
wait on the migration fence (or should the caller synchronize) before
exposing screen_base, and drop the caller's fence reference with
dma_fence_put(fence)?

[1] https://lore.kernel.org/r/20260721142610.93804-12-dev@lankhorst.se

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105161444.5932=
59-7-dev@lankhorst.se?part=3D5
