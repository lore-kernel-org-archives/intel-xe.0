Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F82CCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 12:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B3010E261;
	Thu, 30 Oct 2025 12:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bc8hyMkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B7E10E261
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 12:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761827072; x=1793363072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+CaI8fN9ThxwWIL1v8z6xz6eJQlCfgMLEl9cS/f2sQA=;
 b=bc8hyMkmgm6bq5Qtw/s37TB2ff/Me3XINSyiG0iP773RrDQZARVAq2ZQ
 DxqzdUPLr923E+mREu1chKwGxVvDctooJ1Y8tnr5c7VbkQcvyOGPe92s/
 SjP76XxA4wfOlpUKfoIw9Hadmk8hMMSOqA3ARhSFcyPpYAT5ei+8vyhHO
 IKNNOISU3aqe55muCQyUyU3QZJiVj/GZEmT3PrvUmFg4wgBzFtONRUr/+
 hQ2zDtqFfwYH5Ke50h/vo5FsIz8qdRIYkg2YpvOV39PtvUn83aOXydkgO
 mr7IVAbNm8twXH4SMyypefK63RagAWNat+iwnd2QK+eFMN1MOXDYW/wm3 A==;
X-CSE-ConnectionGUID: +NI86ErrS/m2GVl/PXjfIQ==
X-CSE-MsgGUID: u/a/DHI+SauyonfKo3YVHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64062630"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="64062630"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 05:24:32 -0700
X-CSE-ConnectionGUID: uFcT0RYRQNWiT2ASv24GKg==
X-CSE-MsgGUID: KvpJBWj0Tne2KmgMQX02ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="191103675"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2025 05:24:29 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v8 1/4] drm/xe/vf: Update pause/unpause() helpers with VF
 naming
Date: Thu, 30 Oct 2025 17:53:54 +0530
Message-Id: <20251030122357.128825-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030122357.128825-1-raag.jadav@intel.com>
References: <20251030122357.128825-1-raag.jadav@intel.com>
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

Now that pause/unpause() helpers have been updated for VF migration
usecase, update their naming to match the functionality and while at it,
add IS_SRIOV_VF() assert to make sure they are not abused.

v7: Add IS_SRIOV_VF() assert (Matthew Brost)
    Use "vf" suffix (Michal)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  6 +++---
 drivers/gpu/drm/xe/xe_guc_submit.c  | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_guc_submit.h  |  6 +++---
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4c73a077d314..97c29c55f885 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1128,7 +1128,7 @@ static bool vf_post_migration_shutdown(struct xe_gt *gt)
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
 
 	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
-	xe_guc_submit_pause(&gt->uc.guc);
+	xe_guc_submit_pause_vf(&gt->uc.guc);
 	xe_tlb_inval_reset(&gt->tlb_inval);
 
 	return false;
@@ -1163,12 +1163,12 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 static void vf_post_migration_rearm(struct xe_gt *gt)
 {
 	xe_guc_ct_restart(&gt->uc.guc.ct);
-	xe_guc_submit_unpause_prepare(&gt->uc.guc);
+	xe_guc_submit_unpause_prepare_vf(&gt->uc.guc);
 }
 
 static void vf_post_migration_kickstart(struct xe_gt *gt)
 {
-	xe_guc_submit_unpause(&gt->uc.guc);
+	xe_guc_submit_unpause_vf(&gt->uc.guc);
 }
 
 static void vf_post_migration_abort(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d4ffdb71ef3d..d9073dde9467 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2162,14 +2162,15 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 }
 
 /**
- * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
+ * xe_guc_submit_pause_vf - Stop further runs of submission tasks for VF.
  * @guc: the &xe_guc struct instance whose scheduler is to be disabled
  */
-void xe_guc_submit_pause(struct xe_guc *guc)
+void xe_guc_submit_pause_vf(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
 
+	xe_gt_assert(guc_to_gt(guc), IS_SRIOV_VF(guc_to_xe(guc)));
 	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
 
 	mutex_lock(&guc->submission_state.lock);
@@ -2259,14 +2260,15 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 }
 
 /**
- * xe_guc_submit_unpause_prepare - Prepare unpause submission tasks on given GuC.
+ * xe_guc_submit_unpause_prepare_vf - Prepare unpause submission tasks for VF.
  * @guc: the &xe_guc struct instance whose scheduler is to be prepared for unpause
  */
-void xe_guc_submit_unpause_prepare(struct xe_guc *guc)
+void xe_guc_submit_unpause_prepare_vf(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
 
+	xe_gt_assert(guc_to_gt(guc), IS_SRIOV_VF(guc_to_xe(guc)));
 	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
 
 	mutex_lock(&guc->submission_state.lock);
@@ -2334,14 +2336,16 @@ static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
 }
 
 /**
- * xe_guc_submit_unpause - Allow further runs of submission tasks on given GuC.
+ * xe_guc_submit_unpause_vf - Allow further runs of submission tasks for VF.
  * @guc: the &xe_guc struct instance whose scheduler is to be enabled
  */
-void xe_guc_submit_unpause(struct xe_guc *guc)
+void xe_guc_submit_unpause_vf(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
 
+	xe_gt_assert(guc_to_gt(guc), IS_SRIOV_VF(guc_to_xe(guc)));
+
 	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
 		/*
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index b49a2748ec46..0e7996836131 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -20,10 +20,10 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
 void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
-void xe_guc_submit_pause(struct xe_guc *guc);
-void xe_guc_submit_unpause(struct xe_guc *guc);
-void xe_guc_submit_unpause_prepare(struct xe_guc *guc);
 void xe_guc_submit_pause_abort(struct xe_guc *guc);
+void xe_guc_submit_pause_vf(struct xe_guc *guc);
+void xe_guc_submit_unpause_vf(struct xe_guc *guc);
+void xe_guc_submit_unpause_prepare_vf(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
 int xe_guc_read_stopped(struct xe_guc *guc);
-- 
2.34.1

