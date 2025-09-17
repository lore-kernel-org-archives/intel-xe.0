Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F2ECAC5A7
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3719E10E737;
	Wed, 17 Sep 2025 03:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMqOO7oT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C7E10E644
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080783; x=1789616783;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/kDj9bw8/EZNvNRZM3uBcErANUROgXUivfKKA4K/UYE=;
 b=KMqOO7oTJIJD9kuPcipEi4f+5wxiu2i3RkkfInJwB13eD+2jCuevePUC
 EEkBXPRaqmRMR53nfkH5Bn6dmfBUHx405K28WfeumG7tvIIvA/X+DeL+5
 YUwjuqSVcnLCHdySytX4ldUu86wRwrxJMzt29jtLyoqQedNexjX8w8okt
 0LouvRIS3epCoQEgiB+m8DkiqtqZrM8gKvRELV/GmqGgte8jSqmqF0DqD
 ZBQEo/F2W0RnUulURyPeeBuMEqNLZcZPscHDMX0fdPA1uD3evUzVSV9Uk
 Rf8KMaxUffpN3ecwMmM6VQhREabGocxZxblQJU+FNUat4lbFUCUZkQ7cM w==;
X-CSE-ConnectionGUID: teEf8cKBTZSU37cmzC4Xpg==
X-CSE-MsgGUID: FOq5mRZaS5ePhmrWQt7Pzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060805"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060805"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:23 -0700
X-CSE-ConnectionGUID: k0BE1+YmTIKGiM8Zb3kUxQ==
X-CSE-MsgGUID: paspFm33QXu5BcjgIFkzxw==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 23/28] drm/xe/vf: Start CTs before resfix VF post migration
 recovery
Date: Tue, 16 Sep 2025 20:46:10 -0700
Message-Id: <20250917034615.3977603-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917034615.3977603-1-matthew.brost@intel.com>
References: <20250917034615.3977603-1-matthew.brost@intel.com>
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

Before `resfix`, all CTs stuck in the H2G queue need to be squashed, as
they may contain stale or invalid data.

Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
resubmitted by the GuC submission state machine.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 +++++
 drivers/gpu/drm/xe/xe_guc_ct.c      | 48 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
 3 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index af0b7f0e2060..99b2ab3c1b32 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1223,6 +1223,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
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
@@ -1272,6 +1277,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	if (err)
 		goto fail;
 
+	vf_post_migration_rearm(gt);
+
 	err = vf_post_migration_notify_resfix_done(gt);
 	if (err && err != -EAGAIN)
 		goto fail;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index fb4bf894de1c..27a8b317548a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -501,7 +501,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
 		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
 }
 
-int xe_guc_ct_enable(struct xe_guc_ct *ct)
+static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
@@ -513,17 +513,19 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
 	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
 
-	err = guc_ct_ctb_h2g_register(ct);
-	if (err)
-		goto err_out;
+	if (needs_register) {
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
+	}
 
 	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
 
@@ -555,6 +557,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
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
index 1e32a59817cc..506616ec1db0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
+int xe_guc_ct_restart(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_flush(struct xe_guc_ct *ct);
-- 
2.34.1

