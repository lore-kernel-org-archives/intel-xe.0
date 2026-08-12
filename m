Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6405EC5DF64
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C0610E45C;
	Wed, 12 Aug 2026 19:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8if8/tt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DA410E45C
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562137; x=1818098137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=srT1H4Kf8+1esbqBy6+J/yvlgLIEnlUQLGEzEAFKM3w=;
 b=I8if8/ttsky3BUf0gpfxpARSArZTlYnLQxCTDu30BzLJ0Rlk0P+JE4Di
 YUmaPL+9KMIKeYfsLvTenpiprfOYO09Acqp4fcgVfXFaHvqBI69P4sZj9
 fRCUagFtlwSvoG3waEGG8WJiptWU1KIsoKmCZ2vCCXpx3z9+GJkP6/1iU
 G7/NQ4g7FLpthhiJtRFK4L88/T0B2H/j/v2q4FJRSqPc+/LG8yWdoIYdn
 ZStrkHxJqDXy4/rJHeHnhgyoDwXvSlfdBRzwIIP3BCy96KaCOqB6MsKCH
 niPT7mR3EVYCRKyT8LfqWaFcApaAAU+37nql6otcuPPy2KzcNBvA7Y7PO Q==;
X-CSE-ConnectionGUID: mZqZcjP7Tziu6VTHJHXd7w==
X-CSE-MsgGUID: y5KbHXFMTw6r9vJ2Kammcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987565"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987565"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:37 -0700
X-CSE-ConnectionGUID: mIHel4ONSZG45ZRlYrmwKw==
X-CSE-MsgGUID: /VCOyrx2Q5KIFrWYdlCzTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892026"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 20/32] drm/xe/survivability: Report 'boot status' using
 SIGID
Date: Wed, 12 Aug 2026 21:14:36 +0200
Message-ID: <20260812191450.11690-21-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

Report 'boot status' details using xe_log_err_fatal/info() macros.
While around, move static helper code closer to the caller and let
it take xe instead of pdev.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 35 ++++++++++++----------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 4c506027fa94..85b4c125a217 100644
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
@@ -172,21 +173,6 @@ static void populate_survivability_info(struct xe_device *xe)
 	}
 }
 
-static void log_survivability_info(struct pci_dev *pdev)
-{
-	struct xe_device *xe = pdev_to_xe_device(pdev);
-	struct xe_survivability *survivability = &xe->survivability;
-	u32 *info = survivability->info;
-	int id;
-
-	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
-		 survivability->boot_status);
-	for (id = 0; id < MAX_SCRATCH_REG; id++) {
-		if (info[id])
-			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
-	}
-}
-
 static int check_boot_failure(struct xe_device *xe)
 {
 	struct xe_survivability *survivability = &xe->survivability;
@@ -429,6 +415,23 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
 }
 
+static void log_survivability_info(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	u32 *info = survivability->info;
+	int id;
+
+	xe_log_err_fatal(xe, SURVIVABILITY, -ENXIO, "Boot Status: %s (%u)\n",
+			 survivability->boot_status == CRITICAL_FAILURE ?
+			 "Critical Failure" : "Other", survivability->boot_status);
+
+	for (id = 0; id < MAX_SCRATCH_REG; id++) {
+		if (!info[id])
+			continue;
+		xe_log_info(xe, SURVIVABILITY, "%s: %#x\n", reg_map[id], info[id]);
+	}
+}
+
 /**
  * xe_survivability_mode_boot_enable - Initialize and enable boot survivability mode
  * @xe: xe device instance
@@ -452,7 +455,7 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
 	 * v2 supports survivability mode for critical errors
 	 */
 	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
-		log_survivability_info(pdev);
+		log_survivability_info(xe);
 		return -ENXIO;
 	}
 
-- 
2.47.1

