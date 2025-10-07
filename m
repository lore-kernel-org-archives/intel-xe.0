Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662EECCD188
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181AD10E67A;
	Tue,  7 Oct 2025 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jldrL7sX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAFD10E649
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842315; x=1791378315;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/4ylWZ0RxNqdqbT4lEbqtHOv21kTTbPNHYpUzMzEB9Q=;
 b=jldrL7sXnstwQ5LorLdVY6SiTWDZO5d8AteyHjsPAwcTzXf/OCWhzaiI
 3Ywg2DoqxfYPWyhkZVM3y8sNK8+8bmn7Tcux5pA8aDREyn1bqr/oGmWVo
 61w+Ezimy/Q7TaR90sU1rDOeFiljDBZMYkmYgJ5sbJDFN88EjBDCpA0zx
 NJRDd1zLdnoghGFii4pmaEBZ1H323hzMdV9kub3rUgAKhjOWvW6GFUNls
 ff9Hs2TESDfnYFaTfSHXPa811RIARRQ3sG3WUQnsE9QIgU/zmxMHW6bKK
 qEfyZUiW05fkxn0/pmfsXyg50QzaSlrROnxy2snxhGG0r86kwMPIG/LxE g==;
X-CSE-ConnectionGUID: LSSZzfaoSju2kUJH2qmAtg==
X-CSE-MsgGUID: zyhqLYwrT4ON7vY+DWRTEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639844"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639844"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:15 -0700
X-CSE-ConnectionGUID: kpyOjmGMTmGpZ27GNR/sxw==
X-CSE-MsgGUID: xggcG2aXTlSlHWlgRtbiiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576955"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 23/33] drm/xe/vf: Start CTs before resfix VF post migration
 recovery
Date: Tue,  7 Oct 2025 06:04:55 -0700
Message-Id: <20251007130505.2694829-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c      | 59 ++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
 3 files changed, 54 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 1575ffaaaf52..675bb0d43343 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1128,6 +1128,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
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
@@ -1179,6 +1184,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	if (err)
 		goto fail;
 
+	vf_post_migration_rearm(gt);
+
 	err = vf_post_migration_notify_resfix_done(gt);
 	if (err && err != -EAGAIN)
 		goto fail;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 503cf5cb5d33..d0666d6d12f8 100644
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
@@ -510,21 +510,28 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
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
 
@@ -556,6 +563,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
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

