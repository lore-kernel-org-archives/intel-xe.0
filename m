Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B161D2594B
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 06:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E4010E149;
	Tue, 27 Jan 2026 06:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxfkStMD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE8E10E149
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769497162; x=1801033162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5kPfaVoNktlf2N9b8kRqz2tfN1cfhLbt4txbKEU8Zdc=;
 b=GxfkStMDzymoF0noNlJCR1mGjWfltPi7Gi/Xh5IZIcXvxGMxio0CoJSw
 hZsRaFWLhUXqFa9d+71y+8G4FhmMf0jPJovCmOOYAzatqjLGe8E1tICV7
 itmWhgqGoRa91vGbL05pSyX13LGDp5/u08THtL3jw2I/zxTqMZXQRsC7N
 TIkZzwzhQceIpPdZ4DMsyu1riV0Q+RmMht/4wHK2M88Pmr+0eLB2HLmMT
 1iKzcxxVy9AiaHSWpNXSc52Qshzr7eTSSFQjBn30tmpPt3lOoVEnRfHTG
 GemgrrWFWcZlfFgS7VYJ1qG/RovOEKA149tDNmT+PoYji/f8EGHnn3ZQa Q==;
X-CSE-ConnectionGUID: 3+WN8p0YRbiSrgcIvnjqog==
X-CSE-MsgGUID: NylzXpn/ShqxCcnzsqZcxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81405384"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81405384"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 22:59:22 -0800
X-CSE-ConnectionGUID: HrttYNfhTPWD1ZCJwMoFbg==
X-CSE-MsgGUID: iRaK+4dfRMqEvlsmYzs7Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207131869"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 22:59:19 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Soham Purkait <soham.purkait@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/cri: Add check to verify if CSC is a PCIe endpoint
Date: Tue, 27 Jan 2026 12:31:20 +0530
Message-ID: <20260127070119.1381077-2-balasubramani.vivekanandan@intel.com>
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

From: Soham Purkait <soham.purkait@intel.com>

Add check to verify if CSC is a PCIe endpoint via pcode mailbox
during xe modprobe. If this mode is not supported, an auxiliary
child device for the MEI driver is created as a fallback flow.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_heci_gsc.c  | 35 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h |  1 +
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index c1f15313f92e..191ac24707a4 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -10,10 +10,14 @@
 
 #include <drm/drm_print.h>
 
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_heci_gsc.h"
 #include "regs/xe_gsc_regs.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 #include "xe_platform_types.h"
+#include "xe_pm.h"
 #include "xe_survivability_mode.h"
 
 #define GSC_BAR_LENGTH  0x00000FFC
@@ -42,6 +46,30 @@ static int heci_gsc_irq_init(int irq)
 	return irq_set_chip_data(irq, NULL);
 }
 
+/**
+ * is_csc_pci_ep - Checks whether CSC is exposed as a PCIe endpoint
+ * @xe:  xe device
+ *
+ * This function queries whether CSC is exposed as a PCIe endpoint,
+ * through pcode mailbox sub-command PCODE_STATUS_SUBCOMMAND_CSC_PCIE_DEVICE_STATUS.
+ *
+ * returns true upon CSC as pci endpoint, false otherwise
+ */
+static bool is_csc_pci_ep(struct xe_device *xe)
+{
+	int ret = 0;
+	u32 val;
+
+	xe_pm_runtime_get(xe);
+	ret = xe_pcode_read(xe_device_get_root_tile(xe),
+			    PCODE_MBOX(DGFX_PCODE_STATUS,
+				       DGFX_CSC_PCIE_DEVICE_STATUS, 0),
+				       &val, NULL);
+
+	xe_pm_runtime_put(xe);
+	return (!ret && (val & 0x1U));
+}
+
 /**
  * struct heci_gsc_def - graphics security controller heci interface definitions
  *
@@ -179,7 +207,12 @@ int xe_heci_gsc_init(struct xe_device *xe)
 
 	heci_gsc->irq = -1;
 
-	if (xe->info.platform == XE_BATTLEMAGE) {
+	if (xe->info.platform == XE_CRESCENTISLAND) {
+		if (is_csc_pci_ep(xe))
+			return 0;
+
+		def = &heci_gsc_def_dg2;
+	} else if (xe->info.platform == XE_BATTLEMAGE) {
 		def = &heci_gsc_def_dg2;
 	} else if (xe->info.platform == XE_PVC) {
 		def = &heci_gsc_def_pvc;
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 85cc7478b787..391a98c8b5fb 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -35,6 +35,7 @@
 #define     DGFX_GET_INIT_STATUS	0x0
 #define     DGFX_INIT_STATUS_COMPLETE	0x1
 #define     DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
+#define     DGFX_CSC_PCIE_DEVICE_STATUS 0x3
 
 #define   PCODE_POWER_SETUP			0x7C
 #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
-- 
2.43.0

