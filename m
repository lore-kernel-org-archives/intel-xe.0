Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3952DC30653
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 12:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF69B10E035;
	Thu, 27 Jun 2024 12:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="IyAiN56W";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B9D10E297
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 12:41:14 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1719492071; bh=zoFXPjbx/zOJ5DabBXFm9ssh2rhJKt/rRSRBZO3ixHQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IyAiN56WwfGCoW5E9GoRUEEgs/teQIepoPTfohr6Wa+WCcSiRwOs71sKDQJDXV4IE
 WSIgZ0J9I4o68qWrQRIInf52eWdjzH790LwyPEOV7hLgKB+n+/M3fYEfpHX13OPO3j
 Ki+tFZO/tfwEgAk+lW9i2j/iwKeXXCFqao1ZPYW1kfxgJIVY5pgYz9P2E8/TAxVr/6
 OybFBRAcsup03A9xaXQMbtkJPcdUHDhmcQvMYLkxO/qSWd+W27+qrjxQPoOZ4HaR+T
 SatfOs+EpkfiGhonw1yphmpxX4xkOaW5T3fSl5M+Yee96io/uO4s/FRhGf+REHWmX0
 /67DS1lX55xNQ==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 45RCexkx2923636
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 15:40:59 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 45RCex2o2923635; 
 Thu, 27 Jun 2024 15:40:59 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: dliberman@habana.ai, illevi@habana.ai, rodrigo.vivi@intel.com
Subject: [PATCH v2 4/8] drm/xe/exec: adding msix infra to exec queue
Date: Thu, 27 Jun 2024 15:40:39 +0300
Message-Id: <20240627124043.2923586-5-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627124043.2923586-1-dliberman@habana.ai>
References: <20240627124043.2923586-1-dliberman@habana.ai>
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

On MSIX platform each exec queue will allocate MSIX.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 39 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_irq.c              | 11 +++++--
 3 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0ba37835849b..e40c5380e292 100644
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
+	u32 msix;
+	int ret = 0;
+
+	if (!xe->irq.msix_enabled)
+		return 0;
+
+	ret = xe_request_irq(xe, xe_irq_hwe_handler, q->hwe, q->hwe->name, true, &msix);
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
+	if (!xe->irq.msix_enabled)
+		return;
+
+	if (q->msix_number)
+		xe_free_irq(xe, q->msix_number);
+}
+
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
+	xe_exec_queue_msix_fini(q);
+
 	if (q->vm)
 		xe_vm_put(q->vm);
 	kfree(q);
@@ -81,6 +114,12 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
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
index 201588ec33c3..7da157b0e676 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -56,6 +56,8 @@ struct xe_exec_queue {
 	 * @logical_mask: logical mask of where job submitted to exec queue can run
 	 */
 	u32 logical_mask;
+	/** @msix_number: msix number */
+	u32 msix_number;
 	/** @name: name of this exec queue */
 	char name[MAX_FENCE_NAME_LEN];
 	/** @width: width (number BB submitted per exec) of this exec queue */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 28173e946e77..cf4f523b7fae 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -895,11 +895,16 @@ void xe_free_irq(struct xe_device *xe, u32 msix)
 	void *irq_buf;
 	int irq;
 
+	/* When removing the driver this function can be called twice for each msix that was
+	 * allocated for exec queue. First from irq_uninstall() and then from exec queue free.
+	 * Hence, it is possible that the xarray was already destroyed or the member was removed.
+	 */
+	if (xa_empty(&xe->irq.msix_indexes))
+		return;
+
 	irq_buf = xa_load(&xe->irq.msix_indexes, msix);
-	if (!irq_buf) {
-		drm_err(&xe->drm, "MSIX %u can't be released since it wasn't allocated\n", msix);
+	if (!irq_buf)
 		return;
-	}
 
 	irq = pci_irq_vector(pdev, msix);
 	if (irq < 0) {
-- 
2.34.1

