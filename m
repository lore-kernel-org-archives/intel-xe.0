Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750BF606A329
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 13:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBQChdht
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD9110E066;
	Wed,  4 Nov 2026 13:22:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC96910FBF3;
 Wed,  4 Nov 2026 13:22:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 769B64120B;
 Wed,  4 Nov 2026 13:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313A71F00A15;
 Wed,  4 Nov 2026 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793798540;
 bh=yMONjB+yqGVxi3mDBQLWOCVu2z2UwpZBo7yc7zHamJ4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=dBQChdhtM5CuNjXHuSFZUASgSkil9aLJCyhNbP70zLLqgrDvgagvXweNAe2KbXaO+
 bodmQfuaQtLoivBO2XsmCRZ9QvrhLwG5iDhCYFSpatN7al9tkRVeX+HsarbyHBI0Gq
 gAev2uZ2WRQe7NmXDjTKJVFHnljt+t3YtfkV+H+w6qcKEStksb4F0y2nFqbER4tpu3
 04SOR7v5cg7zT3/JC5LfWVBwWDVVxjJXoJYbKSHbQOPrx/+tEPbfLVgH+9sD+7y8/m
 0ouI6cOP10M75mMUd7cVHV3BS5mRYaKW/19WSSUNNKOfrB0yR6CE9ofYR6OW4jzVYb
 U3C7ES5o749RQ==
Message-ID: <sashiko-outbox-197334@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] TEST ONLY: drm/intel: add mmio to display parent interface
To: "Jani Nikula" <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261104130831.152563-1-jani.nikula@intel.com>
References: <20261104130831.152563-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 13:22:19 +0000
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] drm/i915/display: indirect call overhead in intel_de_read_fw() a=
nd write_fw()
- [Low] drm/i915/display: broken context lock annotations in intel_vblank.c
- [Low] drm/xe/display: missing static qualifier on xe_display_mmio_interfa=
ce
- [Low] drm/intel: unused write16 hook and silent no-op in xe_uncore_write1=
6()
- [Low] drm/xe: orphaned uncore compat headers and TEST ONLY commit message
--

commit 0609c4221fda9fb179c2667810e576a6d92944ab
Author: Jani Nikula <jani.nikula@intel.com>

TEST ONLY: drm/intel: add mmio to display parent interface

This commit introduces an intel_display_mmio_interface to the display parent
interface, converting display MMIO register accesses, uncore spinlock calls,
and unclaimed MMIO detection in i915 and Xe to go through parent interface
function pointers.

>     TEST ONLY: drm/intel: add mmio to display parent interface
>    =20
>     Just testing, no need to review. We probably don't want this.
>    =20
>     Signed-off-by: Jani Nikula <jani.nikula@intel.com>

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index d0a239a369807..1fddb85d5640a 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -6,16 +6,11 @@
>  #ifndef __INTEL_DE_H__
>  #define __INTEL_DE_H__
> =20
> +#include <drm/intel/display_parent_interface.h>
> +
>  #include "intel_display_core.h"
>  #include "intel_dmc_wl.h"
>  #include "intel_dsb.h"
> -#include "intel_uncore.h"
> -#include "intel_uncore_trace.h"
> -
> -static inline struct intel_uncore *__to_uncore(struct intel_display *dis=
play)
> -{
> -	return to_intel_uncore(display->drm);
> -}

[Severity: Low]
This isn't a runtime bug, but removing the intel_uncore.h and
intel_uncore_trace.h includes from drivers/gpu/drm/i915/display/intel_de.h
removes the last include sites for
drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h and
drivers/gpu/drm/xe/compat-i915-headers/intel_uncore_trace.h.

Should those two unused compatibility headers in Xe be removed as part of
this change, and should the placeholder commit subject and message be
updated to describe the change and its rationale?

