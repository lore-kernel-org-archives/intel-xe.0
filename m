Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA754C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9597C10F9C5;
	Mon,  6 May 2024 13:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqLi3oyr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE1F10F07D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 13:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715002715; x=1746538715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xG3p8vF0zp1eT+9LZVqi1Gf6z76ZD1u+UiejMxUXBH4=;
 b=mqLi3oyrd+ACfeZ4i+8QDEgpeXvLv9XhzNZCmLCIVkmy3/MlUrgn9jgr
 MGTa2AI2FgxPjWDYk/c7pnOz4iuDlonWVsnlayD8RLG94xVMwxJnK7OxH
 a9JuXg7t8sVPpQElPvoi1G0Vxx6x7P7coyGUO6ZyDo9/rVgvqy4rr08mo
 DZRJkFDSYj8q1d+Ti4++Qn1O1CSo/X3Qlb51NJSz/arlzYjhGagCE9TAn
 5cVG2KtxqS9ySSDpqA7xYOajrFaiHSf+YzJfmwYDZuRDL/wExnuBs71zs
 6e/PHUVhHtF5nUTvInRGXwlx3atAklhoDwCC7emph4rb0gusKxYxwryFh w==;
X-CSE-ConnectionGUID: 2aCfSAQ2TAetbVJQB4pBTA==
X-CSE-MsgGUID: shIrU/2DQUODPhu3zP6nBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21903422"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21903422"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:34 -0700
X-CSE-ConnectionGUID: Mawh0fm+QTu+He48aUbLTw==
X-CSE-MsgGUID: mICLcIxbQXSj9HyF2AMU7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28131690"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/8] drm/xe/pf: Introduce functions to configure VF thresholds
Date: Mon,  6 May 2024 15:38:10 +0200
Message-Id: <20240506133814.2571-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240506133814.2571-1-michal.wajdeczko@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
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

The GuC firmware monitors VF's activity and notifies the PF driver
once any configured threshold related to such activity is exceeded.
Add functions to allow configuration of these thresholds per VF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 87 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  6 ++
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  4 +
 3 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 7eac01e04cc5..fd35375ccd1e 100644
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
+ * @threshold: the threshold index
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
+ * xe_gt_sriov_pf_config_get_threshold - Get VF's preemption timeout.
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

