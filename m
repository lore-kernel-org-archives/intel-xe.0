Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4543C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8265B10E48A;
	Wed, 10 May 2023 12:12:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A740E10E4AB
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720738; x=1715256738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4pMRtgdqLJvEyrevHOJCnYmo6Om1HEESFCZIE9e3dfM=;
 b=c5LpVKxEDsShHKKJS6ml5VxMq1G1B8PX3/q73wYPw1bFTHHBWDOM3RZ7
 9OA2XVWU64SkFJL0y+f9n105S2fAwl60Qll7VYp1Y07CGZ0UpNFVsYnTM
 r15SkDDJAJ2ZJKq8BMz8mwzOhfSiX3ozqEsU04Jow8Ru3bUTFedmqjA1x
 ip/EafL6N+9N/AFCVCpNBCiYIcO8G3S3SVH2g9dPT+HT3c/2HMSwLqEgv
 grOuIO+/3nPHnX0A7sonN4v6NQWZ/U9/GlXNgHlcdwwm9kz+Hq0Sh4PfU
 IQUBIG55accXttfs+VM/ZGu3own2aWAy2ghdG0h44Xe2i4CwISJjcaNfa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268077"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268077"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906047"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906047"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:15 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:32 +0300
Message-Id: <20230510121152.736148-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 03/23] Revert "drm/i915: Remove gem and
 overlay frontbuffer tracking"
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit a38443669f03189621844fec25b2aa4f96e99276.

We want to keep frontbuffer tracking as removing it would break
GPU rendering in i915 driver.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  1 -
 drivers/gpu/drm/i915/display/intel_drrs.c     |  1 -
 drivers/gpu/drm/i915/display/intel_fb.c       |  1 -
 drivers/gpu/drm/i915/display/intel_overlay.c  | 14 +++++++++++
 .../drm/i915/display/intel_plane_initial.c    |  1 -
 drivers/gpu/drm/i915/display/intel_psr.c      |  1 -
 .../drm/i915/display/skl_universal_plane.c    |  1 -
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |  4 +++
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  7 ++++++
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 ++
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 25 +++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    | 22 ++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  4 +++
 drivers/gpu/drm/i915/i915_driver.c            |  1 -
 drivers/gpu/drm/i915/i915_gem.c               |  8 ++++++
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  1 +
 drivers/gpu/drm/i915/i915_vma.c               | 12 +++++++++
 17 files changed, 99 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 633e462d96a0..ecaeb7dc196b 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -17,7 +17,6 @@
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
-#include "intel_frontbuffer.h"
 #include "intel_sprite.h"
 
 /* Primary plane formats for gen <= 3 */
diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index 59527a4667f4..760e63cdc0c8 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -9,7 +9,6 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_drrs.h"
-#include "intel_frontbuffer.h"
 #include "intel_panel.h"
 
 /**
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 9a7928f7fa08..953e3a4269b6 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -13,7 +13,6 @@
 #include "intel_display_types.h"
 #include "intel_dpt.h"
 #include "intel_fb.h"
-#include "intel_frontbuffer.h"
 
 #ifdef I915
 /*
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index bcab587c634b..d6fe2bbabe55 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -186,6 +186,7 @@ struct intel_overlay {
 	struct intel_crtc *crtc;
 	struct i915_vma *vma;
 	struct i915_vma *old_vma;
+	struct intel_frontbuffer *frontbuffer;
 	bool active;
 	bool pfit_active;
 	u32 pfit_vscale_ratio; /* shifted-point number, (1<<12) == 1.0 */
@@ -286,9 +287,20 @@ static void intel_overlay_flip_prepare(struct intel_overlay *overlay,
 				       struct i915_vma *vma)
 {
 	enum pipe pipe = overlay->crtc->pipe;
+	struct intel_frontbuffer *frontbuffer = NULL;
 
 	drm_WARN_ON(&overlay->i915->drm, overlay->old_vma);
 
+	if (vma)
+		frontbuffer = intel_frontbuffer_get(vma->obj);
+
+	intel_frontbuffer_track(overlay->frontbuffer, frontbuffer,
+				INTEL_FRONTBUFFER_OVERLAY(pipe));
+
+	if (overlay->frontbuffer)
+		intel_frontbuffer_put(overlay->frontbuffer);
+	overlay->frontbuffer = frontbuffer;
+
 	intel_frontbuffer_flip_prepare(overlay->i915,
 				       INTEL_FRONTBUFFER_OVERLAY(pipe));
 
@@ -798,6 +810,8 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 		goto out_pin_section;
 	}
 
