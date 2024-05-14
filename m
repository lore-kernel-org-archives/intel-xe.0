Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C7DC25B79
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 19:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE2610E53F;
	Tue, 14 May 2024 19:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKAL2QJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E32B10E4B0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 19:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715713268; x=1747249268;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=z6YiC5lG1TTwDVFvixtz1VnVYsTXydhipjGfW/Sxe9s=;
 b=dKAL2QJjzeo400gqc2A/Cr/qEMmld28bpwiWt1ZBMUljixRSdVkfgBpm
 gfnmdVA1i/PlVLcQ/nwBPqkbQbE19oEavr2S0AhPdNKCUkjmVZMwHj2Wq
 eQDPXukZDhRkQKnnzUUY/PnF9bfry3vnQi8/iyW8aeejcVjv/YSt1FSkO
 EhmEDBIRpQj1qo6a4nHV8CXrIBRJDVriKk/jnLsTzZcacYD3BwOw/1KPd
 2EDl0VssROo+ImfsRZWLux0NYjFABEVwXy6FbAnpWuRzZ2mCywh5hNh5G
 0rEwicZAA70NmEl9oQdYZYqjGhpVYlOg5kACsEKaedV1EAWTcmF/r4rp9 g==;
X-CSE-ConnectionGUID: b+2IKcNxSF+tanm0Y5NqDQ==
X-CSE-MsgGUID: gSEvhZwIQd2DlO3dcPJR5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11523183"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11523183"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:08 -0700
X-CSE-ConnectionGUID: M9BnJF7jRbSsJoSwQgfsCQ==
X-CSE-MsgGUID: h9aY6Eb7R+OnjD/DRT5gxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35565511"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:06 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/xe/pf: Allow configuration of VF thresholds over
 debugfs
Date: Tue, 14 May 2024 21:00:12 +0200
Message-Id: <20240514190015.2172-6-michal.wajdeczko@intel.com>
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

Initial values of all thresholds used by the GuC to monitor VF's
activity is zero (disabled) and we need to explicitly configure
them per each VF. Expose additional attributes over debugfs.

Definitions of all attributes are generated so we will not need
to make any changes if new thresholds would be added to the set.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 72 +++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 5102035faa7e..eb71c2009c34 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -197,6 +197,71 @@ DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(dbs, u32, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(preempt_timeout, u32, "%llu\n");
 
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── pf
+ *      │   │   ├── threshold_cat_error_count
+ *      │   │   ├── threshold_doorbell_time_us
+ *      │   │   ├── threshold_engine_reset_count
+ *      │   │   ├── threshold_guc_time_us
+ *      │   │   ├── threshold_irq_time_us
+ *      │   │   ├── threshold_page_fault_count
+ *      │   ├── vf1
+ *      │   │   ├── threshold_cat_error_count
+ *      │   │   ├── threshold_doorbell_time_us
+ *      │   │   ├── threshold_engine_reset_count
+ *      │   │   ├── threshold_guc_time_us
+ *      │   │   ├── threshold_irq_time_us
+ *      │   │   ├── threshold_page_fault_count
+ */
+
+static int set_threshold(void *data, u64 val, enum xe_guc_klv_threshold_index index)
+{
+	struct xe_gt *gt = extract_gt(data);
+	unsigned int vfid = extract_vfid(data);
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	if (val > (u32)~0ull)
+		return -EOVERFLOW;
+
+	xe_pm_runtime_get(xe);
+	err = xe_gt_sriov_pf_config_set_threshold(gt, vfid, index, val);
+	xe_pm_runtime_put(xe);
+
+	return err;
+}
+
+static int get_threshold(void *data, u64 *val, enum xe_guc_klv_threshold_index index)
+{
+	struct xe_gt *gt = extract_gt(data);
+	unsigned int vfid = extract_vfid(data);
+
+	*val = xe_gt_sriov_pf_config_get_threshold(gt, vfid, index);
+	return 0;
+}
+
+#define DEFINE_SRIOV_GT_THRESHOLD_DEBUGFS_ATTRIBUTE(THRESHOLD, INDEX)		\
+										\
+static int THRESHOLD##_set(void *data, u64 val)					\
+{										\
+	return set_threshold(data, val, INDEX);					\
+}										\
+										\
+static int THRESHOLD##_get(void *data, u64 *val)				\
+{										\
+	return get_threshold(data, val, INDEX);					\
+}										\
+										\
+DEFINE_DEBUGFS_ATTRIBUTE(THRESHOLD##_fops, THRESHOLD##_get, THRESHOLD##_set, "%llu\n")
+
+/* generate all threshold attributes */
+#define define_threshold_attribute(TAG, NAME, ...) \
+	DEFINE_SRIOV_GT_THRESHOLD_DEBUGFS_ATTRIBUTE(NAME, MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG));
+MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_threshold_attribute)
+#undef define_threshold_attribute
+
 static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigned int vfid)
 {
 	xe_gt_assert(gt, gt == extract_gt(parent));
@@ -217,6 +282,13 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 				   &exec_quantum_fops);
 	debugfs_create_file_unsafe("preempt_timeout_us", 0644, parent, parent,
 				   &preempt_timeout_fops);
+
+	/* register all threshold attributes */
+#define register_threshold_attribute(TAG, NAME, ...) \
+	debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent, \
+				   &NAME##_fops);
+	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
+#undef register_threshold_attribute
 }
 
 /*
-- 
2.43.0

