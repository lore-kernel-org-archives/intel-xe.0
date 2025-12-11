Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DD0D3E783
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7614C10E6D4;
	Thu, 11 Dec 2025 01:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMUov8az";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD4710E6D3
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765418244; x=1796954244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Jc4gqg0iMp9Wu0U6T+qvoUWfsUCJj25peqyvSkHjTs=;
 b=XMUov8azhcwGIg0U5uJIAMAdGgLeu/tZsjUIn1qpGaVYZWVvWeFUF5v5
 U4C9s3+AbExZKtzcxmNOtYvU8A1T5VPD9LIu0SYFh5YEi8YCL11z3F4uS
 83X2BePoBKkz7Wca03uL7PmnWFkW/ReldJksH+75NTSJ+oW+LW9pfKGHv
 nHxKRFhU/UdCEH+q7bBfxmh4dg4nirXoF0xLpKE119llCu2xK2+0YOL7b
 DD0h5Td4CiV6aufJugzBSyPzzAxAMWgCqM+LxlZCRGTn+4z3m21S0amCU
 9RXerC8hZDRGVypxCId8siedQKWCkWtmagmc0m9+BQQgqSb8fZk8yryAB A==;
X-CSE-ConnectionGUID: c47kj1yORQiaRvxgMCG4Xg==
X-CSE-MsgGUID: HWn+GA2QSqqYtaKq8VyFug==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71244488"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="71244488"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:24 -0800
X-CSE-ConnectionGUID: ht45VOkPSIavd5yt+qGO+Q==
X-CSE-MsgGUID: ZcDJvc69RGqQ51mPXyeasg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196676776"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:24 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 06/12] drm/xe/sriov: Add handling for MLRC adverse event
 threshold
Date: Wed, 10 Dec 2025 17:57:05 -0800
Message-ID: <20251211015700.34266-20-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
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

Since it is illegal to register a MLRC context when scheduler groups are
enabled, the GuC consider the VF doing so as an adverse event. Like for
other adverse event, there is a threshold for how many times the event
can happen before the GuC throws an error, which we need to add support
for.

Since this is the first threshold that we have that has a minimum GuC
version requirement, support for checking that has been added to the
generic threshold handling.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: split from previous patch, add GuC version checking
v3: don't move version code to its own file, call MAKE_GUC_VER from the
caller instead.
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  9 +++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++++++---
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  | 17 +++++++++--------
 4 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 5f791237d0ab..186d4fa162c9 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -378,6 +378,12 @@ enum  {
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
@@ -436,6 +442,9 @@ enum  {
 #define   GUC_SCHED_PRIORITY_NORMAL		1u
 #define   GUC_SCHED_PRIORITY_HIGH		2u
 
+#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
+#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
+
 /*
  * Workaround keys:
  */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 59c5c6b4d994..3d9bfdd305c9 100644
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
+#define encode_threshold_config(TAG, NAME, MAJ, MIN) ({					\
+	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0)) {	\
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
+#define define_threshold_key_to_provision_case(TAG, NAME, MAJ, MIN)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (MAJ && GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(MAJ, MIN, 0))	\
+			return -ENOKEY;							\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
 		return pf_provision_threshold(gt, vfid,					\
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 0fd863609848..7833a7118039 100644
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
+#define register_threshold_attribute(TAG, NAME, MAJ, MIN) ({				\
+	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0))		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});
 	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
 #undef register_threshold_attribute
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
index 0a028c94756d..611a99224888 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
@@ -23,15 +23,16 @@
  * with the &TAG, that corresponds to the GuC threshold KLV key name defined by
  * ABI and the associated &NAME, that may be used in code or debugfs/sysfs::
  *
- *	define(TAG, NAME)
+ *	define(TAG, NAME, MIN_GUC_VER_MAJ, MIN_GUC_VER_MIN)
  */
-#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
-	define(CAT_ERR, cat_error_count)		\
-	define(ENGINE_RESET, engine_reset_count)	\
-	define(PAGE_FAULT, page_fault_count)		\
-	define(H2G_STORM, guc_time_us)			\
-	define(IRQ_STORM, irq_time_us)			\
-	define(DOORBELL_STORM, doorbell_time_us)	\
+#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)					\
+	define(CAT_ERR, cat_error_count, 0, 0)					\
+	define(ENGINE_RESET, engine_reset_count, 0, 0)				\
+	define(PAGE_FAULT, page_fault_count, 0, 0)				\
+	define(H2G_STORM, guc_time_us, 0, 0)					\
+	define(IRQ_STORM, irq_time_us, 0, 0)					\
+	define(DOORBELL_STORM, doorbell_time_us, 0, 0)				\
+	define(MULTI_LRC_COUNT, multi_lrc_count, 70, 53)			\
 	/* end */
 
 /**
-- 
2.43.0