>  u8 intel_de_read8(struct intel_display *display, intel_reg_t reg);
>  void intel_de_write8(struct intel_display *display, intel_reg_t reg, u8 =
val);
> @@ -28,7 +23,7 @@ intel_de_read(struct intel_display *display, intel_reg_=
t reg)
> =20
>  	intel_dmc_wl_get(display, reg);
> =20
> -	val =3D intel_uncore_read(__to_uncore(display), reg);
> +	val =3D display->parent->mmio->read32(display->drm, intel_reg_offset(re=
g));
> =20
>  	intel_dmc_wl_put(display, reg);
> =20
> @@ -58,7 +53,7 @@ intel_de_write(struct intel_display *display, intel_reg=
_t reg, u32 val)
>  {
>  	intel_dmc_wl_get(display, reg);
> =20
> -	intel_uncore_write(__to_uncore(display), reg, val);
> +	display->parent->mmio->write32(display->drm, intel_reg_offset(reg), val=
);
> =20
>  	intel_dmc_wl_put(display, reg);
>  }
> @@ -107,19 +102,13 @@ int intel_de_wait_for_clear_ms(struct intel_display=
 *display, intel_reg_t reg,
>  static inline u32
>  intel_de_read_fw(struct intel_display *display, intel_reg_t reg)
>  {
> -	u32 val;
> -
> -	val =3D intel_uncore_read_fw(__to_uncore(display), reg);
> -	trace_i915_reg_rw(false, reg, val, sizeof(val), true);
> -
> -	return val;
> +	return display->parent->mmio->read32_fw(display->drm, intel_reg_offset(=
reg));
>  }
> =20
>  static inline void
>  intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 va=
l)
>  {
> -	trace_i915_reg_rw(true, reg, val, sizeof(val), true);
> -	intel_uncore_write_fw(__to_uncore(display), reg, val);
> +	display->parent->mmio->write32_fw(display->drm, intel_reg_offset(reg), =
val);
>  }

[Severity: Medium]
Won't routing intel_de_read_fw() and intel_de_write_fw() (as well as
intel_de_read() and intel_de_write()) in
drivers/gpu/drm/i915/display/intel_de.h through indirect function pointers
in display->parent->mmio introduce a performance regression on hot MMIO
paths?

In particular, intel_de_read_fw() and intel_de_write_fw() are used inside
vblank evasion critical sections with local interrupts disabled to minimize
MMIO latency. Replacing the inlined register accesses with indirect calls
through display->parent->mmio->read32_fw() and write32_fw() adds pointer
chasing, indirect branch overhead, and repeated drm-to-uncore/mmio lookups
on every register access.

Also, drivers/gpu/drm/i915/display/intel_de.h, i9xx_wm.c, intel_display.c,
and intel_vblank.c dereference display->parent->mmio directly instead of
going through helpers in drivers/gpu/drm/i915/display/intel_parent.c like
the other parent interfaces. Is that intentional?

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/dr=
m/i915/display/intel_vblank.c
> index 1d4753605675e..5a0af95a7442b 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -294,15 +294,13 @@ static int __intel_get_crtc_scanline(struct intel_c=
rtc *crtc)
>  static void intel_vblank_section_enter(struct intel_display *display)
>  	__acquires(uncore->lock)
>  {
> -	struct intel_uncore *uncore =3D to_intel_uncore(display->drm);
> -	spin_lock(&uncore->lock);
> +	display->parent->mmio->lock(display->drm);
>  }
> =20
>  static void intel_vblank_section_exit(struct intel_display *display)
>  	__releases(uncore->lock)
>  {
> -	struct intel_uncore *uncore =3D to_intel_uncore(display->drm);
> -	spin_unlock(&uncore->lock);
> +	display->parent->mmio->unlock(display->drm);
>  }
>  #else
>  static void intel_vblank_section_enter(struct intel_display *display)

[Severity: Low]
Does drivers/gpu/drm/i915/display/intel_vblank.c fail to build when compiler
context analysis (CONFIG_WARN_CONTEXT_ANALYSIS_ALL) is enabled?

Both intel_vblank_section_enter() and intel_vblank_section_exit() remove the
local uncore variable (and intel_de.h no longer includes intel_uncore.h),
but they still retain:

    __acquires(uncore->lock)
    __releases(uncore->lock)

which reference the undeclared identifier uncore when context analysis
expands those attributes.

