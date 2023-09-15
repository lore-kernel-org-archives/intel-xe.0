Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA75BEE6455
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 10:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901C510E61D;
	Fri, 15 Sep 2023 10:57:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28B410E61D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694775461; x=1726311461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d/CC2KTM1e9XZS5x2OEEQ7CfeLoPxgHmSDuuJtV1yLM=;
 b=HEEwjfzX0+Hvc83rlTGPGFevAJs4ykyLG4vlA7dyk3MFM+9B8l1b0kyr
 r7wej3Sh1AEcAAwRtcg7zkInfpDZTFl3ABEq27kcSPt5Eb8tsiQWfSqJ8
 zmAm7VXEyxGFp3fG+/CCf2QQ1a/Bz4vdpWs/moyQw/HaEAFKoup3PAQWe
 WI7WCTTJ7Tns7rc5NjzfbgN2+/3COnM323riYboU+lhpOg1q5PwUx3ogE
 A81PaTp9WbmTXubXELFI4pA2eEOmeddDNeMfqov2cKbSyR8IGI3WOwTbj
 wiyf9ke6tlEG633Bf5s45A5qzSRvWyDU/qAo5ejKZociiv5xbtOBh/7X7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="379140130"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="379140130"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 03:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="835171646"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="835171646"
Received: from cohrs-mobl1.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.48.100])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 03:57:39 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 13:57:22 +0300
Message-Id: <20230915105724.1025509-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915105724.1025509-1-jouni.hogander@intel.com>
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/i915: add minimal
 i915_gem_object_frontbuffer.h
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

Split out frontbuffer related declarations and static inlines from
gem/i915_gem_object.h into new gem/i915_gem_object_frontbuffer.h.

The main goal is to reduce header interdependencies. With
gem/i915_gem_object.h including display/intel_frontbuffer.h,
modification of the latter causes a whopping 300+ objects to be rebuilt,
while many of the source files actually needing it aren't explicitly
including it at all.

After the change, only 21 objects depend on display/intel_frontbuffer.h,
directly or indirectly.

Cc: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230830085127.2416842-1-jani.nikula@intel.com
(cherry picked from commit c1464a89e1a41695d5bda47d5c27923b1802ce00)
---
 drivers/gpu/drm/i915/display/i9xx_plane.c     |   1 +
 drivers/gpu/drm/i915/display/intel_drrs.c     |   1 +
 .../gpu/drm/i915/display/intel_frontbuffer.c  |   1 +
 drivers/gpu/drm/i915/display/intel_overlay.c  |   1 +
 .../drm/i915/display/intel_plane_initial.c    |   1 +
 drivers/gpu/drm/i915/display/intel_psr.c      |   1 +
 drivers/gpu/drm/i915/display/intel_sprite.c   |   1 +
 .../drm/i915/display/skl_universal_plane.c    |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  90 ---------------
 .../i915/gem/i915_gem_object_frontbuffer.h    | 103 ++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   1 +
 drivers/gpu/drm/i915/i915_gem.c               |   2 +-
 drivers/gpu/drm/i915/i915_vma.c               |   1 +
 16 files changed, 117 insertions(+), 94 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index b10488324457..91f2bc405cba 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -17,6 +17,7 @@
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
+#include "intel_frontbuffer.h"
 #include "intel_sprite.h"
 
 /* Primary plane formats for gen <= 3 */
diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index 0d35b6be5b6a..6282ec0fc9b4 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -9,6 +9,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_drrs.h"
+#include "intel_frontbuffer.h"
 #include "intel_panel.h"
 
 /**
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 15302ea9cc4e..e6fb777dc374 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -55,6 +55,7 @@
  * cancelled as soon as busyness is detected.
  */
 
+#include "gem/i915_gem_object_frontbuffer.h"
 #include "i915_active.h"
 #include "i915_drv.h"
 #include "intel_display_trace.h"
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 09c1aa1427ad..7454441ab469 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -29,6 +29,7 @@
 #include <drm/drm_fourcc.h>
 
 #include "gem/i915_gem_internal.h"
+#include "gem/i915_gem_object_frontbuffer.h"
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_ring.h"
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 736072a8b2b0..451a642e106e 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -9,6 +9,7 @@
 #include "intel_display.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
+#include "intel_frontbuffer.h"
 #include "intel_plane_initial.h"
 
 static bool
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 72887c29fb51..60b486299834 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -32,6 +32,7 @@
 #include "intel_display_types.h"
 #include "intel_dp.h"
 #include "intel_dp_aux.h"
