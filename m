Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E7F606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CcLXTVEJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4A610FB44;
	Wed, 11 Nov 2026 11:20:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBE410FB34;
 Wed, 11 Nov 2026 11:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396046; x=1825932046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dJR1ny9qU3l9IJXP+4unWzLhhgsqk05zGpuKQxZaz14=;
 b=CcLXTVEJr9u5l37I0vyPT8Ky7oanKWjkbv0d0m+Dl+WhJSfxvlMT9r9P
 DYNWKoZZMbAXQp9kqRZMkPUxU01Il/rcFVW239YB8p78LIJGxVma6reQZ
 r4FcmjofU7DgdPTWOueOPk0oavzfE3yv0+q/mAWc6T+qNmAB4S4CmP/6j
 Da9aUgSGa/1I21b2/+84oA8jLuytZ/LrPBYLFKdl4mkmhDeVyaaphB448
 5SP+VIm1RYGmItls5wzhWMwxwxjmzihstpwKULrHzd2YKTGUME3KLvFBI
 uDyzy8rRPQO8p5XycaoCdk4PfzswpU3Nfp2dp1x6cqRbTJopPoUHSgnwo A==;
X-CSE-ConnectionGUID: JDao+uaGQxugc/wD/OqUrg==
X-CSE-MsgGUID: MWlzxHPkRrOe0nLhqfj7VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3162132"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3162132"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:45 -0800
X-CSE-ConnectionGUID: CAD18IiXQlqUVHav4I7pig==
X-CSE-MsgGUID: wnywLZwPT2yRx6va+luh5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8493237"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:44 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/13] drm/i915/dpt: Make i915_dpt_{suspend,
 resume}() internal to i915
Date: Wed, 11 Nov 2026 13:20:03 +0200
Message-ID: <20261111112007.16790-10-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently the DPT suspend/resume happens through the parent
interface from the display code. The reason being that we track
DPTs only in framebuffers and those are the purview of the display
code.

Cut out the display middle man by tracking the DPTs in their
associated GGTT. This means a leaner parent interface, and the
strict ordering requirement between the DPT and GGTT
suspend/resume is now guaranteed internally by the GGTT code.

Currently DPT lifetime is still tied to the FB lifetime, but
that is changing soon. For that reason i915_dpt_suspend() is
already written in a way that can deal with DPTs potentially
getting destroyed during suspend. Thus the suspend path drains
the dpt_list one by one, drops the lock around
i915_ggtt_suspend_vm() (relying on the elevated reference
count to keep the DPT alive) and once done all the DPTs that
are still alive are put back onto the GGTT's dpt_list.

The resume side is easier since i915_ggtt_resume_vm() is
essentially a nop for DPTs. Thus it can be called while
holding the lock.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_display_driver.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_dpt.c      | 58 -------------
 drivers/gpu/drm/i915/display/intel_dpt.h      |  2 -
 drivers/gpu/drm/i915/display/intel_parent.c   | 12 ---
 drivers/gpu/drm/i915/display/intel_parent.h   |  2 -
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 10 +++
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 +
 drivers/gpu/drm/i915/i915_dpt.c               | 85 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_dpt.h               |  4 +
 drivers/gpu/drm/i915/i915_driver.c            |  5 --
 include/drm/intel/display_parent_interface.h  |  2 -
 11 files changed, 95 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 0c7bec7d7f01..7f263660fd99 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -766,7 +766,7 @@ static int __intel_display_driver_pm_suspend(struct intel_display *display, bool
 			display->restore.modeset_state = state;
 	}
 
-	/* ensure all DPT VMAs have been unpinned for intel_dpt_suspend() */
+	/* ensure all DPT VMAs have been unpinned for i915_dpt_suspend() */
 	flush_workqueue(display->wq.cleanup);
 
 	intel_dp_mst_suspend(display);
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 145dc9511116..ccdfefe96c93 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -34,61 +34,3 @@ void intel_dpt_configure(struct intel_crtc *crtc)
 			     CHICKEN_MISC_DISABLE_DPT);
 	}
 }
