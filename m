Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E91C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 07:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C84210E009;
	Fri, 12 Apr 2024 07:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USue58dF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EFD10EE8A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 07:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712908153; x=1744444153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gX5IZ2LV3evgALo9tKvayRMvz5jLuvxt8byP/+J307E=;
 b=USue58dFxsUsvYjIW87DEHGm1vqi3fURZi0Q949JrjYbJSb13c4VNrFz
 xyu55KluvLE/0Dwq7xHpVpETnMVgBEqzFgUDRPs8ZYLgycUgGl19/Hyyw
 U/LwvBV7xsa+fimQUJs0Cj2iWfNttX50DoLFHBNZ+KiSfWjXUQlPpbE1y
 t8fYr7P/w/Qyo5j6qKJyUnKaJV0fngnxUZ6maUO85AutDa9jdF9oeo0A6
 5hXyms4qcW+8n/9DPUf9306bs3gt0x/FNYZjvYV42hMUFytYvlCbOcTjN
 z7T+j7ekgahqiXLz69YiMz+WAO1SwtoK0rKccB1dwnN/Xp61l9P5BQFJ6 Q==;
X-CSE-ConnectionGUID: 1xqbEOVJReCuXeAj9PHVfA==
X-CSE-MsgGUID: Ts4cxt/AQ5myhMUMTNMIrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11317216"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="11317216"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 00:49:13 -0700
X-CSE-ConnectionGUID: /XskyZqKQpWBLTffzE231Q==
X-CSE-MsgGUID: ao97ylqiTRCUzLgOO0HVQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21220740"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 12 Apr 2024 00:49:12 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 7/7] drm/xe/pm: Capture errors and handle them
Date: Fri, 12 Apr 2024 13:32:45 +0530
Message-Id: <20240412080245.1044902-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
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

xe_pm_init may encounter failures for various reasons, such as a failure
in initializing drmm_mutex, or when dealing with a d3cold-capable device
for vram_threshold sysfs creation and setting default threshold.
Presently, all these potential failures are disregarded.

Move d3cold.lock initialization to xe_pm_init_early and cause driver
abort if mutex initialization has failed.

Warn about failure to create and setting default threshold.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 12 ++++------
 drivers/gpu/drm/xe/xe_device_sysfs.h |  2 +-
 drivers/gpu/drm/xe/xe_pm.c           | 34 +++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pm.h           |  2 +-
 4 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index e47c8ad1bb17..21677b8cd977 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -76,18 +76,14 @@ static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
 	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
 }
 
-void xe_device_sysfs_init(struct xe_device *xe)
+int xe_device_sysfs_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 	int ret;
 
 	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
-	if (ret) {
-		drm_warn(&xe->drm, "Failed to create sysfs file\n");
-		return;
-	}
-
-	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
 	if (ret)
-		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
+		return ret;
+
+	return drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
index 38b240684bee..f9e83d8bd2c7 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
@@ -8,6 +8,6 @@
 
 struct xe_device;
 
-void xe_device_sysfs_init(struct xe_device *xe);
+int xe_device_sysfs_init(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f1fc83845c01..f4d9441720b4 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -208,10 +208,25 @@ static void xe_pm_runtime_init(struct xe_device *xe)
 	pm_runtime_put(dev);
 }
 
-void xe_pm_init_early(struct xe_device *xe)
+int xe_pm_init_early(struct xe_device *xe)
 {
+	int err;
+
 	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
-	drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
+
+	err = drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
+	if (err)
+		return err;
+
+	/* Currently d3cold.lock will be used only with GuC */
+	if (!xe_device_uc_enabled(xe))
+		return 0;
+
+	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
+	if (err)
+		return err;
+
+	return 0;
 }
 
 /**
@@ -219,20 +234,27 @@ void xe_pm_init_early(struct xe_device *xe)
  * @xe: xe device instance
  *
  * This component is responsible for System and Device sleep states.
+ *
  */
 void xe_pm_init(struct xe_device *xe)
 {
+	int err;
+
 	/* For now suspend/resume is only allowed with GuC */
 	if (!xe_device_uc_enabled(xe))
 		return;
 
-	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
-
 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
 
 	if (xe->d3cold.capable) {
-		xe_device_sysfs_init(xe);
-		xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
+		err = xe_device_sysfs_init(xe);
+		if (err)
+			drm_warn(&xe->drm,
+				 "Sysfs create for user to set vram threshold failed\n");
+
+		err = xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
+		if (err)
+			drm_warn(&xe->drm, "Setting default vram threshold failed\n");
 	}
 
 	xe_pm_runtime_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 0cb38ca244fe..1e6ec58878d2 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -20,7 +20,7 @@ struct xe_device;
 int xe_pm_suspend(struct xe_device *xe);
 int xe_pm_resume(struct xe_device *xe);
 
-void xe_pm_init_early(struct xe_device *xe);
+int xe_pm_init_early(struct xe_device *xe);
 void xe_pm_init(struct xe_device *xe);
 void xe_pm_runtime_fini(struct xe_device *xe);
 bool xe_pm_runtime_suspended(struct xe_device *xe);
-- 
2.25.1

