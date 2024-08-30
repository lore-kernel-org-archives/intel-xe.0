Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA31DCA0EE5
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4D210E80B;
	Fri, 30 Aug 2024 06:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUMLVRBp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780B110E804
 for <Intel-Xe@lists.freedesktop.org>; Fri, 30 Aug 2024 06:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724998992; x=1756534992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xsr4hD14q6PBJt0STEIumae8dFwGRezP3OKUMwu2VhY=;
 b=kUMLVRBpC2lT6RhvMdjKra3umDOtklKqKDQaf1OjMDb+BHv0hMwQwWZX
 NdM2SPJH/nl+BLfq4lbz5Ftoo+x6d/fEopvmc/Dj8Zo1Enf11wzXJZRbc
 diYc6OGL6sQ0yZ097wBr/sqfc7B9wRZwvyf9StnKye955LJFB2KaAcnYf
 GBxxQPS7wFDHo+w12T1eXWhlkH7UxpoyhKSc+HymE1x4O0/4PzCKrOphk
 FJsYC7RqpYGrJKkeD1GKKw0U5CIShYqKBeypa+k1xnGCvzra6IR6rZkkw
 oTSC8d9hkUPr1ORHO5wNJ+6Y3fAw3QjnkJgAdJ8mHfKaIP03XqTWsHzBD Q==;
X-CSE-ConnectionGUID: 7msNSKdCRiCO1iqJATQ3zQ==
X-CSE-MsgGUID: uSRBLainQpCwaukWcM5oZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34245224"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="34245224"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:23:12 -0700
X-CSE-ConnectionGUID: WN+cC/w4SGeoSVFXO1jEIw==
X-CSE-MsgGUID: 72Ue4MttQdGUJgD72/TAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="87040580"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 29 Aug 2024 23:23:11 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 7/9] drm/xe/guc: Dump entire CTB on errors
Date: Thu, 29 Aug 2024 23:23:08 -0700
Message-ID: <20240830062310.3450387-8-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
References: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
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
v3: Fix kerneldoc.
v4: Use ascii85 instead of hexdump (review feedback from Matthew B).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 85 ++++++++++++----------------
 drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +--
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  2 +
 3 files changed, 41 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f51fc0d9e648..e41f2e4fbe6b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -17,6 +17,7 @@
 #include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_klvs_abi.h"
 #include "xe_bo.h"
+#include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_pagefault.h"
@@ -444,6 +445,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
 
+	xe_map_memset(xe, &ct->bo->vmap, 0, 0, ct->bo->size);
 	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
 	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
 
@@ -1571,49 +1573,42 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
-static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
-				     struct guc_ctb_snapshot *snapshot,
-				     bool atomic)
+static void guc_ctb_snapshot_alloc(struct guc_ctb *ctb, struct guc_ctb_snapshot *snapshot,
+				   bool atomic)
+{
+	snapshot->size = ctb->info.size * sizeof(u32);
+	snapshot->cmds = kmalloc(snapshot->size, atomic ? GFP_ATOMIC : GFP_KERNEL);
+}
+
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic)
 {
-	u32 head, tail;
+	struct xe_guc_ct_snapshot *snapshot;
+
+	snapshot = kzalloc(sizeof(*snapshot), atomic ? GFP_ATOMIC : GFP_KERNEL);
+	if (!snapshot)
+		return NULL;
+
+	/* Don't give up if the CTB storage fails to allocate */
+	guc_ctb_snapshot_alloc(&ct->ctbs.h2g, &snapshot->h2g, atomic);
+	guc_ctb_snapshot_alloc(&ct->ctbs.g2h, &snapshot->g2h, atomic);
 
+	return snapshot;
+}
+
+static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
+				     struct guc_ctb_snapshot *snapshot)
+{
 	xe_map_memcpy_from(xe, &snapshot->desc, &ctb->desc, 0,
 			   sizeof(struct guc_ct_buffer_desc));
 	memcpy(&snapshot->info, &ctb->info, sizeof(struct guc_ctb_info));
 
-	snapshot->cmds = kmalloc_array(ctb->info.size, sizeof(u32),
-				       atomic ? GFP_ATOMIC : GFP_KERNEL);
-
-	if (!snapshot->cmds) {
-		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CT info will be available.\n");
-		return;
-	}
-
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
+	if (snapshot->cmds)
+		xe_map_memcpy_from(xe, snapshot->cmds, &ctb->cmds, 0, snapshot->size);
 }
 
 static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
 				   struct drm_printer *p)
 {
-	u32 head, tail;
-
 	drm_printf(p, "\tsize: %d\n", snapshot->info.size);
 	drm_printf(p, "\tresv_space: %d\n", snapshot->info.resv_space);
 	drm_printf(p, "\thead: %d\n", snapshot->info.head);
@@ -1624,19 +1619,13 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
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
+	xe_print_blob_ascii85(p, snapshot->cmds, 0, snapshot->size);
 }
 
 static void guc_ctb_snapshot_free(struct guc_ctb_snapshot *snapshot)
@@ -1662,9 +1651,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc_ct_snapshot *snapshot;
 
-	snapshot = kzalloc(sizeof(*snapshot),
-			   atomic ? GFP_ATOMIC : GFP_KERNEL);
-
+	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic);
 	if (!snapshot) {
 		drm_err(&xe->drm, "Skipping CTB snapshot entirely.\n");
 		return NULL;
@@ -1673,10 +1660,8 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
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
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 293041bed7ed..338f0b75d29f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -9,6 +9,7 @@
 #include "xe_guc_ct_types.h"
 
 struct drm_printer;
+struct xe_device;
 
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
@@ -16,10 +17,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
-struct xe_guc_ct_snapshot *
-xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
-void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
-			      struct drm_printer *p);
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic);
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
+void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 85e127ec91d7..c2a2a2831e82 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -52,6 +52,8 @@ struct guc_ctb {
 struct guc_ctb_snapshot {
 	/** @desc: snapshot of the CTB descriptor */
 	struct guc_ct_buffer_desc desc;
+	/** @size: size of the snapshot of the CTB commands */
+	size_t size;
 	/** @cmds: snapshot of the CTB commands */
 	u32 *cmds;
 	/** @info: snapshot of the CTB info */
-- 
2.46.0

