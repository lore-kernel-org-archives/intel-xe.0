Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4514DCD4F25
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 15:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD62010F280;
	Thu, 14 May 2026 15:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Smtgxvv+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1AF10F276
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 15:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778774258; x=1810310258;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4fy68kZfm9W/WMLX0BFuED8amNYh4P2M9qWtdVZW45I=;
 b=Smtgxvv+2wNJ6S4PoCDNJ+DJ3EGV15TjFrFUyC2/MSa3vI5/BncJWzXz
 WPBrkJooQRI+fWOnqX2BDC1iWctQ6aZskGJo7OdEubKwwRdbfaItBQodp
 8nFS2JYeN34OrqreeinXhIP2kjUdU413emuGJGsKcL3i3yBttRgYna0MP
 L6d91XYSZTqTrX32rh4L1dGtbMcdi7KC+B/LNGqMyfgcG4IwQ9akGdcLz
 7x1d6L6Z6WDhcfm0/1TWBTSgcaqSFceqgBAr1UxyzLsr8A43S/y/d2rLR
 EARkWtlPkfyVP4Vk8ga2fEg/2ZibDP15R9XzWV+44BqaH1mUslphpN8yA Q==;
X-CSE-ConnectionGUID: Ci0HotgeQA2PgpW0JFlxrg==
X-CSE-MsgGUID: HcgqTnMfS0WvmOUxPi0Lwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83587717"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="83587717"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:57:38 -0700
X-CSE-ConnectionGUID: NFZdWRNHTqCKIfJGR+Vjag==
X-CSE-MsgGUID: IL3Vs4YXRtW2B/+WeTzCoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="238303225"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:57:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
Subject: [PATCH] drm/xe/vf: Fix signature of print functions
Date: Thu, 14 May 2026 17:57:26 +0200
Message-ID: <20260514155726.7165-1-michal.wajdeczko@intel.com>
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

We have plugged-in existing VF print functions into our GT debugfs
show helper as-is, but we missed that the helper expects functions
to return int, while they were defined as void. This can lead to
errors being reported when CFI is enabled.

Fixes: 63d8cb8fe3dd ("drm/xe/vf: Expose SR-IOV VF attributes to GT debugfs")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
---
Alternatively, we may want to fix commit f2345ed5374e ("drm/xe/vf:
Add support for VF to query its configuration")
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 24 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  6 +++---
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 8989c8e1be95..0cd9d77f3351 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1137,13 +1137,15 @@ void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 }
 
 /**
- * xe_gt_sriov_vf_print_config - Print VF self config.
+ * xe_gt_sriov_vf_print_config() - Print VF self config.
  * @gt: the &xe_gt
  * @p: the &drm_printer
  *
  * This function is for VF use only.
+ *
+ * Return: always 0.
  */
-void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
+int xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
 	struct xe_device *xe = gt_to_xe(gt);
@@ -1170,16 +1172,20 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 
 	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
 	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
+
+	return 0;
 }
 
 /**
- * xe_gt_sriov_vf_print_runtime - Print VF's runtime regs received from PF.
+ * xe_gt_sriov_vf_print_runtime() - Print VF's runtime regs received from PF.
  * @gt: the &xe_gt
  * @p: the &drm_printer
  *
  * This function is for VF use only.
+ *
+ * Return: always 0.
  */
-void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
+int xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct vf_runtime_reg *vf_regs = gt->sriov.vf.runtime.regs;
 	unsigned int size = gt->sriov.vf.runtime.num_regs;
@@ -1188,16 +1194,20 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
 
 	for (; size--; vf_regs++)
 		drm_printf(p, "%#x = %#x\n", vf_regs->offset, vf_regs->value);
+
+	return 0;
 }
 
 /**
- * xe_gt_sriov_vf_print_version - Print VF ABI versions.
+ * xe_gt_sriov_vf_print_version() - Print VF ABI versions.
  * @gt: the &xe_gt
  * @p: the &drm_printer
  *
  * This function is for VF use only.
+ *
+ * Return: always 0.
  */
-void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
+int xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_uc_fw_version *guc_version = &gt->sriov.vf.guc_version;
@@ -1227,6 +1237,8 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 		   GUC_RELAY_VERSION_LATEST_MAJOR, GUC_RELAY_VERSION_LATEST_MINOR);
 	drm_printf(p, "\thandshake:\t%u.%u\n",
 		   pf_version->major, pf_version->minor);
+
+	return 0;
 }
 
 static bool vf_post_migration_shutdown(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index a6f7127521a5..79878f21b1da 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -35,9 +35,9 @@ bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
 
-void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
-void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
-void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
+int xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
+int xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
+int xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
 
 int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
 int xe_vf_migration_fixups_complete_count(struct xe_gt *gt);
-- 
2.47.1

