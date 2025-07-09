Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A62C83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 15:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DC910E06E;
	Wed,  9 Jul 2025 15:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFH4n4bF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B8410E06E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 15:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752075290; x=1783611290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cj57oGZSRxZHQmdjDUphiES+ysJ3Cj0s3py/p3yAuFY=;
 b=OFH4n4bFUxnkOP1B9vFEYZcsxGETlGuB7WCiiEiz/ZZgxcp0bedBD1AE
 P1eArgmEfECZadWAgc2PoAhOh6dfj4NP3BncK2t7PKyTsLmD/xPteK5vK
 GOWbNWy/Cqjuq9wwQBlgbZxHUb9s4VVTdZ3/r+rqA4pFSM/2N/IdjSF4q
 sVjFkFCQd7nsuU2ubC0yuEd61hlA2pc24rgFQBu7UfYEteEfb8Sk5UwJg
 apxUrhUBm66tnqauAlQJdTszvnISqVQtfDQ9fXBBMj0lFLYKaHO4QG7VZ
 o0K7F17ysrAfOKLe6pbaKMDr8F3TfwDEsJOQ0merxmq8hYJima+Lm/YEL A==;
X-CSE-ConnectionGUID: qgz8okN2QaKSBeUiqNmtQA==
X-CSE-MsgGUID: l/nhHyIdT7K4vlwUlBiYtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="41966439"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="41966439"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 08:34:49 -0700
X-CSE-ConnectionGUID: UuMK9Ai4TemFT648Xaw0sA==
X-CSE-MsgGUID: hqv9l2kAQkWF7YHVUexP1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156296779"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 09 Jul 2025 08:34:46 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3] drm/xe: Expose fan control and voltage regulator version
Date: Wed,  9 Jul 2025 21:04:02 +0530
Message-Id: <20250709153402.2657493-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add sysfs attributes for late binding features which expose bound version
to the user.

v2: Rework attribute and macro naming (Badal)
v3: Drop fancy formatting (Rodrigo)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 143 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h    |  15 +++
 2 files changed, 157 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index b9440f8c781e..81e8dafef31e 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -24,6 +24,12 @@
  *
  * vram_d3cold_threshold - Report/change vram used threshold(in MB) below
  * which vram save/restore is permissible during runtime D3cold entry/exit.
+ *
+ * lb_fan_control_version - Fan control version provisioned by late binding.
+ * Exposed only if supported by the device.
+ *
+ * lb_voltage_regulator_version - Voltage regulator version provisioned by late
+ * binding. Exposed only if supported by the device.
  */
 
 static ssize_t
@@ -65,6 +71,135 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RW(vram_d3cold_threshold);
 
+static ssize_t
+lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	struct xe_tile *root = xe_device_get_root_tile(xe);
+	u32 cap, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
+	int ret;
+
+	xe_pm_runtime_get(xe);
+
+	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
+			    &cap, NULL);
+	if (ret)
+		goto out;
+
+	if (REG_FIELD_GET(V1_FAN_PROVISIONED, cap)) {
+		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
+				    &ver_low, NULL);
+		if (ret)
+			goto out;
+
+		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
+				    &ver_high, NULL);
+		if (ret)
+			goto out;
+
+		ret = sysfs_emit(buf, "%u.%u.%u.%u\n",
+				 REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low),
+				 REG_FIELD_GET(MINOR_VERSION_MASK, ver_low),
+				 REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high),
+				 REG_FIELD_GET(BUILD_VERSION_MASK, ver_high));
+	}
+out:
+	xe_pm_runtime_put(xe);
+
+	return ret ?: sysfs_emit(buf, "0.0.0.0\n");
+}
+static DEVICE_ATTR_ADMIN_RO(lb_fan_control_version);
+
+static ssize_t
+lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	struct xe_tile *root = xe_device_get_root_tile(xe);
+	u32 cap, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
+	int ret;
+
+	xe_pm_runtime_get(xe);
+
+	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
+			    &cap, NULL);
+	if (ret)
+		goto out;
+
+	if (REG_FIELD_GET(VR_PARAMS_PROVISIONED, cap)) {
+		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
+				    &ver_low, NULL);
+		if (ret)
+			goto out;
+
+		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
+				    &ver_high, NULL);
+		if (ret)
+			goto out;
+
+		ret = sysfs_emit(buf, "%u.%u.%u.%u\n",
+				 REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low),
+				 REG_FIELD_GET(MINOR_VERSION_MASK, ver_low),
+				 REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high),
+				 REG_FIELD_GET(BUILD_VERSION_MASK, ver_high));
+	}
+out:
+	xe_pm_runtime_put(xe);
+
+	return ret ?: sysfs_emit(buf, "0.0.0.0\n");
+}
+static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
+
+static int late_bind_create_files(struct device *dev)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	struct xe_tile *root = xe_device_get_root_tile(xe);
+	u32 cap;
+	int ret;
+
+	xe_pm_runtime_get(xe);
+
+	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
+			    &cap, NULL);
+	if (ret)
+		goto out;
+
+	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
+		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
+		if (ret)
+			goto out;
+	}
+
+	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
+		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
+out:
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
+static void late_bind_remove_files(struct device *dev)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	struct xe_tile *root = xe_device_get_root_tile(xe);
+	u32 cap;
+	int ret;
+
+	xe_pm_runtime_get(xe);
+
+	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
+			    &cap, NULL);
+	if (ret)
+		goto out;
+
+	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
+		sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
+
+	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
+		sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
+out:
+	xe_pm_runtime_put(xe);
+}
+
 /**
  * DOC: PCIe Gen5 Limitations
  *
@@ -151,8 +286,10 @@ static void xe_device_sysfs_fini(void *arg)
 	if (xe->d3cold.capable)
 		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
 
-	if (xe->info.platform == XE_BATTLEMAGE)
+	if (xe->info.platform == XE_BATTLEMAGE) {
 		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
+		late_bind_remove_files(xe->drm.dev);
+	}
 }
 
 int xe_device_sysfs_init(struct xe_device *xe)
@@ -170,6 +307,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
 		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
 		if (ret)
 			return ret;
+
+		ret = late_bind_create_files(dev);
+		if (ret)
+			return ret;
 	}
 
 	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 0befdea77db1..92bfcba51e19 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -50,6 +50,21 @@
 #define	READ_PL_FROM_FW				0x1
 #define	READ_PL_FROM_PCODE			0x0
 
+#define   PCODE_LATE_BINDING			0x5C
+#define     GET_CAPABILITY_STATUS		0x0
+#define       V1_FAN_SUPPORTED			REG_BIT(0)
+#define       VR_PARAMS_SUPPORTED		REG_BIT(3)
+#define       V1_FAN_PROVISIONED		REG_BIT(16)
+#define       VR_PARAMS_PROVISIONED		REG_BIT(19)
+#define     GET_VERSION_LOW			0x1
+#define     GET_VERSION_HIGH			0x2
+#define       MAJOR_VERSION_MASK		REG_GENMASK(31, 16)
+#define       MINOR_VERSION_MASK		REG_GENMASK(15, 0)
+#define       HOTFIX_VERSION_MASK		REG_GENMASK(31, 16)
+#define       BUILD_VERSION_MASK		REG_GENMASK(15, 0)
+#define       FAN_TABLE				1
+#define       VR_CONFIG				2
+
 #define   PCODE_FREQUENCY_CONFIG		0x6e
 /* Frequency Config Sub Commands (param1) */
 #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
-- 
2.34.1

