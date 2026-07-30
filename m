Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C34C55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 15:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1A510EFB9;
	Thu, 30 Jul 2026 15:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSNqV+lA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2174D10EFB0
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 15:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785425615; x=1816961615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b6ek8c5cLv96AT+/oUuRxUunSXLNa/GYnuusBatFMQk=;
 b=OSNqV+lAPXnXuqIgtFJtJ9j9MS9HtV2r7VjhYv80UGlVxRRfLM/+uxhT
 U/5P8RR+whoKnrz9Omdl2a7X9r3qlx3MfGOYqghg6Txlq4ke46cokkHiz
 XjSRsPP2a2hSQdAYOYTmIn2s90vKif7QSzIzldiVLcgyhAjuMedALXFNn
 ePuRJhQSVosqr2EY59kxxxqa0DdelyeXxukMHwdKAjQtYhGobx62lQFuS
 78Mi8S53mcOqVL49kS347KqHjHlrnpl35uqtRb+HHDNASHv+XzsOyZWpK
 4jnwl4DIbv6DQLflngEz9ujSP50aY1+14UNn56iT9w5aqudnZZOpCHri7 w==;
X-CSE-ConnectionGUID: Xpcjv5iyTsOegedKN7aE/Q==
X-CSE-MsgGUID: yX+GImSXTOemnx7AnlWyvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73583116"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="73583116"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:31 -0700
X-CSE-ConnectionGUID: CTl1KbhlQP+LTRS2G+IF+g==
X-CSE-MsgGUID: bq+CQGZZR0q1g5SHHRrpSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="260387629"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3 18/23] drm/xe: Report 'Survivability Mode' errors using
 SIGID
Date: Thu, 30 Jul 2026 17:21:14 +0200
Message-ID: <20260730152121.576-19-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730152121.576-1-michal.wajdeczko@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
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

Report various 'Survivability Mode' errors using xe_log() helpers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 24 +++++++++++++---------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 4c506027fa94..788b7e8137a9 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -14,9 +14,11 @@
 #include "xe_device.h"
 #include "xe_heci_gsc.h"
 #include "xe_i2c.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_nvm.h"
 #include "xe_pcode_api.h"
+#include "xe_printk.h"
 #include "xe_vsec.h"
 
 /**
@@ -179,11 +181,11 @@ static void log_survivability_info(struct pci_dev *pdev)
 	u32 *info = survivability->info;
 	int id;
 
-	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
-		 survivability->boot_status);
+	xe_log_info(xe, SURVIVABILITY, "Boot Status : Critical Failure (%d)\n",
+		    survivability->boot_status);
 	for (id = 0; id < MAX_SCRATCH_REG; id++) {
 		if (info[id])
-			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
+			xe_log_info(xe, SURVIVABILITY, "%s: 0x%x\n", reg_map[id], info[id]);
 	}
 }
 
@@ -316,7 +318,6 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 
 static int enable_boot_survivability_mode(struct pci_dev *pdev)
 {
-	struct device *dev = &pdev->dev;
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	struct xe_survivability *survivability = &xe->survivability;
 	int ret = 0;
@@ -342,12 +343,12 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 	if (ret)
 		goto err;
 
-	dev_err(dev, "In Survivability Mode\n");
-
+	xe_log_emit(pdev, check_boot_failure(xe) ? CPER_SEV_FATAL : CPER_SEV_INFORMATIONAL,
+		    XE_SIGID_SURVIVABILITY, 0, 0, 0, 0, "In Survivability Boot Mode\n");
 	return 0;
 
 err:
-	dev_err(dev, "Failed to enable Survivability Mode\n");
+	xe_log_err_fatal(xe, SURVIVABILITY, ret, "Failed to enable Survivability Mode\n");
 	survivability->mode = false;
 	return ret;
 }
@@ -412,7 +413,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
-		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
+		xe_log_info(xe, SURVIVABILITY, "Runtime Mode not supported!\n");
 		return;
 	}
 
@@ -422,11 +423,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 		dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
 
 	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
-	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
+	xe_log_err_fatal(xe, SURVIVABILITY, 0, "Runtime Mode enabled!\n");
 
 	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
 	xe_device_declare_wedged(xe);
-	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
+
+	xe_log_err_fatal(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
+	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
+		xe->info.platform_name);
 }
 
 /**
-- 
2.47.1

