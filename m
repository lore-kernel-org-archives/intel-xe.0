Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD15C27C5F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 01:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC3B10E270;
	Tue, 11 Jun 2024 01:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpTT/yhW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD5810E164
 for <Intel-Xe@lists.freedesktop.org>; Tue, 11 Jun 2024 01:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718068831; x=1749604831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4mY04Idr83sSy0NfAOj6jih+gsdwIsi5rn6Ky7GUb70=;
 b=XpTT/yhWWMrT8MrBlHiCTo6QsB4fT62NSFNmgBcraDDDj2o2p/JnUUrZ
 6uKHLTMrfiO42UGMEbbffg/36TAuAkgEBtFs2lU+ukWI0Q+GeNl22YfWx
 m//gWEgi9RDzutNAPAYpOJ05U4ALu9uM2UwKPUwbkiETsgmj6szuthrnP
 72LAZ+DBwhnEqsseoaD5xf9wFPwMdjAiLZNKGPUtHJeZU5WI28tkXla3s
 LtPk5QWTY9fi1T4lmJzPTtDUqfkQtlqdPEttCPotnbixxzLK560faAE9r
 0j++girHDItc3IXCl7AEYX70HeR1I/l81b1MMGiKFz8bhFC6HEbjVakjJ g==;
X-CSE-ConnectionGUID: +ToR+oJGS+SPETC2LeENtg==
X-CSE-MsgGUID: 2GofuYbTSOWcA3tDxryx4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18612250"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="18612250"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 18:20:30 -0700
X-CSE-ConnectionGUID: l5fn6/AWTZm4DIC9R4Tmeg==
X-CSE-MsgGUID: cbZP2e+AQ/WnqfoluemtVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43684365"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2024 18:20:29 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 7/7] drm/xe/guc: Dump entire CTB on errors
Date: Mon, 10 Jun 2024 18:20:28 -0700
Message-ID: <20240611012028.2305024-8-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
References: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c  |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 101 ++++++++++++---------------
 drivers/gpu/drm/xe/xe_guc_ct.h       |   9 +--
 drivers/gpu/drm/xe/xe_guc_ct_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_log.c      |   4 +-
 drivers/gpu/drm/xe/xe_guc_log.h      |   2 +
 6 files changed, 55 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d7f2d19a77c1..eb078265b751 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -114,7 +114,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	xe_device_snapshot_print(xe, &p);
 
 	drm_printf(&p, "\n**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+	xe_guc_ct_snapshot_print(xe, coredump->snapshot.ct, &p, false);
 	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
 
 	drm_printf(&p, "\n**** Job ****\n");
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 744402f9e774..47916d773525 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -418,6 +418,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
 
+	xe_map_memset(xe, &ct->bo->vmap, 0, 0, ct->bo->size);
 	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
 	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
 
@@ -1530,49 +1531,43 @@ static void g2h_worker_func(struct work_struct *w)
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
@@ -1583,19 +1578,13 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
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
@@ -1621,9 +1610,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc_ct_snapshot *snapshot;
 
-	snapshot = kzalloc(sizeof(*snapshot),
-			   atomic ? GFP_ATOMIC : GFP_KERNEL);
-
+	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic);
 	if (!snapshot) {
 		drm_err(&xe->drm, "Skipping CTB snapshot entirely.\n");
 		return NULL;
@@ -1632,10 +1619,8 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
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
@@ -1648,18 +1633,18 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
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
@@ -1699,7 +1684,7 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic)
 	struct xe_guc_ct_snapshot *snapshot;
 
 	snapshot = xe_guc_ct_snapshot_capture(ct, atomic);
-	xe_guc_ct_snapshot_print(snapshot, p);
+	xe_guc_ct_snapshot_print(ct_to_xe(ct), snapshot, p, atomic);
 	xe_guc_ct_snapshot_free(snapshot);
 }
 
@@ -1720,7 +1705,7 @@ static void ct_dead_print(struct xe_dead_ct *dead)
 	drm_printf(&lp, "CTB is dead - reason=0x%X\n", dead->reason);
 
 	xe_guc_log_snapshot_print(ct_to_xe(ct), dead->snapshot_log, &lp, false);
-	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
+	xe_guc_ct_snapshot_print(ct_to_xe(ct), dead->snapshot_ct, &lp, false);
 
 	drm_printf(&lp, "Done.\n");
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 105bb8e99a8d..782e821dae1c 100644
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
index db1d45b7be2b..549112595920 100644
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
index 9714ee6f99e0..11453de08cc6 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -64,8 +64,8 @@ static size_t guc_log_size(void)
 #define LINES_PER_READ		4
 #define WORDS_PER_READ		(WORDS_PER_DUMP * DUMPS_PER_LINE * LINES_PER_READ)
 
-static void xe_hexdump_blob(struct xe_device *xe, const void *blob, size_t size,
-			    struct drm_printer *p, bool atomic)
+void xe_hexdump_blob(struct xe_device *xe, const void *blob, size_t size,
+		     struct drm_printer *p, bool atomic)
 {
 	char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
 	const u32 *blob32 = (const u32 *)blob;
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 29154ab507ff..f204b9c85e65 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -45,6 +45,8 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 void xe_guc_log_snapshot_print(struct xe_device *xe, struct xe_guc_log_snapshot *snapshot,
 			       struct drm_printer *p, bool atomic);
 void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
+void xe_hexdump_blob(struct xe_device *xe, const void *blob, size_t size,
+		     struct drm_printer *p, bool atomic);
 
 static inline u32
 xe_guc_log_get_level(struct xe_guc_log *log)
-- 
2.43.2

