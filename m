Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA90C54E4A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 13:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FFF10E905;
	Tue, 27 Feb 2024 13:12:55 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D417310E90A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 13:12:50 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v3 1/3] `drm/xe: Move lrc snapshot capturing to xe_lrc.c
Date: Tue, 27 Feb 2024 14:12:45 +0100
Message-ID: <20240227131248.92910-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

This allows the dumping of HWSP and HW Context without exporting more
functions.

Changes since v1:
- GFP_KERNEL -> GFP_NOWAIT. (Souza)

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c       | 33 ++++++-----------
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 13 +------
 drivers/gpu/drm/xe/xe_lrc.c              | 45 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h              |  4 +++
 drivers/gpu/drm/xe/xe_lrc_types.h        |  2 ++
 5 files changed, 63 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ff77bc8da1b2..7348689ec5ae 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1814,21 +1814,14 @@ xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
 	snapshot->sched_props.preempt_timeout_us =
 		q->sched_props.preempt_timeout_us;
 
-	snapshot->lrc = kmalloc_array(q->width, sizeof(struct lrc_snapshot),
+	snapshot->lrc = kmalloc_array(q->width, sizeof(struct xe_lrc_snapshot *),
 				      GFP_ATOMIC);
 
 	if (snapshot->lrc) {
 		for (i = 0; i < q->width; ++i) {
 			struct xe_lrc *lrc = q->lrc + i;
 
-			snapshot->lrc[i].context_desc =
-				lower_32_bits(xe_lrc_ggtt_addr(lrc));
-			snapshot->lrc[i].head = xe_lrc_ring_head(lrc);
-			snapshot->lrc[i].tail.internal = lrc->ring.tail;
-			snapshot->lrc[i].tail.memory =
-				xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
-			snapshot->lrc[i].start_seqno = xe_lrc_start_seqno(lrc);
-			snapshot->lrc[i].seqno = xe_lrc_seqno(lrc);
+			snapshot->lrc[i] = xe_lrc_snapshot_capture(lrc);
 		}
 	}
 
@@ -1894,18 +1887,9 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 	drm_printf(p, "\tPreempt timeout: %u (us)\n",
 		   snapshot->sched_props.preempt_timeout_us);
 
-	for (i = 0; snapshot->lrc && i < snapshot->width; ++i) {
-		drm_printf(p, "\tHW Context Desc: 0x%08x\n",
-			   snapshot->lrc[i].context_desc);
-		drm_printf(p, "\tLRC Head: (memory) %u\n",
-			   snapshot->lrc[i].head);
-		drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
-			   snapshot->lrc[i].tail.internal,
-			   snapshot->lrc[i].tail.memory);
-		drm_printf(p, "\tStart seqno: (memory) %d\n",
-			   snapshot->lrc[i].start_seqno);
-		drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->lrc[i].seqno);
-	}
+	for (i = 0; snapshot->lrc && i < snapshot->width; ++i)
+		xe_lrc_snapshot_print(snapshot->lrc[i], p);
+
 	drm_printf(p, "\tSchedule State: 0x%x\n", snapshot->schedule_state);
 	drm_printf(p, "\tFlags: 0x%lx\n", snapshot->exec_queue_flags);
 
@@ -1930,10 +1914,15 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
  */
 void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot)
 {
+	int i;
 	if (!snapshot)
 		return;
 
-	kfree(snapshot->lrc);
+	if (snapshot->lrc) {
+		for (i = 0; i < snapshot->width; i++)
+			xe_lrc_snapshot_free(snapshot->lrc[i]);
+		kfree(snapshot->lrc);
+	}
 	kfree(snapshot->pending_list);
 	kfree(snapshot);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index 72fc0f42b0a5..dc7456c34583 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -61,17 +61,6 @@ struct guc_submit_parallel_scratch {
 	u32 wq[WQ_SIZE / sizeof(u32)];
 };
 
-struct lrc_snapshot {
-	u32 context_desc;
-	u32 head;
-	struct {
-		u32 internal;
-		u32 memory;
-	} tail;
-	u32 start_seqno;
-	u32 seqno;
-};
-
 struct pending_list_snapshot {
 	u32 seqno;
 	bool fence;
@@ -109,7 +98,7 @@ struct xe_guc_submit_exec_queue_snapshot {
 	} sched_props;
 
 	/** @lrc: LRC Snapshot */
-	struct lrc_snapshot *lrc;
+	struct xe_lrc_snapshot **lrc;
 
 	/** @schedule_state: Schedule State at the moment of Crash */
 	u32 schedule_state;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 7ad853b0788a..8233d4512fc6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -31,6 +31,17 @@
 #define ENGINE_CLASS_SHIFT			61
 #define ENGINE_INSTANCE_SHIFT			48
 
+struct xe_lrc_snapshot {
+	u32 context_desc;
+	u32 head;
+	struct {
+		u32 internal;
+		u32 memory;
+	} tail;
+	u32 start_seqno;
+	u32 seqno;
+};
+
 static struct xe_device *
 lrc_to_xe(struct xe_lrc *lrc)
 {
@@ -1300,3 +1311,37 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
 		bb->len += num_dw;
 	}
 }
+
+struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
+{
+	struct xe_lrc_snapshot *snapshot = kmalloc(sizeof(*snapshot), GFP_NOWAIT);
+
+	if (!snapshot)
+		return NULL;
+
+	snapshot->context_desc = lower_32_bits(xe_lrc_ggtt_addr(lrc));
+	snapshot->head = xe_lrc_ring_head(lrc);
+	snapshot->tail.internal = lrc->ring.tail;
+	snapshot->tail.memory = xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
+	snapshot->start_seqno = xe_lrc_start_seqno(lrc);
+	snapshot->seqno = xe_lrc_seqno(lrc);
+	return snapshot;
+}
+
+void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p)
+{
+	if (!snapshot)
+		return;
+
+	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
+	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
+	drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
+		   snapshot->tail.internal, snapshot->tail.memory);
+	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
+	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
+}
+
+void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
+{
+	kfree(snapshot);
+}
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 28b1d3f404d4..d6dd4045d6d7 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -55,4 +55,8 @@ void xe_lrc_dump_default(struct drm_printer *p,
 
 void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb);
 
+struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
+void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
+void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 24f20ed66fd1..b716df0dfb4e 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -43,4 +43,6 @@ struct xe_lrc {
 	struct xe_hw_fence_ctx fence_ctx;
 };
 
+struct xe_lrc_snapshot;
+
 #endif
-- 
2.43.0

