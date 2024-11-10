Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC57D12D4F
	for <intel-xe@archiver.kernel.org>; Sun, 10 Nov 2024 20:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD08D10E3D7;
	Sun, 10 Nov 2024 20:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+uO5Bzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCF610E3D9
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Nov 2024 20:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731271173; x=1762807173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p523TC25Yq9T4fWnDbPz5uk4RcknBom14g4VUYlZWSM=;
 b=B+uO5BzzinXqK7GFOdPmG1V18IeCplGY4KSUrwq2PTKc4D5iynCx1Wy/
 CC+Ga/YYDaAjnhWyAwyzSyQ0XzN6YO8WdBphc3ZOhjvQtzWcT2n2t0YXZ
 qJgbwoPlSZOeF73aRnKpgU+kft7jvRWFtsaPS3Eb441qFnf0LpGtz/01H
 iGfwN+P5K6yHSx7WM2i0T/sTDU08bwX7Pt62ZoUYoOKyh6O+iyAJjE8fj
 70f/PLXqixIBoBs9piFKpRIvWtjjX7S3Ofe6U51inUZtF6C8uc1n39Ski
 lrqQwv4OGN8WtZM6gvjesTLgCMgw2772kOchSLNIXx0YXbPJwA2KTycGQ Q==;
X-CSE-ConnectionGUID: O9fdpNtKShqQjSfT9JGljQ==
X-CSE-MsgGUID: N9AAzIK7RrGGTHZCJppN5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="42479041"
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; d="scan'208";a="42479041"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 12:39:33 -0800
X-CSE-ConnectionGUID: 0xUWfiBQRrCfcaog0af5Fw==
X-CSE-MsgGUID: ymvFRI3lRu6ZZTdieIqhzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; d="scan'208";a="124131320"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.200.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 12:39:31 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, niranjana.vishwanathapura@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com,
 Dani Liberman <dliberman@habana.ai>
Subject: [PATCH v4 3/3] drm/xe/uapi: Support requesting unique MSI-X for exec
 queue
Date: Sun, 10 Nov 2024 22:39:15 +0200
Message-Id: <20241110203915.729-4-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241110203915.729-1-ilia.levi@intel.com>
References: <20241110203915.729-1-ilia.levi@intel.com>
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

From: Dani Liberman <dliberman@habana.ai>

Unique MSI-X per exec queue will improve the performance of the
IRQ handler. In case no MSI-X is available, the uAPI will return
-EBUSY error and the user would be able to execute the uAPI again
without the flag (fallback to default MSI-X).

Co-authored-by: Ilia Levi <ilia.levi@intel.com>
Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 58 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_irq_msix.c         | 26 +++++++++++
 drivers/gpu/drm/xe/xe_irq_msix.h         |  1 +
 include/uapi/drm/xe_drm.h                |  8 +++-
 5 files changed, 89 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fe3a10825245..f4c9ee87e256 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -12,10 +12,12 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_device.h"
+#include "xe_drv.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hw_fence.h"
+#include "xe_irq_msix.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_migrate.h"
@@ -34,8 +36,46 @@ enum xe_exec_queue_sched_prop {
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 extensions, int ext_number);
 
+static int xe_exec_queue_msix_init(struct xe_device *xe, struct xe_exec_queue *q, bool unique_msix)
+{
+	u16 msix;
+	int ret = 0;
+
+	if (!xe_device_has_msix(xe))
+		return 0;
+
+	if (!unique_msix) {
+		q->msix = xe->irq.msix.default_msix;
+		return 0;
+	}
+
+	ret = xe_irq_msix_request_irq(xe, xe_irq_msix_hwe_handler, q,
+				      DRIVER_NAME "-exec-queue", true, &msix);
+	if (ret < 0) {
+		drm_dbg(&xe->drm, "Can't allocate unique MSI-X to exec queue (%d)\n", ret);
+		return ret;
+	}
+
+	q->msix = msix;
+
+	return 0;
+}
+
+static void xe_exec_queue_msix_fini(struct xe_exec_queue *q)
+{
+	struct xe_device *xe = gt_to_xe(q->gt);
+
+	if (!xe_device_has_msix(xe))
+		return;
+
+	if (q->msix && q->msix != xe->irq.msix.default_msix)
+		xe_irq_msix_free_irq(xe, q->msix);
+}
+
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
+	xe_exec_queue_msix_fini(q);
+
 	if (q->vm)
 		xe_vm_put(q->vm);
 
@@ -68,7 +108,12 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->gt = gt;
 	q->class = hwe->class;
 	q->width = width;
-	q->msix = xe->irq.msix.default_msix;
+	err = xe_exec_queue_msix_init(xe, q, flags & EXEC_QUEUE_FLAG_UNIQUE_MSIX);
+	if (err) {
+		kfree(q);
+		return ERR_PTR(err);
+	}
+
 	q->logical_mask = logical_mask;
 	q->fence_irq = &gt->fence_irq[hwe->class];
 	q->ring_ops = gt->ring_ops[hwe->class];
