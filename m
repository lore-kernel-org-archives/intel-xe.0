Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08727CA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 16:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE60410E26E;
	Mon, 25 Aug 2025 16:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKBH0exB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A408010E26E
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756141124; x=1787677124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tKgk4AavT1oHWv94IVoHtZ8r70v89uiUVb4m7fbWi90=;
 b=CKBH0exBLlLJQRRU3Efd2qSkCgP1IW5cbUhg/dG2Yuw+Rs+McOqH6+26
 YJHkGkDZSDU/S/2ND0cQ/CN3KdswqzV3U1D2snxAs716LngsUQ4YXmXEG
 QqU68Ech0e5goZI9VB8qn2SgTr7hJdn9+5UqEiigq2BWkrhCjzue0gwwr
 UfT2lc+w7fVHiMydqI2hz0lyny3xnRmkOEezPza138mqClcNsPwY8n7Kq
 UFZADD274uplUOck9vozTabM74CNH8lVpgHBdmiVgMKSdmPJiqvHlF8qh
 bAaE03+DGf/2FfAYTU+7ElRnIO6NVwNNe+dB+nQpJJODO/PUBGcU9Ihja A==;
X-CSE-ConnectionGUID: p1tbHIGKRMiO5zyoh3VsEA==
X-CSE-MsgGUID: smCLJDfRTSmc/YcuHZDfog==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58223564"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="58223564"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:58:44 -0700
X-CSE-ConnectionGUID: f5mNHis0QPKftEmFQOU9eQ==
X-CSE-MsgGUID: +90+zjXdS9e9HWo7B/PFOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="200296939"
Received: from osgc-sh-rabbit.sh.intel.com ([10.239.81.90])
 by orviesa002.jf.intel.com with ESMTP; 25 Aug 2025 09:58:42 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, karthik.poosa@intel.com, james.xiong@intel.com,
 stuart.summers@intel.com, shuicheng.lin@intel.com,
 vinay.belgaumkar@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH 1/2] drm/xe: make xe_gt_idle_disable_c6() handle the forcewake
 internally
Date: Mon, 25 Aug 2025 09:57:58 -0700
Message-ID: <20250825165759.1263546-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825165759.1263546-1-x.wang@intel.com>
References: <20250825165759.1263546-1-x.wang@intel.com>
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

Move forcewake_get() into xe_gt_idle_enable_c6() to streamline the
code and make it easier to use.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 23 ++++++++++++++---------
 drivers/gpu/drm/xe/xe_gt_idle.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c  | 13 +------------
 3 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index ffb210216aa9..8556b3ff1561 100644
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
@@ -390,14 +386,23 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
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
+	if (!fw_ref)
+		return -ETIMEDOUT;
 
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

