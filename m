Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83260606A324
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EuV95YKW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4851710FB45;
	Wed, 11 Nov 2026 11:20:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFE810FB45;
 Wed, 11 Nov 2026 11:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396053; x=1825932053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=36pDT2lGC6BVp3Gpj7wl2VoLw2NuW/WDYQN2r5fi6VI=;
 b=EuV95YKW92S2/Y7ptE0l/or5UyL7KrGk0N4udbERJCyoUM6P/ut5/8kA
 1KT6kNz4dRGf13v73uekpgnaV6SQAwCsFuivkL1Q5voSBVDs1RyWcY6rj
 XaHkdo+9W/5ctaAn+NpMXJx/JmnqAmo4Vm22P5savkLSW65hc3BHOfVOW
 nvQHwO4KN9VzPlrKLjlrxBlqsU5dANLWh6Q78LUSjLcNCi18oZOv0RxuK
 mEcEcONnkweWqyA4leBrTh+1lC5X+7JodrQfzf6Bkca17mvqsjSrkaxFS
 uvnBSGA1b9GAR3v0aRsYhXiwBZFVgcsdEsCYCIB5jyW6MYTaoFGwUhCaL A==;
X-CSE-ConnectionGUID: CIjfHCvJRdCylGLqlf2xaA==
X-CSE-MsgGUID: SNuvXpctTMaLOd6H+ct7mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3195906"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3195906"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:53 -0800
X-CSE-ConnectionGUID: sme5s+6YRd23TKQ3FOAPbA==
X-CSE-MsgGUID: rXa8oVVUQPOpcRhK/CIGYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8287800"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:52 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 11/13] drm/i915/dpt: Hide the DPT even more from the display
 code
Date: Wed, 11 Nov 2026 13:20:05 +0200
Message-ID: <20261111112007.16790-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Now that the display code doesn't need to track the dpt
pointer we can even get rid of intel_parent_dpt_create()
by deferring the DPT creation until we have to pin the fb.

The downside is that we now pay the slight cost of the
DPT object allocation during the first atomic commit,
whereas previously the cost was incurred during the
addfb ioctl.

But even before the cost of actually populating the DPT
(and its GGTT mapping) was incurred during fb pinning.
The object allocation seems rather cheap compared to
that so this is probably fine.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c      | 16 ------------
 drivers/gpu/drm/i915/display/intel_parent.c  | 11 ---------
 drivers/gpu/drm/i915/display/intel_parent.h  |  6 -----
 drivers/gpu/drm/i915/i915_dpt.c              | 26 ++++++++------------
 drivers/gpu/drm/i915/i915_dpt.h              |  4 +--
 drivers/gpu/drm/i915/i915_driver.c           |  3 ---
 drivers/gpu/drm/i915/i915_fb_pin.c           |  6 ++---
 include/drm/intel/display_parent_interface.h |  9 -------
 8 files changed, 15 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index dba2d5ec6688..ef9aeb48dcd3 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2270,22 +2270,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	if (ret)
 		goto err_bo_framebuffer_fini;
 