-
-/**
- * intel_dpt_suspend - suspend the memory mapping for all DPT FBs during system suspend
- * @display: display device instance
- *
- * Suspend the memory mapping during system suspend for all framebuffers which
- * are mapped to HW via a GGTT->DPT page table.
- *
- * This function must be called before the mappings in GGTT are suspended calling
- * i915_ggtt_suspend().
- */
-void intel_dpt_suspend(struct intel_display *display)
-{
-	struct drm_framebuffer *drm_fb;
-
-	if (!HAS_DISPLAY(display))
-		return;
-
-	mutex_lock(&display->drm->mode_config.fb_lock);
-
-	drm_for_each_fb(drm_fb, display->drm) {
-		struct intel_framebuffer *fb = to_intel_framebuffer(drm_fb);
-
-		if (fb->dpt)
-			intel_parent_dpt_suspend(display, fb->dpt);
-	}
-
-	mutex_unlock(&display->drm->mode_config.fb_lock);
-}
-
-/**
- * intel_dpt_resume - restore the memory mapping for all DPT FBs during system resume
- * @display: display device instance
- *
- * Restore the memory mapping during system resume for all framebuffers which
- * are mapped to HW via a GGTT->DPT page table. The content of these page
- * tables are not stored in the hibernation image during S4 and S3RST->S4
- * transitions, so here we reprogram the PTE entries in those tables.
- *
- * This function must be called after the mappings in GGTT have been restored calling
- * i915_ggtt_resume().
- */
-void intel_dpt_resume(struct intel_display *display)
-{
-	struct drm_framebuffer *drm_fb;
-
-	if (!HAS_DISPLAY(display))
-		return;
-
-	mutex_lock(&display->drm->mode_config.fb_lock);
-	drm_for_each_fb(drm_fb, display->drm) {
-		struct intel_framebuffer *fb = to_intel_framebuffer(drm_fb);
-
-		if (fb->dpt)
-			intel_parent_dpt_resume(display, fb->dpt);
-	}
-	mutex_unlock(&display->drm->mode_config.fb_lock);
-}
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
index 11bd495693b2..dbf61fbcdcac 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.h
+++ b/drivers/gpu/drm/i915/display/intel_dpt.h
@@ -10,7 +10,5 @@ struct intel_crtc;
 struct intel_display;
 
 void intel_dpt_configure(struct intel_crtc *crtc);
-void intel_dpt_suspend(struct intel_display *display);
-void intel_dpt_resume(struct intel_display *display);
 
 #endif /* __INTEL_DPT_COMMON_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
index e9609c29997e..8497694b29d7 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.c
+++ b/drivers/gpu/drm/i915/display/intel_parent.c
@@ -41,18 +41,6 @@ void intel_parent_dpt_destroy(struct intel_display *display, struct intel_dpt *d
 		display->parent->dpt->destroy(dpt);
 }
 
