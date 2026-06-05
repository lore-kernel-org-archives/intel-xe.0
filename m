Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F319CCD6E7B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 23:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B087611ABCA;
	Fri,  5 Jun 2026 23:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdlFLGUn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02D711ABBE
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 23:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780701680; x=1812237680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ymty2ayuay7hq2P3Dd+0hnAxSikBrzXJZeRkImNMfGk=;
 b=UdlFLGUnsSF61FmSj3Vqxnud9fGsVZEvuuJHzrBF58bQMiKdGvfi/bzD
 DmgkmZdVVW00qhtd4wsz63LrgOkLot1hGaZm8aNn9wrS3ADihQDoRoito
 5QhZ5gsU0xmMyB/bvdrBFX9rBAHxM4o9xUIrJN4SZb5xukgb0R9UcGi5G
 k6q+K/g8R+dAav3YpUvbol6FNKSRrsVK8lCtw3AqUqy2Vr8fTpnMdpG+t
 jcLxQYsTUG7J2xawMFF1+WJHHZkFDwQnM5+kTyvJOyJfoo6kMsBux1xwt
 qye40PINd8beBo/dKcgI+9hgdmUmBN4FB7O0AARiRSis2+QwN1rnUuCcZ w==;
X-CSE-ConnectionGUID: +62dMEpkQyWIFU1U98hwlw==
X-CSE-MsgGUID: ob7ciZOAS66I0s175Qig1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81449679"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81449679"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:19 -0700
X-CSE-ConnectionGUID: oJMxBshTS3iO4Wcsm6Vm6A==
X-CSE-MsgGUID: rUDznIfZT6CUJlxH2Ic0WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="245018293"
Received: from dut4385arlh.fm.intel.com ([10.105.8.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:19 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 04/12] drm/xe: Assign dedicated MSI-X vectors to exec queues
Date: Fri,  5 Jun 2026 23:21:11 +0000
Message-ID: <20260605232108.674580-18-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605232108.674580-14-stuart.summers@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
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

Assign a dedicated MSI-X interrupt vector to each user exec queue at
creation time when the platform supports MSI-X. If allocation fails
for any other reason, the queue silently falls back to the shared
default MSI-X vector.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_device_types.h |  5 ++++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 34 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_irq.c          | 27 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_irq.h          |  2 ++
 4 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..ff15de34fd17 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -255,6 +255,11 @@ struct xe_device {
 			u16 nvec;
 			/** @irq.msix.indexes: used to allocate MSI-X indexes */
 			struct xarray indexes;
+			/**
+			 * @irq.msix.vec_count: total number of MSI-X vectors
+			 * currently allocated (static + dynamic)
+			 */
+			atomic_t vec_count;
 		} msix;
 	} irq;
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b5ca3ce578a..6c101b4f6488 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -16,6 +16,7 @@
 #include "xe_bo.h"
 #include "xe_dep_scheduler.h"
 #include "xe_device.h"
+#include "xe_drv.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_vf.h"
@@ -138,6 +139,34 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
 	kfree(group);
 }
 
+static void exec_queue_msix_init(struct xe_device *xe, struct xe_exec_queue *q)
+{
+	int err;
+	u16 msix;
+
+	if (!xe_device_has_msix(xe) || q->flags & EXEC_QUEUE_FLAG_KERNEL)
+		goto use_default;
+
+	err = xe_irq_msix_request_irq(xe, xe_irq_msix_hwe_handler, q,
+				      DRIVER_NAME "-exec-queue", true, &msix);
+	if (err)
+		goto use_default;
+
+	q->msix_vec = msix;
+	return;
+
+use_default:
+	q->msix_vec = XE_IRQ_DEFAULT_MSIX;
+}
+
+static void exec_queue_msix_fini(struct xe_exec_queue *q)
+{
+	struct xe_device *xe = gt_to_xe(q->gt);
+
+	if (q->msix_vec != XE_IRQ_DEFAULT_MSIX)
+		xe_irq_msix_free_irq(xe, q->msix_vec);
+}
+
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
 	int i;
@@ -152,6 +181,8 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 	if (xe_exec_queue_is_multi_queue(q))
 		xe_exec_queue_group_cleanup(q);
 
+	exec_queue_msix_fini(q);
+
 	if (q->vm) {
 		xe_vm_remove_exec_queue(q->vm, q);
 		xe_vm_put(q->vm);
@@ -220,7 +251,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->gt = gt;
 	q->class = hwe->class;
 	q->width = width;
-	q->msix_vec = XE_IRQ_DEFAULT_MSIX;
 	q->logical_mask = logical_mask;
 	q->fence_irq = &gt->fence_irq[hwe->class];
 	q->ring_ops = gt->ring_ops[hwe->class];
@@ -436,6 +466,8 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	if (IS_ERR(q))
 		return q;
 
+	exec_queue_msix_init(xe, q);
+
 	err = __xe_exec_queue_init(q, flags);
 	if (err)
 		goto err_post_alloc;
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 3429bb305293..c84d2283dd6a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -13,6 +13,7 @@
 #include "regs/xe_irq_regs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
+#include "xe_exec_queue.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
@@ -930,6 +931,19 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
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
@@ -976,18 +990,26 @@ int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *i
 {
 	int ret;
 
+	if (!atomic_add_unless(&xe->irq.msix.vec_count, 1,
+			       xe->irq.msix.nvec))
+		return -ENOSPC;
+
 	ret = xe_irq_msix_alloc_vector(xe, irq_buf, dynamic_msix, msix);
 	if (ret)
-		return ret;
+		goto err_dec;
 
 	ret = xe_irq_msix_request_irq_internal(xe, handler, irq_buf, name, *msix);
 	if (ret) {
 		drm_err(&xe->drm, "Failed to request IRQ for MSI-X %u\n", *msix);
 		xe_irq_msix_release_vector(xe, *msix);
-		return ret;
+		goto err_dec;
 	}
 
 	return 0;
+
+err_dec:
+	atomic_dec(&xe->irq.msix.vec_count);
+	return ret;
 }
 
 void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
@@ -1008,6 +1030,7 @@ void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
 
 	free_irq(irq, irq_buf);
 	xe_irq_msix_release_vector(xe, msix);
+	atomic_dec(&xe->irq.msix.vec_count);
 }
 
 int xe_irq_msix_request_irqs(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index 5f48249dae8a..6c76004d6442 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -18,6 +18,7 @@
 #define XE_MSIX_MAX_VECS 1024
 
 struct xe_device;
+struct xe_exec_queue;
 struct xe_tile;
 struct xe_gt;
 
@@ -29,5 +30,6 @@ void xe_irq_enable_hwe(struct xe_gt *gt);
 int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
 			    const char *name, bool dynamic_msix, u16 *msix);
 void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix);
+irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg);
 
 #endif
-- 
2.43.0

