Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C9CC5DF6A
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61CD10F6D2;
	Fri, 14 Aug 2026 17:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYyXce2o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B90810F6CC
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727933; x=1818263933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z9ELffBUJkF2Bph0mCP6OD2bh3ISAHeyrVPj8zPU98A=;
 b=gYyXce2oAYX1/hHXXFhyojlWiS4Jkb3EwDFijpPm3Gu3cB+TbHYmTlau
 CXbwyHEy+X/yIK+Y8UZalt7mDmTa7jBdUIQrVB6QEHTe2aGxbRGz9Sz5a
 BuEWBkKh11ijhN9B/8pOZj4N7HZqUohQe2oyNmss3Y0ZsfvNYWpKSPzxF
 BIWBILJpFVwUEpn3UM0prnQzjgv7tT/myTSOPUS4+nRwgBUyTUoqkUdZm
 DlibClr1E7y9Uf5YHrWm3xi3KYCqThVgo67lyNu0ghstzoDzi0+OVM40B
 V/TvXfIHv7qcqsVS9gtUSVimPte1AyVxOuhRC2gHUxjTxzHUNdEjiwe6B w==;
X-CSE-ConnectionGUID: XukCY1/cSIeRcKQb3lk4IQ==
X-CSE-MsgGUID: 8z1UdInYQ5evsOwwtP+fIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464072"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:53 -0700
X-CSE-ConnectionGUID: fgF+idLwRRmq6IDs+dugiQ==
X-CSE-MsgGUID: aSNqkuVbRwmt3RKvZgRxMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946253"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 20/33] drm/xe/survivability: Report 'boot status' using
 SIGID
Date: Fri, 14 Aug 2026 19:17:46 +0200
Message-ID: <20260814171801.13347-21-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

Report 'boot status' and other scratch registers details using
the xe_log_info() macros. While around, add helper to decode
boot status code and change pdev parameter to xe.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com> #v1
---
v2: make helper more even flexible (Michal)
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 29 ++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 4c506027fa94..0ace10ae500a 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -14,6 +14,7 @@
 #include "xe_device.h"
 #include "xe_heci_gsc.h"
 #include "xe_i2c.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_nvm.h"
 #include "xe_pcode_api.h"
@@ -172,18 +173,32 @@ static void populate_survivability_info(struct xe_device *xe)
 	}
 }
 
-static void log_survivability_info(struct pci_dev *pdev)
+static const char *boot_status_str(u8 boot_status)
+{
+	switch (boot_status) {
+	case CRITICAL_FAILURE:
+		return "Critical Failure";
+	case NON_CRITICAL_FAILURE:
+		return "Non Critical Failure";
+	default:
+		return "Other";
+	}
+}
+
+static void log_survivability_info(struct xe_device *xe)
 {
-	struct xe_device *xe = pdev_to_xe_device(pdev);
 	struct xe_survivability *survivability = &xe->survivability;
 	u32 *info = survivability->info;
 	int id;
 
-	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
-		 survivability->boot_status);
+	xe_log_info(xe, SURVIVABILITY, "Boot Status: %#x (%s)\n",
+		    survivability->boot_status,
+		    boot_status_str(survivability->boot_status));
+
 	for (id = 0; id < MAX_SCRATCH_REG; id++) {
-		if (info[id])
-			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
+		if (!info[id])
+			continue;
+		xe_log_info(xe, SURVIVABILITY, "%s: %#x\n", reg_map[id], info[id]);
 	}
 }
 
@@ -452,7 +467,7 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
 	 * v2 supports survivability mode for critical errors
 	 */
 	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
-		log_survivability_info(pdev);
+		log_survivability_info(xe);
 		return -ENXIO;
 	}
 
-- 
2.47.1

