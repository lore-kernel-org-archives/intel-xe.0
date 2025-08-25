Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87EFCA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 13:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9776210E473;
	Mon, 25 Aug 2025 13:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDNa16WT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C002E10E473
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 13:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756129201; x=1787665201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iAgYmYq0E8XhNXPOGOj7t4t6SCRqR8ERW8D5Lc0NYAI=;
 b=IDNa16WTxOIm4Tfp3vl4nqneS6hbWzxGPmKMCKOxguZNDUz7z0t8ejzM
 jzKNyjYe6zVw9rXAwACRHnIB1wvBoPbFwOyg1frmGwlC3PT/gr7nNc8gY
 cz1miIwJp7htF/xLXi32z5pGBrMusEwI/U0yIEPLYFuQubzM46lnxRUt5
 AQK4W5+dM5Duca6kP0ChvcI9iNveq6ZZSxwYkk04kww9Z74iAIEREXR0u
 69GA9gu1b9VhBr9GZ0avf7UY+C2jA5KoQstVEjq512my/S37ZM31CCv+3
 HBqkcCtI+mNl3CRBfqjHQgXvVThjb/YcfYpdtZS5BV1lG5dpA9MNzC8wG A==;
X-CSE-ConnectionGUID: k1zUWhsXQfKcVI7UgvoMiw==
X-CSE-MsgGUID: 9Y/HonkiQ9KrI9CgsftvYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69055631"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="69055631"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:40:00 -0700
X-CSE-ConnectionGUID: +MQt/stjRQeizuclScuU2w==
X-CSE-MsgGUID: E8KdxOKMRvyjNAiJfaVivg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="173483672"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 25 Aug 2025 06:39:58 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3] drm/xe/vf: Enable CCS save/restore only on supported GUC
 versions
Date: Mon, 25 Aug 2025 19:26:41 +0530
Message-ID: <20250825135641.4259-1-satyanarayana.k.v.p@intel.com>
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

---
V2 -> V3:
- Fixed review comments (Michal)

V1 -> V2:
- Fixed review comments (Michal)
---
 drivers/gpu/drm/xe/xe_sriov_vf.c       | 40 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c   |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_types.h |  5 ++++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 5de81f213d83..734e64a50f13 100644
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
@@ -133,7 +134,42 @@ static bool vf_migration_supported(struct xe_device *xe)
 	 * TODO: Add conditions to allow specific platforms, when they're
 	 * supported at production quality.
 	 */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+	xe_assert(xe, IS_SRIOV_VF(xe));
+	return xe->sriov.vf.migration.disabled;
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
+{
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_uc_fw_version *guc_version;
+
+	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
+		return vf_disable_migration(xe,
+					    "experimantal feature not available on production builds");
+
+	guc_version = &tile->primary_gt->sriov.vf.guc_version;
+	if (!IS_DGFX(xe) && MAKE_GUC_VER(guc_version->major, guc_version->minor,
+					 guc_version->patch) < MAKE_GUC_VER(1, 23, 0)) {
+		return vf_disable_migration(xe,
+					    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
+					    guc_version->major, guc_version->minor);
+	}
 }
 
 static void migration_worker_func(struct work_struct *w);
@@ -146,6 +182,8 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 {
 	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
 
+	vf_check_migration_support(xe);
+
 	if (!vf_migration_supported(xe))
 		xe_sriov_info(xe, "migration not supported by this module version\n");
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 4872e43eb440..05d3c680b3fa 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -268,6 +268,9 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 	xe_assert(xe, !IS_DGFX(xe));
 	xe_assert(xe, xe_device_has_flat_ccs(xe));
 
+	if (xe->sriov.vf.migration.disabled)
+		return 0;
+
 	for_each_ccs_rw_ctx(ctx_id) {
 		ctx = &tile->sriov.vf.ccs[ctx_id];
 		ctx->ctx_id = ctx_id;
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

