Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F6EC02181
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 23:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC43710E18C;
	Mon, 20 Jan 2025 23:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHccUq68";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61C010E4A2
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jan 2025 23:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737415551; x=1768951551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yGQKU9H21Oogu2Mn5dcCbN0lQ24WbA+iI0NgthIrytk=;
 b=bHccUq68oPs+63KkDIL/nxuN1jvGQdaxcBwy7SYzK9piewZn4RmsIPqn
 6+T8Yr5cy/j0kY+d5xXuibS1N9iMemaVsZ1haHMQTxpb1jnOZ4BZCDaUr
 evxxRZJ7TxMK62H+akzMPr7c80EnQuqf65cHgxmctw47vUh1CSqTvlPjI
 /9XdfIZqbeXKjkVDuUleqPNW818RWyP84RdqGr8vucEz6IPJdxhBCssAA
 /zpv6uPhRMEvoEm6yXJiPvTP3ozL9yzxGCc59BqDZhBIXO/0xOHikqP4a
 ySxgBeSuqAEVkmNamjJLxFftiMh3LjM0OVEpInXN1lVXkcotx/gOjmaoT Q==;
X-CSE-ConnectionGUID: Zr2JdjZ6Qi+ND4aTPNH2bA==
X-CSE-MsgGUID: RZwr7vWRTdqHZGeGQW7JAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="63184771"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; d="scan'208";a="63184771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 15:25:50 -0800
X-CSE-ConnectionGUID: ZR3XVfCbTPyiCcZPBSv7RA==
X-CSE-MsgGUID: 8ljQJrP2Qsus7JuAeSqybA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107540262"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 15:25:47 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/pf: Fix migration initialization
Date: Tue, 21 Jan 2025 00:24:43 +0100
Message-Id: <20250120232443.544-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The migration support only needs to be initialized once, but it
was incorrectly called from the xe_gt_sriov_pf_init_hw(), which
is part of the reset flow and may be called multiple times.

Fixes: d86e3737c7ab ("drm/xe/pf: Add functions to save and restore VF GuC state")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c          |  4 +++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 14 +++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h |  6 ++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b5c313a3e946..01a4a852b8f4 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -532,8 +532,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
 		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
 
-	if (IS_SRIOV_PF(gt_to_xe(gt)))
+	if (IS_SRIOV_PF(gt_to_xe(gt))) {
+		xe_gt_sriov_pf_init(gt);
 		xe_gt_sriov_pf_init_hw(gt);
+	}
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index e71fc3d2bda2..6f906c8e8108 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -68,6 +68,19 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 	return 0;
 }
 
+/**
+ * xe_gt_sriov_pf_init - Prepare SR-IOV PF data structures on PF.
+ * @gt: the &xe_gt to initialize
+ *
+ * Late one-time initialization of the PF data.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_init(struct xe_gt *gt)
+{
+	return xe_gt_sriov_pf_migration_init(gt);
+}
+
 static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
 {
 	return GRAPHICS_VERx100(xe) == 1200;
@@ -90,7 +103,6 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
 		pf_enable_ggtt_guest_update(gt);
 
 	xe_gt_sriov_pf_service_update(gt);
-	xe_gt_sriov_pf_migration_init(gt);
 }
 
 static u32 pf_get_vf_regs_stride(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
index 96fab779a906..f474509411c0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -10,6 +10,7 @@ struct xe_gt;
 
 #ifdef CONFIG_PCI_IOV
 int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
+int xe_gt_sriov_pf_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
 void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_restart(struct xe_gt *gt);
@@ -19,6 +20,11 @@ static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 	return 0;
 }
 
+static inline int xe_gt_sriov_pf_init(struct xe_gt *gt)
+{
+	return 0;
+}
+
 static inline void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
 {
 }
-- 
2.47.1

