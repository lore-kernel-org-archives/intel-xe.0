Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7070CEA71B5
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 02:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCEF10E0AD;
	Mon, 20 Apr 2026 02:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HdqYSDDp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8B510E0AD
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 02:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776650583; x=1808186583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=anYXrBf1zco9CHv1CTEDZvN4/WmvMGfrdH3tQI1YOiM=;
 b=HdqYSDDpTNeQICZIF+Ip294oCgV62yUWUOmo05+NRhOOehpBifAJNZCQ
 aIhf9eXV5KeHsK0uiu0VWTMvf5ihdlC8pOA91+tpLP/puDJTEGfIeBoov
 /M6o2oVPoJEtwe3B0nBwPaRATzyjIj3RkIFKG+JcON88ibqSn90EgoA0r
 i6cn1L+hob+4QMFbwi+M5m4uwVkbTkoN7RuScelSCn613v69Y/+ifEPRo
 6EIrQTYGQYk17TDxcU2op1TXMSCpdVI5jejwFMHnB5KAbbtcF6CgGd/12
 fuV1mQelXxM2yY2bdP3o+bwaGUy4DglVPdmM5gE22vCke+NDZXBYw3wtj A==;
X-CSE-ConnectionGUID: dQOka66kQrSBwspvfTtHAQ==
X-CSE-MsgGUID: 6gYEglajSMq9G6Pgibs3Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="100219957"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="100219957"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 19:03:02 -0700
X-CSE-ConnectionGUID: kMgrpvEnRaK2hTnZgfpVPA==
X-CSE-MsgGUID: o6yDmIdQQ9GY4HE6PLhmKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="231502816"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 19 Apr 2026 19:03:00 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4] drm/xe/xe_survivability: Fix runtime survivability error
 handling
Date: Mon, 20 Apr 2026 07:30:26 +0530
Message-ID: <20260420020025.882006-2-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_survivability_mode_runtime_enable() returns an int, but its caller
csc_hw_error_work() cannot take any meaningful recovery action on
failure. The function already handles all internal errors via dev_err()
and proceeds to enable survivability mode regardless of sysfs creation
failure.

Change the return type to void and drop unnecessary error handling
in csc_hw_error_work().

v2:
- Return is not require after the sysfs creation fail. (Rodrigo/Riana)
- Change int to void return type. (Rodrigo)
- Remove extra message from csc_hw_error_work().

v3:
- Remove ret variable. (Raag)

v4:
- Drop ret variable from other part of code.

Fixes: a2ca0633a0fe ("drm/xe/xe_survivability: Add support for Runtime survivability mode")
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c           |  5 +----
 drivers/gpu/drm/xe/xe_survivability_mode.c | 14 ++++----------
 drivers/gpu/drm/xe/xe_survivability_mode.h |  2 +-
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 2a31b430570e..64d2260e761b 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -169,11 +169,8 @@ static void csc_hw_error_work(struct work_struct *work)
 {
 	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
 	struct xe_device *xe = tile_to_xe(tile);
-	int ret;
 
-	ret = xe_survivability_mode_runtime_enable(xe);
-	if (ret)
-		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");
+	xe_survivability_mode_runtime_enable(xe);
 }
 
 static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index db64cac39c94..427afd144f3a 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -396,25 +396,21 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
  * Runtime survivability mode is enabled when certain errors cause the device to be
  * in non-recoverable state. The device is declared wedged with the appropriate
  * recovery method and survivability mode sysfs exposed to userspace
- *
- * Return: 0 if runtime survivability mode is enabled, negative error code otherwise.
  */
-int xe_survivability_mode_runtime_enable(struct xe_device *xe)
+void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 {
 	struct xe_survivability *survivability = &xe->survivability;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	int ret;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
 		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
-		return -EINVAL;
+		return;
 	}
 
 	populate_survivability_info(xe);
 
-	ret = create_survivability_sysfs(pdev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create survivability mode sysfs\n");
+	if (create_survivability_sysfs(pdev))
+		dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
 
 	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
 	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
@@ -422,8 +418,6 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
 	xe_device_declare_wedged(xe);
 	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
-
-	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
index 1cc94226aa82..cd040e4d18bb 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
@@ -11,7 +11,7 @@
 struct xe_device;
 
 int xe_survivability_mode_boot_enable(struct xe_device *xe);
-int xe_survivability_mode_runtime_enable(struct xe_device *xe);
+void xe_survivability_mode_runtime_enable(struct xe_device *xe);
 bool xe_survivability_mode_is_boot_enabled(struct xe_device *xe);
 bool xe_survivability_mode_is_requested(struct xe_device *xe);
 
-- 
2.34.1

