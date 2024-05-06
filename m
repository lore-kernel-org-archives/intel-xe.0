Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8AAC25B5F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1477310FDAB;
	Mon,  6 May 2024 13:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifCji08P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C076B10FD92
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715002716; x=1746538716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Qy59tIDl7GW/ewJ35GnFXX1f60DXZyDFdlPDDcs76I=;
 b=ifCji08PpXVOMrWujgBWh87koP/nHdT4w2TeSXcCOpPR8wN10YqVzv3q
 CVmPRNX2wg9UMdMKvuqBPgEWcgmhXVbi3LgQuCYzg43pyjTaqD8x0xWkZ
 /uzCan8W5gCkNqqNUuvNQPA/GVoijLe4ZCvtwCOEIaczatcHbP3dN4btr
 /G3R75V4s446S3YxbaGpmfmz4axMDZPYU2PnOB49xkWMjLA+gGU3aXU7i
 WObaXNGEpNOx46Cx3oJcEVkEsIwBoEuwSL2m3RXpO1V0drtpqT6pQlqO0
 Qthw6mRVsGHs13nL053KN0CS8aE5UESPQeAzhRUtUVQFQ7LQJVMPIEk5r g==;
X-CSE-ConnectionGUID: xfaETJSwTb2tZ9pyN5hnXA==
X-CSE-MsgGUID: xHo06mAqSjCdC09xgwJ5VQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21903423"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21903423"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:36 -0700
X-CSE-ConnectionGUID: 3IUklPg9SXKcMFKYgfSNhA==
X-CSE-MsgGUID: Nj/dbGAhQ12j+wD+wVvwcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28131702"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 5/8] drm/xe/pf: Allow configuration of VF thresholds over
 debugfs
Date: Mon,  6 May 2024 15:38:11 +0200
Message-Id: <20240506133814.2571-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240506133814.2571-1-michal.wajdeczko@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
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

