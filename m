Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3373FC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 17:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0B710F78E;
	Fri, 12 Apr 2024 17:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxnFIqqX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C6D10F789
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712944721; x=1744480721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bubNjqpGl7G5gIkw6Zl/szG/6uL3JVZAHkewzbSIMps=;
 b=KxnFIqqXAEskMlLOwr8RZWoI6DGsuZyAg2LNZ5HqQK/xd/GPeIGlsRSy
 RangyytNdsbq6Hlvso6mAK7oSVe+0O1I5Yx/NxR1X4927JBMGCJBmvggn
 A2/xTPYUrARgfGs14ZtEp0uF1/pqv2HY7ZyKlWwQIGZ8Ih4Op1zts/bYm
 0JkBCRf9kJdU9M9mCDWwjfHBQDLpXlIQiN83E4Hjy+tysrBh2gCwxcgcO
 4S/PRs36sycMVAtn52CFXmkXb9NQoCTnpD/3ZTkkptecHJEMTiMXdv+2G
 dxXQ+HxBJiSfbGdbGg1E8TeGo/QOHIQ6eDAeHt2cH5gRcZW9/BwsnhIw3 w==;
X-CSE-ConnectionGUID: IuPI5IddQ+CmJSKNxr8XZA==
X-CSE-MsgGUID: LtbUl438T2i64dSHTirNrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8628148"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8628148"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 10:58:41 -0700
X-CSE-ConnectionGUID: pIGCctU4R069pdISSpwG0w==
X-CSE-MsgGUID: S1VC7+y9TlSPn0lSGt9mvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21369129"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 12 Apr 2024 10:58:39 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 7/7] drm/xe/pm: Capture errors and handle them
Date: Fri, 12 Apr 2024 23:42:11 +0530
Message-Id: <20240412181211.1155732-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
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

For xe_pm_init failures cleanup the driver and return error code

-v2
Make mutex init cleaner (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 12 ++++------
 drivers/gpu/drm/xe/xe_device_sysfs.h |  2 +-
 drivers/gpu/drm/xe/xe_pci.c          | 12 ++++++++--
 drivers/gpu/drm/xe/xe_pm.c           | 36 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_pm.h           |  4 ++--
 5 files changed, 45 insertions(+), 21 deletions(-)

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
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index fa2cc80a08a3..65ea44672cab 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -781,18 +781,26 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		str_yes_no(xe_device_has_sriov(xe)),
 		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
 
-	xe_pm_init_early(xe);
+	err = xe_pm_init_early(xe);
+	if (err)
+		return err;
 
 	err = xe_device_probe(xe);
 	if (err)
 		return err;
 
-	xe_pm_init(xe);
+	err = xe_pm_init(xe);
+	if (err)
+		goto err_driver_cleanup;
 
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
 	return 0;
+
+err_driver_cleanup:
+	xe_pci_remove(pdev);
+	return err;
 }
 
 static void xe_pci_shutdown(struct pci_dev *pdev)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f1fc83845c01..a9decdf266a8 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -208,10 +208,21 @@ static void xe_pm_runtime_init(struct xe_device *xe)
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
+	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
+	if (err)
+		return err;
+
+	return 0;
 }
 
 /**
@@ -219,23 +230,32 @@ void xe_pm_init_early(struct xe_device *xe)
  * @xe: xe device instance
  *
  * This component is responsible for System and Device sleep states.
+ *
+ * Returns 0 for success, negative error code otherwise.
  */
-void xe_pm_init(struct xe_device *xe)
+int xe_pm_init(struct xe_device *xe)
 {
+	int err;
+
 	/* For now suspend/resume is only allowed with GuC */
 	if (!xe_device_uc_enabled(xe))
-		return;
-
-	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
+		return 0;
 
 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
 
 	if (xe->d3cold.capable) {
-		xe_device_sysfs_init(xe);
-		xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
+		err = xe_device_sysfs_init(xe);
+		if (err)
+			return err;
+
+		err = xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
+		if (err)
+			return err;
 	}
 
 	xe_pm_runtime_init(xe);
+
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 0cb38ca244fe..2cefe8624474 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -20,8 +20,8 @@ struct xe_device;
 int xe_pm_suspend(struct xe_device *xe);
 int xe_pm_resume(struct xe_device *xe);
 
-void xe_pm_init_early(struct xe_device *xe);
-void xe_pm_init(struct xe_device *xe);
+int xe_pm_init_early(struct xe_device *xe);
+int xe_pm_init(struct xe_device *xe);
 void xe_pm_runtime_fini(struct xe_device *xe);
 bool xe_pm_runtime_suspended(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
-- 
2.25.1

