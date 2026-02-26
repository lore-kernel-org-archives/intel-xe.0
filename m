Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237AAFD9E12
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 21:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8B410E9AF;
	Thu, 26 Feb 2026 21:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMFkY3Oq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74A310E9B7
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 21:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772140944; x=1803676944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u3Tu4icy0iW2xRPeTH50GyW0y7ls6gz97fkKClD6Czs=;
 b=kMFkY3Oq+2Q1D1J0zNcR4Z1kVW9k3gLqFbbgpxTEMDQQhDNhojOSMoy/
 cm1+OMoN1hxhWzXC/ooT2ybMxPFZa0ESRmP9zXHMBMp7N7x//mlZ+PEpI
 Y9BxJtbMt8CEUFfHV6J+dPjB4yHmeOe+jx85GYmDZGC6vgdDH37KlFED2
 Way+aDN+wNGvEuM5FelqIIZ4xD8ld0t/yiFhaMdARIAohSTWe6tvoo6+y
 d7yC+dGV9HNI4DiZ6pqf54LHa6xsBFnYQQVlZ1qN2x9dbNWmwBz+G5Kzj
 O+X8/K9FOfaI478bEDDiUZ+ekE8FbhAd21A6XrMWEwjoMlQ14TLGMxL50 Q==;
X-CSE-ConnectionGUID: 7qTq6H2yTj6JSjYux7Yfog==
X-CSE-MsgGUID: oPKjpzx1QY+Ccu92LBMX7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84307902"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="84307902"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 13:22:24 -0800
X-CSE-ConnectionGUID: mlGnqAqIRd6kJ4CSsnYBjQ==
X-CSE-MsgGUID: 4n6+vxmQQKmQPcxcNHbJsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221698685"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa005.jf.intel.com with ESMTP; 26 Feb 2026 13:22:22 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 3/4] drm/xe/vf: Wait for all fixups before using default
 LRCs
Date: Thu, 26 Feb 2026 22:27:00 +0100
Message-Id: <20260226212701.2937065-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260226212701.2937065-1-tomasz.lis@intel.com>
References: <20260226212701.2937065-1-tomasz.lis@intel.com>
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

When a context is being created during save/restore, the LRC creation
needs to wait for GGTT address space to be shifted. But it also needs
to have fixed default LRCs. This is mandatory to avoid the situation
where LRC will be created based on data from before the fixups, but
reference within exec queue will be set too late for fixups.

This fixes an issue where contexts created during save/restore have
a large chance of having one unfixed LRC, due to the xe_lrc_create()
being synced for equal start to race with default LRC fixups.

v2: Move the fixups confirmation further, behind all fixups.
  Revert some renames.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 16 +++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 +-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 527ded3c9c22..7f83c0d3b099 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -536,12 +536,6 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	 */
 	xe_ggtt_shift_nodes(tile->mem.ggtt, start);
 
-	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
-		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
-		smp_wmb();	/* Ensure above write visible before wake */
-		wake_up_all(&gt->sriov.vf.migration.wq);
-	}
-
 	return 0;
 }
 
@@ -846,6 +840,13 @@ static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
 		xe_default_lrc_update_memirq_regs_with_address(hwe);
 }
 
+static void vf_post_migration_mark_fixups_done(struct xe_gt *gt)
+{
+	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
+	smp_wmb();	/* Ensure above write visible before wake */
+	wake_up_all(&gt->sriov.vf.migration.wq);
+}
+
 static void vf_start_migration_recovery(struct xe_gt *gt)
 {
 	bool started;
@@ -1380,6 +1381,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	if (err)
 		goto fail;
 
+	vf_post_migration_mark_fixups_done(gt);
 	vf_post_migration_rearm(gt);
 
 	err = vf_post_migration_resfix_done(gt, marker);
@@ -1514,7 +1516,7 @@ static bool vf_valid_ggtt(struct xe_gt *gt)
 }
 
 /**
- * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
+ * xe_gt_sriov_vf_wait_valid_ggtt() - wait for valid GGTT nodes and address refs
  * @gt: the &xe_gt
  */
 void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 4ef881b9b662..fca18be589db 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -73,7 +73,7 @@ struct xe_gt_sriov_vf_migration {
 	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
 	bool recovery_inprogress;
-	/** @ggtt_need_fixes: VF GGTT needs fixes */
+	/** @ggtt_need_fixes: VF GGTT and references to it need fixes */
 	bool ggtt_need_fixes;
 };
 
-- 
2.25.1

