Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF601CCD1A5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 22:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBD910E66A;
	Tue, 21 Oct 2025 22:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMTPpIU5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5DA10E667
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 22:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086818; x=1792622818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N4F6qG7K8++HyAjweGowhPTXT3SaYPeZPPVbM1WbY1w=;
 b=NMTPpIU5c3hASIhwb5HIAUoyHHg9e3NjnsuwssGkQZAP1jcNuq1zzk7a
 xBYHj+9C3Je64aPxVFrLRinkw+BADwZZYNsloPgB0qSvnS2aVzD0CkJOt
 o6rR2kl3rBJXbcbj1yla1TM+szix0emfLSmggxj6VaHkQK/UnquRrl/bz
 fE31oV4AOqXDXbUlgApwHRYOMXo9cg9WKw2nUqg0LxVsYaXhSRzvtAkCg
 a2AlzsxBnC7j1OhMl8vIh9t/WteNYtEDoaqjJXIY8WczW3zmPRbj0RWAf
 AsWMlbu7FRMxEaoK2iX3eMcNBiaVTu3gFoSBJF2M31manmrOVKU55DamR w==;
X-CSE-ConnectionGUID: cRTaOGHvRICtjWEq9aS0wA==
X-CSE-MsgGUID: JvqcFWzmSG20jM8S5I1QMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67089090"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="67089090"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:46:57 -0700
X-CSE-ConnectionGUID: 11EqtxBERcG45EuSChJHlQ==
X-CSE-MsgGUID: w/irWFvrQ8+TeuvZSveAug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="188989358"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa004.fm.intel.com with ESMTP; 21 Oct 2025 15:46:56 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 2/4] drm/xe/vf: Fix GuC FW check for VF migration support
Date: Wed, 22 Oct 2025 00:48:15 +0200
Message-Id: <20251021224817.1593817-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251021224817.1593817-1-tomasz.lis@intel.com>
References: <20251021224817.1593817-1-tomasz.lis@intel.com>
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

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Tested-by: Matthew Brost <matthew.brost@intel.com> #v1
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349
Fixes: ff1d2b5e3d28 ("drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT")
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
v2: Use xe_sriov_vf_ccs_migration_bb_needed()

v3: Update commit message, move check funct to ccs module (Michal),
 rename xe_sriov_vf_migration_disable(), remove its duplicate

v4: Limit scope of some functions to xe_sriov_vf_ccs file,
 switched 'Fixes:' tag to a different commit (Michal)

v5: Squashed with "Helper for telling whether CCS migration BBs are
 needed", added kerneldoc, moved location of some checks (Michal)

v6: Typo, equivalent gt getter and exposing some conditionals (Michal)

 drivers/gpu/drm/xe/xe_sriov_vf.c     | 33 ++++++++------------
 drivers/gpu/drm/xe/xe_sriov_vf.h     |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 46 ++++++++++++++++++++++++++--
 3 files changed, 57 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 0d8135f3927c..13d6c094ae8f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -133,7 +133,12 @@ bool xe_sriov_vf_migration_supported(struct xe_device *xe)
 	return !xe->sriov.vf.migration.disabled;
 }
 
-static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
+/**
+ * xe_sriov_vf_migration_disable - Turn off VF migration with given log message.
+ * @xe: the &xe_device instance.
+ * @fmt: format string for the log message, to be combined with following VAs.
+ */
+void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...)
 {
 	struct va_format vaf;
 	va_list va_args;
@@ -156,22 +161,13 @@ static void vf_migration_init_early(struct xe_device *xe)
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
 }
 
 /**
@@ -193,12 +189,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
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
index 790249801364..797a4b866226 100644
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
@@ -260,6 +262,45 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
 	return err;
 }
 
+/*
+ * Whether GuC requires CCS copy BBs for VF migration.
+ * @xe: the &xe_device instance.
+ *
+ * Only selected platforms require VF KMD to maintain CCS copy BBs and linked LRCAs.
+ *
+ * Return: true if VF driver must participate in the CCS migration, false otherwise.
+ */
+static bool vf_migration_ccs_bb_needed(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
+}
+
+/*
+ * Check for disable migration due to no CCS BBs support in GuC FW.
+ * @xe: the &xe_device instance.
+ *
+ * Performs late disable of VF migration feature in case GuC FW cannot support it.
+ *
+ * Returns: True if VF migration with CCS BBs is supported, false otherwise.
+ */
+static bool vf_migration_ccs_bb_support_check(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_uc_fw_version guc_version;
+
+	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
+	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0)) {
+		xe_sriov_vf_migration_disable(xe,
+					      "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
+					      guc_version.major, guc_version.minor);
+		return false;
+	}
+
+	return true;
+}
+
 static void xe_sriov_vf_ccs_fini(void *arg)
 {
 	struct xe_sriov_vf_ccs_ctx *ctx = arg;
@@ -292,9 +333,10 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 	int err;
 
 	xe_assert(xe, IS_SRIOV_VF(xe));
-	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
 
-	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe))
+	if (!xe_sriov_vf_migration_supported(xe) ||
+	    !vf_migration_ccs_bb_needed(xe) ||
+	    !vf_migration_ccs_bb_support_check(xe))
 		return 0;
 
 	for_each_ccs_rw_ctx(ctx_id) {
-- 
2.25.1

