Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E61CCD183
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 10:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED37410E307;
	Mon,  6 Oct 2025 10:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYED8n3H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4CD10E314
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759747493; x=1791283493;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3eEufq5C8tfymWlMpmnKPYOMENSJx+5DQctEDdXnYUQ=;
 b=iYED8n3HGWjZzTV7QPBtoziIjfmJjcpDfOHkypFJaKuCB7HRJHVqPl2i
 mOcy1TSPgcvpS937n7AIMq7DVf28Ar22yalm0TzdVHMg8ZLAkl1b5Bftb
 zM+TYfrbkxxtCZImyTwucrM14NpFS1Jh2V9gdu/grSaOfDAJYRoz7dgrV
 O/AFb/PRPskrbRnuUGoTYqo8EcZZ6EHbeuHDoyf0KqWSBhzTjZm80BYZO
 SmgnrT/iJYzxujnwOpmU/Vqhi4qdNocEy02RygP2hTtS+AbXjcxNYnoUV
 6Jk4hLidWn9lj4LVhau3op7MknzwT9pp9OMkjU+LbHqL2qcOEmiGnHFec w==;
X-CSE-ConnectionGUID: Ljc3ZzRRR8uQzyHqopVm+g==
X-CSE-MsgGUID: TCwWIeMVTWmZSTH1zEy2ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="84546333"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="84546333"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:53 -0700
X-CSE-ConnectionGUID: j7YpkVLvR2KQ28WblHv63A==
X-CSE-MsgGUID: TstnCsJ1S+SiBszCtke2fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="203589331"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 20/30] drm/xe/vf: Start CTs before resfix VF post migration
 recovery
Date: Mon,  6 Oct 2025 03:44:35 -0700
Message-Id: <20251006104445.2210624-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006104445.2210624-1-matthew.brost@intel.com>
References: <20251006104445.2210624-1-matthew.brost@intel.com>
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

Before RESFIX_DONE, all CTs stuck in the H2G queue need to be squashed,
as they may contain actions which contain invalid GGTT references or are
unnecessary after HW change.

Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
resubmitted by the GuC submission state machine.

v3:
 - Don't mess with head / tail values (Michal)
v4:
 - Don't mess with broke (Michal)
 - Add CTB_H2G_BUFFER_OFFSET (Michal)
v5:
 - Adjust commit message (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 +++
 drivers/gpu/drm/xe/xe_guc_ct.c      | 70 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
 3 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 2a988eb3e904..6052c7302cc6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1139,6 +1139,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 	return 0;
 }
 
+static void vf_post_migration_rearm(struct xe_gt *gt)
+{
+	xe_guc_ct_restart(&gt->uc.guc.ct);
+}
+
 static void vf_post_migration_kickstart(struct xe_gt *gt)
 {
 	xe_guc_submit_unpause(&gt->uc.guc);
@@ -1190,6 +1195,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	if (err)
 		goto fail;
 
+	vf_post_migration_rearm(gt);
+
 	err = vf_post_migration_notify_resfix_done(gt);
 	if (err && err != -EAGAIN)
 		goto fail;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f67575b1ed79..c0d261abf735 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -167,6 +167,7 @@ ct_to_xe(struct xe_guc_ct *ct)
  */
 
 #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
+#define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
 #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
 #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
 #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
@@ -190,7 +191,7 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
 
 static size_t guc_ct_size(void)
 {
-	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
+	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
 		CTB_G2H_BUFFER_SIZE;
 }
 
@@ -331,7 +332,7 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
 	h2g->desc = *map;
 	xe_map_memset(xe, &h2g->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
 
-	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2);
+	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET);
 }
 
 static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
@@ -349,7 +350,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
 	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
 	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
 
-	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2 +
+	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
 					    CTB_H2G_BUFFER_SIZE);
 }
 
@@ -360,7 +361,7 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
 	int err;
 
 	desc_addr = xe_bo_ggtt_addr(ct->bo);
-	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2;
+	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
 	size = ct->ctbs.h2g.info.size * sizeof(u32);
 
 	err = xe_guc_self_cfg64(guc,
@@ -387,7 +388,7 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
 	int err;
 
 	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
-	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2 +
+	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
 		CTB_H2G_BUFFER_SIZE;
 	size = ct->ctbs.g2h.info.size * sizeof(u32);
 
@@ -501,7 +502,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
 		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
 }
 
-int xe_guc_ct_enable(struct xe_guc_ct *ct)
+static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
@@ -509,21 +510,28 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
 
-	xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
-	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
-	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
+	if (needs_register) {
+		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
+		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
+		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
 
-	err = guc_ct_ctb_h2g_register(ct);
-	if (err)
-		goto err_out;
+		err = guc_ct_ctb_h2g_register(ct);
+		if (err)
+			goto err_out;
 
-	err = guc_ct_ctb_g2h_register(ct);
-	if (err)
-		goto err_out;
+		err = guc_ct_ctb_g2h_register(ct);
+		if (err)
+			goto err_out;
 
-	err = guc_ct_control_toggle(ct, true);
-	if (err)
-		goto err_out;
+		err = guc_ct_control_toggle(ct, true);
+		if (err)
+			goto err_out;
+	} else {
+		ct->ctbs.h2g.info.broken = false;
+		ct->ctbs.g2h.info.broken = false;
+		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
+			      CTB_H2G_BUFFER_SIZE);
+	}
 
 	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
 
@@ -555,6 +563,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	return err;
 }
 
+/**
+ * xe_guc_ct_restart() - Restart GuC CT
+ * @ct: the &xe_guc_ct
+ *
+ * Restart GuC CT to an empty state without issuing a CT register MMIO command.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int xe_guc_ct_restart(struct xe_guc_ct *ct)
+{
+	return __xe_guc_ct_start(ct, false);
+}
+
+/**
+ * xe_guc_ct_enable() - Enable GuC CT
+ * @ct: the &xe_guc_ct
+ *
+ * Enable GuC CT to an empty state and issue a CT register MMIO command.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int xe_guc_ct_enable(struct xe_guc_ct *ct)
+{
+	return __xe_guc_ct_start(ct, true);
+}
+
 static void stop_g2h_handler(struct xe_guc_ct *ct)
 {
 	cancel_work_sync(&ct->g2h_worker);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 02eaa452b400..10d05193e51c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
+int xe_guc_ct_restart(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
-- 
2.34.1

