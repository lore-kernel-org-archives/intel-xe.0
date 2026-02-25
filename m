Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67ECFD45FA
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 23:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6789910E846;
	Wed, 25 Feb 2026 23:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvkQwRWo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E47F10E845
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 23:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772063409; x=1803599409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u3Tu4icy0iW2xRPeTH50GyW0y7ls6gz97fkKClD6Czs=;
 b=fvkQwRWo2xrBTrm88iXKuV29Csu1CSmcL3Z1OBrqLGJCc9ngItgB9Xqn
 +olDeYuwS2lQ7RUsu42a+0lOq/peo0ue9WEeSTCZCKdeZKR7tazkWzsdQ
 Pnegagx2Hzs7mWBXo6ul/Pflto0odcbWkJat0aJIOJaLaC/eL7XIf8/s6
 WRZtZujZI3uNbWQOiE00wjPf69FgU9HGAS4DF1W5+lIeUu5w542E+Q8kC
 5GZ0RwL0kklEpVqGWDWpFK4bdB8xaiFDhcH9p/pi6ruAusW+IHmc8VrfO
 +nTpVcESQ4/+uu6KRL73G4r7pMHjQ4nBEwTvfJpZxF4gpKgd28YfmqTxh w==;
X-CSE-ConnectionGUID: x2D77ohgSWWzjkGaT+6MCQ==
X-CSE-MsgGUID: OuRoJDR+R2+aDuOk0I5C8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="95730755"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="95730755"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 15:50:09 -0800
X-CSE-ConnectionGUID: nZvYkrO+QU2TqHpELSHnsA==
X-CSE-MsgGUID: /kezZh01Qmaiq3XgUlpy+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="246934350"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa002.jf.intel.com with ESMTP; 25 Feb 2026 15:50:08 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 3/4] drm/xe/vf: Wait for all fixups before using default
 LRCs
Date: Thu, 26 Feb 2026 00:54:46 +0100
Message-Id: <20260225235447.2772383-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260225235447.2772383-1-tomasz.lis@intel.com>
References: <20260225235447.2772383-1-tomasz.lis@intel.com>
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

