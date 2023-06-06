Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF6EC7EE24
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 09:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF8010E21B;
	Tue,  6 Jun 2023 09:23:49 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1586810E329
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686043427; x=1717579427;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TxFTLfp/RhuaJWGKT0RHAXz5ue5w0dlLoYmDSILj110=;
 b=Mqs5Gk3iD02h4MZawZksatgNHJ9jyEGGnCqmpwbIdhOOxjgFc8iN4DYl
 1FCt+oKK0YcBEphQEHE2D2iWpXo0y4nS40zcrn2nfSmqNhC+ZnjAfyrpk
 iq7N+LdX89oFaDRvRzEbfK563pO0G2sVqn3xhAlUc83oYSNZV6fOKBFQ5
 nZQfLCzXKpK0ZulpA/qNnEl8xWSY82dKN5O71IVq9P69p8URwAeJeWP1S
 JJw7xyxcjHBQFYdyY9zeI10tYT0Hv9S+is6JXdCAoH1DQkOSdid3R1ck9
 5d/MEvwPByyBbD9XLP7WS0XqOxSTHmFIPDDibSJSR8ECn0F8HDJo2fK/5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355466717"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="355466717"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 02:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="742075061"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="742075061"
Received: from sujaritha-z170x-ud5.fm.intel.com ([10.1.27.182])
 by orsmga001.jf.intel.com with ESMTP; 06 Jun 2023 02:23:46 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 01:21:42 -0700
Message-Id: <20230606082142.7846-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] [RFC]drm/xe: Sysfs entries to query fused min,
 max frequency of lmem
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

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h |  7 +++++
 drivers/gpu/drm/xe/xe_guc_pc.c    | 44 +++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 8be616a1bd51..bd7b26296402 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -101,4 +101,11 @@
 #define DSMBASE					XE_REG(0x1080C0)
 #define   BDSM_MASK				REG_GENMASK64(63, 20)
 
+#define   XEHP_PCODE_FREQUENCY_CONFIG           0x6e
+/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
+#define     PCODE_MBOX_FC_SC_READ_FUSED_P0      0x0
+#define     PCODE_MBOX_FC_SC_READ_FUSED_PN      0x1
+/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
+#define     PCODE_MBOX_DOMAIN_HBM               0x2
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 67faa9ee0006..1b349ce74c3d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -453,6 +453,48 @@ static ssize_t freq_rpn_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(freq_rpn);
 
+static ssize_t freq_mem_rp0_show(struct device *dev,
+				 struct device_attribute *attr, char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
+			    PCODE_MBOX_FC_SC_READ_FUSED_P0,
+			    PCODE_MBOX_DOMAIN_HBM, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(freq_mem_rp0);
+
+static ssize_t freq_mem_rpn_show(struct device *dev,
+				 struct device_attribute *attr, char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
+			    PCODE_MBOX_FC_SC_READ_FUSED_PN,
+			    PCODE_MBOX_DOMAIN_HBM, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(freq_mem_rpn);
+
 static ssize_t freq_min_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
@@ -631,6 +673,8 @@ static const struct attribute *pc_attrs[] = {
 	&dev_attr_freq_rp0.attr,
 	&dev_attr_freq_rpe.attr,
 	&dev_attr_freq_rpn.attr,
+	&dev_attr_freq_mem_rp0.attr,
+	&dev_attr_freq_mem_rpn.attr,
 	&dev_attr_freq_min.attr,
 	&dev_attr_freq_max.attr,
 	&dev_attr_rc_status.attr,
-- 
2.39.1

