Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3008C54E51
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 15:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654DC10E073;
	Mon, 26 Feb 2024 15:59:27 +0000 (UTC)
Received: from mblankhorst.nl (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690D110E453
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 15:59:25 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 3/3] drm/xe: Implement capture of HWSP and HWCTX
Date: Mon, 26 Feb 2024 16:59:13 +0100
Message-ID: <20240226155913.77158-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226155913.77158-1-dev@lankhorst.se>
References: <20240226155913.77158-1-dev@lankhorst.se>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Dump the HWCTX and HWSP as part of LRC capture.

Changes since v1:
- Use same layout for HWSP and HWCTX as VM bo's, to simplify dumping.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c |  4 ++
 drivers/gpu/drm/xe/xe_lrc.c         | 70 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h         |  1 +
 3 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 7002e3b698f2..62d016e3ca66 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -64,8 +64,12 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
 static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 {
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
+	int i;
 
 	xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+	for (i = 0; i < ARRAY_SIZE(ss->lrc); i++)
+		xe_lrc_snapshot_capture_delayed(ss->lrc[i]);
+
 	if (ss->vm)
 		xe_vm_snapshot_capture_delayed(ss->vm);
 	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8233d4512fc6..25440e227198 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -5,6 +5,8 @@
 
 #include "xe_lrc.h"
 
+#include <linux/ascii85.h>
+
 #include "instructions/xe_mi_commands.h"
 #include "instructions/xe_gfxpipe_commands.h"
 #include "regs/xe_engine_regs.h"
@@ -32,6 +34,10 @@
 #define ENGINE_INSTANCE_SHIFT			48
 
 struct xe_lrc_snapshot {
+	struct xe_bo *lrc_bo;
+	void *lrc_snapshot;
+	unsigned long lrc_size, lrc_offset;
+
 	u32 context_desc;
 	u32 head;
 	struct {
@@ -1325,11 +1331,47 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->tail.memory = xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
 	snapshot->start_seqno = xe_lrc_start_seqno(lrc);
 	snapshot->seqno = xe_lrc_seqno(lrc);
+	snapshot->lrc_bo = xe_bo_get(lrc->bo);
+	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
+	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
+	snapshot->lrc_snapshot = NULL;
 	return snapshot;
 }
 
+void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
+{
+	struct xe_bo *bo;
+	struct iosys_map src;
+
+	if (!snapshot)
+		return;
+
+	bo = snapshot->lrc_bo;
+	snapshot->lrc_bo = NULL;
+
+	snapshot->lrc_snapshot = kvmalloc(snapshot->lrc_size, GFP_KERNEL);
+	if (!snapshot->lrc_snapshot)
+		goto put_bo;
+
+	dma_resv_lock(bo->ttm.base.resv, NULL);
+	if (!ttm_bo_vmap(&bo->ttm, &src)) {
+		xe_map_memcpy_from(xe_bo_device(bo),
+				   snapshot->lrc_snapshot, &src, snapshot->lrc_offset,
+				   snapshot->lrc_size);
+		ttm_bo_vunmap(&bo->ttm, &src);
+	} else {
+		kvfree(snapshot->lrc_snapshot);
+		snapshot->lrc_snapshot = NULL;
+	}
+	dma_resv_unlock(bo->ttm.base.resv);
+put_bo:
+	xe_bo_put(bo);
+}
+
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p)
 {
+	unsigned long i;
+
 	if (!snapshot)
 		return;
 
@@ -1339,9 +1381,37 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 		   snapshot->tail.internal, snapshot->tail.memory);
 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
+
+	if (!snapshot->lrc_snapshot)
+		return;
+
+	drm_printf(p, "\t[HWSP].length: 0x%x\n", LRC_PPHWSP_SIZE);
+	drm_puts(p, "\t[HWSP].data: ");
+	for (i = 0; i < LRC_PPHWSP_SIZE; i += sizeof(u32)) {
+		u32 *val = snapshot->lrc_snapshot + i;
+		char dumped[ASCII85_BUFSZ];
+
+		drm_puts(p, ascii85_encode(*val, dumped));
+	}
+
+	drm_printf(p, "\n\t[HWCTX].length: 0x%lx\n", snapshot->lrc_size - LRC_PPHWSP_SIZE);
+	drm_puts(p, "\t[HWCTX].data: ");
+	for (; i < snapshot->lrc_size; i += sizeof(u32)) {
+		u32 *val = snapshot->lrc_snapshot + i;
+		char dumped[ASCII85_BUFSZ];
+
+		drm_puts(p, ascii85_encode(*val, dumped));
+	}
+	drm_puts(p, "\n");
 }
 
 void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
 {
+	if (!snapshot)
+		return;
+
+	kvfree(snapshot->lrc_snapshot);
+	if (snapshot->lrc_bo)
+		xe_bo_put(snapshot->lrc_bo);
 	kfree(snapshot);
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index d6dd4045d6d7..d32fa31faa2c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -56,6 +56,7 @@ void xe_lrc_dump_default(struct drm_printer *p,
 void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb);
 
 struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
+void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
 void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
 
-- 
2.43.0

