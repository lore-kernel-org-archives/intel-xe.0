Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0083CCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 12:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8584410E469;
	Mon, 27 Oct 2025 12:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQIAOxd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327CC10E469
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 12:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761568318; x=1793104318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gMmV6YFnYHyT8fqC6cHeSVJJ7gT/Z4nAdclYRTssHbA=;
 b=nQIAOxd0p4cH3a6fazmzrA7lpichZCVBPv7FezTB3/kUq//f+h6mVc9R
 8Y9+VUgekH19m7k+zQ9ycKDL+vMOhsTaCxZ/eFgZjYD77mn+T3lcCRguF
 Rvh2rSm6rC1wZ1UhDP65uBl5PY78xfZpnEfKoL4kJUyrd0TLDmCj/wIzJ
 KDrWI9bmVdW5fBmuVSQMpSv0U5ZXDMxhULGzGo4MDpxrZKcHSYJZwStDH
 kh6U7ra1NHIOofngwFbiI00dkMwtZ9yl+1vGaZGYdOU6eHnzpxWYa5Aus
 FaOtiyeHYgWlcuYL7EteKAI98QCJavfI/Y2+65PcbvysWo22MMMh8pdIV A==;
X-CSE-ConnectionGUID: UvFddboLSfmK0N82fk/9bQ==
X-CSE-MsgGUID: 42dIvteVR1yyN0/noUy/Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63678877"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63678877"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:31:58 -0700
X-CSE-ConnectionGUID: WQQV7WYqQgq8jURNmiwPFA==
X-CSE-MsgGUID: IJUmJM5sS86pQV9XAJMgVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184729521"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2025 05:31:55 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 1/4] drm/xe/vf: Update pause/unpause() helpers with VF
 naming
Date: Mon, 27 Oct 2025 18:00:54 +0530
Message-Id: <20251027123057.3738059-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027123057.3738059-1-raag.jadav@intel.com>
References: <20251027123057.3738059-1-raag.jadav@intel.com>
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
index d0b102ab6ce8..511fc0f05e97 100644
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
index 0ef67d3523a7..0cb83e5faceb 100644
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

