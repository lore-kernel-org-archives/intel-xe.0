Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3424CF8E489
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 22:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D929410E23E;
	Thu, 16 Apr 2026 22:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YotbAW4j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D92610E23E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 22:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776379331; x=1807915331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kjsZLbElt8+9xWBsOOk5zlgT2c8ZiGYOKLraKVwj5JA=;
 b=YotbAW4jiQ1FukFmImscI2sjzxZq+YHMh7XJEvcSHE5cYfiwk6VOTEke
 PO2f6gFLtQYI90EYHY3hT5fpM6n3Rh4kRxn7aGUm4AXtePNN2UhGQn7Uy
 gqpgEdiykiMJz4GcJH4EjFuDgCwv8yve6aohZBqFMYMwrtI+lB9Et1n6k
 9gL51Dj4dxt68BVSO8pZme6vlAVMitn7g/PcHbPoxiP1BhWxUW361canF
 tr2gMYh7wyM59On4NQbDKdhwghWygkRsWSSS5p+/nFfWnzkEheTDq3vhN
 JTDhTtQFwxKNtvNe6EDoW79Ub80GIB8SMSstHJo/ZCsy+aPCevS8r+Sg5 Q==;
X-CSE-ConnectionGUID: tG6iRgz4R5aTPAtBC9Qa+Q==
X-CSE-MsgGUID: vb/QXkDzRxG3TvaApzCqBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88844005"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88844005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 15:42:11 -0700
X-CSE-ConnectionGUID: rfzwWynYTLW4l5A8zS4b9Q==
X-CSE-MsgGUID: 5usaHOpsTGmEU/fk3tSY2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="227726086"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 16 Apr 2026 15:42:07 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3] drm/xe/xe_survivability: Fix runtime survivability error
 handling
Date: Fri, 17 Apr 2026 04:09:34 +0530
Message-ID: <20260416223934.769040-2-mallesh.koujalagi@intel.com>
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
- Remove ret variable (Raag)

Fixes: a2ca0633a0fe ("drm/xe/xe_survivability: Add support for Runtime survivability mode")
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c           | 5 +----
 drivers/gpu/drm/xe/xe_survivability_mode.c | 9 ++-------
 drivers/gpu/drm/xe/xe_survivability_mode.h | 2 +-
 3 files changed, 4 insertions(+), 12 deletions(-)

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
index db64cac39c94..b16c2ad9aa15 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -396,18 +396,15 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
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
@@ -422,8 +419,6 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
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

