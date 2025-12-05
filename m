Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C2BD2E039
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 08:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDDF10E259;
	Fri,  5 Dec 2025 08:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFmX+ngc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9BE10E259
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 08:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764923189; x=1796459189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1IfWiW5UqmQmAs2iEzzxozXrpIepYePWuNUb8/OpqHg=;
 b=eFmX+ngc0JQaYPx4PwLCWQBS4jrcY77zNW6eG3U6OrJSjWX9MKnwzAim
 SMllpkyhkNT55fLrUAvocNiyQU705HCv5UeurJjkQZA0f3E4Nc2lHJC3b
 7eKWzNOEC5CImpzc8AYexUBhMOsxdD9WYRyoFV2agWNxt2binhZYBtCRQ
 2opLnHXvm8P96UusduXSn6lqUykOk1PoMAr6MLXy+Wb7PNsXONJckgeam
 qFZamFqhg6aVwn1vc+0uC9BW+fi18gIITKBI1fiFEnQCE9/R1/yXCWBlg
 vtgFYUFRPrXduwztgIhCuVuCXgL8n2CPGn4R0lngHqGtK2+n+harqAqJo A==;
X-CSE-ConnectionGUID: 7ZjmJ0tEQJ+2dqTfHb3Mtw==
X-CSE-MsgGUID: lBdMSA83TnmCZvfJFWBxVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66144669"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66144669"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 00:26:29 -0800
X-CSE-ConnectionGUID: rs26K5pORbeOZey6VHyHKg==
X-CSE-MsgGUID: ACZLjnCDSjWfphDvoTNJ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="200191038"
Received: from ksatya-dev.iind.intel.com ([10.190.228.51])
 by fmviesa004.fm.intel.com with ESMTP; 05 Dec 2025 00:26:27 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 1/1] drm/xe/vf: Reset recovery_queued after issuing
 RESFIX_START
Date: Fri,  5 Dec 2025 08:26:17 +0000
Message-ID: <20251205082615.154649-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205082615.154649-3-satyanarayana.k.v.p@intel.com>
References: <20251205082615.154649-3-satyanarayana.k.v.p@intel.com>
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

During VF_RESTORE or VF_RESUME, the GuC sends a migration interrupt and
clears the RESFIX_START marker. If migration or resume occurs before the
VF issues its own RESFIX_START, VF KMD may receive two back-to-back
migration interrupts. VF then sends RESFIX_START to indicate the beginning
of fixups and RESFIX_DONE to mark completion. However, the second
RESFIX_START fails because the GuC is already in the RUNNING state.

To prevent VF KMD from queuing additional recovery work items when extra
interrupts arrive, move the clearing of recovery_queued from
vf_post_migration_shutdown() to vf_post_migration_resfix_start().
This ensures the state is reset only after the fixup process begins,
avoiding redundant work item queuing.

Fixes: b5fbb94341a2 ("drm/xe/vf: Introduce RESFIX start marker support")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 3c806c8e5f3e..90f2ef1772f2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -781,7 +781,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 
 	spin_lock(&gt->sriov.vf.migration.lock);
 
-	if (!gt->sriov.vf.migration.recovery_queued ||
+	if (!gt->sriov.vf.migration.recovery_queued &&
 	    !gt->sriov.vf.migration.recovery_teardown) {
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
@@ -1171,10 +1171,6 @@ static bool vf_post_migration_shutdown(struct xe_gt *gt)
 			return true;
 	}
 
-	spin_lock_irq(&gt->sriov.vf.migration.lock);
-	gt->sriov.vf.migration.recovery_queued = false;
-	spin_unlock_irq(&gt->sriov.vf.migration.lock);
-
 	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
 	xe_guc_submit_pause_vf(&gt->uc.guc);
 	xe_tlb_inval_reset(&gt->tlb_inval);
@@ -1258,7 +1254,15 @@ static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
 
 static int vf_post_migration_resfix_start(struct xe_gt *gt, u16 marker)
 {
-	return vf_resfix_start(gt, marker);
+	int err;
+
+	err = vf_resfix_start(gt, marker);
+
+	spin_lock_irq(&gt->sriov.vf.migration.lock);
+	gt->sriov.vf.migration.recovery_queued = false;
+	spin_unlock_irq(&gt->sriov.vf.migration.lock);
+
+	return err;
 }
 
 static u16 vf_post_migration_next_resfix_marker(struct xe_gt *gt)
-- 
2.43.0