-	if (intel_fb_uses_dpt(fb)) {
-		struct drm_gem_object *obj = intel_fb_bo(&intel_fb->base);
-		const struct intel_gtt_view *view;
-
-		if (intel_fb_needs_pot_stride_remap(intel_fb))
-			view = &intel_fb->remapped_view.gtt;
-		else
-			view = &intel_fb->normal_view.gtt;
-
-		ret = intel_parent_dpt_create(display, obj, view);
-		if (ret) {
-			drm_dbg_kms(display->drm, "failed to create DPT\n");
-			goto err_bo_framebuffer_fini;
-		}
-	}
-
 	ret = drm_framebuffer_init(display->drm, fb, &intel_fb_funcs);
 	if (ret) {
 		drm_err(display->drm, "framebuffer init failed %d\n", ret);
diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
index 22be54098b3d..f652bc51a4aa 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.c
+++ b/drivers/gpu/drm/i915/display/intel_parent.c
@@ -24,17 +24,6 @@
 #include "intel_display_core.h"
 #include "intel_parent.h"
 
-/* dpt */
-int intel_parent_dpt_create(struct intel_display *display,
-			    struct drm_gem_object *obj,
-			    const struct intel_gtt_view *view)
-{
-	if (display->parent->dpt)
-		return display->parent->dpt->create(obj, view);
-
-	return 0;
-}
-
 /* fb_pin */
 int intel_parent_fb_pin_ggtt_pin(struct intel_display *display,
 				 struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
index e95710e115be..3185ac5ac478 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.h
+++ b/drivers/gpu/drm/i915/display/intel_parent.h
@@ -13,7 +13,6 @@ struct drm_gem_object;
 struct drm_scanout_buffer;
 struct i915_vma;
 struct intel_display;
-struct intel_dpt;
 struct intel_fb_pin_params;
 struct intel_frontbuffer;
 struct intel_gtt_view;
@@ -22,11 +21,6 @@ struct intel_panic;
 struct intel_stolen_node;
 struct iosys_map;
 
-/* dpt */
-int intel_parent_dpt_create(struct intel_display *display,
-			    struct drm_gem_object *obj,
-			    const struct intel_gtt_view *view);
-
 /* fb_pin */
 int intel_parent_fb_pin_ggtt_pin(struct intel_display *display,
 				 struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
index 27f9a648bb26..53cb07144552 100644
--- a/drivers/gpu/drm/i915/i915_dpt.c
+++ b/drivers/gpu/drm/i915/i915_dpt.c
@@ -4,7 +4,6 @@
  */
 
 #include <drm/drm_print.h>
-#include <drm/intel/display_parent_interface.h>
 
 #include "gem/i915_gem_domain.h"
 #include "gem/i915_gem_internal.h"
@@ -222,8 +221,8 @@ struct intel_dpt *i915_dpt_lookup(struct drm_i915_gem_object *obj,
 	return dpt;
 }
 
-static void i915_dpt_add(struct drm_i915_gem_object *obj,
-			 struct intel_dpt *new_dpt)
+static struct intel_dpt *i915_dpt_add(struct drm_i915_gem_object *obj,
+				      struct intel_dpt *new_dpt)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
@@ -239,7 +238,7 @@ static void i915_dpt_add(struct drm_i915_gem_object *obj,
 	if (old_dpt) {
 		spin_unlock(&obj->dpt_lock);
 		i915_dpt_free(new_dpt);
-		return;
+		return old_dpt;
 	}
 
 	list_add_tail(&new_dpt->obj_link, &obj->dpt_list);
@@ -249,6 +248,8 @@ static void i915_dpt_add(struct drm_i915_gem_object *obj,
 	spin_lock(&ggtt->dpt_lock);
 	list_add_tail(&new_dpt->ggtt_link, &ggtt->dpt_list);
 	spin_unlock(&ggtt->dpt_lock);
+
+	return new_dpt;
 }
 
 static struct intel_dpt *dpt_create(struct drm_i915_gem_object *obj,
@@ -322,24 +323,21 @@ static struct intel_dpt *dpt_create(struct drm_i915_gem_object *obj,
 	return dpt;
 }
 
-static int i915_dpt_create(struct drm_gem_object *_obj,
-			   const struct intel_gtt_view *view)
+struct intel_dpt *i915_dpt_instance(struct drm_i915_gem_object *obj,
+				    const struct intel_gtt_view *view)
 {
-	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
 	struct intel_dpt *dpt;
 
 	/* already have one? */
 	dpt = i915_dpt_lookup(obj, view);
 	if (dpt)
-		return 0;
+		return dpt;
 
 	dpt = dpt_create(obj, view);
 	if (IS_ERR(dpt))
-		return PTR_ERR(dpt);
+		return dpt;
 
-	i915_dpt_add(obj, dpt);
-
-	return 0;
+	return i915_dpt_add(obj, dpt);
 }
 
 void i915_dpt_obj_free(struct drm_i915_gem_object *obj)
@@ -418,7 +416,3 @@ u64 i915_dpt_offset(struct i915_vma *dpt_vma)
 {
 	return i915_vma_offset(dpt_vma);
 }
-
-const struct intel_display_dpt_interface i915_display_dpt_interface = {
-	.create = i915_dpt_create,
-};
diff --git a/drivers/gpu/drm/i915/i915_dpt.h b/drivers/gpu/drm/i915/i915_dpt.h
index 5e88d8881db1..3f05311a7e73 100644
--- a/drivers/gpu/drm/i915/i915_dpt.h
+++ b/drivers/gpu/drm/i915/i915_dpt.h
@@ -17,6 +17,8 @@ struct intel_dpt *i915_vm_to_dpt(struct i915_address_space *vm);
 void i915_dpt_obj_free(struct drm_i915_gem_object *obj);
 struct intel_dpt *i915_dpt_lookup(struct drm_i915_gem_object *obj,
 				  const struct intel_gtt_view *view);
+struct intel_dpt *i915_dpt_instance(struct drm_i915_gem_object *obj,
+				    const struct intel_gtt_view *view);
 
 struct i915_address_space *i915_dpt_to_vm(struct intel_dpt *dpt);
 struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dpt *dpt, unsigned int alignment);
@@ -26,6 +28,4 @@ u64 i915_dpt_offset(struct i915_vma *dpt_vma);
 void i915_dpt_suspend(struct i915_ggtt *ggtt);
 void i915_dpt_resume(struct i915_ggtt *ggtt);
 
-extern const struct intel_display_dpt_interface i915_display_dpt_interface;
-
 #endif /* __I915_DPT_H__ */
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 56bca9301532..5c6fd0fc38cd 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -59,7 +59,6 @@
 #include "display/intel_display_power.h"
 #include "display/intel_dmc.h"
 #include "display/intel_dp.h"
-#include "display/intel_dpt.h"
 #include "display/intel_fbdev.h"
 #include "display/intel_gmbus.h"
 #include "display/intel_hotplug.h"
@@ -92,7 +91,6 @@
 #include "i915_bo.h"
 #include "i915_debugfs.h"
 #include "i915_display_pc8.h"
-#include "i915_dpt.h"
 #include "i915_driver.h"
 #include "i915_drm_client.h"
 #include "i915_drv.h"
@@ -746,7 +744,6 @@ static bool vgpu_active(struct drm_device *drm)
 
 static const struct intel_display_parent_interface parent = {
 	.bo = &i915_display_bo_interface,
-	.dpt = &i915_display_dpt_interface,
 	.dsb = &i915_display_dsb_interface,
 	.fb_pin = &i915_display_fb_pin_interface,
 	.frontbuffer = &i915_display_frontbuffer_interface,
diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i915_fb_pin.c
index 91385c17e564..831baf0c6898 100644
--- a/drivers/gpu/drm/i915/i915_fb_pin.c
+++ b/drivers/gpu/drm/i915/i915_fb_pin.c
@@ -259,9 +259,9 @@ static int i915_fb_pin_dpt_pin(struct drm_gem_object *_obj,
 	struct i915_vma *ggtt_vma, *dpt_vma;
 	struct intel_dpt *dpt;
 
-	dpt = i915_dpt_lookup(obj, pin_params->view);
-	if (drm_WARN_ON(obj->base.dev, !dpt))
-		return -EINVAL;
+	dpt = i915_dpt_instance(obj, pin_params->view);
+	if (IS_ERR(dpt))
+		return PTR_ERR(dpt);
 
 	ggtt_vma = i915_dpt_pin_to_ggtt(dpt, pin_params->alignment / 512);
 	if (IS_ERR(ggtt_vma))
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index d905d59cc43e..ef5c449808f6 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -17,7 +17,6 @@ struct drm_plane_state;
 struct drm_scanout_buffer;
 struct fb_info;
 struct i915_vma;
-struct intel_dpt;
 struct intel_dsb_buffer;
 struct intel_frontbuffer;
 struct intel_gtt_view;
@@ -65,11 +64,6 @@ struct intel_display_bo_interface {
 #endif
 };
 
-struct intel_display_dpt_interface {
-	int (*create)(struct drm_gem_object *obj,
-		      const struct intel_gtt_view *view);
-};
-
 struct intel_display_dsb_interface {
 	u32 (*ggtt_offset)(struct intel_dsb_buffer *dsb_buf);
 	void (*write)(struct intel_dsb_buffer *dsb_buf, u32 idx, u32 val);
@@ -247,9 +241,6 @@ struct intel_display_parent_interface {
 	/** @bo: BO interface */
 	const struct intel_display_bo_interface *bo;
 
-	/** @dpt: DPT interface. Optional. */
-	const struct intel_display_dpt_interface *dpt;
-
 	/** @dsb: DSB buffer interface */
 	const struct intel_display_dsb_interface *dsb;
 
-- 
2.56.0