-void intel_parent_dpt_suspend(struct intel_display *display, struct intel_dpt *dpt)
-{
-	if (display->parent->dpt)
-		display->parent->dpt->suspend(dpt);
-}
-
-void intel_parent_dpt_resume(struct intel_display *display, struct intel_dpt *dpt)
-{
-	if (display->parent->dpt)
-		display->parent->dpt->resume(dpt);
-}
-
 /* fb_pin */
 int intel_parent_fb_pin_ggtt_pin(struct intel_display *display,
 				 struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
index 3d0959d67727..b22f92404f65 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.h
+++ b/drivers/gpu/drm/i915/display/intel_parent.h
@@ -27,8 +27,6 @@ struct intel_dpt *intel_parent_dpt_create(struct intel_display *display,
 					  struct drm_gem_object *obj,
 					  const struct intel_gtt_view *view);
 void intel_parent_dpt_destroy(struct intel_display *display, struct intel_dpt *dpt);
-void intel_parent_dpt_suspend(struct intel_display *display, struct intel_dpt *dpt);
-void intel_parent_dpt_resume(struct intel_display *display, struct intel_dpt *dpt);
 
 /* fb_pin */
 int intel_parent_fb_pin_ggtt_pin(struct intel_display *display,
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 64ca5bbc53c6..abd7efc8bcdc 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -22,6 +22,7 @@
 #include "intel_gt.h"
 #include "intel_gt_regs.h"
 #include "intel_ring.h"
+#include "i915_dpt.h"
 #include "i915_drv.h"
 #include "i915_pci.h"
 #include "i915_reg.h"
@@ -182,6 +183,9 @@ void i915_ggtt_suspend(struct i915_ggtt *ggtt)
 {
 	struct intel_gt *gt;
 
+	/* must be called before ggtt is suspended */
+	i915_dpt_suspend(ggtt);
+
 	i915_ggtt_suspend_vm(&ggtt->vm, false);
 	ggtt->invalidate(ggtt);
 
@@ -1591,6 +1595,9 @@ struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915)
 
 	INIT_LIST_HEAD(&ggtt->gt_list);
 
+	INIT_LIST_HEAD(&ggtt->dpt_list);
+	spin_lock_init(&ggtt->dpt_lock);
+
 	return ggtt;
 }
 
@@ -1679,4 +1686,7 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
 		wbinvd_on_all_cpus();
 
 	intel_ggtt_restore_fences(ggtt);
+
+	/* must be called after ggtt is resumed */
+	i915_dpt_resume(ggtt);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index b54ee4f25af1..bda1c1700c8f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -407,6 +407,10 @@ struct i915_ggtt {
 
 	/** List of GTs mapping this GGTT */
 	struct list_head gt_list;
+
+	/* List of DPTs create for this GGTT */
+	struct list_head dpt_list;
+	spinlock_t dpt_lock; /* protects dpt_list */
 };
 
 struct i915_ppgtt {
diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
index 96bcffc38d3c..e625ec293c5c 100644
--- a/drivers/gpu/drm/i915/i915_dpt.c
+++ b/drivers/gpu/drm/i915/i915_dpt.c
@@ -20,6 +20,7 @@ struct intel_dpt {
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
 	void __iomem *iomem;
+	struct list_head ggtt_link;
 };
 
 #define i915_is_dpt(vm) ((vm)->is_dpt)
@@ -179,10 +180,27 @@ void i915_dpt_unpin_from_ggtt(struct intel_dpt *dpt)
 	i915_vma_put(dpt->vma);
 }
 
+static void i915_dpt_get(struct intel_dpt *dpt)
+{
+	i915_vm_get(&dpt->vm);
+}
+
+static void i915_dpt_put(struct intel_dpt *dpt)
+{
+	i915_vm_put(&dpt->vm);
+}
+
+static void i915_dpt_free(struct intel_dpt *dpt)
+{
+	dpt->obj->is_dpt = false;
+	i915_dpt_put(dpt);
+}
+
 static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj,
 					 const struct intel_gtt_view *view)
 {
 	struct drm_i915_private *i915 = to_i915(obj->dev);
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct drm_i915_gem_object *dpt_obj;
 	struct i915_address_space *vm;
 	struct intel_dpt *dpt;
@@ -239,28 +257,79 @@ static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj,
 	vm->vma_ops.bind_vma    = dpt_bind_vma;
 	vm->vma_ops.unbind_vma  = dpt_unbind_vma;
 
-	vm->pte_encode = vm->gt->ggtt->vm.pte_encode;
+	vm->pte_encode = ggtt->vm.pte_encode;
 
 	dpt->obj = dpt_obj;
 	dpt->obj->is_dpt = true;
 
+	spin_lock(&ggtt->dpt_lock);
+	list_add_tail(&dpt->ggtt_link, &ggtt->dpt_list);
+	spin_unlock(&ggtt->dpt_lock);
+
 	return dpt;
 }
 
 static void i915_dpt_destroy(struct intel_dpt *dpt)
 {
-	dpt->obj->is_dpt = false;
-	i915_vm_put(&dpt->vm);
+	struct i915_ggtt *ggtt = i915_dpt_to_vm(dpt)->gt->ggtt;
+
+	spin_lock(&ggtt->dpt_lock);
+	list_del_init(&dpt->ggtt_link);
+	spin_unlock(&ggtt->dpt_lock);
+
+	i915_dpt_free(dpt);
 }
 
