Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC57C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6124C10E146;
	Tue, 30 May 2023 10:26:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE4310E141
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685442395; x=1716978395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+7DXmXIM9p3gMLKHXhPz1sI5nLK1Nd91F60D+GComF0=;
 b=Gsca0Z7sYrFva7NQI5kcSmJgB3M3+quSDUHjIjPekbWXE5VXaGnfy4h6
 p2nJUjKGKUc7I0L30t4UzZagKKW8i9YUzIXeV6RyzLOESuW5L+lxoXkTc
 YH8kh+H7/9Iivv7uhgscfEkFEFlGnkXsNp6LtgwvXKGN5YWuv+YezgacT
 Utg74681iJkYsGekpk4F42Z5QmHzpSjKargODtSZQkV4x/6aEKwthexGn
 KJa1J7tfkqdSKjJDZBRflZWk1Q9fsdnbZ1J8hJNiYklDxaRiODhPoR+ST
 5R1Qbf/+CPDKYc2eauudebLEI7Qi94vK3xmNq95ZgflLk0gEOYu0NlCy7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="383131113"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="383131113"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="880715099"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="880715099"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga005.jf.intel.com with ESMTP; 30 May 2023 03:26:33 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 16:04:21 +0530
Message-Id: <20230530103421.2824622-2-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530103421.2824622-1-sujaritha.sundaresan@intel.com>
References: <20230530103421.2824622-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] [RFC]drm/xe: Adding throttle reasons sysfs
 attributes
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

Adding throttle reasons sysfs attributes.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +++++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 67 ++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index e64e5c0733d6..e7fe8a3e348e 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -374,4 +374,16 @@
 #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
 #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
 
+#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
+#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
+#define   PROCHOT_MASK				REG_BIT(0)
+#define   THERMAL_LIMIT_MASK			REG_BIT(1)
+#define   RATL_MASK				REG_BIT(5)
+#define   VR_THERMALERT_MASK			REG_BIT(6)
+#define   VR_TDC_MASK				REG_BIT(7)
+#define   POWER_LIMIT_4_MASK			REG_BIT(8)
+#define   POWER_LIMIT_1_MASK			REG_BIT(10)
+#define   POWER_LIMIT_2_MASK			REG_BIT(11)
+#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e799faa1c6b8..363332881e4d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -638,6 +638,73 @@ static const struct attribute *pc_attrs[] = {
 	NULL
 };
 
+static inline
+xe_reg_t xe_gt_perf_limit_reasons_reg(struct xe_gt *gt)
+{
+        if (xe_gt_is_media_type(gt))
+                return MTL_MEDIA_PERF_LIMIT_REASONS;
+
+        return GT0_PERF_LIMIT_REASONS;
+}
+
+struct xe_gt_bool_throttle_attr {
+	struct attribute attr;
+	ssize_t (*show)(struct device *dev, struct device_attribute *attr,
+			char *buf);
+	xe_reg_t (*reg32)(struct xe_gt *gt);
+	u32 mask;
+};
+
+bool xe_mmio_mask_read(struct xe_gt *gt,
+			xe_reg_t reg32, u32 mask)
+{
+	return xe_mmio_read32(gt, reg32) & mask;
+}
+
+static ssize_t throttle_reason_bool_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	struct xe_gt_bool_throttle_attr *t_attr =
+			(struct xe_gt_bool_throttle_attr *) attr;
+	bool val = xe_mmio_mask_read(&gt->rps, t_attr->reg32(gt), t_attr->mask);
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+
+#define XE_GT_BOOL_ATTR_RO(sysfs_func__, mask__) \
+struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
+	.attr = { .name = __stringify(sysfs_func__), .mode = 0444 }, \
+	.show = throttle_reason_bool_show, \
+	.reg32 = xe_gt_perf_limit_reasons_reg, \
+	.mask = mask__, \
+}
+
+static XE_GT_BOOL_ATTR_RO(throttle_reason_status, GT0_PERF_LIMIT_REASONS_MASK);
+static XE_GT_BOOL_ATTR_RO(throttle_reason_pl1, POWER_LIMIT_1_MASK);
+static XE_GT_BOOL_ATTR_RO(throttle_reason_pl2, POWER_LIMIT_2_MASK);
+static XE_GT_BOOL_ATTR_RO(throttle_reason_pl4, POWER_LIMIT_4_MASK);
+static XE_GT_BOOL_ATTR_RO(throttle_reason_thermal, THERMAL_LIMIT_MASK);
+static XE_GT_BOOL_ATTR_RO(throttle_reason_prochot, PROCHOT_MASK);
+static XE_GT_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
+static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
+static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
+
+static const struct attribute *throttle_reason_attrs[] = {
+	&dev_attr_throttle_reason_status.attr,
+	&dev_attr_throttle_reason_pl1.attr,
+	&dev_attr_throttle_reason_pl2.attr,
+	&dev_attr_throttle_reason_pl4.attr,
+	&dev_attr_throttle_reason_thermal.attr,
+	&dev_attr_throttle_reason_prochot.attr,
+	&dev_attr_throttle_reason_ratl.attr,
+	&dev_attr_throttle_reason_vr_thermalert.attr,
+	&dev_attr_throttle_reason_vr_tdc.attr,
+	NULL
+};
+
 static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
-- 
2.25.1

