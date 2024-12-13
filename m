Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E127E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 07:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E5B10EF19;
	Fri, 13 Dec 2024 07:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="csEgmBFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB4710EF11
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 07:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734073449; x=1765609449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eHhDdDd12yEvD7hwnbAVTILjsretxQrgbQsXl4xRnAg=;
 b=csEgmBFIn/E3foxNOmpS9v+HMbMOOl7urFL3WizqfE3OM9gkzZsbOmLB
 UJf/H6Nc0WqD4pUoLcAtRcV9cX4I1Yv20BQn3GhVXE2Gh7q3B7HiV0O3d
 tLEaXxKVoiUDUzIlN550mrDurHgsEtgg/Lv2+mfXhTfE8w/tTB7czAELL
 BjSPwnlQY0NKgCqwyS72snS1CeLntLpwVqStfHSiVPU2wHMn3SYh6tYEU
 4+6gw7QbIc5hn6RnnH0LdotRDshSglMGcSC/UHAp2FvfOxF/r64+gQuqK
 77jYCMPGEIKs1Ftoxb4sSIPTYLIPzyYaoIJKe3WcGNb5i1m7JUKMA4VfR Q==;
X-CSE-ConnectionGUID: zdIM5CG4QpCZmzp3cTkpjg==
X-CSE-MsgGUID: VGiQFSOBRsi5+0Iz3n1KvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45128844"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="45128844"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 23:04:09 -0800
X-CSE-ConnectionGUID: LNZ8aoYIRU2uLg4CF5s2cA==
X-CSE-MsgGUID: 3KxfygsMQOKV4zNCIXFReA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119712550"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.160.81])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 23:04:08 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, Dani Liberman <dliberman@habana.ai>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [CI 4/4] drm/xe/uapi: Support requesting unique MSI-X for exec queue
Date: Fri, 13 Dec 2024 09:03:53 +0200
Message-Id: <20241213070353.1511-5-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213070353.1511-1-ilia.levi@intel.com>
References: <20241213070353.1511-1-ilia.levi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Co-developed-by: Ilia Levi <ilia.levi@intel.com>
Signed-off-by: Ilia Levi <ilia.levi@intel.com>
Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 57 +++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_irq.c              | 18 ++++++++
 drivers/gpu/drm/xe/xe_irq.h              |  1 +
 include/uapi/drm/xe_drm.h                |  8 +++-
 5 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 9c94be571900..35ef75f9919f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -12,6 +12,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_device.h"
+#include "xe_drv.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
@@ -35,8 +36,46 @@ enum xe_exec_queue_sched_prop {
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 extensions, int ext_number);
 
+static int xe_exec_queue_msix_init(struct xe_device *xe, struct xe_exec_queue *q, bool unique_msix)
+{
+	u16 msix;
+	int err;
+
+	if (!xe_device_has_msix(xe))
+		return 0;
+
+	if (!unique_msix) {
+		q->msix_vec = XE_IRQ_DEFAULT_MSIX;
+		return 0;
+	}
+
+	err = xe_irq_msix_request_irq(xe, xe_irq_msix_hwe_handler, q,
+				      DRIVER_NAME "-exec-queue", true, &msix);
+	if (err < 0) {
+		drm_dbg(&xe->drm, "Can't allocate unique MSI-X to exec queue (%d)\n", err);
+		return err;
+	}
+
+	q->msix_vec = msix;
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
+	if (q->msix_vec && q->msix_vec != XE_IRQ_DEFAULT_MSIX)
+		xe_irq_msix_free_irq(xe, q->msix_vec);
+}
+
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
+	xe_exec_queue_msix_fini(q);
+
 	if (q->vm)
 		xe_vm_put(q->vm);
 
@@ -69,7 +108,12 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->gt = gt;
 	q->class = hwe->class;
 	q->width = width;
-	q->msix_vec = XE_IRQ_DEFAULT_MSIX;
+	err = xe_exec_queue_msix_init(xe, q, flags & EXEC_QUEUE_FLAG_UNIQUE_MSIX);
+	if (err) {
+		kfree(q);
+		return ERR_PTR(err);
+	}
+
 	q->logical_mask = logical_mask;
 	q->fence_irq = &gt->fence_irq[hwe->class];
 	q->ring_ops = gt->ring_ops[hwe->class];
@@ -547,13 +591,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
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
@@ -569,6 +613,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
 		return -EINVAL;
 
+	if (args->flags & DRM_XE_EXEC_QUEUE_CREATE_FLAG_UNIQUE_INTERRUPT_HINT)
+		flags |= EXEC_QUEUE_FLAG_UNIQUE_MSIX;
+
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		if (XE_IOCTL_DBG(xe, args->width != 1) ||
 		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
@@ -577,8 +624,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 		for_each_tile(tile, xe, id) {
 			struct xe_exec_queue *new;
-			u32 flags = EXEC_QUEUE_FLAG_VM;
 
+			flags |= EXEC_QUEUE_FLAG_VM;
 			if (id)
 				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
 
@@ -625,7 +672,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 
 		q = xe_exec_queue_create(xe, vm, logical_mask,
-					 args->width, hwe, 0,
+					 args->width, hwe, flags,
 					 args->extensions);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index eec8f9935a58..6e419b572000 100644
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
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 32f5a67a917b..52829771c89b 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -14,6 +14,7 @@
 #include "regs/xe_irq_regs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
+#include "xe_exec_queue_types.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
@@ -880,6 +881,23 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+/*
+ * In MSI-X mode command streamers raise an interrupt only as a result of
+ * MI_USER_INTERRUPT and MI_FLUSH_DW_NOTIFY commands.
+ */
+irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg)
+{
+	struct xe_exec_queue *q = arg;
+	struct xe_tile *tile = gt_to_tile(q->hwe->gt);
+
+	if (!atomic_read(&tile->xe->irq.enabled))
+		return IRQ_NONE;
+
+	xe_memirq_hwe_handler(&tile->memirq, q->hwe);
+
+	return IRQ_HANDLED;
+}
+
 static int xe_irq_msix_alloc_vector(struct xe_device *xe, void *irq_buf,
 				    bool dynamic_msix, u16 *msix)
 {
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index a28bd577ba52..47058e2d9d36 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -19,6 +19,7 @@ int xe_irq_install(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
 void xe_irq_resume(struct xe_device *xe);
 void xe_irq_enable_hwe(struct xe_gt *gt);
+irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg);
 int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
 			    const char *name, bool dynamic_msix, u16 *msix);
 void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0383b52cbd86..d5e824355a5b 100644
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

