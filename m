Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714BDCA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 19:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3762910EB99;
	Fri, 22 Aug 2025 19:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntuwZYBG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C981810EB99
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 19:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755892468; x=1787428468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/b3lAzITAm3EnbQ4v8Id1rh1BUXEX1+5C1S2I92hwFk=;
 b=ntuwZYBGWB1syCuSbPDJ5VCQl1rQaUcaOJqfruPzycnxTcycCQ0zqQiJ
 xq+OS/Z/uUKO8cSLL7tWdb/HPmfl4Qdx3vd10sbMjOVH3Wuv/ZUVwVnHE
 DVqn5Sq0HIFv5TfAfIT87w90F6maBcJTVRVRGRFwhcdoVTlAaFftwNmkR
 Hf8PLixGR1q9NcZdZYKDkhc63ZV7ZGHLy3uQ9U/YTrEgVBd6hLcwwesM3
 WkIeiqFBLhhjFwX3T0gLRhseHoSpTkEAyzrJRi1sUx+0POEUTx4ORFvgR
 ZQSDv4cC4rXmwJjUElh8JNCe5IzORzle+/r8x9QbSHEX3KrK6ZyqywtBO Q==;
X-CSE-ConnectionGUID: V8VbE2imQ2anuqDX8EhQ8w==
X-CSE-MsgGUID: tnJxw23xSmCCwdtjwioipQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57404257"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="57404257"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:54:27 -0700
X-CSE-ConnectionGUID: ZLce+4BiQwyAeulwp3hlGg==
X-CSE-MsgGUID: i0tcFbcdQfGnxtxZQNhGQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168685437"
Received: from osgc-sh-rabbit.sh.intel.com ([10.239.81.90])
 by orviesa007.jf.intel.com with ESMTP; 22 Aug 2025 12:54:25 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, karthik.poosa@intel.com, james.xiong@intel.com,
 stuart.summers@intel.com, shuicheng.lin@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH 1/2] drm/xe: make xe_gt_idle_disable_c6() handle the forcewake
 internally
Date: Fri, 22 Aug 2025 12:53:39 -0700
Message-ID: <20250822195340.1246075-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822195340.1246075-1-x.wang@intel.com>
References: <20250822195340.1246075-1-x.wang@intel.com>
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

This change streamlines the code and makes the API easier to use.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 25 ++++++++++++++++---------
 drivers/gpu/drm/xe/xe_gt_idle.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c  | 13 +------------
 3 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index ffb210216aa9..7a2e5b50b1ec 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -322,15 +322,11 @@ static void gt_idle_fini(void *arg)
 {
 	struct kobject *kobj = arg;
 	struct xe_gt *gt = kobj_to_gt(kobj->parent);
-	unsigned int fw_ref;
 
 	xe_gt_idle_disable_pg(gt);
 
-	if (gt_to_xe(gt)->info.skip_guc_pc) {
-		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (gt_to_xe(gt)->info.skip_guc_pc)
 		xe_gt_idle_disable_c6(gt);
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	}
 
 	sysfs_remove_files(kobj, gt_idle_attrs);
 	kobject_put(kobj);
@@ -390,14 +386,25 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
 			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE | RC_CTL_RC6_ENABLE);
 }
 
-void xe_gt_idle_disable_c6(struct xe_gt *gt)
+int xe_gt_idle_disable_c6(struct xe_gt *gt)
 {
-	xe_device_assert_mem_access(gt_to_xe(gt));
-	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
+	unsigned int fw_ref;
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
-		return;
+		return 0;
+
+	xe_device_assert_mem_access(gt_to_xe(gt));
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		return -ETIMEDOUT;
+	}
 
 	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
 	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 591a01e181bc..9c34a155e102 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -13,7 +13,7 @@ struct xe_gt;
 
 int xe_gt_idle_init(struct xe_gt_idle *gtidle);
 void xe_gt_idle_enable_c6(struct xe_gt *gt);
-void xe_gt_idle_disable_c6(struct xe_gt *gt);
+int xe_gt_idle_disable_c6(struct xe_gt *gt);
 void xe_gt_idle_enable_pg(struct xe_gt *gt);
 void xe_gt_idle_disable_pg(struct xe_gt *gt);
 int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 0f8430acd16d..88557e86d637 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1076,7 +1076,6 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 {
 	struct xe_device *xe = pc_to_xe(pc);
 	struct xe_gt *gt = pc_to_gt(pc);
-	unsigned int fw_ref;
 	int ret = 0;
 
 	if (xe->info.skip_guc_pc)
@@ -1086,17 +1085,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 	if (ret)
 		return ret;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
-		return -ETIMEDOUT;
-	}
-
-	xe_gt_idle_disable_c6(gt);
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
-	return 0;
+	return xe_gt_idle_disable_c6(gt);
 }
 
 /**
-- 
2.43.0

