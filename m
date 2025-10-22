Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D9DCCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 09:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC45410E724;
	Wed, 22 Oct 2025 09:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mexU8HbP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287FF10E724
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 09:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761126189; x=1792662189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qLf0woMf9uw/WhhaQ/0r5xJV0BPKXw6hySzrDKMGdmc=;
 b=mexU8HbPrldrKOO6+9dbRlnkpDpEsjClgwv2C6jVLx8eIAQ4ZfPjEy/P
 /ugVBVCzZnWkXvf/j0+KOGTxudnNL4ZI397alVwJgd/12qn48Z3OREs2x
 PJphIQJOtBAUL719SaxGgSFr3Kd6qOd3bkncQPhgEfDnx/mZwKSqHhce2
 +AKywFy5xVzC06N+KBXRjWIpTn7HlvyAoJXXVLfarOqjRRCl5oyamTK3/
 OhOZLgE+VQC/eiiukgJM8BZiQRvl3v/TQqTHH4AzUdCEhUrMyNUJeuCkN
 fibs1u47aOxo2dLAEMFS8mxOUTqdUwbrBcP7Fe29PDnDnKgpe4euNpH9e A==;
X-CSE-ConnectionGUID: yRYvVg0PT9mk4sgef/fAKQ==
X-CSE-MsgGUID: sJ2aaMAQSoCOyxr5ebAX7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63363952"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63363952"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:43:09 -0700
X-CSE-ConnectionGUID: m0eGIGfuQ/ycx46o96okxg==
X-CSE-MsgGUID: VxZyGtZgTHyA+eaEh+zvqg==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 22 Oct 2025 02:43:06 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 1/4] drm/xe/vf: Update pause/unpause() helpers with VF
 naming
Date: Wed, 22 Oct 2025 15:12:43 +0530
Message-Id: <20251022094246.3584785-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022094246.3584785-1-raag.jadav@intel.com>
References: <20251022094246.3584785-1-raag.jadav@intel.com>
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
usecase, update their naming to match the functionality.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  6 +++---
 drivers/gpu/drm/xe/xe_guc_submit.c  | 12 ++++++------
 drivers/gpu/drm/xe/xe_guc_submit.h  |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 46518e629ba3..fca96556335a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1129,7 +1129,7 @@ static bool vf_post_migration_shutdown(struct xe_gt *gt)
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
 
 	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
-	xe_guc_submit_pause(&gt->uc.guc);
+	xe_guc_submit_vf_pause(&gt->uc.guc);
 	xe_tlb_inval_reset(&gt->tlb_inval);
 
 	return false;
@@ -1164,12 +1164,12 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 static void vf_post_migration_rearm(struct xe_gt *gt)
 {
 	xe_guc_ct_restart(&gt->uc.guc.ct);
-	xe_guc_submit_unpause_prepare(&gt->uc.guc);
+	xe_guc_submit_vf_unpause_prepare(&gt->uc.guc);
 }
 
 static void vf_post_migration_kickstart(struct xe_gt *gt)
 {
-	xe_guc_submit_unpause(&gt->uc.guc);
+	xe_guc_submit_vf_unpause(&gt->uc.guc);
 }
 
 static void vf_post_migration_abort(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0ef67d3523a7..8fbb6b27095d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2162,10 +2162,10 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 }
 
 /**
- * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
+ * xe_guc_submit_vf_pause - Stop further runs of submission tasks for VF.
  * @guc: the &xe_guc struct instance whose scheduler is to be disabled
  */
-void xe_guc_submit_pause(struct xe_guc *guc)
+void xe_guc_submit_vf_pause(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
@@ -2259,10 +2259,10 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 }
 
 /**
- * xe_guc_submit_unpause_prepare - Prepare unpause submission tasks on given GuC.
+ * xe_guc_submit_vf_unpause_prepare - Prepare unpause submission tasks for VF.
  * @guc: the &xe_guc struct instance whose scheduler is to be prepared for unpause
  */
-void xe_guc_submit_unpause_prepare(struct xe_guc *guc)
+void xe_guc_submit_vf_unpause_prepare(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
@@ -2334,10 +2334,10 @@ static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
 }
 
 /**
- * xe_guc_submit_unpause - Allow further runs of submission tasks on given GuC.
+ * xe_guc_submit_vf_unpause - Allow further runs of submission tasks for VF.
  * @guc: the &xe_guc struct instance whose scheduler is to be enabled
  */
-void xe_guc_submit_unpause(struct xe_guc *guc)
+void xe_guc_submit_vf_unpause(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index b49a2748ec46..cb5cc2cc9497 100644
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
+void xe_guc_submit_vf_pause(struct xe_guc *guc);
+void xe_guc_submit_vf_unpause(struct xe_guc *guc);
+void xe_guc_submit_vf_unpause_prepare(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
 int xe_guc_read_stopped(struct xe_guc *guc);
-- 
2.34.1

