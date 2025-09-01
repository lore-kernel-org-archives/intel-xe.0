Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDABCA0FF0
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 10:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AEC10E407;
	Mon,  1 Sep 2025 10:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnOjFSeN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED5B10E407
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 10:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756721015; x=1788257015;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CRrF6k7WkoxabufHMYTNH8yB8vfFbpmzBB92otMDfZ4=;
 b=fnOjFSeN7aIIfnytqS4pRfgtWS2SMNPx9MavgFb0l6IhX0JetGy0Qatk
 Cwhh7VK16J5rpQGSh8gp+kGrmEiJ0xJvrz7ouTRtTt23mLqpLbW4772fn
 IBe+QX8735GzakAr6o6qQ3SG9JmC5HGHfvzux44Ogt8wR5zYnr+fKI5Z0
 D4VP8H2nLT0mzQRwdyW+E7JOXaIZmWLmwU/fl4OAXH9Ne3nK4Z+UoIy6/
 ikuKown5oDz7ANpMT0uwJYAUNXoqujXiEp7x3NCUgg09lEPq2VGgNlXaL
 ZO2FH2ajSFNUE8/tg/aPjj7wJRELq9fYjyq+uzzRnfnKqCPaLW5JOw/04 g==;
X-CSE-ConnectionGUID: 56wdL7RDRhyyfvUkNKxTGA==
X-CSE-MsgGUID: xgPCw8nTTfyIcSraBNynJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="58674448"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="58674448"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:03:35 -0700
X-CSE-ConnectionGUID: crbbSR1LTPS5cyJRVzxmMg==
X-CSE-MsgGUID: 1gVfsiigSveyqOsd/ifbgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="170529712"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa009.jf.intel.com with ESMTP; 01 Sep 2025 03:03:33 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v7] drm/xe/vf: Enable CCS save/restore only on supported GUC
 versions
Date: Mon,  1 Sep 2025 15:50:40 +0530
Message-ID: <20250901102040.9071-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
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
V6 -> V7:
- Fixed review comments (Michal)

V5 -> V6:
- Fixed issues reported by patchwork.

V4 -> V5:
- Fixed issues reported by patchwork.

V3 -> V4:
- Fixed review comments (Michal, Andi)

V2 -> V3:
- Fixed review comments (Michal)

V1 -> V2:
- Fixed review comments (Michal)
---
 drivers/gpu/drm/xe/xe_sriov.c          |  5 ++-
 drivers/gpu/drm/xe/xe_sriov_vf.c       | 56 +++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_sriov_vf.h       |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c   |  5 +--
 drivers/gpu/drm/xe/xe_sriov_vf_types.h |  5 +++
 5 files changed, 65 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 87911fb4eea7..1c03967ffd9a 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -171,7 +171,10 @@ int xe_sriov_late_init(struct xe_device *xe)
 {
 	int err = 0;
 
-	if (IS_VF_CCS_INIT_NEEDED(xe))
+	if (!IS_SRIOV_VF(xe))
+		return 0;
+
+	if (xe_sriov_vf_migration_supported(xe))
 		err = xe_sriov_vf_ccs_init(xe);
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 5de81f213d83..f3a5a6efd8c4 100644
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
@@ -127,13 +128,59 @@
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
+	return xe->sriov.vf.migration.enabled;
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
+}
+
+static void vf_migration_init_early(struct xe_device *xe)
 {
 	/*
 	 * TODO: Add conditions to allow specific platforms, when they're
 	 * supported at production quality.
 	 */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
+		return vf_disable_migration(xe,
+					    "experimental feature not available on production builds");
+
+	if (GRAPHICS_VER(xe) >= 20) {
+		struct xe_uc_fw_version guc_version;
+
+		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
+
+		if (MAKE_GUC_VER(guc_version.major, guc_version.minor, guc_version.patch) <
+		    MAKE_GUC_VER(1, 23, 0))
+			return vf_disable_migration(xe,
+						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
+						    guc_version.major, guc_version.minor);
+	} else {
+		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
+					    GRAPHICS_VER(xe));
+	}
+
+	xe->sriov.vf.migration.enabled = true;
 }
 
 static void migration_worker_func(struct work_struct *w);
@@ -146,8 +193,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 {
 	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
 
-	if (!vf_migration_supported(xe))
-		xe_sriov_info(xe, "migration not supported by this module version\n");
+	vf_migration_init_early(xe);
 }
 
 /**
@@ -302,7 +348,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
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
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 4872e43eb440..908590fa79d4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -264,9 +264,8 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 	u32 flags;
 	int err;
 
-	xe_assert(xe, IS_SRIOV_VF(xe));
-	xe_assert(xe, !IS_DGFX(xe));
-	xe_assert(xe, xe_device_has_flat_ccs(xe));
+	if (!IS_VF_CCS_INIT_NEEDED(xe))
+		return 0;
 
 	for_each_ccs_rw_ctx(ctx_id) {
 		ctx = &tile->sriov.vf.ccs[ctx_id];
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
index 24a873c50c49..2c94d1f92187 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
@@ -35,6 +35,11 @@ struct xe_device_vf {
 		struct work_struct worker;
 		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
 		unsigned long gt_flags;
+		/**
+		 * @migration.enabled: flag indicating if migration support
+		 * was enabled or not due to missing prerequisites
+		 */
+		bool enabled;
 	} migration;
 
 	/** @ccs: VF CCS state data */
-- 
2.51.0

