Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8643DC43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 11:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CCD10EBFB;
	Tue, 30 Jun 2026 11:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7fO5m9D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B6610EBFB
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 11:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782820740; x=1814356740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=edXe4YmFDDf5JNMhgv+DjEzVot+kxtSRAWF6229UwWc=;
 b=N7fO5m9D2IzGz+oNpcQxTpQOt8f5CQgPH/nL0C2PGluvJ4XIgrEPob5T
 5x6dCbNMfpfbEDGtpRy8q+niGECrlgURj6qk7s+gC225jHelyVSK2Js8u
 Dlp7DJWeiZ9d4r2dap+2PBQ5LGo53SsoFGo+CFToFOrauP8dHDKO4FnXD
 ToUe1qJNXmt/yaQlUQXiVHM055xEgQYprMIwytOtp5Wsiv0qXtO9gON8U
 G2DCxU/NP4ADxRZRYfnRHj3b1qCWfAXJ7P/I3YHfaHsDNOXY+CBfW5sWp
 5B2doU6CPhX8VI8j7qlrVA1ddww8otRkU3xUWxnGQZKQngNYgMT5CUVdp Q==;
X-CSE-ConnectionGUID: gHLdLrrPR/OVyNsaDgm22g==
X-CSE-MsgGUID: 3jsyIitqTk+GT/+CkTWwqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106323579"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="106323579"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 04:59:00 -0700
X-CSE-ConnectionGUID: C+rNhIltT9yHq4cGIvkT6g==
X-CSE-MsgGUID: ebGO/hvRRm6UL1a2jJiuow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="255839703"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 30 Jun 2026 04:58:56 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v4 4/5] drm/xe: Use RAS logging to report survivability
 mode
Date: Tue, 30 Jun 2026 17:25:08 +0530
Message-ID: <20260630115503.407158-11-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
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

Replace dev_err() calls with xe_ras_log_survivability() so
survivability events are reported through the structured RAS logging
path with a consistent format.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 427afd144f3a..a58d46f67677 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -17,6 +17,7 @@
 #include "xe_mmio.h"
 #include "xe_nvm.h"
 #include "xe_pcode_api.h"
+#include "xe_ras_log.h"
 #include "xe_vsec.h"
 
 /**
@@ -307,7 +308,6 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 
 static int enable_boot_survivability_mode(struct pci_dev *pdev)
 {
-	struct device *dev = &pdev->dev;
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	struct xe_survivability *survivability = &xe->survivability;
 	int ret = 0;
@@ -333,12 +333,12 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 	if (ret)
 		goto err;
 
-	dev_err(dev, "In Survivability Mode\n");
+	xe_ras_log_survivability(xe, 0, "Boot Survivability Mode enabled\n");
 
 	return 0;
 
 err:
-	dev_err(dev, "Failed to enable Survivability Mode\n");
+	xe_ras_log_survivability(xe, ret, "Failed to enable Boot Survivability Mode\n");
 	survivability->mode = false;
 	return ret;
 }
@@ -413,11 +413,12 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 		dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
 
 	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
-	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
+	xe_ras_log_survivability(xe, -EIO,
+				 "Runtime Survivability Mode enabled, firmware flash required.\n"
+				 "Please refer to the userspace documentation for more details!\n");
 
 	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
 	xe_device_declare_wedged(xe);
-	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
 }
 
 /**
-- 
2.34.1

