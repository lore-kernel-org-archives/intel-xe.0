Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E80D0BB4B
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 00:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFA110E24F;
	Thu, 24 Oct 2024 00:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMMdmbe/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DC110E24B
 for <Intel-Xe@lists.freedesktop.org>; Thu, 24 Oct 2024 00:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729729556; x=1761265556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IRSi9X6+r7+aia0SL1WAuf3CNCz+RimzBwTR9+qDcgs=;
 b=PMMdmbe/KDXC5+/SpCFi81G1HwJLZu2GdnRvqwopnopHysk4CAIBx9fg
 taw+9oWbJFpNZxZtIKEIA0kGhI7H0rHQTiurcVEgSXkUkMiG4r2YmNsFC
 Dp4C7zvBfyBCp/AaAA3OG5AUQJPqD4E/5o2KWitQiI/HKsM3bbNF5Re8b
 jj8pubHyELqkpSNGyT81JqHdbkNGc+YyPoKRRVjKTZ0vZkABTOwLaQl5F
 rvFL/xzjVTUMXynAnS8EZJeyPyVnPT7kfQzZ8A0DeT5Ei90SioXIABltz
 EMJwqmPKgG/moQkETwwZotSxlQdkhF8PV/L9sT/o+6yiOIc3o2WXiJJuQ Q==;
X-CSE-ConnectionGUID: wsbP6ozeRFy40men8Yro9A==
X-CSE-MsgGUID: UfBwCE7DTBqPY14Jz9pXdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33254617"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="33254617"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 17:25:55 -0700
X-CSE-ConnectionGUID: OMtwznhKQzquf+I/acx/MQ==
X-CSE-MsgGUID: km7V92MJSPShG+ufWidA6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="80844930"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa007.jf.intel.com with ESMTP; 23 Oct 2024 17:25:55 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 2/2] drm/xe/guc: Separate full CTB content from guc_info
 debugfs
Date: Wed, 23 Oct 2024 17:25:54 -0700
Message-ID: <20241024002554.1983101-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024002554.1983101-1-John.C.Harrison@Intel.com>
References: <20241024002554.1983101-1-John.C.Harrison@Intel.com>
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

The guc_info debugfs file is meant to be a quick view of the current
software state of the GuC interface. Including the full CTB contents
makes the file as a whole much less human readable and is not
partiular useful in the general case. So don't pollute the info dump
with the full buffers. Instead, move those into a separate debugfs
entry that can be read when that information is actually required.

Also, improve the human readability by adding a few extra blank lines
to delimt the sections.

v2: Hide the internal capture/print params from external callers that
don't need to know (review feedback from Matthew Brost).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
 drivers/gpu/drm/xe/xe_guc.c         |  5 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c      | 54 +++++++++++++++--------------
 drivers/gpu/drm/xe/xe_guc_ct.h      |  5 ++-
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 14 ++++++++
 5 files changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 8b0ea77661b2..d2679c5d976b 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -267,7 +267,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
-	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
+	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
 	ss->job = xe_sched_job_snapshot_capture(job);
 	ss->vm = xe_vm_snapshot_capture(q->vm);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b065bb9973e9..fcb540003e53 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1187,7 +1187,10 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
-	xe_guc_ct_print(&guc->ct, p);
+	drm_puts(p, "\n");
+	xe_guc_ct_print(&guc->ct, p, false);
+
+	drm_puts(p, "\n");
 	xe_guc_submit_print(guc, p);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c260d8840990..0ae0fc1f0084 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1607,7 +1607,8 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
-struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic)
+static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
+							bool want_ctb)
 {
 	struct xe_guc_ct_snapshot *snapshot;
 
@@ -1615,7 +1616,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool a
 	if (!snapshot)
 		return NULL;
 
-	if (ct->bo) {
+	if (ct->bo && want_ctb) {
 		snapshot->ctb_size = ct->bo->size;
 		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
 	}
@@ -1645,25 +1646,13 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
 	drm_printf(p, "\tstatus (memory): 0x%x\n", snapshot->desc.status);
 }
 
-/**
- * xe_guc_ct_snapshot_capture - Take a quick snapshot of the CT state.
- * @ct: GuC CT object.
- * @atomic: Boolean to indicate if this is called from atomic context like
- * reset or CTB handler or from some regular path like debugfs.
- *
- * This can be printed out in a later stage like during dev_coredump
- * analysis.
- *
- * Returns: a GuC CT snapshot object that must be freed by the caller
- * by using `xe_guc_ct_snapshot_free`.
- */
-struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
-						      bool atomic)
+static struct xe_guc_ct_snapshot *guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic,
+							  bool want_ctb)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc_ct_snapshot *snapshot;
 
-	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic);
+	snapshot = guc_ct_snapshot_alloc(ct, atomic, want_ctb);
 	if (!snapshot) {
 		xe_gt_err(ct_to_gt(ct), "Skipping CTB snapshot entirely.\n");
 		return NULL;
@@ -1682,6 +1671,21 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 	return snapshot;
 }
 
+/**
+ * xe_guc_ct_snapshot_capture - Take a quick snapshot of the CT state.
+ * @ct: GuC CT object.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis. This is safe to be called during atomic context.
+ *
+ * Returns: a GuC CT snapshot object that must be freed by the caller
+ * by using `xe_guc_ct_snapshot_free`.
+ */
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
+{
+	return guc_ct_snapshot_capture(ct, true, true);
+}
+
 /**
  * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
  * @snapshot: GuC CT snapshot object.
@@ -1704,12 +1708,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_printf(p, "\tg2h outstanding: %d\n",
 			   snapshot->g2h_outstanding);
 
-		if (snapshot->ctb) {
+		if (snapshot->ctb)
 			xe_print_blob_ascii85(p, "CTB data", snapshot->ctb, 0, snapshot->ctb_size);
-		} else {
-			drm_printf(p, "CTB snapshot missing!\n");
-			return;
-		}
 	} else {
 		drm_puts(p, "CT disabled\n");
 	}
@@ -1735,14 +1735,16 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
  * xe_guc_ct_print - GuC CT Print.
  * @ct: GuC CT.
  * @p: drm_printer where it will be printed out.
+ * @want_ctb: Should the full CTB content be dumped (vs just the headers)
  *
- * This function quickly capture a snapshot and immediately print it out.
+ * This function will quickly capture a snapshot of the CT state
+ * and immediately print it out.
  */
-void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
+void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 {
 	struct xe_guc_ct_snapshot *snapshot;
 
-	snapshot = xe_guc_ct_snapshot_capture(ct, false);
+	snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
 	xe_guc_ct_snapshot_print(snapshot, p);
 	xe_guc_ct_snapshot_free(snapshot);
 }
@@ -1776,7 +1778,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 		return;
 
 	snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
-	snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);
+	snapshot_ct = xe_guc_ct_snapshot_capture((ct));
 
 	spin_lock_irqsave(&ct->dead.lock, flags);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 338f0b75d29f..82c4ae458dda 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -17,11 +17,10 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
-struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic);
-struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
 void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
-void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
+void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
 
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index d3822cbea273..995b306aced7 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -47,9 +47,23 @@ static int guc_log(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int guc_ctb(struct seq_file *m, void *data)
+{
+	struct xe_guc *guc = node_to_guc(m->private);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_pm_runtime_get(xe);
+	xe_guc_ct_print(&guc->ct, &p, true);
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"guc_info", guc_info, 0},
 	{"guc_log", guc_log, 0},
+	{"guc_ctb", guc_ctb, 0},
 };
 
 void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
-- 
2.47.0