+#include "intel_frontbuffer.h"
 #include "intel_hdmi.h"
 #include "intel_psr.h"
 #include "intel_psr_regs.h"
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 25034bbf1445..1fb16510f750 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -45,6 +45,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
+#include "intel_frontbuffer.h"
 #include "intel_sprite.h"
 
 static void i9xx_plane_linear_gamma(u16 gamma[8])
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 2ded1bcce754..4d01c7ae4485 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -16,6 +16,7 @@
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
+#include "intel_frontbuffer.h"
 #include "intel_psr.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index 385ffc575b48..7d97ea2a653e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -6,11 +6,10 @@
 
 #include <drm/drm_cache.h>
 
-#include "display/intel_frontbuffer.h"
-
 #include "i915_config.h"
 #include "i915_drv.h"
 #include "i915_gem_clflush.h"
+#include "i915_gem_object_frontbuffer.h"
 #include "i915_sw_fence_work.h"
 #include "i915_trace.h"
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index ffddec1d2a76..3770828f2eaf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -5,7 +5,6 @@
  */
 
 #include "display/intel_display.h"
-#include "display/intel_frontbuffer.h"
 #include "gt/intel_gt.h"
 
 #include "i915_drv.h"
@@ -16,6 +15,7 @@
 #include "i915_gem_lmem.h"
 #include "i915_gem_mman.h"
 #include "i915_gem_object.h"
+#include "i915_gem_object_frontbuffer.h"
 #include "i915_vma.h"
 
 #define VTD_GUARD (168u * I915_GTT_PAGE_SIZE) /* 168 or tile-row PTE padding */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index ef9346ed6d0f..c26d87555825 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -37,6 +37,7 @@
 #include "i915_gem_dmabuf.h"
 #include "i915_gem_mman.h"
 #include "i915_gem_object.h"
+#include "i915_gem_object_frontbuffer.h"
 #include "i915_gem_ttm.h"
 #include "i915_memcpy.h"
 #include "i915_trace.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 525cb440cc15..3560a062d287 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -11,7 +11,6 @@
 #include <drm/drm_file.h>
 #include <drm/drm_device.h>
 
-#include "display/intel_frontbuffer.h"
 #include "intel_memory_region.h"
 #include "i915_gem_object_types.h"
 #include "i915_gem_gtt.h"
@@ -806,27 +805,6 @@ int i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 				  unsigned int flags,
 				  const struct i915_sched_attr *attr);
 
-void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
-					 enum fb_op_origin origin);
-void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
-					      enum fb_op_origin origin);
-
-static inline void
-i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
-				  enum fb_op_origin origin)
-{
-	if (unlikely(rcu_access_pointer(obj->frontbuffer)))
-		__i915_gem_object_flush_frontbuffer(obj, origin);
-}
-
-static inline void
-i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
-				       enum fb_op_origin origin)
-{
-	if (unlikely(rcu_access_pointer(obj->frontbuffer)))
-		__i915_gem_object_invalidate_frontbuffer(obj, origin);
-}
-
 int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size);
 
 bool i915_gem_object_is_shmem(const struct drm_i915_gem_object *obj);
