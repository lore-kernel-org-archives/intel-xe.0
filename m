Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787F3F9D0E8
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 17:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B2B10E00E;
	Tue, 14 Apr 2026 17:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUSXrOXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8119C10E00E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776187756; x=1807723756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JdLITsg1nwoImw5CSxlmundQNSSRL3Khtke1ttro6tg=;
 b=SUSXrOXLJpUnovtC6/re4pJ6Q/0oOGf6llzKuhrny2uuvKyI3HI4ROkC
 cHSppVd5bCvOGtb09vQUuk2K7gle81rKGuJJOpZax8nqbSHh2rB2jaN7W
 N5mURjxWnO778BTpHrDgpMgkWbqDnV7oWMD9UyhAu6Nzz/KY2pBkEZuwP
 kJ+oF8arEKPCbXHA1CUEpq6P7TfRcFTCsLQYodq8s+LhHIm+6aOvipZ13
 93F/fLiumtND0Q1lztMtwOSaTAdKEGr/+Corsnx6Mkx6UV1u/ckAtwDTw
 hfTFIYrRwwyd91eCTASB1XFW0xKuxDlaUIJktfO9qMJUY8EcAQ1AZB5uE g==;
X-CSE-ConnectionGUID: 6cf1djF3TkKCuF1zuRRdow==
X-CSE-MsgGUID: YGVwDfufQF+b9PbhxUStQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="64693366"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="64693366"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 10:29:16 -0700
X-CSE-ConnectionGUID: Bv+bFJO3RISKKjsbX58SSg==
X-CSE-MsgGUID: LAlMU9V+QkugwUp2IRi4qw==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 14 Apr 2026 10:29:13 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2] drm/xe/xe_survivability: Fix runtime survivability error
 handling
Date: Tue, 14 Apr 2026 22:56:42 +0530
Message-ID: <20260414172641.570653-2-mallesh.koujalagi@intel.com>
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

Fixes: a2ca0633a0fe ("drm/xe/xe_survivability: Add support for Runtime survivability mode")
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c           | 5 +----
 drivers/gpu/drm/xe/xe_survivability_mode.c | 8 ++------
 drivers/gpu/drm/xe/xe_survivability_mode.h | 2 +-
 3 files changed, 4 insertions(+), 11 deletions(-)

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
index db64cac39c94..c68b789d93c7 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -396,10 +396,8 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
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
@@ -407,7 +405,7 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
 		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
-		return -EINVAL;
+		return;
 	}
 
 	populate_survivability_info(xe);
@@ -422,8 +420,6 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
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

