Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8FFCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 18:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7187410E9B9;
	Wed, 10 Sep 2025 18:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQJbECZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A4010E9B9
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 18:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757529161; x=1789065161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S7n8GF7v3yOYGW0/LQfJM0vCWK5hqeop9AmM1sw2k6M=;
 b=GQJbECZcr/VL6VgjMZYkg+QJghmrMfzSJpSWVNT6gC2qN3dZs3zWAZYh
 WZSTtJjEvht88wkhyLVPUQ+lYfhFU1ZvmRA6rwOa8Mxz7HfzWInjuuJsB
 h7EFY/uqLR4qKv5wCdWPrq9MI0wQ4SpscgPoxi4Tb+qiRDayvOvc1sVtI
 r8g3erPuY+aPEEdTbE+14QQzhRdcg/P6S4SXD7DLcuS/hTzG+kbmkhLaP
 ZW5AH7JNmU6kYCCjJvKLer0fp0gM52ChTrN9gKi93o43TdOuAtQUfxDgn
 zVF8wWM0PrERjx1UVqUXvjcw5i64ui1KwcfiEik0lpRwFLcUAHUrIw8fZ w==;
X-CSE-ConnectionGUID: n+5mJmEtQbKv4dMic3nUxg==
X-CSE-MsgGUID: Sknj53QZQg2q7RZKs470vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="47423285"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="47423285"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 11:32:40 -0700
X-CSE-ConnectionGUID: apf1zhWzQDqGQyXpPtYXCA==
X-CSE-MsgGUID: f2VkUWi9TAW/F9DqWmkU1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="172757572"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa010.jf.intel.com with ESMTP; 10 Sep 2025 11:32:38 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/xe_device_sysfs: add cleanup action in
 xe_device_sysfs_init
Date: Thu, 11 Sep 2025 02:32:33 +0800
Message-Id: <20250910183233.3971054-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.34.1
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

xe_device_sysfs_fini(): switch the order of late_bind_remove_files
and sysfs_remove_files to follow the rule that files create latest
deleted first.(LIFO)

xe_device_sysfs_init(): on partial failure, any sysfs files created
before the failure will be cleaned up via xe_device_sysfs_fini,
ensuring no leaked sysfs entries
Add function description comments for xe_device_sysfs_init().

v2:
- Refine code using "goto cleanup" to reduced code duplication and
  improve clarity and scalability. (Stuart)

- Change remove order in late_bind_remove_files(). (Stuart)

- In xe_device_sysfs_fini() and late_bind_remove_files(), cancle the
  capable, platform and pcode/runtime check. And just remove in reverse
  order of creation(LIFO). sysfs_remove_file is safe even the attribute
  doesn't exist, so it avoids extra overhead or error paths during cleanup.

Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
Fixes: cdc36b66cd41 (drm/xe: Expose fan control and voltage regulator version)
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 61 +++++++++++++++-------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 6ee422594b56..44ee008ea3ce 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -184,25 +184,13 @@ static int late_bind_create_files(struct device *dev)
 
 static void late_bind_remove_files(struct device *dev)
 {
-	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
-	struct xe_tile *root = xe_device_get_root_tile(xe);
-	u32 cap = 0;
-	int ret;
-
-	xe_pm_runtime_get(xe);
-
-	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-			    &cap, NULL);
-	if (ret)
-		goto out;
-
-	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
-		sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
-
-	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
-		sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
-out:
-	xe_pm_runtime_put(xe);
+	/* Remove in reverse order of creation (LIFO).
+	* Avoid querying pcode/runtime pm here — sysfs_remove_file is safe
+	* when the attribute doesn't exist, and this avoids extra overhead
+	* or error paths during cleanup.
+	*/
+	sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
+	sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
 }
 
 /**
@@ -287,16 +275,28 @@ static const struct attribute *auto_link_downgrade_attrs[] = {
 static void xe_device_sysfs_fini(void *arg)
 {
 	struct xe_device *xe = arg;
+	struct device *dev = xe->drm.dev;
 
-	if (xe->d3cold.capable)
-		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
-
-	if (xe->info.platform == XE_BATTLEMAGE) {
-		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
-		late_bind_remove_files(xe->drm.dev);
-	}
+	/* Remove in reverse order of creation (LIFO).
+	 * Avoid attrs check here — sysfs_remove_file is safe
+	 */
+	late_bind_remove_files(dev);
+	sysfs_remove_files(&dev->kobj, auto_link_downgrade_attrs);
+	sysfs_remove_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
 }
 
+/**
+ * xe_device_sysfs_init - Initialize sysfs attributes for the Xe device
+ * @xe: Pointer to the Xe device structure
+ *
+ * Creates and registers sysfs attributes for device-specific controls and status,
+ * including VRAM D3cold threshold and PCIe link downgrade capabilities, depending
+ * on device capabilities and platform type.
+ *
+ * On partial failure, any sysfs files created before the failure will be cleaned up
+ * via xe_device_sysfs_fini.
+ */
+
 int xe_device_sysfs_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -311,12 +311,17 @@ int xe_device_sysfs_init(struct xe_device *xe)
 	if (xe->info.platform == XE_BATTLEMAGE) {
 		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
 		if (ret)
-			return ret;
+			goto cleanup;
 
 		ret = late_bind_create_files(dev);
 		if (ret)
-			return ret;
+			goto cleanup;
 	}
 
 	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
+
+cleanup:
+	xe_device_sysfs_fini(xe);
+	return ret;
+
 }
-- 
2.34.1

