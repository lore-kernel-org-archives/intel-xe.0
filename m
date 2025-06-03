Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11708C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 16:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E23D10E0F3;
	Tue,  3 Jun 2025 16:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHumzbd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E00910E0F3
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748969159; x=1780505159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=szfOiLoS09gO1Ejnj83aJ66gctjRCVx925YSRBFYm6I=;
 b=mHumzbd/PRGvEQI1v5So+wx90ija1akwmWfilimnM4Js7vMl7plz0ye5
 3jwVxsk0mmsrznjMyw+iRNuhuI910NKGtYBk7ayCbCeh6h94tYoZcNIpU
 QLKljLNGTLadmaF+s2VLTzlkji+slZogq+LcLmxGe6C6ffdaLZ3+J6YWw
 GHf+/d6l9UjV55Lyan7ASXn+NQoqaiHuOepZk/pgmCAh4uk6QMUnFmS9j
 dLBP3hlfUMiKKPPlqLzo2Pmk6MprqjzO+0kWANXe3qS7+kvylCLxkajyt
 mj4yt5WaVJA+f/0XQffL36dB7GodCCRjYif+3HrSs2girGh6BJKDJbAKt A==;
X-CSE-ConnectionGUID: qt/ETZ4uTyKefm7uBm7srg==
X-CSE-MsgGUID: d+q2WsgeRmKiWw9hvDx7oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61640880"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61640880"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:45:59 -0700
X-CSE-ConnectionGUID: 2EgRz2tCTISORUC2kGncPg==
X-CSE-MsgGUID: 5MAV92x5SL6ru8iV/61dSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145885799"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:45:56 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, heikki.krogerus@linux.intel.com
Subject: [PATCH] drm/xe/xe_i2c: Add support for i2c in survivability mode
Date: Tue,  3 Jun 2025 22:39:58 +0530
Message-ID: <20250603170958.1580894-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Initialize i2c in survivability mode to allow firmware
update of Add-In Management Controller (AMC) in survivability mode

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---

This depends on I2C series by Heikki on [1].
[1] https://lore.kernel.org/intel-xe/20250530141744.3605983-1-heikki.krogerus@linux.intel.com/

 drivers/gpu/drm/xe/xe_survivability_mode.c | 23 ++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 1f710b3fc599..3800cc855c22 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -14,6 +14,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_heci_gsc.h"
+#include "xe_i2c.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
 #include "xe_vsec.h"
@@ -173,20 +174,26 @@ static int enable_survivability_mode(struct pci_dev *pdev)
 	survivability->mode = true;
 
 	ret = xe_heci_gsc_init(xe);
-	if (ret) {
-		/*
-		 * But if it fails, device can't enter survivability
-		 * so move it back for correct error handling
-		 */
-		survivability->mode = false;
-		return ret;
-	}
+	if (ret)
+		goto err;
 
 	xe_vsec_init(xe);
 
+	ret = xe_i2c_probe(xe);
+	if (ret)
+		goto err;
+
 	dev_err(dev, "In Survivability Mode\n");
 
 	return 0;
+
+err:
+	/*
+	 * But if it fails, device can't enter survivability
+	 * so move it back for correct error handling
+	 */
+	survivability->mode = false;
+	return ret;
 }
 
 /**
-- 
2.47.1

