Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819CDC4706C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 00:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3401B10E548;
	Wed, 10 Jan 2024 00:43:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712D310E542
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 00:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704847431; x=1736383431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iMJt5Y6VEXg+bT3wP/Ys6alHEQz5eUXQMJf41CU5RcY=;
 b=P8jBv7mNM7pYR9qXCP1y7wn6qhg5pOtR5A173s/fVapVwggJT+i10IAt
 nedP10oPVws+2Hu9zL6Ba/oMoE5Rqfiba6gu8dhuEKAUC1MKLnAMaBRCI
 fdpIpv1/5o1YnkQzZM8vBhhCzok6x1lMF7Jv1djP8E641rAXpVcN5yt9R
 p+AgzC5H9u1ZQ1Q2Zp/GIFwrY6s+sGZP+mDthCg4NFoyWR3T2AygF0MNv
 KAqhAAWZ7rAexgWUQ7L3gxhNZySoiGV5Uh7cjcnIs7pX+SrdnnFwbF41Z
 Kk9pilE8Uml9gXlxkaXNY7a/1WgiJYrZTJEA1edK/ciHMeDqcx6n6m9FR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="464767462"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="464767462"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 16:43:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="775041885"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="775041885"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 16:43:51 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/xe/gsc: add support for GSC proxy interrupt
Date: Tue,  9 Jan 2024 16:44:15 -0800
Message-ID: <20240110004416.1127942-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110004416.1127942-1-daniele.ceraolospurio@intel.com>
References: <20240110004416.1127942-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The GSC notifies us of a proxy request via the HECI2 interrupt. The
interrupt must be enabled both in the HECI layer and in our usual gt irq
programming; for the latter, the interrupt is enabled via the same enable
register as the GSC CS, but it does have its own mask register. When the
interrupt is received, we also need to de-assert it in both layers.

The handling of the proxy request is deferred to the same worker that we
use for GSC load. New flags have been added to distinguish between the
init case and the proxy interrupt.

v2: rename irq define, fix include ordering (Alan)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 +
 drivers/gpu/drm/xe/xe_gsc.c          | 26 +++++++--
 drivers/gpu/drm/xe/xe_gsc_proxy.c    | 81 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gsc_proxy.h    |  3 ++
 drivers/gpu/drm/xe/xe_gsc_types.h    |  9 ++++
 drivers/gpu/drm/xe/xe_irq.c          | 44 +++++++++++----
 6 files changed, 143 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4017319c6300..0d4bfc35ff37 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -459,6 +459,7 @@
 #define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
 #define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
 #define   OTHER_GUC_INSTANCE			0
+#define   OTHER_GSC_HECI2_INSTANCE		3
 #define   OTHER_GSC_INSTANCE			6
 
 #define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
@@ -467,6 +468,7 @@
 #define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8)
 #define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac)
 #define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0)
+#define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
 #define GUC_SG_INTR_MASK			XE_REG(0x1900e8)
 #define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec)
 #define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4)
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index b19e3f676a10..6602cd17c975 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -276,16 +276,27 @@ static void gsc_work(struct work_struct *work)
 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
+	u32 actions;
 	int ret;
 
+	spin_lock_irq(&gsc->lock);
+	actions = gsc->work_actions;
+	gsc->work_actions = 0;
+	spin_unlock_irq(&gsc->lock);
+
 	xe_device_mem_access_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
 
-	ret = gsc_upload_and_init(gsc);
-	if (ret && ret != -EEXIST)
-		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
-	else
-		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_RUNNING);
+	if (actions & GSC_ACTION_FW_LOAD) {
+		ret = gsc_upload_and_init(gsc);
+		if (ret && ret != -EEXIST)
+			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
+		else
+			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_RUNNING);
+	}
+
+	if (actions & GSC_ACTION_SW_PROXY)
+		xe_gsc_proxy_request_handler(gsc);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
 	xe_device_mem_access_put(xe);
@@ -299,6 +310,7 @@ int xe_gsc_init(struct xe_gsc *gsc)
 
 	gsc->fw.type = XE_UC_FW_TYPE_GSC;
 	INIT_WORK(&gsc->work, gsc_work);
+	spin_lock_init(&gsc->lock);
 
 	/* The GSC uC is only available on the media GT */
 	if (tile->media_gt && (gt != tile->media_gt)) {
@@ -422,6 +434,10 @@ void xe_gsc_load_start(struct xe_gsc *gsc)
 		return;
 	}
 
