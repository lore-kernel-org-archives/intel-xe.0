Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A5ACA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 10:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B29210E64E;
	Tue,  2 Sep 2025 10:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXYtTNiy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE90410E64E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756808153; x=1788344153;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GGb0if7cY3nl0Q7e3VR0odBpHnup/1LTJCVQrgGyaRA=;
 b=aXYtTNiycb3zF2Mmg4bc9r6gsc5Vm6tSTjqWfCYXE00mKnH3SUGP1ZSf
 yISWDzVzZLjPnTqFHrzF20jb4DSPI+gnCzOtxPpEmIbegVkiKppQJTvSk
 mvTyuf08uMLOHrho21a9YTs8sR2L+TuZfsVZaLUGtnmZkiLPXy88g+z6s
 P88Id7OheGRkBvj9FHa0xdLowFAlwzdutqMDJld3QEmcfxdSe+33EoG2p
 8FYlfFDKz5FoLwBcEcMVqLGr7EdrPVDAeafPZdTnQvtpwWGhEqYJsDuF6
 LZWsI2yjX1Qso8C3EoBJ03+iw/3JDsBrtCkO0nZjlp9FUrFT6NqByfhQp Q==;
X-CSE-ConnectionGUID: GW8XCjPsQl+kBf+in3EKFA==
X-CSE-MsgGUID: 1fQhiMWtSrGUaa7BI/4Sdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70177373"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70177373"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:15:53 -0700
X-CSE-ConnectionGUID: Sv5XrnaWRKiMKtLwNkBjmA==
X-CSE-MsgGUID: +3tmhibRSUWgwjqcJAlUew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="170496257"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa006.jf.intel.com with ESMTP; 02 Sep 2025 03:15:49 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v9] drm/xe/vf: Enable CCS save/restore only on supported GUC
 versions
Date: Tue,  2 Sep 2025 16:02:57 +0530
Message-ID: <20250902103256.21658-2-satyanarayana.k.v.p@intel.com>
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
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V8 -> V9:
- Updated MAKE_GUC_VER to MAKE_GUC_VER_STRUCT (Michal)

V7 -> V8:
- Fixed review comments (Michal)

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
 drivers/gpu/drm/xe/xe_device.c         |  2 +-
 drivers/gpu/drm/xe/xe_sriov.c          | 14 ++---
 drivers/gpu/drm/xe/xe_sriov.h          |  2 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c       | 87 +++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_sriov_vf.h       |  4 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c   |  5 +-
 drivers/gpu/drm/xe/xe_sriov_vf_types.h |  5 ++
 7 files changed, 95 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9e4773a17ef8..9e2952c9c06a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -950,7 +950,7 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
-	err = xe_sriov_late_init(xe);
+	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
 
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 87911fb4eea7..7d2d6de2aabf 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -160,19 +160,15 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
 }
 
 /**
- * xe_sriov_late_init() - SR-IOV late initialization functions.
+ * xe_sriov_init_late() - SR-IOV late initialization functions.
  * @xe: the &xe_device to initialize
  *
- * On VF this function will initialize code for CCS migration.
- *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_sriov_late_init(struct xe_device *xe)
+int xe_sriov_init_late(struct xe_device *xe)
 {
-	int err = 0;
-
-	if (IS_VF_CCS_INIT_NEEDED(xe))
-		err = xe_sriov_vf_ccs_init(xe);
+	if (IS_SRIOV_VF(xe))
+		return xe_sriov_vf_init_late(xe);
 
-	return err;
+	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 0e0c1abf2d14..6db45df55615 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -18,7 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
 void xe_sriov_probe_early(struct xe_device *xe);
 void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
 int xe_sriov_init(struct xe_device *xe);
-int xe_sriov_late_init(struct xe_device *xe);
+int xe_sriov_init_late(struct xe_device *xe);
 
 static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 5de81f213d83..cb062328551a 100644
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
@@ -18,6 +19,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_printk.h"
 #include "xe_sriov_vf.h"
+#include "xe_sriov_vf_ccs.h"
 #include "xe_tile_sriov_vf.h"
 
 /**
@@ -127,16 +129,66 @@
  *      |                               |                               |
  */
 
-static bool vf_migration_supported(struct xe_device *xe)
+/**
+ * xe_sriov_vf_migration_supported - Report whether SR-IOV VF migration is
+ * supported or not.
+ * @xe: the &xe_device to check
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
+
+	xe->sriov.vf.migration.enabled = false;
+}
+
+static void migration_worker_func(struct work_struct *w);
+
+static void vf_migration_init_early(struct xe_device *xe)
 {
 	/*
 	 * TODO: Add conditions to allow specific platforms, when they're
 	 * supported at production quality.
 	 */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
-}
+	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
+		return vf_disable_migration(xe,
+					    "experimental feature not available on production builds");
+
+	if (GRAPHICS_VER(xe) < 20)
+		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
+					    GRAPHICS_VER(xe));
+
+	if (!IS_DGFX(xe)) {
+		struct xe_uc_fw_version guc_version;
+
+		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
+		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
+			return vf_disable_migration(xe,
+						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
+						    guc_version.major, guc_version.minor);
+	}
 
-static void migration_worker_func(struct work_struct *w);
+	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
+
+	xe->sriov.vf.migration.enabled = true;
+	xe_sriov_dbg(xe, "migration support enabled\n");
+}
 
 /**
  * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
@@ -144,10 +196,7 @@ static void migration_worker_func(struct work_struct *w);
  */
 void xe_sriov_vf_init_early(struct xe_device *xe)
 {
-	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
-
-	if (!vf_migration_supported(xe))
-		xe_sriov_info(xe, "migration not supported by this module version\n");
+	vf_migration_init_early(xe);
 }
 
 /**
@@ -302,8 +351,8 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	xe_pm_runtime_get(xe);
 	vf_post_migration_shutdown(xe);
 
-	if (!vf_migration_supported(xe)) {
-		xe_sriov_err(xe, "migration not supported by this module version\n");
+	if (!xe_sriov_vf_migration_supported(xe)) {
+		xe_sriov_err(xe, "migration is not supported\n");
 		err = -ENOTRECOVERABLE;
 		goto fail;
 	}
@@ -378,3 +427,21 @@ void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
 	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
 		 "scheduled" : "already in progress");
 }
+
+/**
+ * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
+ * @xe: the &xe_device to initialize
+ *
+ * This function initializes code for CCS migration.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vf_init_late(struct xe_device *xe)
+{
+	int err = 0;
+
+	if (xe_sriov_vf_migration_supported(xe))
+		err = xe_sriov_vf_ccs_init(xe);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
index 7b8622cff2b7..3bf3364799ad 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
@@ -6,9 +6,13 @@
 #ifndef _XE_SRIOV_VF_H_
 #define _XE_SRIOV_VF_H_
 
+#include <linux/types.h>
+
 struct xe_device;
 
 void xe_sriov_vf_init_early(struct xe_device *xe);
+int xe_sriov_vf_init_late(struct xe_device *xe);
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

