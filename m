Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CB8D3B7E6
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 23:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0105110E314;
	Sat,  6 Dec 2025 23:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVEO3jsD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07E910E314
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 23:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765062255; x=1796598255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zh1X2eTEQJ0ZaZl2ocHNHupBC3pzbyzhZz90bVFVwj8=;
 b=SVEO3jsD+ho69UVBb7gmBtj2aam+lMno/VNwLNkvoEEcyUrG4QaM0gR8
 3rysGPyXGIxMJoHTnF56aTaHF+NaXjJaKqYKsOA6BQ5QS1lStJ48cD4eD
 suYJWYvaXlWKufzZ5qdNdz4W9M98XeX3Sfo5ZFx1gI4BDvQyb3TLb40NR
 ew/j8lqkI0/fV91uxAoUuhXCoG4l1a3AmgoIc1LYPBM1pK146qO7h0ye9
 KIdBCCMW5Q01V1sfjT9rwe2eVMik1U27FN0LRjFGMXtMtuHUKE07dbLKq
 1hrz1i/s8qIUTpo2XkYN9PWKLxF2J3C8TjzJ+G2vdKHRlMqG85LRdig42 g==;
X-CSE-ConnectionGUID: 26+m/hBwSqq7Co3uOZ8Bfg==
X-CSE-MsgGUID: QQkMlp+NTsWadUpKlnygyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78411686"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="78411686"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:15 -0800
X-CSE-ConnectionGUID: +1h8NZOoTzO0JbvTQhFw2g==
X-CSE-MsgGUID: UEJA2KoPTCy7F3OVbJZ0yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="200045512"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:14 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 05/11] drm/xe/sriov: Add handling for MLRC adverse event
 threshold
Date: Sat,  6 Dec 2025 15:04:01 -0800
Message-ID: <20251206230356.3600292-18-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since it is illegal to register a MLRC context when scheduler groups are
enabled, the GuC consider the VF doing so as an adverse event. Like for
other adverse event, there is a threshold for how many times the event
can happen before the GuC throws an error, which we need to add support
for.

Since this is the first threshold that we have that has a minimum GuC
version requirement, support for checking that has been added to the
generic threshold handling. As part of it, some of the version code has
been moved to its own file and with the occasion some SRIOV
documentation has been added.

v2: split from previous patch, add GuC version checking

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  9 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 +++--
 drivers/gpu/drm/xe/xe_guc.h                   |  7 +---
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  | 18 +++++-----
 drivers/gpu/drm/xe/xe_guc_version.h           | 36 +++++++++++++++++++
 6 files changed, 74 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_version.h

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index edb0546fb163..30a051a0b4ee 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -376,6 +376,12 @@ enum  {
  *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
  *      :2: HIGH = schedule VF in the next time-slice after current active
  *          time-slice completes if it has active work
+ *
+ * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
+ *      Given that multi-LRC contexts are incompatible with SRIOV scheduler
+ *      groups and cause the latter to be turned off when registered with the
+ *      GuC, this config allows the PF to set a threshold for multi-LRC context
+ *      registrations by VFs to monitor their behavior.
  */
 
 #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
@@ -434,6 +440,9 @@ enum  {
 #define   GUC_SCHED_PRIORITY_NORMAL		1u
 #define   GUC_SCHED_PRIORITY_HIGH		2u
 
+#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
+#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
+
 /*
  * Workaround keys:
  */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 59c5c6b4d994..dda671d05b89 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -269,7 +269,8 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
 }
 
 /* Return: number of configuration dwords written */
-static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
+static u32 encode_config(struct xe_gt *gt, u32 *cfg,
+			 const struct xe_gt_sriov_config *config, bool details)
 {
 	u32 n = 0;
 
@@ -303,9 +304,11 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
 	cfg[n++] = config->preempt_timeout;
 
-#define encode_threshold_config(TAG, ...) ({					\
-	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
-	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+#define encode_threshold_config(TAG, NAME, MIN_GUC_VER) ({				\
+	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER) {		\
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+	}										\
 });
 
 	MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
@@ -328,7 +331,7 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
 		return -ENOBUFS;
 
 	cfg = xe_guc_buf_cpu_ptr(buf);
-	num_dwords = encode_config(cfg, config, true);
+	num_dwords = encode_config(gt, cfg, config, true);
 	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
 
 	if (xe_gt_is_media_type(gt)) {
@@ -2518,7 +2521,7 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
 			ret = -ENOBUFS;
 		} else {
 			config = pf_pick_vf_config(gt, vfid);
-			ret = encode_config(buf, config, false) * sizeof(u32);
+			ret = encode_config(gt, buf, config, false) * sizeof(u32);
 		}
 	}
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
@@ -2551,9 +2554,11 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
 		return pf_provision_preempt_timeout(gt, vfid, value[0]);
 
 	/* auto-generate case statements */
