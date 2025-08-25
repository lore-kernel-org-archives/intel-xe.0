Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D39C8303F
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 22:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2397F10E59E;
	Mon, 25 Aug 2025 22:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRohKZB7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B01C10E59E
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 22:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756161151; x=1787697151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+j6zEL61UNRJUTlMepLC3cvPUuJ6sNlzNCh3kLBpH38=;
 b=PRohKZB7+yUueU+OCF9cx+hVxzqiDEj1uem5dynYC2aHDnGZtVJESDLg
 cJ7xbWd/tof2NgfL/XH3cuiJUkrKkqeoERNgUfsnJgw4SNgrHzJmYV1uc
 9uUeawUMZ1QjB2S9bthyPoXMn3PlCe5MfG7ksjNo73T0xYivwOFba7mA2
 5IPSqptOQhGvupAPhqqTz5lUCzDAI4J2VKorDHRndBrH/XdxQ4YtGWg5V
 GJ0Fn1ySiEDlC3XSk8WVHkR7G01xLkUxWiYASUBwoNw5+Cb9b6x45AU5f
 U92cRTdu9FT4HKkNMXmb7TtfB8/b9jpXa3p07jbif5bsJ8LylYEowzbSp A==;
X-CSE-ConnectionGUID: RQv0th6WRx6LrwUFovadZg==
X-CSE-MsgGUID: YU4hNrCBQICfphqAYZ0uMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69818306"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69818306"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 15:32:31 -0700
X-CSE-ConnectionGUID: tLMKV6cATFOXckje0OaHyQ==
X-CSE-MsgGUID: Z8YRXjYaQmO2DOF/9P6IFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170243510"
Received: from osgc-sh-rabbit.sh.intel.com ([10.239.81.90])
 by fmviesa010.fm.intel.com with ESMTP; 25 Aug 2025 15:32:29 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, karthik.poosa@intel.com, james.xiong@intel.com,
 stuart.summers@intel.com, shuicheng.lin@intel.com,
 vinay.belgaumkar@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH 2/3] drm/xe: make xe_gt_idle_disable_c6() handle the forcewake
 internally
Date: Mon, 25 Aug 2025 15:32:18 -0700
Message-ID: <20250825223219.1351786-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825223219.1351786-1-x.wang@intel.com>
References: <20250825223219.1351786-1-x.wang@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_idle.c | 21 +++++++++++++--------
 drivers/gpu/drm/xe/xe_gt_idle.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c  | 13 +------------
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 611c506bdad1..48953ebd783f 100644
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
+	unsigned int fw_ref;
+
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
-		return;
+		return 0;
 
 	xe_device_assert_mem_access(gt_to_xe(gt));
-	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
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

