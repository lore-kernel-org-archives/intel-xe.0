Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B04C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 19:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4B210E4B0;
	Tue, 14 May 2024 19:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRdIjAIv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433D610E4B0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 19:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715713266; x=1747249266;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UUdVwnQBixNtQtuVZe0y/HIY1a+r7BexEt/Z3WtgIzI=;
 b=jRdIjAIvh3hbZNMWYNQSuaKm75Qw4vXRa9hrvTby7AFdAfUZQWDbRc1Z
 z1xu1YvRWFe7DuyCMnqO8hWPc2roz6ZmQ345vQ/ZuGbLYOcXntvBKnM0V
 zHQAWYuaHv3of4bHTNRTXviSwaV0VKX3UJjtBgX2VfDqAdhSxBPZP4vHy
 GpUQGALKnG55c/jCJOtE5p+5EV7qBqQfZIQcSetECe/GRs9aw6byfLYw4
 DwfiLKcrRYa2SboF1mEG2lf4c6Y8rcINf0+coDKqGdvvPcb8CfJpRymMj
 SAGbB2UVmp/mTy1W9xYZsgGPZcc8SfgbKLLf9o2xblzh/YDqDCsbOmILL w==;
X-CSE-ConnectionGUID: cE0W592WQkWN0XZ8ZszkwA==
X-CSE-MsgGUID: lBfgjfraSOyLV6YK0hj4mg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11523182"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11523182"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:06 -0700
X-CSE-ConnectionGUID: oKrndJw2SyCkkhzLmTn9Ow==
X-CSE-MsgGUID: nG3LKxrJRXWHQQxQwseIqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35565509"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:05 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm/xe/pf: Introduce functions to configure VF
 thresholds
Date: Tue, 14 May 2024 21:00:11 +0200
Message-Id: <20240514190015.2172-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240514190015.2172-1-michal.wajdeczko@intel.com>
References: <20240514190015.2172-1-michal.wajdeczko@intel.com>
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

The GuC firmware monitors VF's activity and notifies the PF driver
once any configured threshold related to such activity is exceeded.
Add functions to allow configuration of these thresholds per VF.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: fix kernel-doc (Piotr, CI.hooks)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 87 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  6 ++
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  4 +
 3 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 7eac01e04cc5..f678cd1ad9c5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -25,6 +25,7 @@
 #include "xe_guc_fwif.h"
 #include "xe_guc_id_mgr.h"
 #include "xe_guc_klv_helpers.h"
+#include "xe_guc_klv_thresholds_set.h"
 #include "xe_guc_submit.h"
 #include "xe_lmtt.h"
 #include "xe_map.h"
@@ -208,6 +209,15 @@ static int pf_push_vf_cfg_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	return pf_push_vf_cfg_u64(gt, vfid, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, size);
 }
 
+static int pf_push_vf_cfg_threshold(struct xe_gt *gt, unsigned int vfid,
+				    enum xe_guc_klv_threshold_index index, u32 value)
+{
+	u32 key = xe_guc_klv_threshold_index_to_key(index);
+
+	xe_gt_assert(gt, key);
+	return pf_push_vf_cfg_u32(gt, vfid, key, value);
+}
+
 static struct xe_gt_sriov_config *pf_pick_vf_config(struct xe_gt *gt, unsigned int vfid)
 {
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
@@ -1748,6 +1758,83 @@ static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *c
 	config->preempt_timeout = 0;
 }
 
+static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
+				  enum xe_guc_klv_threshold_index index, u32 value)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+	int err;
+
+	err = pf_push_vf_cfg_threshold(gt, vfid, index, value);
+	if (unlikely(err))
+		return err;
+
+	config->thresholds[index] = value;
+
+	return 0;
+}
+
+static int pf_get_threshold(struct xe_gt *gt, unsigned int vfid,
+			    enum xe_guc_klv_threshold_index index)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+
+	return config->thresholds[index];
+}
+
+static const char *threshold_unit(u32 threshold)
+{
+	return threshold ? "" : "(disabled)";
+}
+
+/**
+ * xe_gt_sriov_pf_config_set_threshold - Configure threshold for the VF.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @index: the threshold index
+ * @value: requested value (0 means disabled)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
+					enum xe_guc_klv_threshold_index index, u32 value)
+{
+	u32 key = xe_guc_klv_threshold_index_to_key(index);
+	const char *name = xe_guc_klv_key_to_string(key);
+	int err;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	err = pf_provision_threshold(gt, vfid, index, value);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_config_set_u32_done(gt, vfid, value,
+				      xe_gt_sriov_pf_config_get_threshold(gt, vfid, index),
+				      name, threshold_unit, err);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_threshold - Get VF's threshold.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @index: the threshold index
+ *
+ * This function can only be called on PF.
+ *
+ * Return: value of VF's (or PF's) threshold.
+ */
+u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
+					enum xe_guc_klv_threshold_index index)
+{
+	u32 value;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	value = pf_get_threshold(gt, vfid, index);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return value;
+}
+
 static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 5e6b36f00b5b..e8238c1ad06a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+enum xe_guc_klv_threshold_index;
 struct drm_printer;
 struct xe_gt;
 
@@ -43,6 +44,11 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
 int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 					      u32 preempt_timeout);
 
+u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
+					enum xe_guc_klv_threshold_index index);
+int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
+					enum xe_guc_klv_threshold_index index, u32 value);
+
 int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
 int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
index d3745c355957..7bc66656fcc7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -8,6 +8,8 @@
 
 #include <drm/drm_mm.h>
 
+#include "xe_guc_klv_thresholds_set_types.h"
+
 struct xe_bo;
 
 /**
@@ -32,6 +34,8 @@ struct xe_gt_sriov_config {
 	u32 exec_quantum;
 	/** @preempt_timeout: preemption timeout in microseconds. */
 	u32 preempt_timeout;
+	/** @thresholds: GuC thresholds for adverse events notifications. */
+	u32 thresholds[XE_GUC_KLV_NUM_THRESHOLDS];
 };
 
 /**
-- 
2.43.0