-#define define_threshold_key_to_provision_case(TAG, ...)				\
+#define define_threshold_key_to_provision_case(TAG, NAME, MIN_GUC_VER)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (MIN_GUC_VER && GUC_FIRMWARE_VER(&gt->uc.guc) < MIN_GUC_VER)		\
+			return -ENOKEY;							\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
 		return pf_provision_threshold(gt, vfid,					\
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 0fd863609848..5123ff1fb116 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -21,6 +21,7 @@
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_pf_service.h"
+#include "xe_guc.h"
 #include "xe_pm.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_provision.h"
@@ -301,9 +302,11 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 				   &sched_priority_fops);
 
 	/* register all threshold attributes */
-#define register_threshold_attribute(TAG, NAME, ...) \
-	debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent, \
-				   &NAME##_fops);
+#define register_threshold_attribute(TAG, NAME, MIN_GUC_VER) ({				\
+	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER)		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});
 	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
 #undef register_threshold_attribute
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index fdb08658d05a..9028718189ed 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -8,15 +8,10 @@
 
 #include "xe_gt.h"
 #include "xe_guc_types.h"
+#include "xe_guc_version.h"
 #include "xe_hw_engine_types.h"
 #include "xe_macros.h"
 
-/*
- * GuC version number components are defined to be only 8-bit size,
- * so converting to a 32bit 8.8.8 integer allows simple (and safe)
- * numerical comparisons.
- */
-#define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
 #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
 #define GUC_SUBMIT_VER(guc) \
 	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
index 0a028c94756d..f7ed32244c6b 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
@@ -7,6 +7,7 @@
 #define _XE_GUC_KLV_THRESHOLDS_SET_TYPES_H_
 
 #include "xe_args.h"
+#include "xe_guc_version.h"
 
 /**
  * MAKE_XE_GUC_KLV_THRESHOLDS_SET - Generate various GuC thresholds definitions.
@@ -23,15 +24,16 @@
  * with the &TAG, that corresponds to the GuC threshold KLV key name defined by
  * ABI and the associated &NAME, that may be used in code or debugfs/sysfs::
  *
- *	define(TAG, NAME)
+ *	define(TAG, NAME, MIN_GUC_VER)
  */
-#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
-	define(CAT_ERR, cat_error_count)		\
-	define(ENGINE_RESET, engine_reset_count)	\
-	define(PAGE_FAULT, page_fault_count)		\
-	define(H2G_STORM, guc_time_us)			\
-	define(IRQ_STORM, irq_time_us)			\
-	define(DOORBELL_STORM, doorbell_time_us)	\
+#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)					\
+	define(CAT_ERR, cat_error_count, 0)					\
+	define(ENGINE_RESET, engine_reset_count, 0)				\
+	define(PAGE_FAULT, page_fault_count, 0)					\
+	define(H2G_STORM, guc_time_us, 0)					\
+	define(IRQ_STORM, irq_time_us, 0)					\
+	define(DOORBELL_STORM, doorbell_time_us, 0)				\
+	define(MULTI_LRC_COUNT, multi_lrc_count, MAKE_GUC_VER(70, 53, 0))	\
 	/* end */
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_version.h b/drivers/gpu/drm/xe/xe_guc_version.h
new file mode 100644
index 000000000000..e6f80abd2f05
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_version.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GUC_VERSION_H_
+#define _XE_GUC_VERSION_H_
+
+/*
+ * GuC version number components are defined to be only 8-bit size,
+ * so converting to a 32bit 8.8.8 integer allows simple (and safe)
+ * numerical comparisons.
+ */
+#define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
+
+/**
+ * DOC: SRIOV-changes
+ *
+ * We record SRIOV-specific changes here as those need to be tracked carefully.
+ *
+ * GuC 70.53.0 (VF interface 1.26.0):
+ *
+ * Added support for EGS. See:
+ *  * GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG
+ *  * GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT
+ *
+ * GuC 70.54.0 (VF interface 1.27.0):
+ *
+ * Updated VF migration support. See RESFIX actions
+ *
+ * GuC 70.55.1 (VF interface 1.28.1):
+ *
+ * Fixes for EGS.
+ */
+
+#endif
-- 
2.43.0

