Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E042BCCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 20:56:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A098D10E513;
	Mon, 20 Oct 2025 20:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqFMSqml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0245E10E511
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 20:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760993812; x=1792529812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6PDNMjUAYdN/UZv7hc1Eiq5dveo0HbmzvuhcQcZlAyg=;
 b=dqFMSqmlsqZQ40ZeumwGu7OeV+bGQxzJYuiZn5LPl6Mkg/dr/Z/xL8LF
 +vzkzzDVunHWgnT+EhUERZkAEn0Bv+ZQxP0olSwm5e84VnauaKPfb+V+Q
 nWEIDN4HbtRYvypWfj3w6HMrVWofkIFkY5fOzY20fmhG2/4vIB8jbnMn4
 Uf1ubd9EY1LJm/kbu+qr8KOK8MTixNBH9NTqXR15xm1kAiOgFqwzIiUV6
 a/HQSOacz11LeOyLiBgOPTp5CZc5Sy8tcGU9Udjra7Hm4Jrx1d9ZK961d
 9Rr8AlhwwzdiGkgdEd6BX9Vuv++RtQZeLFUubOeMuM0pNKUzesfAfbHDG g==;
X-CSE-ConnectionGUID: LiW9uYRhQOup0YXJXv8GIA==
X-CSE-MsgGUID: 0SBWa7oURf+hWx1K1nWITw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63036088"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63036088"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 13:56:51 -0700
X-CSE-ConnectionGUID: xlcrLQ4HSW6MDXkzB/BvnQ==
X-CSE-MsgGUID: x7tAJf2pSQGGlBZnBeCC0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="184196590"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2025 13:56:49 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 2/4] drm/xe/vf: Fix GuC FW check for VF migration support
Date: Mon, 20 Oct 2025 22:58:06 +0200
Message-Id: <20251020205808.1187308-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251020205808.1187308-1-tomasz.lis@intel.com>
References: <20251020205808.1187308-1-tomasz.lis@intel.com>
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

Tested-by: Matthew Brost <matthew.brost@intel.com> #v1
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349
Fixes: be5590c384f3 ("drm/xe/vf: Enable CCS save/restore only on supported GUC versions")
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c     | 24 ++++++++----------------
 drivers/gpu/drm/xe/xe_sriov_vf.h     |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
 4 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 911d5720917b..3a3cd9c35aa8 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -133,7 +133,7 @@ bool xe_sriov_vf_migration_supported(struct xe_device *xe)
 	return xe->sriov.vf.migration.enabled;
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
 
 	xe->sriov.vf.migration.enabled = true;
-	xe_sriov_dbg(xe, "migration support enabled\n");
 }
 
 /**
@@ -198,6 +188,8 @@ int xe_sriov_vf_init_late(struct xe_device *xe)
 {
 	int err = 0;
 
+	xe_sriov_vf_migration_ccs_bb_support_check(xe);
+
 	if (xe_sriov_vf_migration_supported(xe))
 		err = xe_sriov_vf_ccs_init(xe);
 
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
index a2d61b37ff21..02d0fcd26399 100644
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
@@ -275,6 +277,29 @@ bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe)
 	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
 }
 
+/**
+ * xe_sriov_vf_migration_ccs_bb_support_check - Check for disable migration due to FW version.
+ * @xe: the &xe_device instance.
+ *
+ * Performs late disable of VF migration feature in case GuC FW cannot support it.
+ */
+void xe_sriov_vf_migration_ccs_bb_support_check(struct xe_device *xe)
+{
+	if (!xe_sriov_vf_migration_supported(xe))
+		return;
+
+	if (xe_sriov_vf_migration_ccs_bb_needed(xe)) {
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
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index 0e6b27016dac..2844628269d1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -15,6 +15,7 @@ struct xe_device;
 struct xe_bo;
 
 bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe);
+void xe_sriov_vf_migration_ccs_bb_support_check(struct xe_device *xe);
 
 int xe_sriov_vf_ccs_init(struct xe_device *xe);
 int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
-- 
2.25.1