+	spin_lock_irq(&gsc->lock);
+	gsc->work_actions |= GSC_ACTION_FW_LOAD;
+	spin_unlock_irq(&gsc->lock);
+
 	queue_work(gsc->wq, &gsc->work);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 86353c5a81cd..309ef80e3b95 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -21,6 +21,7 @@
 #include "xe_gt_printk.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 
 /*
  * GSC proxy:
@@ -74,6 +75,30 @@ static bool gsc_proxy_init_done(struct xe_gsc *gsc)
 	       HECI1_FWSTS1_PROXY_STATE_NORMAL;
 }
 
+static void __gsc_proxy_irq_rmw(struct xe_gsc *gsc, u32 clr, u32 set)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+
+	/* make sure we never accidentally write the RST bit */
+	clr |= HECI_H_CSR_RST;
+
+	xe_mmio_rmw32(gt, HECI_H_CSR(MTL_GSC_HECI2_BASE), clr, set);
+}
+
+static void gsc_proxy_irq_clear(struct xe_gsc *gsc)
+{
+	/* The status bit is cleared by writing to it */
+	__gsc_proxy_irq_rmw(gsc, 0, HECI_H_CSR_IS);
+}
+
+static void gsc_proxy_irq_toggle(struct xe_gsc *gsc, bool enabled)
+{
+	u32 set = enabled ? HECI_H_CSR_IE : 0;
+	u32 clr = enabled ? 0 : HECI_H_CSR_IE;
+
+	__gsc_proxy_irq_rmw(gsc, clr, set);
+}
+
 static int proxy_send_to_csme(struct xe_gsc *gsc, u32 size)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
@@ -264,7 +289,7 @@ static int proxy_query(struct xe_gsc *gsc)
 	return ret < 0 ? ret : 0;
 }
 
-static int gsc_proxy_request_handler(struct xe_gsc *gsc)
+int xe_gsc_proxy_request_handler(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	int slept;
@@ -286,12 +311,36 @@ static int gsc_proxy_request_handler(struct xe_gsc *gsc)
 		xe_gt_err(gt, "GSC proxy component not bound!\n");
 		err = -EIO;
 	} else {
+		/*
+		 * clear the pending interrupt and allow new proxy requests to
+		 * be generated while we handle the current one
+		 */
+		gsc_proxy_irq_clear(gsc);
 		err = proxy_query(gsc);
 	}
 	mutex_unlock(&gsc->proxy.mutex);
 	return err;
 }
 
+void xe_gsc_proxy_irq_handler(struct xe_gsc *gsc, u32 iir)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+
+	if (unlikely(!iir))
+		return;
+
+	if (!gsc->proxy.component) {
+		xe_gt_err(gt, "GSC proxy irq received without the component being bound!\n");
+		return;
+	}
+
+	spin_lock(&gsc->lock);
+	gsc->work_actions |= GSC_ACTION_SW_PROXY;
+	spin_unlock(&gsc->lock);
+
+	queue_work(gsc->wq, &gsc->work);
+}
+
 static int xe_gsc_proxy_component_bind(struct device *xe_kdev,
 				       struct device *mei_kdev, void *data)
 {
@@ -434,11 +483,28 @@ void xe_gsc_proxy_remove(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
+	int err = 0;
 
-	if (gsc->proxy.component_added) {
-		component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
-		gsc->proxy.component_added = false;
-	}
+	if (!gsc->proxy.component_added)
+		return;
+
+	/* disable HECI2 IRQs */
+	xe_pm_runtime_get(xe);
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	if (err)
+		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
+
+	/* try do disable irq even if forcewake failed */
+	gsc_proxy_irq_toggle(gsc, false);
+
+	if (!err)
+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+	xe_pm_runtime_put(xe);
+
+	xe_gsc_wait_for_worker_completion(gsc);
+
+	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
+	gsc->proxy.component_added = false;
 }
 
 /**
@@ -451,11 +517,14 @@ int xe_gsc_proxy_start(struct xe_gsc *gsc)
 {
 	int err;
 
+	/* enable the proxy interrupt in the GSC shim layer */
+	gsc_proxy_irq_toggle(gsc, true);
+
 	/*
 	 * The handling of the first proxy request must be manually triggered to
 	 * notify the GSC that we're ready to support the proxy flow.
 	 */
-	err = gsc_proxy_request_handler(gsc);
+	err = xe_gsc_proxy_request_handler(gsc);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.h b/drivers/gpu/drm/xe/xe_gsc_proxy.h
index 5dc6321efbaf..908f9441f093 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.h
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.h
@@ -14,4 +14,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc);
 void xe_gsc_proxy_remove(struct xe_gsc *gsc);
 int xe_gsc_proxy_start(struct xe_gsc *gsc);
 
