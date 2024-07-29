Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674B7C52CDA
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 23:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA5610E43D;
	Mon, 29 Jul 2024 23:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwHlIggQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FB710E430
 for <Intel-Xe@lists.freedesktop.org>; Mon, 29 Jul 2024 23:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722295075; x=1753831075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TJohen+pPl2WKSkvAtZCAGKqXUkDpYmLNTtUvIBkU0s=;
 b=lwHlIggQyJKIuteVmZpIvpfgfgnH2jyUzKIn5O0ajGFKV7ItKB4ZvJwr
 wxr0V9X/phDTGrN5PUCt6HjulKEkfnyFFcZpAueQUcgUv6mfYnhvF+ehb
 AKN5u6NyOgv8NcfsL/oWlVWmKUJB1iZA9BAi7DyaqvjEZko0xKYuX2pz3
 8pfS57GIPbvpHozAk81M1ECxwUozCKkQndcE3pr3+JEZ+jNqPvvsvK+Bh
 19MDWO1qp5fGg1DMeggkVaG97aQSXlXi6FLOFOKsbtFK4XDdqDfEHI51X
 KPKFcxt99mFSofH7YPDVuYNzrFhckoZJWA5mIZUwqhL2Z+/LiM1V1wkh/ w==;
X-CSE-ConnectionGUID: CPbeKvtIRn2ENHJ/olHf5w==
X-CSE-MsgGUID: 7nCp7e2ESw2Dk6zLlO7bUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19966926"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="19966926"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 16:17:54 -0700
X-CSE-ConnectionGUID: Yi6JvnnTRnibyIFOOausTQ==
X-CSE-MsgGUID: AbpkxqMnSJGcnxmuVIZ36Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="54103551"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa009.jf.intel.com with ESMTP; 29 Jul 2024 16:17:54 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 7/8] drm/xe/guc: Dump entire CTB on errors
Date: Mon, 29 Jul 2024 16:17:51 -0700
Message-ID: <20240729231753.3101070-8-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The dump of the CT buffers was only showing the unprocessed data which
is not generally useful for saying why a hang occurred - because it
was probably caused by the commands that were just processed. So save
and dump the entire buffer but in a more compact dump format. Also
zero fill it on allocation to avoid confusion over uninitialised data
in the dump.

v2: Add kerneldoc - review feedback from Michal W.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c  |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 101 ++++++++++++---------------
 drivers/gpu/drm/xe/xe_guc_ct.h       |   9 +--
 drivers/gpu/drm/xe/xe_guc_ct_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_log.c      |  12 +++-
 drivers/gpu/drm/xe/xe_guc_log.h      |   2 +
 6 files changed, 63 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d8d8ca2c19d3..08a0bb3ee7c0 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -117,7 +117,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	xe_device_snapshot_print(xe, &p);
 
 	drm_printf(&p, "\n**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+	xe_guc_ct_snapshot_print(xe, coredump->snapshot.ct, &p, false);
 	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
 
 	drm_printf(&p, "\n**** Job ****\n");
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 21c88a0cdfd3..ad393d22db28 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -436,6 +436,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
 
+	xe_map_memset(xe, &ct->bo->vmap, 0, 0, ct->bo->size);
 	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
 	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
 
@@ -1563,49 +1564,43 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
-static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
-				     struct guc_ctb_snapshot *snapshot,
-				     bool atomic)
+static void guc_ctb_snapshot_alloc(struct guc_ctb *ctb, struct guc_ctb_snapshot *snapshot,
+				   bool atomic)
 {
-	u32 head, tail;
+	snapshot->size = ctb->info.size * sizeof(u32);
+	snapshot->cmds = kmalloc(snapshot->size, atomic ? GFP_ATOMIC : GFP_KERNEL);
+}
 
