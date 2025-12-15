Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D97AD5B175
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 14:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AA910E51F;
	Mon, 15 Dec 2025 14:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BH9jve+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603F710E4F8
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765809497; x=1797345497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84ceibXT6ETMH+H09K5EhF5xfg6papNsOvEF8C7mwTA=;
 b=BH9jve+eJ8QMACxka+7Fz04eZCVoASrzWrAEJpwtKi8Dwtg7in9u0/lD
 tcl94XroNMU58FC5maZ/b3RkAhHj8FG46SL5feNhJTqHa4xxmERw56Gpw
 uE50Bnc0jL0CDLPbg1z1iBtE+lmoxdB5pkoRx37gND39tSDPaM3HsSUpO
 Z+BLGB9ih3Bvwb6/enx3Hxyhzy8YE87hJa99Cu2mIvYb+iwW/aFtULpqB
 BkVViFEaSKLbYBeadkbk/J+b/FIphrsrqpZ1rCi7/1vssp7Ol/Ve+eeFu
 KL90PCo/UnF7tbjb3uTSTQPWWuSrNadZwY4hYodKJ1aM1MJgdNmd4PnF7 Q==;
X-CSE-ConnectionGUID: 8Ugxe5+hQOqTSVmDycslUQ==
X-CSE-MsgGUID: wQGh/k9uTdSDDVQCMqxiBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85304129"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="85304129"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:38:11 -0800
X-CSE-ConnectionGUID: ibE7DBXvRri7EWt1V2m1lA==
X-CSE-MsgGUID: jJYkNYhBRq+kBPONZGwK/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="196828298"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:38:02 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 3/4] drm/xe/pf: Prepare for new threshold KLVs
Date: Mon, 15 Dec 2025 15:37:38 +0100
Message-ID: <20251215143739.196336-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215143739.196336-1-michal.wajdeczko@intel.com>
References: <20251215143739.196336-1-michal.wajdeczko@intel.com>
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

We want to extend our macro-based KLV list definitions with new
information about the version from which given KLV is supported.
Prepare our code generators to emit dedicated version check if
a KLV was defined with the version information.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> #v1
---
v2: rebased after patch split, use new macro
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++++++---
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  5 +++++
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 59c5c6b4d994..6e8507c24986 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -269,7 +269,8 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
 }
 
 /* Return: number of configuration dwords written */
-static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
+static u32 encode_config(struct xe_gt *gt, u32 *cfg, const struct xe_gt_sriov_config *config,
+			 bool details)
 {
 	u32 n = 0;
 
@@ -303,9 +304,11 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
 	cfg[n++] = config->preempt_timeout;
 
-#define encode_threshold_config(TAG, ...) ({					\
-	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
-	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+#define encode_threshold_config(TAG, NAME, VER...) ({					\
+	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER)) {		\
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
@@ -2551,11 +2554,13 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
 		return pf_provision_preempt_timeout(gt, vfid, value[0]);
 
 	/* auto-generate case statements */
-#define define_threshold_key_to_provision_case(TAG, ...)				\
+#define define_threshold_key_to_provision_case(TAG, NAME, VER...)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
+		if (IF_ARGS(!GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), false, VER))	\
+			return -EKEYREJECTED;						\
 		return pf_provision_threshold(gt, vfid,					\
 					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
 					      value[0]);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 0fd863609848..ece9eed5d7c5 100644
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
+#define register_threshold_attribute(TAG, NAME, VER...) ({				\
+	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER))		\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
+					   &NAME##_fops);				\
+});
 	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
 #undef register_threshold_attribute
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
index 0a028c94756d..5f84da3d10d3 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
@@ -24,6 +24,11 @@
  * ABI and the associated &NAME, that may be used in code or debugfs/sysfs::
  *
  *	define(TAG, NAME)
+ *
+ * If required, KLVs can be labeled with GuC firmware version that added them::
+ *
+ *	define(TAG, NAME, MAJOR, MINOR)
+ *	define(TAG, NAME, MAJOR, MINOR, PATCH)
  */
 #define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
 	define(CAT_ERR, cat_error_count)		\
-- 
2.47.1

