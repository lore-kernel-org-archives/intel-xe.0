Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBF9CAC5A6
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B4710E649;
	Wed, 17 Sep 2025 03:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXhdxIy1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9453310E40E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080783; x=1789616783;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WvzyLesnfNs441Tht+K6TfEe209642MZ7Jc0MLjECPY=;
 b=iXhdxIy1WLpbGy3b23y7SybooR9k45b2iZ71bsvQHkmBf3MKRx8Rhdkx
 69I1whmcatmPV2gmuYs4czNOK3l+WSFEhhPdi6L5JvfMb7XgJjJtZ2NFt
 8AXdskR19vwGEl8xObS/zGSXHda2QP4d2IWB/tzMog+YAOLqh4/R79zxk
 0BddwqhKj1IvUYnNAMRdMb426LQ4hz5mVFo/x8Pn10fQlDv7TuiPH3PYw
 0b7qOIVX5XafvTxYziQWRFKh/7NKXN11ItjD4UeJgqhS+jvyThzt9j2sh
 jTRX3r3+Mtamvu1kY0qMBCHopjXEv5gLULZ5nKOrAFmWF3R0KxDJIyD7C Q==;
X-CSE-ConnectionGUID: j7893D88TeCvtn3P2Y5PZQ==
X-CSE-MsgGUID: /IAP8IWITP+VPgN2oV3dzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060804"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060804"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:23 -0700
X-CSE-ConnectionGUID: 1NJ7RWmPTNSl8Gy10d8cFg==
X-CSE-MsgGUID: nBBTgnNeTCe2GjgoTUmm6g==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 22/28] drm/xe/vf: Kickstart after resfix in VF post migration
 recovery
Date: Tue, 16 Sep 2025 20:46:09 -0700
Message-Id: <20250917034615.3977603-23-matthew.brost@intel.com>
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

GuC needs to be live for the GuC submission state machine to resubmit
anything lost during VF post-migration recovery.  Therefore, move the
kickstart step after `resfix` to ensure proper resubmission.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index f76c278670aa..af0b7f0e2060 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1225,13 +1225,6 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 
 static void vf_post_migration_kickstart(struct xe_gt *gt)
 {
-	/*
-	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
-	 * must be working at this point, since the recovery did started,
-	 * but the rest was not enabled using the procedure from spec.
-	 */
-	xe_irq_resume(gt_to_xe(gt));
-
 	xe_guc_submit_unpause(&gt->uc.guc);
 }
 
@@ -1248,6 +1241,14 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
 	}
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
 
+	/*
+	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
+	 * must be working at this point, since the recovery did started,
+	 * but the rest was not enabled using the procedure from spec.
+	 */
+	if (!skip_resfix)
+		xe_irq_resume(gt_to_xe(gt));
+
 	return skip_resfix ? -EAGAIN : xe_gt_sriov_vf_notify_resfix_done(gt);
 }
 
@@ -1271,11 +1272,12 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	if (err)
 		goto fail;
 
-	vf_post_migration_kickstart(gt);
 	err = vf_post_migration_notify_resfix_done(gt);
 	if (err && err != -EAGAIN)
 		goto fail;
 
+	vf_post_migration_kickstart(gt);
+
 	xe_pm_runtime_put(xe);
 	xe_gt_sriov_notice(gt, "migration recovery ended\n");
 	return;
-- 
2.34.1

