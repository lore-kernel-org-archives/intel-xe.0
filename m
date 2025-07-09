Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE3DC83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 10:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5C110E79F;
	Wed,  9 Jul 2025 10:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S1WZBTAn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C4510E79F
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752058558; x=1783594558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J5GnlyAMXcACzq3Vw13lrV0pUY+lplxEzQ8X21A8vbE=;
 b=S1WZBTAnaUetm/Jngwzj093/d3rx42Dfp27DGup7sBfScdBGnNZXZ810
 4JiNpz1rnYidqSwBYecNMzkwwP6Ga0bEN7kL33LfJIxWBAFqtktmXKq48
 eCukMVjzecCyxAfq3huaAKVEHD/aaGjyJ10NVphtxnS8ps3uiCncYzXWE
 s4ifc0bS9Tlj5A46zJVWWx9L+Knf6+ShfLGW4xAeldmY43H5MeRJBBTv4
 Mm0iMB2022YAXhU2Q64b19yC6HuII8/3AZKFpPmc3mmjOXot5TnT+pgdD
 a0aWgAZhViiqxihuVKklhI7O1yCpirkNVkHkoxTMpygSyh+S1Ao0fpKB7 A==;
X-CSE-ConnectionGUID: 0KtHrF08RVynHxiz2E+KZg==
X-CSE-MsgGUID: LiShViG3QFizqi8d5jUihw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54288499"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54288499"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 03:55:58 -0700
X-CSE-ConnectionGUID: Q40c+WbSQmuaRuMUnz0XDQ==
X-CSE-MsgGUID: Un9m8EasRGSA3RA8G8PxiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="192936377"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 03:55:55 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: [PATCH v4 5/9] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Date: Wed,  9 Jul 2025 16:50:17 +0530
Message-ID: <20250709112024.1053710-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250709112024.1053710-1-riana.tauro@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
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

Certain runtime firmware errors can cause the device to be in a unusable
state requiring a firmware flash to restore normal operation.
Runtime Survivability Mode indicates firmware flash is necessary by
wedging the device and exposing survivability mode sysfs.

The below sysfs is an indication that device is in survivability mode

/sys/bus/pci/devices/<device>/survivability_mode

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 42 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_survivability_mode.h    |  1 +
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  1 +
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index fefb027b1c84..ca1cfa13525a 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -137,7 +137,8 @@ static ssize_t survivability_mode_show(struct device *dev,
 	struct xe_survivability_info *info = survivability->info;
 	int index = 0, count = 0;
 
-	count += sysfs_emit_at(buff, count, "Survivability mode type: Boot\n");
+	count += sysfs_emit_at(buff, count, "Survivability mode type: %s\n",
+			       survivability->type ? "Runtime" : "Boot");
 
 	if (!check_boot_failure(xe))
 		return count;
@@ -288,6 +289,45 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
 	return check_boot_failure(xe);
 }
 
+/**
+ * xe_survivability_mode_runtime_enable - Initialize and enable runtime survivability mode
+ * @xe: xe device instance
+ *
+ * Initialize survivability information and enable runtime survivability mode.
+ * Runtime survivability mode is enabled when certain errors cause the device to be
+ * in non-recoverable state. The device is declared wedged with the appropriate
+ * recovery method and survivability mode sysfs exposed to userspace
+ *
+ * Return: 0 if runtime survivability mode is enabled or not requested, negative error
+ * code otherwise.
+ */
+int xe_survivability_mode_runtime_enable(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int ret;
+
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
+		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
+		return -EINVAL;
+	}
+
+	ret = init_survivability_mode(xe);
+	if (ret)
+		return ret;
+
+	ret = create_survivability_sysfs(pdev);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to create survivability mode sysfs\n");
+
+	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
+	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
+	xe_device_declare_wedged(xe);
+
+	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
+	return 0;
+}
+
 /**
  * xe_survivability_mode_boot_enable - Initialize and enable boot survivability mode
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
index f6ee283ea5e8..1cc94226aa82 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
@@ -11,6 +11,7 @@
 struct xe_device;
 
 int xe_survivability_mode_boot_enable(struct xe_device *xe);
+int xe_survivability_mode_runtime_enable(struct xe_device *xe);
 bool xe_survivability_mode_is_boot_enabled(struct xe_device *xe);
 bool xe_survivability_mode_is_requested(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
index 5dce393498da..cd65a5d167c9 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
@@ -11,6 +11,7 @@
 
 enum xe_survivability_type {
 	XE_SURVIVABILITY_TYPE_BOOT,
+	XE_SURVIVABILITY_TYPE_RUNTIME,
 };
 
 struct xe_survivability_info {
-- 
2.47.1

