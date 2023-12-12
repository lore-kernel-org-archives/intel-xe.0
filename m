Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAE9C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 01:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D53010E53C;
	Tue, 12 Dec 2023 01:06:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDB910E53A
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 01:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702343158; x=1733879158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mWdo1ocfe0Y4JFqrfcRHJz2VX6PpS6n9COQKL0Qs50k=;
 b=hWxKwqj2kNMg6HI/UdSAp9nORVtnSiTO/sFzpmWiDmcZa+X3MW+D7yEu
 YgUS5YVauOGj7CpDcYSsSkU5kFdh+ggcR9E7L2ri6/9EDKHg93Yc7AyLF
 hnKFmTCrQN5gJBsyBf6kX+4in2xHVwbbMXBT5eWZIIMcmqfkBigHsXSoV
 I6pJz/YrQavAVqiAKYQv9S7kG9t8Z4Y45AbRkS4IUJsguVoVlqx4/3jzP
 YNrJy+PNO0FI2IUhdJkO713i4an0jbAJYFMl7FcYSaZQ9fun/uQZXOczp
 ZKLh+prVsdsam7VhdR8BFG0/Gl//HqmT7/VP6ILweFdzR0dZdWYvK1B9d A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="459047681"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="459047681"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 17:05:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="917078942"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="917078942"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 17:05:58 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/gsc: add support for GSC proxy interrupt
Date: Mon, 11 Dec 2023 17:05:59 -0800
Message-ID: <20231212010600.3479465-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212010600.3479465-1-daniele.ceraolospurio@intel.com>
References: <20231212010600.3479465-1-daniele.ceraolospurio@intel.com>
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
index 5f5a72e9d0d8..9f5f2150034a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -450,6 +450,7 @@
 #define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
 #define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
 #define   OTHER_GUC_INSTANCE			0
+#define   OTHER_HECI2_INSTANCE			3
 #define   OTHER_GSC_INSTANCE			6
 
 #define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
@@ -462,6 +463,7 @@
 #define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8)
 #define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac)
 #define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0)
+#define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
 #define GUC_SG_INTR_MASK			XE_REG(0x1900e8)
 #define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec)
 #define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4)
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 38e9dd3129bd..630ccf3604c4 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -275,16 +275,27 @@ static void gsc_work(struct work_struct *work)
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
@@ -298,6 +309,7 @@ int xe_gsc_init(struct xe_gsc *gsc)
 
 	gsc->fw.type = XE_UC_FW_TYPE_GSC;
 	INIT_WORK(&gsc->work, gsc_work);
+	spin_lock_init(&gsc->lock);
 
 	/* The GSC uC is only available on the media GT */
 	if (tile->media_gt && (gt != tile->media_gt)) {
@@ -421,6 +433,10 @@ void xe_gsc_load_start(struct xe_gsc *gsc)
 		return;
 	}
 
+	spin_lock_irq(&gsc->lock);
+	gsc->work_actions |= GSC_ACTION_FW_LOAD;
+	spin_unlock_irq(&gsc->lock);
+
 	queue_work(gsc->wq, &gsc->work);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 0983b4903cc7..0c8212fe4845 100644
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
@@ -260,7 +285,7 @@ static int proxy_query(struct xe_gsc *gsc)
 	return ret < 0 ? ret : 0;
 }
 
-static int gsc_proxy_request_handler(struct xe_gsc *gsc)
+int xe_gsc_proxy_request_handler(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	int slept;
@@ -282,12 +307,36 @@ static int gsc_proxy_request_handler(struct xe_gsc *gsc)
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
@@ -420,22 +469,42 @@ void xe_gsc_proxy_remove(struct xe_gsc *gsc)
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
 
 int xe_gsc_proxy_start(struct xe_gsc *gsc)
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
index 645166adae1f..310f25809798 100644
--- a/drivers/gpu/drm/xe/xe_gsc_types.h
+++ b/drivers/gpu/drm/xe/xe_gsc_types.h
@@ -9,6 +9,7 @@
 #include <linux/workqueue.h>
 #include <linux/iosys-map.h>
 #include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
 #include "xe_uc_fw_types.h"
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
index d1f5ba4bb745..de7cc6e611a2 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -15,6 +15,7 @@
 #include "xe_display.h"
 #include "xe_drv.h"
 #include "xe_gt.h"
+#include "xe_gsc_proxy.h"
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
 #include "xe_mmio.h"
@@ -129,6 +130,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	u32 ccs_mask, bcs_mask;
 	u32 irqs, dmask, smask;
 	u32 gsc_mask = 0;
+	u32 heci_mask = 0;
 
 	if (xe_device_uc_enabled(xe)) {
 		irqs = GT_RENDER_USER_INTERRUPT |
@@ -178,14 +180,23 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
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
 
@@ -232,6 +243,8 @@ gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
 		return xe_guc_irq_handler(&gt->uc.guc, iir);
 	if (instance == OTHER_MEDIA_GUC_INSTANCE && xe_gt_is_media_type(gt))
 		return xe_guc_irq_handler(&gt->uc.guc, iir);
+	if (instance == OTHER_HECI2_INSTANCE && xe_gt_is_media_type(gt))
+		return xe_gsc_proxy_irq_handler(&gt->uc.gsc, iir);
 
 	if (instance != OTHER_GUC_INSTANCE &&
 	    instance != OTHER_MEDIA_GUC_INSTANCE) {
@@ -249,15 +262,23 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
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
+		case OTHER_HECI2_INSTANCE:
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
@@ -484,6 +505,7 @@ static void gt_irq_reset(struct xe_tile *tile)
 	    HAS_HECI_GSCFI(tile_to_xe(tile))) {
 		xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, 0);
 		xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~0);
+		xe_mmio_write32(mmio, HECI2_RSVD_INTR_MASK, ~0);
 	}
 
 	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
-- 
2.43.0