@@ -887,72 +865,4 @@ static inline int i915_gem_object_userptr_validate(struct drm_i915_gem_object *o
 
 #endif
 
-/**
- * i915_gem_object_get_frontbuffer - Get the object's frontbuffer
- * @obj: The object whose frontbuffer to get.
- *
- * Get pointer to object's frontbuffer if such exists. Please note that RCU
- * mechanism is used to handle e.g. ongoing removal of frontbuffer pointer.
- *
- * Return: pointer to object's frontbuffer is such exists or NULL
- */
-static inline struct intel_frontbuffer *
-i915_gem_object_get_frontbuffer(const struct drm_i915_gem_object *obj)
-{
-	struct intel_frontbuffer *front;
-
-	if (likely(!rcu_access_pointer(obj->frontbuffer)))
-		return NULL;
-
-	rcu_read_lock();
-	do {
-		front = rcu_dereference(obj->frontbuffer);
-		if (!front)
-			break;
-
-		if (unlikely(!kref_get_unless_zero(&front->ref)))
-			continue;
-
-		if (likely(front == rcu_access_pointer(obj->frontbuffer)))
-			break;
-
-		intel_frontbuffer_put(front);
-	} while (1);
-	rcu_read_unlock();
-
-	return front;
-}
-
-/**
- * i915_gem_object_set_frontbuffer - Set the object's frontbuffer
- * @obj: The object whose frontbuffer to set.
- * @front: The frontbuffer to set
- *
- * Set object's frontbuffer pointer. If frontbuffer is already set for the
- * object keep it and return it's pointer to the caller. Please note that RCU
- * mechanism is used to handle e.g. ongoing removal of frontbuffer pointer. This
- * function is protected by i915->display.fb_tracking.lock
- *
- * Return: pointer to frontbuffer which was set.
- */
-static inline struct intel_frontbuffer *
-i915_gem_object_set_frontbuffer(struct drm_i915_gem_object *obj,
-				struct intel_frontbuffer *front)
-{
-	struct intel_frontbuffer *cur = front;
-
-	if (!front) {
-		RCU_INIT_POINTER(obj->frontbuffer, NULL);
-		i915_gem_object_put(obj);
-	} else if (rcu_access_pointer(obj->frontbuffer)) {
-		cur = rcu_dereference_protected(obj->frontbuffer, true);
-		kref_get(&cur->ref);
-	} else {
-		drm_gem_object_get(intel_bo_to_drm_bo(obj));
-		rcu_assign_pointer(obj->frontbuffer, front);
-	}
-
-	return cur;
-}
-
 #endif
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h b/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
new file mode 100644
index 000000000000..e5e870b6f186
--- /dev/null
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __I915_GEM_OBJECT_FRONTBUFFER_H__
+#define __I915_GEM_OBJECT_FRONTBUFFER_H__
+
+#include <linux/kref.h>
+#include <linux/rcupdate.h>
+
+#include "display/intel_frontbuffer.h"
+#include "i915_gem_object_types.h"
+
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
+/**
+ * i915_gem_object_get_frontbuffer - Get the object's frontbuffer
+ * @obj: The object whose frontbuffer to get.
+ *
+ * Get pointer to object's frontbuffer if such exists. Please note that RCU
+ * mechanism is used to handle e.g. ongoing removal of frontbuffer pointer.
+ *
+ * Return: pointer to object's frontbuffer is such exists or NULL
+ */
+static inline struct intel_frontbuffer *
+i915_gem_object_get_frontbuffer(const struct drm_i915_gem_object *obj)
+{
+	struct intel_frontbuffer *front;
+
+	if (likely(!rcu_access_pointer(obj->frontbuffer)))
+		return NULL;
+
+	rcu_read_lock();
+	do {
+		front = rcu_dereference(obj->frontbuffer);
+		if (!front)
+			break;
+
+		if (unlikely(!kref_get_unless_zero(&front->ref)))
+			continue;
+
+		if (likely(front == rcu_access_pointer(obj->frontbuffer)))
+			break;
+
+		intel_frontbuffer_put(front);
+	} while (1);
+	rcu_read_unlock();
+
+	return front;
+}
+
+/**
+ * i915_gem_object_set_frontbuffer - Set the object's frontbuffer
+ * @obj: The object whose frontbuffer to set.
+ * @front: The frontbuffer to set
+ *
+ * Set object's frontbuffer pointer. If frontbuffer is already set for the
+ * object keep it and return it's pointer to the caller. Please note that RCU
+ * mechanism is used to handle e.g. ongoing removal of frontbuffer pointer. This
+ * function is protected by i915->display.fb_tracking.lock
+ *
+ * Return: pointer to frontbuffer which was set.
+ */
+static inline struct intel_frontbuffer *
+i915_gem_object_set_frontbuffer(struct drm_i915_gem_object *obj,
+				struct intel_frontbuffer *front)
+{
+	struct intel_frontbuffer *cur = front;
+
+	if (!front) {
+		RCU_INIT_POINTER(obj->frontbuffer, NULL);
+	} else if (rcu_access_pointer(obj->frontbuffer)) {
+		cur = rcu_dereference_protected(obj->frontbuffer, true);
+		kref_get(&cur->ref);
+	} else {
+		drm_gem_object_get(intel_bo_to_drm_bo(obj));
+		rcu_assign_pointer(obj->frontbuffer, front);
+	}
+
+	return cur;
+}
+
+#endif
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 76efe98eaa14..5df128e2f4dc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -13,6 +13,7 @@
 #include "gt/intel_gt.h"
 #include "i915_drv.h"
 #include "i915_gem_object.h"
+#include "i915_gem_object_frontbuffer.h"
 #include "i915_gem_region.h"
 #include "i915_gem_tiling.h"
 #include "i915_scatterlist.h"
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 1f65bb33dd21..147d5b95b9ac 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -40,12 +40,12 @@
 #include <drm/drm_vma_manager.h>
 
 #include "display/intel_display.h"
-#include "display/intel_frontbuffer.h"
 
 #include "gem/i915_gem_clflush.h"
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_ioctls.h"
 #include "gem/i915_gem_mman.h"
+#include "gem/i915_gem_object_frontbuffer.h"
 #include "gem/i915_gem_pm.h"
 #include "gem/i915_gem_region.h"
 #include "gem/i915_gem_userptr.h"
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 6f180ee13853..d09aad34ba37 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -29,6 +29,7 @@
 #include "display/intel_display.h"
 #include "display/intel_frontbuffer.h"
 #include "gem/i915_gem_lmem.h"
+#include "gem/i915_gem_object_frontbuffer.h"
 #include "gem/i915_gem_tiling.h"
 #include "gt/intel_engine.h"
 #include "gt/intel_engine_heartbeat.h"
-- 
2.34.1

