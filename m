Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06B0E7DF08
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 16:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7533E10E50A;
	Mon,  2 Feb 2026 16:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNdDlu3p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2296C10E50A
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 16:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770051099; x=1801587099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MvvvkqD5UJNzckUZI7uW/1P2f6rQj7BPzCqGdr0gZP0=;
 b=jNdDlu3pJbJF9JbNa5r6B5xuKsD1ToFBXaNqDoT8mBNW79l8AOtpbCoM
 lY4SCUd1LR2RoCz3AEHJ7YTebvdsHjAuI7MIwRbCUtw5wNwIwI5H0BKyH
 pEJH/6RWNHih3cI/htH88VEj+es/CMSrdvTqf9BKXXH+51WaDT4ezQUPo
 gm7nwTeZnHXkpsHGtUI3Ug/jEtsUSEapYsozswE+bgasaeHjGwtVPmGgm
 VP//tP1sF+u6Jb/Oowz3EAuAXacHwLEahfek0Xim0NvU9DvkaPanr9kSo
 EF+wXesdznqfVPb9ohRQu0OL8ZjnGemIk9PB7X9sRCzsfoTKCJgfxUIHZ Q==;
X-CSE-ConnectionGUID: plwLqOpQQveCGB6ZZbONwg==
X-CSE-MsgGUID: U0fkN3kATyWECMCN5nCY3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70415788"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="70415788"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 08:51:39 -0800
X-CSE-ConnectionGUID: t6F2iLgeTqy4/EN8pFQNBQ==
X-CSE-MsgGUID: aF0Xtw2jSWSa8derXpcx5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="232482962"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 08:51:37 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2] drm/xe/cri: Add check to verify if CSC is a PCIe endpoint
Date: Mon,  2 Feb 2026 22:23:52 +0530
Message-ID: <20260202165351.2020699-2-balasubramani.vivekanandan@intel.com>
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

v2:
  - Use scoped based resource management for runtime pm (Shuicheng)
  - Initiliaze return value of xe_pcode_read (Shuicheng)
  - Assert when CSC is not supported as a PCIe endpoint

---
 drivers/gpu/drm/xe/xe_heci_gsc.c  | 35 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h |  1 +
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index c1f15313f92e..48b830c99997 100644
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
@@ -42,6 +46,29 @@ static int heci_gsc_irq_init(int irq)
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
+	u32 val = 0;
+
+	guard(xe_pm_runtime)(xe);
+	ret = xe_pcode_read(xe_device_get_root_tile(xe),
+			    PCODE_MBOX(DGFX_PCODE_STATUS,
+				       DGFX_CSC_PCIE_DEVICE_STATUS, 0),
+				       &val, NULL);
+
+	return (!ret && (val & 0x1U));
+}
+
 /**
  * struct heci_gsc_def - graphics security controller heci interface definitions
  *
@@ -179,7 +206,13 @@ int xe_heci_gsc_init(struct xe_device *xe)
 
 	heci_gsc->irq = -1;
 
-	if (xe->info.platform == XE_BATTLEMAGE) {
+	if (xe->info.platform == XE_CRESCENTISLAND) {
+		if (is_csc_pci_ep(xe))
+			return 0;
+
+		xe_assert_msg(xe, false, "CSC not supported as a PCIe endpoint\n");
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

