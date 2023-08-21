Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0D9EE4993
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 11:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DA210E23D;
	Mon, 21 Aug 2023 11:57:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2993B10E234
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692619050; x=1724155050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3SupI2SixSCo1MULsKc2453x5Qfr52hbS+xq9MEMai8=;
 b=jFKyZ8zWkI9EiLuzIvbDthK/5KiUKI9uchaf6TJH3Sv8+nw6FMnK4heX
 YKQYdoyiO+9NOOpOtMGq334UjErA5Ln/Hk124eBVeMzwj7ztKRV7+6dcE
 OmvBMU+CdOTLzvWsgxljug0Ed33tqzOc16/bx+TQiFbBL7dG15f7+ueAJ
 FS8/6aBGSUE4+IhFAccHOG1L/bHeXt1+uPgkkPdZlSPrVP2W4lDRSlKK3
 gYBc00ef9ayftZbwCOwGnrP/o+LYqpxpqpkjw4iCJb4mS3s4x89u0Zhu7
 93+LYgL1lsv1mFAmazqzRznU4ueproJ1YwNFYmGDnj5AURSSI3l/JpE89 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="376317639"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="376317639"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="770918691"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="770918691"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 04:57:28 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 21 Aug 2023 17:37:28 +0530
Message-Id: <20230821120728.3871527-3-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
References: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Sysfs entries to query vram fused
 min, max frequency
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

Add sysfs entries to query fused min and max frequency of vram

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c    | 55 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h |  8 +++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index c03bb58e7049..d7e9609c74c0 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -20,6 +20,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
+#include "xe_pcode_api.h"
 
 #define MCHBAR_MIRROR_BASE_SNB	0x140000
 
@@ -568,6 +569,54 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(freq_max);
 
+static ssize_t freq_vram_rp0_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 val;
+	int err;
+
+	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+			      PCODE_MBOX_FC_SC_READ_FUSED_P0,
+			      PCODE_MBOX_DOMAIN_HBM, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(freq_vram_rp0);
+
+static ssize_t freq_vram_rpn_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 val;
+	int err;
+
+	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+			      PCODE_MBOX_FC_SC_READ_FUSED_PN,
+			      PCODE_MBOX_DOMAIN_HBM, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(freq_vram_rpn);
+
+static const struct attribute *vram_freq_attrs[] = {
+	&dev_attr_freq_vram_rp0.attr,
+	&dev_attr_freq_vram_rpn.attr,
+	NULL
+};
+
 /**
  * xe_guc_pc_c_status - get the current GT C state
  * @pc: XE_GuC_PC instance
@@ -921,6 +970,12 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc_init_fused_rp_values(pc);
 
+	if (IS_DGFX(xe) && xe->info.platform != XE_DG2) {
+		err = sysfs_create_files(gt->sysfs, vram_freq_attrs);
+		if (err)
+			return err;
+	}
+
 	err = sysfs_create_files(gt->sysfs, pc_attrs);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 837ff7c71280..846c99aba3bc 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -25,6 +25,14 @@
 #define PCODE_DATA0			XE_REG(0x138128)
 #define PCODE_DATA1			XE_REG(0x13812C)
 
+#define   XEHP_PCODE_FREQUENCY_CONFIG		0x6e	/* xehp, pvc */
+/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
+#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
+#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
+/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
+/*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
+#define     PCODE_MBOX_DOMAIN_HBM		0x2
+
 /* Min Freq QOS Table */
 #define   PCODE_WRITE_MIN_FREQ_TABLE	0x8
 #define   PCODE_READ_MIN_FREQ_TABLE	0x9
-- 
2.25.1