@@ -542,13 +587,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_gt *gt;
 	struct xe_tile *tile;
 	struct xe_exec_queue *q = NULL;
+	u32 flags = 0;
 	u32 logical_mask;
 	u32 id;
 	u32 len;
 	int err;
 
-	if (XE_IOCTL_DBG(xe, args->flags) ||
-	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	len = args->width * args->num_placements;
@@ -564,6 +609,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
 		return -EINVAL;
 
+	if (args->flags & DRM_XE_EXEC_QUEUE_CREATE_FLAG_UNIQUE_INTERRUPT_HINT)
+		flags |= EXEC_QUEUE_FLAG_UNIQUE_MSIX;
+
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		if (XE_IOCTL_DBG(xe, args->width != 1) ||
 		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
@@ -572,8 +620,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 		for_each_tile(tile, xe, id) {
 			struct xe_exec_queue *new;
-			u32 flags = EXEC_QUEUE_FLAG_VM;
 
+			flags |= EXEC_QUEUE_FLAG_VM;
 			if (id)
 				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
 
@@ -620,7 +668,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 
 		q = xe_exec_queue_create(xe, vm, logical_mask,
-					 args->width, hwe, 0,
+					 args->width, hwe, flags,
 					 args->extensions);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 19fd66d59dd7..047a3fae849f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -85,6 +85,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
 /* kernel exec_queue only, set priority to highest level */
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
+/* queue with unique msix interrupt */
+#define EXEC_QUEUE_FLAG_UNIQUE_MSIX		BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.c b/drivers/gpu/drm/xe/xe_irq_msix.c
index f873bcfe5283..53d05aafb2a7 100644
--- a/drivers/gpu/drm/xe/xe_irq_msix.c
+++ b/drivers/gpu/drm/xe/xe_irq_msix.c
@@ -9,6 +9,7 @@
 
 #include "xe_device.h"
 #include "xe_drv.h"
+#include "xe_exec_queue_types.h"
 #include "xe_guc.h"
 #include "xe_memirq.h"
 
@@ -67,6 +68,23 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+/**
+ * xe_irq_msix_hwe_handler - MSI-X IRQ handler for hw engines
+ * @irq: the irq raised
+ * @arg: the exec queue that raised the interrupt
+ *
+ * In MSI-X mode command streamers raise an interrupt only as a result of
+ * MI_USER_INTERRUPT and MI_FLUSH_DW_NOTIFY commands.
+ */
+irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg)
+{
+	struct xe_exec_queue *q = arg;
+
+	xe_memirq_hwe_handler(&gt_to_tile(q->hwe->gt)->memirq, q->hwe);
+
+	return IRQ_HANDLED;
+}
+
 static int xe_irq_msix_alloc_vector(struct xe_device *xe, void *irq_buf,
 				    bool dynamic_msix, u16 *msix)
 {
@@ -133,6 +151,14 @@ void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
 	int irq;
 	void *irq_buf;
 
+	/*
+	 * When removing the driver this function can be called twice for each msix that was
+	 * allocated for exec queue. First from irq_uninstall() and then from exec queue free.
+	 * Hence, it is possible that the xarray was already destroyed or the entry was removed.
+	 */
+	if (xa_empty(&xe->irq.msix.indexes))
+		return;
+
 	irq_buf = xa_load(&xe->irq.msix.indexes, msix);
 	if (!irq_buf)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.h b/drivers/gpu/drm/xe/xe_irq_msix.h
index a9c8ce18172e..04619d991b10 100644
--- a/drivers/gpu/drm/xe/xe_irq_msix.h
+++ b/drivers/gpu/drm/xe/xe_irq_msix.h
@@ -17,5 +17,6 @@ void xe_irq_msix_synchronize_irq(struct xe_device *xe);
 int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
 			    const char *name, bool dynamic_msix, u16 *msix);
 void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix);
+irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg);
 
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4a8a4a63e99c..5f32553b14fb 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1123,7 +1123,13 @@ struct drm_xe_exec_queue_create {
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
 
-	/** @flags: MBZ */
+	/*
+	 * When creating exec queue in MSIX platforms, the user can request a unique MSIX interrupt
+	 * for the irq handler. If there is no available MSIX, -EBUSY will be returned.
+	 */
+#define	DRM_XE_EXEC_QUEUE_CREATE_FLAG_UNIQUE_INTERRUPT_HINT (0x1 << 0)
+
+	/** @flags: create queue flags */
 	__u32 flags;
 
 	/** @exec_queue_id: Returned exec queue ID */
-- 
2.43.2