In addition, the new lock/unlock callbacks i915_uncore_lock() and
i915_uncore_unlock() in drivers/gpu/drm/i915/intel_uncore.c, as well as
xe_uncore_lock() and xe_uncore_unlock() in
drivers/gpu/drm/xe/display/xe_display.c, acquire and release spinlocks
across function boundaries without context analysis annotations, and
intel_vblank_section_enter() / intel_vblank_section_exit() remain guarded by
#ifdef I915 even though mmio->lock and mmio->unlock are now part of the
parent interface.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe=
/display/xe_display.c
> index aab416485e3ea..42cc19009bab2 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -444,6 +445,82 @@ static void transient_data_flush(struct drm_device *=
drm)
>  	xe_device_td_flush(xe);
>  }
> =20
> +static struct xe_mmio *to_xe_mmio(struct drm_device *drm)
> +{
> +	return xe_root_tile_mmio(to_xe_device(drm));
> +}
> +
> +static u8 xe_uncore_read8(struct drm_device *drm, u32 reg)
> +{
> +	return xe_mmio_read8(to_xe_mmio(drm), XE_REG(reg));
> +}
> +
> +static void xe_uncore_write8(struct drm_device *drm, u32 reg, u8 val)
> +{
> +	xe_mmio_write8(to_xe_mmio(drm), XE_REG(reg), val);
> +}
> +
> +static u16 xe_uncore_read16(struct drm_device *drm, u32 reg)
> +{
> +	return xe_mmio_read16(to_xe_mmio(drm), XE_REG(reg));
> +}
> +
> +static void xe_uncore_write16(struct drm_device *drm, u32 reg, u16 val)
> +{
> +}

[Severity: Low]
Why is write16 added to struct intel_display_mmio_interface in
include/drm/intel/display_parent_interface.h with an empty no-op
implementation in xe_uncore_write16()?

The display driver has no intel_de_write16() helper and never calls
display->parent->mmio->write16, and having xe_uncore_write16() silently
discard writes on Xe without a warning could hide bugs if a caller is ever
added. Also, since xe_uncore_read32_fw() and xe_uncore_write32_fw() are
identical to xe_uncore_read32() and xe_uncore_write32() on Xe, could they
share the same function pointers in xe_display_mmio_interface?

> +
> +static u32 xe_uncore_read32(struct drm_device *drm, u32 reg)
> +{
> +	return xe_mmio_read32(to_xe_mmio(drm), XE_REG(reg));
> +}
> +
> +static u32 xe_uncore_read32_fw(struct drm_device *drm, u32 reg)
> +{
> +	return xe_mmio_read32(to_xe_mmio(drm), XE_REG(reg));
> +}
> +
> +static void xe_uncore_write32(struct drm_device *drm, u32 reg, u32 val)
> +{
> +	xe_mmio_write32(to_xe_mmio(drm), XE_REG(reg), val);
> +}
> +
> +static void xe_uncore_write32_fw(struct drm_device *drm, u32 reg, u32 va=
l)
> +{
> +	xe_mmio_write32(to_xe_mmio(drm), XE_REG(reg), val);
> +}
> +
> +static void xe_uncore_lock(struct drm_device *drm)
> +{
> +	struct xe_device *xe =3D to_xe_device(drm);
> +
> +	spin_lock(&xe->uncore.lock);
> +}
> +
> +static void xe_uncore_unlock(struct drm_device *drm)
> +{
> +	struct xe_device *xe =3D to_xe_device(drm);
> +
> +	spin_unlock(&xe->uncore.lock);
> +}
> +
> +static void xe_uncore_arm_unclaimed_mmio_detection(struct drm_device *dr=
m)
> +{
> +}
> +
> +const struct intel_display_mmio_interface xe_display_mmio_interface =3D {

[Severity: Low]
Should xe_display_mmio_interface in drivers/gpu/drm/xe/display/xe_display.c
be declared static const?

It has no external declaration in any header and is only used within
xe_display.c to initialize parent.mmio, so omitting static triggers
-Wmissing-variable-declarations and Sparse -Wdecl warnings (unlike the
sibling xe_display_irq_interface in the same file, which is marked static).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104130831.1525=
63-1-jani.nikula@intel.com?part=3D1
