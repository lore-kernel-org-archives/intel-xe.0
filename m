Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227B3CCD19D
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4885610E8A4;
	Wed,  8 Oct 2025 18:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLyFdi2m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FC810E88D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946709; x=1791482709;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4ejc1E2ypAOtuKpLDQ6LjWKHscsioaqKvfBFobl9jC8=;
 b=RLyFdi2m2gAC01NMC66pU2L0YQgoUzgrbod82ufqKv0IAcJg5OvadTqQ
 8fm2eLUlXOec2/xBQC/o+6Gi7okyDot7M+JsdH3Lu9uppjIURfXk6cu2O
 0KKYAxZc+Uzuwv+SNTM3GFa9LG7x5h1JA0BpXDPYIw+fq1go40qFyG+LM
 KclCbqZPbPRk2J1XIiDMAkHrtppZVfeHo6xUdVzMxvRqZZsbhvlTpB1qW
 FagIfiJ27ejsJXghcFvqsp4JhDTK3npcyzB5tRxa98cA76ttGATchYHZI
 jDn7rrFU6b7CRofF/lINdIOO477Ft5h0+CoKQV79Ip+1zx7MceYY5+/px g==;
X-CSE-ConnectionGUID: 0VSPsMI4TMaQu52A09FylA==
X-CSE-MsgGUID: BR+VPghRQ6u4UNk8z4NbaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067534"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067534"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: 6Wdt8IYnQ4SvbBqu5pIgKA==
X-CSE-MsgGUID: 0m3Y90QrS/eb45w3zxg52g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593741"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 24/34] drm/xe/vf: Start CTs before resfix VF post migration
 recovery
Date: Wed,  8 Oct 2025 11:04:50 -0700
Message-Id: <20251008180500.3261209-25-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c      | 60 ++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
 3 files changed, 55 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 438ca899e18a..68906ffe931f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1126,6 +1126,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
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
@@ -1177,6 +1182,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	if (err)
 		goto fail;
 
+	vf_post_migration_rearm(gt);
+
 	err = vf_post_migration_notify_resfix_done(gt);
 	if (err && err != -EAGAIN)
 		goto fail;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 503cf5cb5d33..3472e4ea2609 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -502,7 +502,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
 		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
 }
 
-int xe_guc_ct_enable(struct xe_guc_ct *ct)
+static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
@@ -510,21 +510,29 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
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
+		/* Skip everything in H2G buffer */
+		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
+			      CTB_H2G_BUFFER_SIZE);
+	}
 
 	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
 
@@ -556,6 +564,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
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
index f8370fa4727f..ca1ce2b3c354 100644
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