-	xe_map_memcpy_from(xe, &snapshot->desc, &ctb->desc, 0,
-			   sizeof(struct guc_ct_buffer_desc));
-	memcpy(&snapshot->info, &ctb->info, sizeof(struct guc_ctb_info));
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic)
+{
+	struct xe_guc_ct_snapshot *snapshot;
 
-	snapshot->cmds = kmalloc_array(ctb->info.size, sizeof(u32),
-				       atomic ? GFP_ATOMIC : GFP_KERNEL);
+	snapshot = kzalloc(sizeof(*snapshot), atomic ? GFP_ATOMIC : GFP_KERNEL);
+	if (!snapshot)
+		return NULL;
 
-	if (!snapshot->cmds) {
-		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CT info will be available.\n");
-		return;
-	}
+	/* Don't give up if the CTB storage fails to allocate */
+	guc_ctb_snapshot_alloc(&ct->ctbs.h2g, &snapshot->h2g, atomic);
+	guc_ctb_snapshot_alloc(&ct->ctbs.g2h, &snapshot->g2h, atomic);
 
-	head = snapshot->desc.head;
-	tail = snapshot->desc.tail;
-
-	if (head != tail) {
-		struct iosys_map map =
-			IOSYS_MAP_INIT_OFFSET(&ctb->cmds, head * sizeof(u32));
-
-		while (head != tail) {
-			snapshot->cmds[head] = xe_map_rd(xe, &map, 0, u32);
-			++head;
-			if (head == ctb->info.size) {
-				head = 0;
-				map = ctb->cmds;
-			} else {
-				iosys_map_incr(&map, sizeof(u32));
-			}
-		}
-	}
+	return snapshot;
 }
 
-static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
-				   struct drm_printer *p)
+static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
+				     struct guc_ctb_snapshot *snapshot)
 {
-	u32 head, tail;
+	xe_map_memcpy_from(xe, &snapshot->desc, &ctb->desc, 0,
+			   sizeof(struct guc_ct_buffer_desc));
+	memcpy(&snapshot->info, &ctb->info, sizeof(struct guc_ctb_info));
+
+	if (snapshot->cmds)
+		xe_map_memcpy_from(xe, snapshot->cmds, &ctb->cmds, 0, snapshot->size);
+}
 
+static void guc_ctb_snapshot_print(struct xe_device *xe,
+				   struct guc_ctb_snapshot *snapshot,
+				   struct drm_printer *p, bool atomic)
+{
 	drm_printf(p, "\tsize: %d\n", snapshot->info.size);
 	drm_printf(p, "\tresv_space: %d\n", snapshot->info.resv_space);
 	drm_printf(p, "\thead: %d\n", snapshot->info.head);
@@ -1616,19 +1611,13 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
 	drm_printf(p, "\ttail (memory): %d\n", snapshot->desc.tail);
 	drm_printf(p, "\tstatus (memory): 0x%x\n", snapshot->desc.status);
 
-	if (!snapshot->cmds)
+	if (!snapshot->cmds) {
+		drm_printf(p, "CT buffer allocation missing!\n");
 		return;
-
-	head = snapshot->desc.head;
-	tail = snapshot->desc.tail;
-
-	while (head != tail) {
-		drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
-			   snapshot->cmds[head]);
-		++head;
-		if (head == snapshot->info.size)
-			head = 0;
 	}
+
+	drm_printf(p, "CT buffer:\n");
+	xe_hexdump_blob(xe, snapshot->cmds, snapshot->size, p, atomic);
 }
 
 static void guc_ctb_snapshot_free(struct guc_ctb_snapshot *snapshot)
@@ -1654,9 +1643,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc_ct_snapshot *snapshot;
 
-	snapshot = kzalloc(sizeof(*snapshot),
-			   atomic ? GFP_ATOMIC : GFP_KERNEL);
-
+	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic);
 	if (!snapshot) {
 		drm_err(&xe->drm, "Skipping CTB snapshot entirely.\n");
 		return NULL;
@@ -1665,10 +1652,8 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 	if (xe_guc_ct_enabled(ct) || ct->state == XE_GUC_CT_STATE_STOPPED) {
 		snapshot->ct_enabled = true;
 		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
-		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
-					 &snapshot->h2g, atomic);
-		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
-					 &snapshot->g2h, atomic);
+		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g, &snapshot->h2g);
+		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h, &snapshot->g2h);
 	}
 
 	return snapshot;
@@ -1681,18 +1666,18 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
  *
  * This function prints out a given GuC CT snapshot object.
  */
