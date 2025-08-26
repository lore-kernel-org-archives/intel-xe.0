Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943FDCA0FE9
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 09:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB0F10E2E0;
	Tue, 26 Aug 2025 09:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSlIglCF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0901310E2E0
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756200223; x=1787736223;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c3JoFnHQsQrvYLi091n8QUeC7LTuwZFDb1ozHoTyrUg=;
 b=mSlIglCF5LIEXpSy41Yc7sBNFhi+AHN7vUad2byMwoXTiJ7GTSbhrRJB
 KmLy3VHwh6/QURbMJbQxq2aV9+9vxfM675y3G9NDytvd9mDQdyv6yO/yz
 J2aIjTJf0xuytI4Hxt0uR1ZMTRWLJ05twHhnReH6zagjm825jllTd5NTg
 2IN1ilrSb958pn87ZMfzwW0iNFypZY8yrKdMd4Ws6JmUgp6K9Gkc+x44q
 i2Bhu+wuPOqOfGBaJu7o2tsRogA8rVM10ykXtatKt3eKG4R48Yamd5K0I
 bspmkAWFPJP86HhSj275F0E1t247CaR7xQy8Nt4wMBzy+FXl84jIN775E Q==;
X-CSE-ConnectionGUID: qQx9wVtOQtOUtH++jxdgWA==
X-CSE-MsgGUID: rtuqTufjSGCSaI/YiHHqqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="76028229"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="76028229"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 02:23:42 -0700
X-CSE-ConnectionGUID: tzTKOBcsRNalJ+AiXJ+h4A==
X-CSE-MsgGUID: qL5HrbHoRLmsKRjPXw34VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169910930"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 26 Aug 2025 02:23:40 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4] drm/xe/vf: Enable CCS save/restore only on supported GUC
 versions
Date: Tue, 26 Aug 2025 15:10:35 +0530
Message-ID: <20250826094035.30977-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

CCS save/restore is supported starting with GuC 70.48.0 (compatibility
version 1.23.0). Gate the feature on the GuC firmware version and keep it
disabled on older or unsupported versions.

Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>

---
V3 -> V4:
- Fixed review comments (Michal, Andi)

V2 -> V3:
- Fixed review comments (Michal)

V1 -> V2:
- Fixed review comments (Michal)
---
 drivers/gpu/drm/xe/xe_sriov.c          |  2 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c       | 56 +++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_sriov_vf.h       |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_types.h |  5 +++
 4 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 87911fb4eea7..d2d2b2648f8d 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -171,7 +171,7 @@ int xe_sriov_late_init(struct xe_device *xe)
 {
 	int err = 0;
 
-	if (IS_VF_CCS_INIT_NEEDED(xe))
+	if (IS_VF_CCS_INIT_NEEDED(xe) && xe_sriov_vf_migration_supported(xe))
 		err = xe_sriov_vf_ccs_init(xe);
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 5de81f213d83..f2c88957347e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -10,6 +10,7 @@
 #include "xe_gt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_irq.h"
@@ -127,13 +128,54 @@
  *      |                               |                               |
  */
 
-static bool vf_migration_supported(struct xe_device *xe)
+/**
+ * xe_sriov_vf_migration_supported - Report whether SR-IOV VF migration is
+ * supported or not.
+ * @xe: the &xe_device to initialize
+ *
+ * Returns: true if VF migration is supported, false otherwise.
+ */
+bool xe_sriov_vf_migration_supported(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_VF(xe));
+	return !xe->sriov.vf.migration.disabled;
+}
+
+static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list va_args;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	va_start(va_args, fmt);
+	vaf.fmt = fmt;
+	vaf.va  = &va_args;
+	xe_sriov_notice(xe, "migration disabled: %pV\n", &vaf);
+	va_end(va_args);
+
+	xe->sriov.vf.migration.disabled = true;
+}
+
+static void vf_check_migration_support(struct xe_device *xe)
 {
+	struct xe_uc_fw_version guc_version;
+
 	/*
 	 * TODO: Add conditions to allow specific platforms, when they're
 	 * supported at production quality.
 	 */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
+		return vf_disable_migration(xe,
+					    "experimental feature not available on production builds");
+
+	xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
+	if (!IS_DGFX(xe) &&
+	    MAKE_GUC_VER(guc_version.major, guc_version.minor, guc_version.patch) <
+	    MAKE_GUC_VER(1, 23, 0))
+		return vf_disable_migration(xe,
+					    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
+					    guc_version.major, guc_version.minor);
 }
 
 static void migration_worker_func(struct work_struct *w);
@@ -144,10 +186,12 @@ static void migration_worker_func(struct work_struct *w);
  */
 void xe_sriov_vf_init_early(struct xe_device *xe)
 {
-	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
+	vf_check_migration_support(xe);
 
-	if (!vf_migration_supported(xe))
-		xe_sriov_info(xe, "migration not supported by this module version\n");
+	if (!xe_sriov_vf_migration_supported(xe))
+		return;
+
+	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
 }
 
 /**
@@ -302,7 +346,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	xe_pm_runtime_get(xe);
 	vf_post_migration_shutdown(xe);
 
-	if (!vf_migration_supported(xe)) {
+	if (!xe_sriov_vf_migration_supported(xe)) {
 		xe_sriov_err(xe, "migration not supported by this module version\n");
 		err = -ENOTRECOVERABLE;
 		goto fail;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
index 7b8622cff2b7..d6844719ff47 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
@@ -6,9 +6,12 @@
 #ifndef _XE_SRIOV_VF_H_
 #define _XE_SRIOV_VF_H_
 
+#include <linux/types.h>
+
 struct xe_device;
 
 void xe_sriov_vf_init_early(struct xe_device *xe);
 void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
+bool xe_sriov_vf_migration_supported(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
index 24a873c50c49..8eb4ca9f62de 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
@@ -35,6 +35,11 @@ struct xe_device_vf {
 		struct work_struct worker;
 		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
 		unsigned long gt_flags;
+		/**
+		 * @migration.disabled: flag indicating if migration support
+		 * was disabled due to missing prerequisites
+		 */
+		bool disabled;
 	} migration;
 
 	/** @ccs: VF CCS state data */
-- 
2.43.0

