Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D42ED59D6F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 17:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2C910E919;
	Fri, 12 Dec 2025 17:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMJ76Wz1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C34710E304
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 17:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765560906; x=1797096906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=02zAKWPHnqXiOJ6btB7D/jycXO+RUMyuJs5qbCnPzY0=;
 b=DMJ76Wz1tFQPsFeYns7vvPygb8HeRbFh1luRxl/GSCVjJG/6oEqeIJvQ
 84WkpMRu7JPl/pOTQLZkxcbFEj6+73t+Yq9Ra1gQYtWWT/zVXtk+N4iHp
 fDw4tzzPED+Nu/1rKDDdTV4LxIwiwXqyH1pi02JW4U76Bl/wWpwRgWYg9
 zdjPW6Zjky4ZmQ7eOMdvOsYxo+9GfpdGCUw8MW0zwis38WiaJ78hsgOxq
 2jMcb77rrtn+3k3hmTUvwKDI7BGgkiiBInt8+IOxeQRHCeBtPBPw/aEJm
 nRbRrdI8mRHXlfgf+qq7kijpUb3K2hHJCWT8unxF/Wh3GENzHKzPvklDq A==;
X-CSE-ConnectionGUID: Z7Jii5tuQV6BTqKUPeErLg==
X-CSE-MsgGUID: GesSPGfeSQeQSSlStHSaqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71414749"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71414749"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 09:35:06 -0800
X-CSE-ConnectionGUID: 0XV3b4JXReK8FPEsDABogg==
X-CSE-MsgGUID: 1hwmMcXYR/yBF1gDFUZSsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="197205054"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 09:35:05 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 2/3] drm/xe/pf: Prepare for new threshold KLVs
Date: Fri, 12 Dec 2025 18:34:48 +0100
Message-ID: <20251212173449.192639-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212173449.192639-1-michal.wajdeczko@intel.com>
References: <20251212173449.192639-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 20 ++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++++++---
 drivers/gpu/drm/xe/xe_guc.h                   | 18 +++++++++++++++++
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  5 +++++
 4 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 59c5c6b4d994..2d039f67c99d 100644
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
+#define encode_threshold_config(TAG, NAME, VER...) ({						\
+	if (IF_ARGS(xe_guc_supports_fw_version(&gt->uc.guc, MAKE_GUC_VER_ARGS(VER)), true, VER)) { \
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);				\
+		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];		\
+	}											\
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
@@ -2551,11 +2554,14 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
 		return pf_provision_preempt_timeout(gt, vfid, value[0]);
 
 	/* auto-generate case statements */
-#define define_threshold_key_to_provision_case(TAG, ...)				\
+#define define_threshold_key_to_provision_case(TAG, NAME, VER...)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
+		if (IF_ARGS(!xe_guc_supports_fw_version(&gt->uc.guc, MAKE_GUC_VER_ARGS(VER)), \
+			    false, VER))						\
+			return -EKEYREJECTED;						\
 		return pf_provision_threshold(gt, vfid,					\
 					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
 					      value[0]);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 0fd863609848..5362c791a698 100644
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
+#define register_threshold_attribute(TAG, NAME, VER...) ({					\
+	if (IF_ARGS(xe_guc_supports_fw_version(&gt->uc.guc, MAKE_GUC_VER_ARGS(VER)), true, VER))\
+		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,		\
+					   &NAME##_fops);					\
+});
 	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
 #undef register_threshold_attribute
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index fdb08658d05a..2a083d5c5865 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -18,6 +18,9 @@
  */
 #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
 #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
+#define MAKE_GUC_VER_ARGS(ver...) \
+	MAKE_GUC_VER(PICK_ARG1(ver), PICK_ARG2(ver), IF_ARGS(PICK_ARG3(ver), 0, PICK_ARG3(ver)))
+
 #define GUC_SUBMIT_VER(guc) \
 	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
 #define GUC_FIRMWARE_VER(guc) \
@@ -96,4 +99,19 @@ static inline struct drm_device *guc_to_drm(struct xe_guc *guc)
 	return &guc_to_xe(guc)->drm;
 }
 
+/**
+ * xe_guc_supports_fw_version() - Check if GuC supports given version.
+ * @guc: the &xe_guc
+ * @ver: the version to check
+ *
+ * The @ver should be prepared using MAKE_GUC_VER(major, minor, patch).
+ *
+ * Return: true if loaded GuC firmware is at least of given version,
+ *         false otherwise.
+ */
+static inline bool xe_guc_supports_fw_version(struct xe_guc *guc, u32 ver)
+{
+	return GUC_FIRMWARE_VER(guc) >= ver;
+}
+
 #endif
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

