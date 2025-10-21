Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12540CCD1AB
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 12:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14A910E5DE;
	Tue, 21 Oct 2025 12:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CM0otRmv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D060710E5DD
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761050307; x=1792586307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AxKtZqy8I7lSVtphp6QmmZKDdS/MoATaTgDelvWHpOM=;
 b=CM0otRmvuGAtw750bCM16DfyiUVWSfS6LykFmcb2xDVK9cI7KFMajvD2
 0z2KP+VkNufEc0L27QI/z3f97A8IoTlKehWCUHAPuGo2sFbjB7nFpuFve
 52En0Oh84uxE2utY1LiUG3nFrmn3qEckw/syZPPyYHbcRUBWObbkRXnLn
 jKV8c/bivuU+ENOvz7DUkS9xmzzOTY7f5uJErXYpIvzuctczoo08Ic05G
 sNHjw21NOi8/onJG6gicJwrfZZH5IEBFYlCcYcuiVdKJFv9XBkTVDn4u3
 dgIUzkjMAxwTSiUQMaC4MvT83zMeUP2nUdn+lphH5SjbI/HJborx73sus Q==;
X-CSE-ConnectionGUID: 4Q5YCeo7S4SwgjeeAD37nw==
X-CSE-MsgGUID: L1fN8E6ISwiwaYfckzQIFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50747436"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="50747436"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 05:38:27 -0700
X-CSE-ConnectionGUID: SeWPG3eJThGIXY2fBcYqrg==
X-CSE-MsgGUID: ENroJGyEQ6mpfXkp3Fq3IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="187850354"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 21 Oct 2025 05:38:25 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v5 3/5] drm/xe/vf: Fix GuC FW check for VF migration support
Date: Tue, 21 Oct 2025 14:39:41 +0200
Message-Id: <20251021123943.1436375-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251021123943.1436375-1-tomasz.lis@intel.com>
References: <20251021123943.1436375-1-tomasz.lis@intel.com>
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

The check whether GuC ABI version meets requirements shall be
performed after said version is received from GuC.

Doing it in wrong order was triggering a warning:
xe 0000:00:02.1: [drm] Assertion `gt->sriov.vf.guc_version.major` failed!

With this change, dislodge part of the VF migration support check
and moved it to after GuC handshake.

v2: Use xe_sriov_vf_ccs_migration_bb_needed()

v3: Update commit message, move check funct to ccs module (Michal),
 rename xe_sriov_vf_migration_disable(), remove its duplicate

v4: Limit scope of some functions to xe_sriov_vf_ccs file,
 switched 'Fixes:' tag to a different commit (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Tested-by: Matthew Brost <matthew.brost@intel.com> #v1
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349
Fixes: ff1d2b5e3d28 ("drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT")
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c     | 29 ++++++----------------
 drivers/gpu/drm/xe/xe_sriov_vf.h     |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 37 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  2 --
 4 files changed, 40 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 5ad39e315cb5..0a1331db2a9a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -133,7 +133,7 @@ bool xe_sriov_vf_migration_supported(struct xe_device *xe)
 	return !xe->sriov.vf.migration.disabled;
 }
 
-static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
+void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...)
 {
 	struct va_format vaf;
 	va_list va_args;
@@ -156,25 +156,15 @@ static void vf_migration_init_early(struct xe_device *xe)
 	 * supported at production quality.
 	 */
 	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
-		return vf_disable_migration(xe,
-					    "experimental feature not available on production builds");
+		return xe_sriov_vf_migration_disable(xe,
+				"experimental feature not available on production builds");
 
 	if (GRAPHICS_VER(xe) < 20)
-		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
-					    GRAPHICS_VER(xe));
-
-	if (!IS_DGFX(xe)) {
-		struct xe_uc_fw_version guc_version;
-
-		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
-		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
-			return vf_disable_migration(xe,
-						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
-						    guc_version.major, guc_version.minor);
-	}
+		return xe_sriov_vf_migration_disable(xe,
+				"requires gfx version >= 20, but only %u found",
+				GRAPHICS_VER(xe));
 
 	xe->sriov.vf.migration.disabled = false;
-	xe_sriov_dbg(xe, "migration support enabled\n");
 }
 
 /**
@@ -196,12 +186,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
  */
 int xe_sriov_vf_init_late(struct xe_device *xe)
 {
-	int err = 0;
-
-	if (xe_sriov_vf_migration_supported(xe))
-		err = xe_sriov_vf_ccs_init(xe);
-
-	return err;
+	return xe_sriov_vf_ccs_init(xe);
 }
 
 static int sa_info_vf_ccs(struct seq_file *m, void *data)
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
index 4df95266b261..e967d4166a43 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
@@ -14,6 +14,7 @@ struct xe_device;
 void xe_sriov_vf_init_early(struct xe_device *xe);
 int xe_sriov_vf_init_late(struct xe_device *xe);
 bool xe_sriov_vf_migration_supported(struct xe_device *xe);
+void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...);
 void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index a2d61b37ff21..11851c18513b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -10,6 +10,8 @@
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_exec_queue_types.h"
+#include "xe_gt_sriov_vf.h"
+#include "xe_guc.h"
 #include "xe_guc_submit.h"
 #include "xe_lrc.h"
 #include "xe_migrate.h"
@@ -260,21 +262,44 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
 	return err;
 }
 
-/**
- * xe_sriov_vf_migration_ccs_bb_needed - Whether GuC requires CCS copy BBs for VF migration.
+/*
+ * Whether GuC requires CCS copy BBs for VF migration.
  * @xe: the &xe_device instance.
  *
  * Only selected platforms require VF KMD to maintain CCS copy BBs and linked LRCAs.
  *
  * Return: true if VF driver must participate in the CCS migration, false otherwise.
  */
-bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe)
+static bool vf_migration_ccs_bb_needed(struct xe_device *xe)
 {
 	xe_assert(xe, IS_SRIOV_VF(xe));
 
 	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
 }
 
+/*
+ * Check for disable migration due to no CCS BBs support in GuC FW.
+ * @xe: the &xe_device instance.
+ *
+ * Performs late disable of VF migration feature in case GuC FW cannot support it.
+ */
+static void vf_migration_ccs_bb_support_check(struct xe_device *xe)
+{
+	if (!xe_sriov_vf_migration_supported(xe))
+		return;
+
+	if (vf_migration_ccs_bb_needed(xe)) {
+		struct xe_gt *gt = xe_device_get_gt(xe, 0);
+		struct xe_uc_fw_version guc_version;
+
+		xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
+		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
+			return xe_sriov_vf_migration_disable(xe,
+				"CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
+				guc_version.major, guc_version.minor);
+	}
+}
+
 static void xe_sriov_vf_ccs_fini(void *arg)
 {
 	struct xe_sriov_vf_ccs_ctx *ctx = arg;
@@ -307,9 +332,11 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 	int err;
 
 	xe_assert(xe, IS_SRIOV_VF(xe));
-	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
 
-	if (!xe_sriov_vf_migration_ccs_bb_needed(xe))
+	vf_migration_ccs_bb_support_check(xe);
+
+	if (!xe_sriov_vf_migration_supported(xe) ||
+	    !vf_migration_ccs_bb_needed(xe))
 		return 0;
 
 	for_each_ccs_rw_ctx(ctx_id) {
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index 0e6b27016dac..f8ca6efce9ee 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -14,8 +14,6 @@ struct drm_printer;
 struct xe_device;
 struct xe_bo;
 
-bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe);
-
 int xe_sriov_vf_ccs_init(struct xe_device *xe);
 int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
-- 
2.25.1