+	i915_gem_object_flush_frontbuffer(new_bo, ORIGIN_DIRTYFB);
+
 	if (!overlay->active) {
 		const struct intel_crtc_state *crtc_state =
 			overlay->crtc->config;
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 451a642e106e..736072a8b2b0 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -9,7 +9,6 @@
 #include "intel_display.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
-#include "intel_frontbuffer.h"
 #include "intel_plane_initial.h"
 
 static bool
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 2ecc902a85a2..ea0389c5f656 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -32,7 +32,6 @@
 #include "intel_display_types.h"
 #include "intel_dp.h"
 #include "intel_dp_aux.h"
-#include "intel_frontbuffer.h"
 #include "intel_hdmi.h"
 #include "intel_psr.h"
 #include "intel_psr_regs.h"
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 0f1e4e61d32e..71ba544eda71 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -16,7 +16,6 @@
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
-#include "intel_frontbuffer.h"
 #include "intel_psr.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index 1718252cf20f..385ffc575b48 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -6,6 +6,8 @@
 
 #include <drm/drm_cache.h>
 
+#include "display/intel_frontbuffer.h"
+
 #include "i915_config.h"
 #include "i915_drv.h"
 #include "i915_gem_clflush.h"
@@ -21,6 +23,8 @@ static void __do_clflush(struct drm_i915_gem_object *obj)
 {
 	GEM_BUG_ON(!i915_gem_object_has_pages(obj));
 	drm_clflush_sg(obj->mm.pages);
+
+	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
 }
 
 static void clflush_work(struct dma_fence_work *base)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index c165ee50e00f..d2d5a24301b2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -5,6 +5,7 @@
  */
 
 #include "display/intel_display.h"
+#include "display/intel_frontbuffer.h"
 #include "gt/intel_gt.h"
 
 #include "i915_drv.h"
@@ -65,6 +66,8 @@ flush_write_domain(struct drm_i915_gem_object *obj, unsigned int flush_domains)
 				intel_gt_flush_ggtt_writes(vma->vm->gt);
 		}
 		spin_unlock(&obj->vma.lock);
+
+		i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
 		break;
 
 	case I915_GEM_DOMAIN_WC:
@@ -631,6 +634,9 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 out_unlock:
 	i915_gem_object_unlock(obj);
 
+	if (!err && write_domain)
+		i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
+
 out:
 	i915_gem_object_put(obj);
 	return err;
@@ -741,6 +747,7 @@ int i915_gem_object_prepare_write(struct drm_i915_gem_object *obj,
 	}
 
 out:
+	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
 	obj->mm.dirty = true;
 	/* return with the pages pinned */
 	return 0;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 25cf8ab4037e..3aeede6aee4d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -11,6 +11,8 @@
 
 #include <drm/drm_syncobj.h>
 
+#include "display/intel_frontbuffer.h"
+
 #include "gem/i915_gem_ioctls.h"
 #include "gt/intel_context.h"
 #include "gt/intel_gpu_commands.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 82500f73e9ff..4666bb82f312 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -27,6 +27,7 @@
 
 #include <drm/drm_cache.h>
 
+#include "display/intel_frontbuffer.h"
 #include "pxp/intel_pxp.h"
 
 #include "i915_drv.h"
@@ -399,6 +400,30 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 		queue_work(i915->wq, &i915->mm.free_work);
 }
 
+void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
+					 enum fb_op_origin origin)
+{
+	struct intel_frontbuffer *front;
+
+	front = __intel_frontbuffer_get(obj);
+	if (front) {
+		intel_frontbuffer_flush(front, origin);
+		intel_frontbuffer_put(front);
+	}
+}
+
+void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
+					      enum fb_op_origin origin)
+{
+	struct intel_frontbuffer *front;
+
+	front = __intel_frontbuffer_get(obj);
+	if (front) {
+		intel_frontbuffer_invalidate(front, origin);
+		intel_frontbuffer_put(front);
+	}
+}
+
 static void
 i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 83b615a9e628..885ccde9dc3c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -11,6 +11,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_device.h>
 