-void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
-			      struct drm_printer *p)
+void xe_guc_ct_snapshot_print(struct xe_device *xe, struct xe_guc_ct_snapshot *snapshot,
+			      struct drm_printer *p, bool atomic)
 {
 	if (!snapshot)
 		return;
 
 	if (snapshot->ct_enabled) {
 		drm_puts(p, "H2G CTB (all sizes in DW):\n");
-		guc_ctb_snapshot_print(&snapshot->h2g, p);
+		guc_ctb_snapshot_print(xe, &snapshot->h2g, p, atomic);
 
 		drm_puts(p, "G2H CTB (all sizes in DW):\n");
-		guc_ctb_snapshot_print(&snapshot->g2h, p);
+		guc_ctb_snapshot_print(xe, &snapshot->g2h, p, atomic);
 
 		drm_printf(p, "\tg2h outstanding: %d\n",
 			   snapshot->g2h_outstanding);
@@ -1732,7 +1717,7 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic)
 	struct xe_guc_ct_snapshot *snapshot;
 
 	snapshot = xe_guc_ct_snapshot_capture(ct, atomic);
-	xe_guc_ct_snapshot_print(snapshot, p);
+	xe_guc_ct_snapshot_print(ct_to_xe(ct), snapshot, p, atomic);
 	xe_guc_ct_snapshot_free(snapshot);
 }
 
@@ -1753,7 +1738,7 @@ static void ct_dead_print(struct xe_dead_ct *dead)
 	drm_printf(&lp, "CTB is dead - reason=0x%X\n", dead->reason);
 
 	xe_guc_log_snapshot_print(ct_to_xe(ct), dead->snapshot_log, &lp, false);
-	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
+	xe_guc_ct_snapshot_print(ct_to_xe(ct), dead->snapshot_ct, &lp, false);
 
 	drm_printf(&lp, "Done.\n");
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 190202fce2d0..4336865fcedc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -9,6 +9,7 @@
 #include "xe_guc_ct_types.h"
 
 struct drm_printer;
+struct xe_device;
 
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
@@ -16,10 +17,10 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
-struct xe_guc_ct_snapshot *
-xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
-void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
-			      struct drm_printer *p);
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic);
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
+void xe_guc_ct_snapshot_print(struct xe_device *xe, struct xe_guc_ct_snapshot *snapshot,
+			      struct drm_printer *p, bool atomic);
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 9eb2f1a6dcfe..e2a984f0df81 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -52,6 +52,8 @@ struct guc_ctb {
 struct guc_ctb_snapshot {
 	/** @desc: snapshot of the CTB descriptor */
 	struct guc_ct_buffer_desc desc;
+	/** @cmds: size of the snapshot of the CTB commands */
+	size_t size;
 	/** @cmds: snapshot of the CTB commands */
 	u32 *cmds;
 	/** @info: snapshot of the CTB info */
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 2f0a7607941d..82f862b9ad25 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -65,8 +65,16 @@ static size_t guc_log_size(void)
 #define WORDS_PER_READ		(WORDS_PER_DUMP * DUMPS_PER_LINE * LINES_PER_READ)
 #define ASCII_LENGTH_PER_WORD	9	/* ' 00000000' */
 
-static void xe_hexdump_blob(struct xe_device *xe, const void *blob, size_t size,
-			    struct drm_printer *p, bool atomic)
+/**
+ * xe_hexdump_blob - dump a BLOB to some useful location
+ * @xe: an Xe device structure
+ * @blob: the Binary Large OBject to dump out
+ * @size: the size in bytes of the BLOB
+ * @p: the printer object to output to
+ * @atomic: is the call inside an atomic section of some kind?
+ */
+void xe_hexdump_blob(struct xe_device *xe, const void *blob, size_t size,
+		     struct drm_printer *p, bool atomic)
 {
 	char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * ASCII_LENGTH_PER_WORD + 1];
 	int i, j, k;
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 959a33af23f5..111be8bbaade 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -44,6 +44,8 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 void xe_guc_log_snapshot_print(struct xe_device *xe, struct xe_guc_log_snapshot *snapshot,
 			       struct drm_printer *p, bool atomic);
 void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
+void xe_hexdump_blob(struct xe_device *xe, const void *blob, size_t size,
+		     struct drm_printer *p, bool atomic);
 
 static inline u32
 xe_guc_log_get_level(struct xe_guc_log *log)
-- 
2.43.2