-static void i915_dpt_suspend(struct intel_dpt *dpt)
+void i915_dpt_suspend(struct i915_ggtt *ggtt)
 {
-	i915_ggtt_suspend_vm(&dpt->vm, true);
+	struct drm_i915_private *i915 = ggtt->vm.i915;
+	LIST_HEAD(dpt_list);
+
+	for (;;) {
+		struct intel_dpt *dpt;
+
+		spin_lock(&ggtt->dpt_lock);
+
+		dpt = list_first_entry_or_null(&ggtt->dpt_list,
+					       typeof(*dpt), ggtt_link);
+		if (dpt) {
+			i915_dpt_get(dpt);
+			list_move_tail(&dpt->ggtt_link, &dpt_list);
+		}
+
+		spin_unlock(&ggtt->dpt_lock);
+
+		if (!dpt)
+			break;
+
+		i915_ggtt_suspend_vm(&dpt->vm, true);
+
+		i915_dpt_put(dpt);
+	}
+
+	spin_lock(&ggtt->dpt_lock);
+
+	drm_WARN_ON(&i915->drm, !list_empty(&ggtt->dpt_list));
+	list_splice(&dpt_list, &ggtt->dpt_list);
+
+	spin_unlock(&ggtt->dpt_lock);
 }
 
-static void i915_dpt_resume(struct intel_dpt *dpt)
+void i915_dpt_resume(struct i915_ggtt *ggtt)
 {
-	i915_ggtt_resume_vm(&dpt->vm, true);
+	struct intel_dpt *dpt;
+
+	/*
+	 * i915_ggtt_resume_vm() with evict_all==true
+	 * only does a quick sanity check, so OK to call
+	 * with ggtt->dpt_lock held.
+	 */
+	spin_lock(&ggtt->dpt_lock);
+
+	list_for_each_entry(dpt, &ggtt->dpt_list, ggtt_link)
+		i915_ggtt_resume_vm(&dpt->vm, true);
+
+	spin_unlock(&ggtt->dpt_lock);
 }
 
 u64 i915_dpt_offset(struct i915_vma *dpt_vma)
@@ -271,6 +340,4 @@ u64 i915_dpt_offset(struct i915_vma *dpt_vma)
 const struct intel_display_dpt_interface i915_display_dpt_interface = {
 	.create = i915_dpt_create,
 	.destroy = i915_dpt_destroy,
-	.suspend = i915_dpt_suspend,
-	.resume = i915_dpt_resume,
 };
diff --git a/drivers/gpu/drm/i915/i915_dpt.h b/drivers/gpu/drm/i915/i915_dpt.h
index 08dbe444fe18..51a497abb5e1 100644
--- a/drivers/gpu/drm/i915/i915_dpt.h
+++ b/drivers/gpu/drm/i915/i915_dpt.h
@@ -7,6 +7,7 @@
 #include <linux/types.h>
 
 struct i915_address_space;
+struct i915_ggtt;
 struct i915_vma;
 struct intel_dpt;
 
@@ -15,6 +16,9 @@ struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dpt *dpt, unsigned int alignm
 void i915_dpt_unpin_from_ggtt(struct intel_dpt *dpt);
 u64 i915_dpt_offset(struct i915_vma *dpt_vma);
 
+void i915_dpt_suspend(struct i915_ggtt *ggtt);
+void i915_dpt_resume(struct i915_ggtt *ggtt);
+
 extern const struct intel_display_dpt_interface i915_display_dpt_interface;
 
 #endif /* __I915_DPT_H__ */
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 5787f40ac62e..56bca9301532 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1084,8 +1084,6 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	intel_irq_suspend(dev_priv);
 
-	/* Must be called before GGTT is suspended. */
-	intel_dpt_suspend(display);
 	i915_ggtt_suspend(to_gt(dev_priv)->ggtt);
 
 	i9xx_display_sr_save(display);
@@ -1214,9 +1212,6 @@ static int i915_drm_resume(struct drm_device *dev)
 		if (GRAPHICS_VER(gt->i915) >= 8)
 			setup_private_pat(gt);
 
-	/* Must be called after GGTT is resumed. */
-	intel_dpt_resume(display);
-
 	intel_dmc_resume(display);
 
 	i9xx_display_sr_restore(display);
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index 33d29d061373..00f8e27be9f3 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -69,8 +69,6 @@ struct intel_display_dpt_interface {
 	struct intel_dpt *(*create)(struct drm_gem_object *obj,
 				    const struct intel_gtt_view *view);
 	void (*destroy)(struct intel_dpt *dpt);
-	void (*suspend)(struct intel_dpt *dpt);
-	void (*resume)(struct intel_dpt *dpt);
 };
 
 struct intel_display_dsb_interface {
-- 
2.56.0

