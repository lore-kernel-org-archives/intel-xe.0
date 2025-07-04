Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D58EC8303D
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 11:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A67110E9FD;
	Fri,  4 Jul 2025 11:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3N0YDej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5398610E9F3
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751628231; x=1783164231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=loaghuG+eiNHO9OfDBkNOr02/rjbFbd+4UWIYhNtta8=;
 b=l3N0YDejlBoXdZ5WF87BqJytyPsfXT3NrgQT7pLqT+WayK/dRsrTrH2j
 uRDPOSv2ln83/AHQDvpRlVbpuag/CSFa3hl3YbmR3ShS4Qmw2Tj/LSZtC
 gOrM4wDRy2Mi7F43HGr6uhMuSMODRZ7j8CDRRx/Ufuia6Z6ynJ6o/wplT
 9x7zijhBnlXJtfvNe9XcqLrHNh7QpEzSECMTAvbpcC7XWLd6hWy7V+uz1
 +Xv6ZQ6lDjXHh2siqiINGn4f1Oo/v0S8Jeth4IG7nGlG8bcDxx40VenG3
 VFcDEpiHQpxqqLD7NC/FmP0WA7pyvRoHK8JaSY7/tD7KLteFPhOKg2rHI w==;
X-CSE-ConnectionGUID: Z4rrr0hXT7GovoRSCuMqXA==
X-CSE-MsgGUID: kEJDtfxWR2SmWwId2HGbQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64208920"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="64208920"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 04:23:51 -0700
X-CSE-ConnectionGUID: MttH2MhESvSx/tmH7DjCmQ==
X-CSE-MsgGUID: EPZW9UNXTymKa1mhorJeXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="185578368"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 04 Jul 2025 04:23:48 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe: Expose fan control and voltage regulator
 information
Date: Fri,  4 Jul 2025 16:53:05 +0530
Message-Id: <20250704112305.2479800-1-raag.jadav@intel.com>
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

Expose sysfs attributes for late binding features which provide information
about their support, provisioning and bound version to the user.

v2: s/late_bind_fan_info/lb_fan_control_info (Badal)
    s/late_bind_vr_info/lb_voltage_regulator_info (Badal)
    s/LATE_BINDING/PCODE_LATE_BINDING (Badal)
    Add VERSION_MASK macros (Badal)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 121 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h    |  15 ++++
 2 files changed, 135 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index b9440f8c781e..8a1bb2b7c951 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -24,6 +24,15 @@
  *
  * vram_d3cold_threshold - Report/change vram used threshold(in MB) below
  * which vram save/restore is permissible during runtime D3cold entry/exit.
+ *
+ * lb_fan_control_info - Fan control information of the device in comma
+ * separated format as ``<supported>,<provisioned>,<version>`` with optional
+ * ``<version>`` field which is available only if provisioned by late binding.
+ *
+ * lb_voltage_regulator_info - Voltage regulator information of the device in
+ * comma separated format as ``<supported>,<provisioned>,<version>`` with
+ * optional ``<version>`` field which is available only if provisioned by late
+ * binding.
  */
 
 static ssize_t
@@ -65,6 +74,110 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RW(vram_d3cold_threshold);
 
+static ssize_t
+lb_fan_control_info_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	struct xe_tile *root = xe_device_get_root_tile(xe);
+	u32 cap, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
+	bool supported, provisioned;
+	int ret, len = 0;
+
+	xe_pm_runtime_get(xe);
+
+	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
+			    &cap, NULL);
+	if (ret)
+		goto out;
+
+	supported = REG_FIELD_GET(V1_FAN_SUPPORTED, cap);
+	provisioned = REG_FIELD_GET(V1_FAN_PROVISIONED, cap);
+
+	if (provisioned) {
+		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
+				    &ver_low, NULL);
+		if (ret)
+			goto out;
+
+		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
+				    &ver_high, NULL);
+		if (ret)
+			goto out;
+	}
+
+	len += sysfs_emit_at(buf, len, "%u", supported);
+	len += sysfs_emit_at(buf, len, ",%u", provisioned);
+
+	if (provisioned)
+		len += sysfs_emit_at(buf, len, ",%u.%u.%u.%u",
+				     REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low),
+				     REG_FIELD_GET(MINOR_VERSION_MASK, ver_low),
+				     REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high),
+				     REG_FIELD_GET(BUILD_VERSION_MASK, ver_high));
+
+	len += sysfs_emit_at(buf, len, "\n");
+out:
+	xe_pm_runtime_put(xe);
+
+	return ret ?: len;
+}
+static DEVICE_ATTR_ADMIN_RO(lb_fan_control_info);
+
+static ssize_t
+lb_voltage_regulator_info_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	struct xe_tile *root = xe_device_get_root_tile(xe);
+	u32 cap, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
+	bool supported, provisioned;
+	int ret, len = 0;
+
+	xe_pm_runtime_get(xe);
+
+	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
+			    &cap, NULL);
+	if (ret)
+		goto out;
+
+	supported = REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap);
+	provisioned = REG_FIELD_GET(VR_PARAMS_PROVISIONED, cap);
+
+	if (provisioned) {
+		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
+				    &ver_low, NULL);
+		if (ret)
+			goto out;
+
+		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
+				    &ver_high, NULL);
+		if (ret)
+			goto out;
+	}
+
+	len += sysfs_emit_at(buf, len, "%u", supported);
+	len += sysfs_emit_at(buf, len, ",%u", provisioned);
+
+	if (provisioned)
+		len += sysfs_emit_at(buf, len, ",%u.%u.%u.%u",
+				     REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low),
+				     REG_FIELD_GET(MINOR_VERSION_MASK, ver_low),
+				     REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high),
+				     REG_FIELD_GET(BUILD_VERSION_MASK, ver_high));
+
+	len += sysfs_emit_at(buf, len, "\n");
+out:
+	xe_pm_runtime_put(xe);
+
+	return ret ?: len;
+}
+static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_info);
+
+static const struct attribute *late_bind_attrs[] = {
+	&dev_attr_lb_fan_control_info.attr,
+	&dev_attr_lb_voltage_regulator_info.attr,
+	NULL
+};
+
 /**
  * DOC: PCIe Gen5 Limitations
  *
@@ -151,8 +264,10 @@ static void xe_device_sysfs_fini(void *arg)
 	if (xe->d3cold.capable)
 		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
 
-	if (xe->info.platform == XE_BATTLEMAGE)
+	if (xe->info.platform == XE_BATTLEMAGE) {
 		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
+		sysfs_remove_files(&xe->drm.dev->kobj, late_bind_attrs);
+	}
 }
 
 int xe_device_sysfs_init(struct xe_device *xe)
@@ -170,6 +285,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
 		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
 		if (ret)
 			return ret;
+
+		ret = sysfs_create_files(&dev->kobj, late_bind_attrs);
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