+#include "display/intel_frontbuffer.h"
 #include "intel_memory_region.h"
 #include "i915_gem_object_types.h"
 #include "i915_gem_gtt.h"
@@ -801,6 +802,27 @@ int i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 				  unsigned int flags,
 				  const struct i915_sched_attr *attr);
 
+void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
+					 enum fb_op_origin origin);
+void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
+					      enum fb_op_origin origin);
+
+static inline void
+i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
+				  enum fb_op_origin origin)
+{
+	if (unlikely(rcu_access_pointer(obj->frontbuffer)))
+		__i915_gem_object_flush_frontbuffer(obj, origin);
+}
+
+static inline void
+i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
+				       enum fb_op_origin origin)
+{
+	if (unlikely(rcu_access_pointer(obj->frontbuffer)))
+		__i915_gem_object_invalidate_frontbuffer(obj, origin);
+}
+
 int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size);
 
 bool i915_gem_object_is_shmem(const struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index f2c4ed5cdab0..76efe98eaa14 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -160,11 +160,15 @@ int i915_gem_object_pwrite_phys(struct drm_i915_gem_object *obj,
 	 * We manually control the domain here and pretend that it
 	 * remains coherent i.e. in the GTT domain, like shmem_pwrite.
 	 */
+	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
+
 	if (copy_from_user(vaddr, user_data, args->size))
 		return -EFAULT;
 
 	drm_clflush_virt_range(vaddr, args->size);
 	intel_gt_chipset_flush(to_gt(i915));
+
+	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 5d302602793c..0dee8c19d9ee 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -214,7 +214,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	spin_lock_init(&dev_priv->irq_lock);
 	spin_lock_init(&dev_priv->gpu_error.lock);
-	spin_lock_init(&dev_priv->display.fb_tracking.lock);
 	spin_lock_init(&dev_priv->display.wm.dsparb_lock);
 	mutex_init(&dev_priv->display.backlight.lock);
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 2870bf791153..0a78bdbd36b1 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -40,6 +40,7 @@
 #include <drm/drm_vma_manager.h>
 
 #include "display/intel_display.h"
+#include "display/intel_frontbuffer.h"
 
 #include "gem/i915_gem_clflush.h"
 #include "gem/i915_gem_context.h"
@@ -577,6 +578,8 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
 		goto out_rpm;
 	}
 
+	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
+
 	user_data = u64_to_user_ptr(args->data_ptr);
 	offset = args->offset;
 	remain = args->size;
@@ -619,6 +622,7 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
 	}
 
 	intel_gt_flush_ggtt_writes(ggtt->vm.gt);
+	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
 
 	i915_gem_gtt_cleanup(obj, &node, vma);
 out_rpm:
@@ -706,6 +710,8 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *obj,
 		offset = 0;
 	}
 
+	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
+
 	i915_gem_object_unpin_pages(obj);
 	return ret;
 
@@ -1276,6 +1282,8 @@ void i915_gem_init_early(struct drm_i915_private *dev_priv)
 {
 	i915_gem_init__mm(dev_priv);
 	i915_gem_init__contexts(dev_priv);
+
+	spin_lock_init(&dev_priv->display.fb_tracking.lock);
 }
 
 void i915_gem_cleanup_early(struct drm_i915_private *dev_priv)
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index a9662cc6ed1e..7bd1861ddbdf 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -15,6 +15,7 @@
 #include <asm/set_memory.h>
 #include <asm/smp.h>
 
+#include "display/intel_frontbuffer.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_requests.h"
 
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index dd3604f63019..20a44788999e 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -27,6 +27,7 @@
 #include <drm/drm_gem.h>
 
 #include "display/intel_display.h"
+#include "display/intel_frontbuffer.h"
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_tiling.h"
 #include "gt/intel_engine.h"
@@ -1902,6 +1903,17 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 			return err;
 	}
 
+	if (flags & EXEC_OBJECT_WRITE) {
+		struct intel_frontbuffer *front;
+
+		front = __intel_frontbuffer_get(obj);
+		if (unlikely(front)) {
+			if (intel_frontbuffer_invalidate(front, ORIGIN_CS))
+				i915_active_add_request(&front->write, rq);
+			intel_frontbuffer_put(front);
+		}
+	}
+
 	if (fence) {
 		struct dma_fence *curr;
 		enum dma_resv_usage usage;
-- 
2.34.1

