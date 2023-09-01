Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0799BCA0FE6
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 12:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68BD10E7B0;
	Fri,  1 Sep 2023 12:05:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7737E10E7B0
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693569937; x=1725105937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vcw9wwQdpBWUZ2HI1PYWaYRmCYXkjaRnts9K7I32Y2U=;
 b=iEBI4nBMx7sYBdZ7gyEhszaFOAYXOswxgm5UXttKn1YXauX/wwSI2QWZ
 uv9BlmWc//VB50ElsCvwZRVn20EK/qnC/+PLbHg1YtGHQFulFRLUA0VRA
 rz3VAmesp64tGM4S7bc9wGWllFWX6wvMZsgKGnUXW/zBgIsWplCnm1JVR
 DIa1g+IcobOXuK/PL1eFiGhYDvRtigMq3jT5Rf6pKyGjK4Q2Se5uOBnv9
 sLHVJNNBszTh7VUY1xAMNELHSyIpoD/Xp0z8XRjzGUzf1DS39+ohG3knz
 6t4H1wcMpREEjqctaaOuFVxhpxhSZQt2x6IkCRVIQUq9OlzoEpZyrd1Go Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379994934"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="379994934"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:05:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913666781"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="913666781"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga005.jf.intel.com with ESMTP; 01 Sep 2023 05:05:35 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Sep 2023 17:45:44 +0530
Message-Id: <20230901121545.361436-3-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Add base performance sysfs attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add the following attribute to Xe sysfs
- base_freq_factor
- base_freq_factor.scale
- base_freq_rp0
- base_freq_rpn

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c    | 116 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h |  19 +++++
 2 files changed, 135 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index c03bb58e7049..6a139d1dbf66 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -20,6 +20,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
+#include "xe_pcode_api.h"
 
 #define MCHBAR_MIRROR_BASE_SNB	0x140000
 
@@ -37,6 +38,9 @@
 #define GT_FREQUENCY_MULTIPLIER	50
 #define GEN9_FREQ_SCALER	3
 
+#define U8_8_VAL_MASK           0xffff
+#define U8_8_SCALE_TO_VALUE     "0.00390625"
+
 /**
  * DOC: GuC Power Conservation (PC)
  *
@@ -642,6 +646,112 @@ static const struct attribute *pc_attrs[] = {
 	NULL
 };
 
+static ssize_t freq_factor_scale_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buff)
+{
+	return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
+}
+
+static ssize_t base_freq_factor_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = xe_pcode_read_p(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
+				PCODE_MBOX_DOMAIN_CHIPLET,
+				PCODE_MBOX_DOMAIN_BASE, &val);
+	if (err)
+		return err;
+
+	val &= U8_8_VAL_MASK;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+
+static ssize_t base_freq_factor_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buff, size_t count)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = kstrtou32(buff, 0, &val);
+	if (err)
+		return err;
+
+	if (val > U8_8_VAL_MASK)
+		return -EINVAL;
+
+	err = xe_pcode_write_p(gt, PVC_PCODE_QOS_MULTIPLIER_SET,
+				PCODE_MBOX_DOMAIN_CHIPLET,
+				PCODE_MBOX_DOMAIN_BASE, val);
+	if (err)
+		return err;
+
+	return count;
+}
+static DEVICE_ATTR_RW(base_freq_factor);
+static struct device_attribute dev_attr_base_freq_factor_scale =
+	__ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, NULL);
+
+
+static ssize_t base_freq_rp0_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+				PCODE_MBOX_FC_SC_READ_FUSED_P0,
+				PCODE_MBOX_DOMAIN_BASE, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(base_freq_rp0);
+
+static ssize_t base_freq_rpn_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+				PCODE_MBOX_FC_SC_READ_FUSED_PN,
+				PCODE_MBOX_DOMAIN_BASE, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused Pn for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(base_freq_rpn);
+
+static const struct attribute *pvc_perf_power_attrs[] = {
+	&dev_attr_base_freq_factor.attr,
+	&dev_attr_base_freq_factor_scale.attr,
+	&dev_attr_base_freq_rp0.attr,
+	&dev_attr_base_freq_rpn.attr,
+	NULL
+};
+
 static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
@@ -925,6 +1035,12 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	if (err)
 		return err;
 
+	if (xe->info.platform == XE_PVC) {
+		err = sysfs_create_files(gt->sysfs, pvc_perf_power_attrs);
+		if (err)
+			return err;
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, pc_fini, pc);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 837ff7c71280..da4114bfaa7a 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -30,6 +30,25 @@
 #define   PCODE_READ_MIN_FREQ_TABLE	0x9
 #define   PCODE_FREQ_RING_RATIO_SHIFT	16
 
+#define   XEHP_PCODE_FREQUENCY_CONFIG			0x6e	/* xehp, pvc */
+/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
+#define     PCODE_MBOX_FC_SC_READ_FUSED_P0		0x0
+#define     PCODE_MBOX_FC_SC_READ_FUSED_PN		0x1
+/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
+/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
+#define     PCODE_MBOX_DOMAIN_NONE			0x0
+#define     PCODE_MBOX_DOMAIN_GT			0x1
+#define     PCODE_MBOX_DOMAIN_HBM			0x2
+#define     PCODE_MBOX_DOMAIN_MEDIAFF			0x3
+#define     PCODE_MBOX_DOMAIN_MEDIA_SAMPLER		0x4
+#define     PCODE_MBOX_DOMAIN_SYSTOLIC_ARRAY		0x5
+#define     PCODE_MBOX_DOMAIN_CHIPLET			0x6
+#define     PCODE_MBOX_DOMAIN_BASE_CHIPLET_LINK		0x7
+#define     PCODE_MBOX_DOMAIN_BASE			0x8
+#define   PVC_PCODE_QOS_MULTIPLIER_SET			0x67
+/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
+#define   PVC_PCODE_QOS_MULTIPLIER_GET			0x66
+
 /* PCODE Init */
 #define   DGFX_PCODE_STATUS		0x7E
 #define     DGFX_GET_INIT_STATUS	0x0
-- 
2.25.1

