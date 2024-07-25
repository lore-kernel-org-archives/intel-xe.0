Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACCDC3DA7E
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 10:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D96910E74F;
	Thu, 25 Jul 2024 10:23:04 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25E110E1DF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 10:22:51 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 46PAMDbe2182929; Thu, 25 Jul 2024 13:22:34 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, dliberman@habana.ai,
 niranjana.vishwanathapura@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v4 09/11] drm/xe/exec: adding msix infra to exec queue
Date: Thu, 25 Jul 2024 13:22:11 +0300
Message-ID: <20240725102213.2182896-10-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240725102213.2182896-1-ilia.levi@intel.com>
References: <20240725102213.2182896-1-ilia.levi@intel.com>
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

On MSIX platform each exec queue will allocate MSIX.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 39 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 69867a7b7c77..c519db7a7a6e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -22,6 +22,7 @@
 #include "xe_ring_ops_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
+#include "xe_irq.h"
 
 enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
@@ -33,8 +34,40 @@ enum xe_exec_queue_sched_prop {
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 extensions, int ext_number);
 
+static int xe_exec_queue_msix_init(struct xe_device *xe, struct xe_exec_queue *q)
+{
+	u16 msix;
+	int ret = 0;
+
+	if (!xe_device_has_msix(xe))
+		return 0;
+
+	ret = xe_irq_request_irq(xe, xe_irq_msix_hwe_handler, q->hwe, q->hwe->name, true, &msix);
+	if (ret < 0) {
+		drm_dbg(&xe->drm, "Can't allocate unique MSIX to exec queue (%d)\n", ret);
+		return ret;
+	}
+
+	q->msix_number = msix;
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
+	if (q->msix_number)
+		xe_irq_free_irq(xe, q->msix_number);
+}
+
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
+	xe_exec_queue_msix_fini(q);
+
 	if (q->vm)
 		xe_vm_put(q->vm);
 
@@ -85,6 +118,12 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	else
 		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
 
+	err = xe_exec_queue_msix_init(xe, q);
+	if (err) {
+		kfree(q);
+		return ERR_PTR(err);
+	}
+
 	if (vm)
 		q->vm = xe_vm_get(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1408b02eea53..fcfc3878464e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -63,6 +63,8 @@ struct xe_exec_queue {
 	char name[MAX_FENCE_NAME_LEN];
 	/** @width: width (number BB submitted per exec) of this exec queue */
 	u16 width;
+	/** @msix_number: msix number */
+	u16 msix_number;
 	/** @fence_irq: fence IRQ used to signal job completion */
 	struct xe_hw_fence_irq *fence_irq;
 
-- 
2.43.2

