Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3930CAC592
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 17:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3C210E799;
	Tue, 16 Sep 2025 17:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KiFEaFCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F9410E3AF
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 17:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758042072; x=1789578072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0riavquwDfvzbHWqsprZAtnFmVqqDiASF5KTlqU7c6k=;
 b=KiFEaFCwjLJ5bp8kHQAw+jCqktJD89+qCvNj79D3bYghRbE0pd8D2UsS
 kc1SJUGh/MYEE5zTC+Xwwhh99mCqGeGArm1Dq+puPQZo4uJGDLe1Uz+e4
 dNLUiab/SDLyqvZoEjenjcEge0cYWdhU/Ie1lcCugLpjJsH6NC3OimLG1
 f77eZLBCjC+76fDSNMTZDdAv9QvbFp17E8l9sqOlc7/fatQ2jtj2lZ1Vu
 Om+oPLDHNn7uXaPlGVjCgEugUhVj82MNrd9UODosysoUTj3NXePy6d48d
 bSGDpGInA1XZZ1OBDoADhW1WQWbLR3lJa7pxAqAJ8xZQDM+PlgiMbCNYF A==;
X-CSE-ConnectionGUID: N2uOdv+sRiy+Qosky9uZbg==
X-CSE-MsgGUID: fCcAgnXASVq/LoLEMvcdIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="47906956"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="47906956"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 10:00:59 -0700
X-CSE-ConnectionGUID: 4qniLfwSRbuQAOcXbqoHWw==
X-CSE-MsgGUID: nzhZ5B55TOCkHlXWoPbXCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="180128363"
Received: from rjayathi-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.43])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 10:00:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 2/2] drm/xe/sysfs: Simplify sysfs registration
Date: Tue, 16 Sep 2025 19:00:29 +0200
Message-ID: <20250916170029.3313-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916170029.3313-1-michal.wajdeczko@intel.com>
References: <20250916170029.3313-1-michal.wajdeczko@intel.com>
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

Instead of manually maintaining each sysfs file define and use
attribute groups and register them using device managed function.
Then use is_visible() to filter-out unsupported attributes.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: rebased, reordered
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 104 +++++++++++----------------
 1 file changed, 41 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 896484c8fbcc..c5151c86a98a 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -71,6 +71,15 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RW(vram_d3cold_threshold);
 
+static struct attribute *vram_attrs[] = {
+	&dev_attr_vram_d3cold_threshold.attr,
+	NULL
+};
+
+static const struct attribute_group vram_attr_group = {
+	.attrs = vram_attrs,
+};
+
 static ssize_t
 lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -149,8 +158,16 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
 }
 static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
 
-static int late_bind_create_files(struct device *dev)
+static struct attribute *late_bind_attrs[] = {
+	&dev_attr_lb_fan_control_version.attr,
+	&dev_attr_lb_voltage_regulator_version.attr,
+	NULL
+};
+
+static umode_t late_bind_attr_is_visible(struct kobject *kobj,
+					 struct attribute *attr, int n)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
 	struct xe_tile *root = xe_device_get_root_tile(xe);
 	u32 cap = 0;
@@ -160,51 +177,25 @@ static int late_bind_create_files(struct device *dev)
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
 			    &cap, NULL);
-	if (ret) {
-		if (ret == -ENXIO) {
-			drm_dbg(&xe->drm, "Late binding not supported by firmware\n");
-			ret = 0;
-		}
-		goto out;
-	}
-
-	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
-		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
-		if (ret)
-			goto out;
-	}
-
-	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
-		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
-out:
 	xe_pm_runtime_put(xe);
-
-	return ret;
-}
-
-static void late_bind_remove_files(struct device *dev)
-{
-	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
-	struct xe_tile *root = xe_device_get_root_tile(xe);
-	u32 cap = 0;
-	int ret;
-
-	xe_pm_runtime_get(xe);
-
-	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-			    &cap, NULL);
 	if (ret)
-		goto out;
+		return 0;
 
-	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
-		sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
+	if (attr == &dev_attr_lb_fan_control_version.attr &&
+	    REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
+		return attr->mode;
+	if (attr == &dev_attr_lb_voltage_regulator_version.attr &&
+	    REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
+		return attr->mode;
 
-	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
-		sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
-out:
-	xe_pm_runtime_put(xe);
+	return 0;
 }
 
+static const struct attribute_group late_bind_attr_group = {
+	.attrs = late_bind_attrs,
+	.is_visible = late_bind_attr_is_visible,
+};
+
 /**
  * DOC: PCIe Gen5 Limitations
  *
@@ -278,24 +269,15 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
 }
 static DEVICE_ATTR_ADMIN_RO(auto_link_downgrade_status);
 
-static const struct attribute *auto_link_downgrade_attrs[] = {
+static struct attribute *auto_link_downgrade_attrs[] = {
 	&dev_attr_auto_link_downgrade_capable.attr,
 	&dev_attr_auto_link_downgrade_status.attr,
 	NULL
 };
 
-static void xe_device_sysfs_fini(void *arg)
-{
-	struct xe_device *xe = arg;
-
-	if (xe->d3cold.capable)
-		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
-
-	if (xe->info.platform == XE_BATTLEMAGE) {
-		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
-		late_bind_remove_files(xe->drm.dev);
-	}
-}
+static const struct attribute_group auto_link_downgrade_attr_group = {
+	.attrs = auto_link_downgrade_attrs,
+};
 
 int xe_device_sysfs_init(struct xe_device *xe)
 {
@@ -303,24 +285,20 @@ int xe_device_sysfs_init(struct xe_device *xe)
 	int ret;
 
 	if (xe->d3cold.capable) {
-		ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+		ret = devm_device_add_group(dev, &vram_attr_group);
 		if (ret)
 			return ret;
 	}
 
 	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
-		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
+		ret = devm_device_add_group(dev, &auto_link_downgrade_attr_group);
 		if (ret)
-			goto cleanup;
+			return ret;
 
-		ret = late_bind_create_files(dev);
+		ret = devm_device_add_group(dev, &late_bind_attr_group);
 		if (ret)
-			goto cleanup;
+			return ret;
 	}
 
-	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
-
-cleanup:
-	xe_device_sysfs_fini(xe);
-	return ret;
+	return 0;
 }
-- 
2.47.1