+int xe_gsc_proxy_request_handler(struct xe_gsc *gsc);
+void xe_gsc_proxy_irq_handler(struct xe_gsc *gsc, u32 iir);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
index 805f26be4e9b..83c87096f476 100644
--- a/drivers/gpu/drm/xe/xe_gsc_types.h
+++ b/drivers/gpu/drm/xe/xe_gsc_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/iosys-map.h>
 #include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
@@ -39,6 +40,14 @@ struct xe_gsc {
 	/** @work: delayed load and proxy handling work */
 	struct work_struct work;
 
+	/** @lock: protects access to the work_actions mask */
+	spinlock_t lock;
+
+	/** @work_actions: mask of actions to be performed in the work */
+	u32 work_actions;
+#define GSC_ACTION_FW_LOAD BIT(0)
+#define GSC_ACTION_SW_PROXY BIT(1)
+
 	struct {
 		/** @component: struct for communication with mei component */
 		struct i915_gsc_proxy_component *component;
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 907c8ff0fa21..2fd8cc26fc9f 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -14,6 +14,7 @@
 #include "xe_device.h"
 #include "xe_display.h"
 #include "xe_drv.h"
+#include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
@@ -131,6 +132,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	u32 ccs_mask, bcs_mask;
 	u32 irqs, dmask, smask;
 	u32 gsc_mask = 0;
+	u32 heci_mask = 0;
 
 	if (xe_device_uc_enabled(xe)) {
 		irqs = GT_RENDER_USER_INTERRUPT |
@@ -180,14 +182,23 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK, ~dmask);
 		xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK, ~dmask);
 
-		if (xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER))
+		/*
+		 * the heci2 interrupt is enabled via the same register as the
+		 * GSCCS interrupts, but it has its own mask register.
+		 */
+		if (xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER)) {
 			gsc_mask = irqs;
-		else if (HAS_HECI_GSCFI(xe))
+			heci_mask = GSC_IRQ_INTF(1);
+		} else if (HAS_HECI_GSCFI(xe)) {
 			gsc_mask = GSC_IRQ_INTF(1);
+		}
+
 		if (gsc_mask) {
-			xe_mmio_write32(gt, GUNIT_GSC_INTR_ENABLE, gsc_mask);
+			xe_mmio_write32(gt, GUNIT_GSC_INTR_ENABLE, gsc_mask | heci_mask);
 			xe_mmio_write32(gt, GUNIT_GSC_INTR_MASK, ~gsc_mask);
 		}
+		if (heci_mask)
+			xe_mmio_write32(gt, HECI2_RSVD_INTR_MASK, ~(heci_mask << 16));
 	}
 }
 
@@ -234,6 +245,8 @@ gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
 		return xe_guc_irq_handler(&gt->uc.guc, iir);
 	if (instance == OTHER_MEDIA_GUC_INSTANCE && xe_gt_is_media_type(gt))
 		return xe_guc_irq_handler(&gt->uc.guc, iir);
+	if (instance == OTHER_GSC_HECI2_INSTANCE && xe_gt_is_media_type(gt))
+		return xe_gsc_proxy_irq_handler(&gt->uc.gsc, iir);
 
 	if (instance != OTHER_GUC_INSTANCE &&
 	    instance != OTHER_MEDIA_GUC_INSTANCE) {
@@ -251,15 +264,23 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
 	if (MEDIA_VER(xe) < 13)
 		return tile->primary_gt;
 
-	if (class == XE_ENGINE_CLASS_VIDEO_DECODE ||
-	    class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
+	switch (class) {
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
 		return tile->media_gt;
-
-	if (class == XE_ENGINE_CLASS_OTHER &&
-	    (instance == OTHER_MEDIA_GUC_INSTANCE || instance == OTHER_GSC_INSTANCE))
-		return tile->media_gt;
-
-	return tile->primary_gt;
+	case XE_ENGINE_CLASS_OTHER:
+		switch (instance) {
+		case OTHER_MEDIA_GUC_INSTANCE:
+		case OTHER_GSC_INSTANCE:
+		case OTHER_GSC_HECI2_INSTANCE:
+			return tile->media_gt;
+		default:
+			break;
+		};
+		fallthrough;
+	default:
+		return tile->primary_gt;
+	}
 }
 
 static void gt_irq_handler(struct xe_tile *tile,
@@ -486,6 +507,7 @@ static void gt_irq_reset(struct xe_tile *tile)
 	    HAS_HECI_GSCFI(tile_to_xe(tile))) {
 		xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, 0);
 		xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~0);
+		xe_mmio_write32(mmio, HECI2_RSVD_INTR_MASK, ~0);
 	}
 
 	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
-- 
2.43.0

