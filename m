Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F513C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 13:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BBF10E409;
	Mon, 11 Dec 2023 13:36:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AF510E408
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 13:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702301769; x=1733837769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ntRMPqJfRz17cGQmfgbV0miSdC158Ho3MOitU98oP80=;
 b=JVekNv927fOPiPHDuGa7mkXYe3OoIhEK2yLpv42WbSzCGAZ8snG05utw
 MI+l/1U2K7LEKC5GKvspKh/vOHIL9khAESbLci1uRFciobAbvxmMPqa/1
 Wkzr3OXMNNW8Dhlbr8z21p1aZK6Y6KO60yB1OvYOUZofVwAplpDnAWetK
 Qe8c0MOTBI/8ORIsCpB9gZjGmIaXHYV3l4gQQleY7NkN2F3f4k9zgUcTM
 8S7I640d4MAseurcoOriV63eZMq1zyiwsK4dbXt+loX1J0gVt/1c0ab16
 0zRMPMCAAH+tOaQl8lDU0JmIMR0mfj4E2V003CEHP7z4r5NA/E5w6QyoG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1715587"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1715587"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 05:36:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946324760"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="946324760"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga005.jf.intel.com with ESMTP; 11 Dec 2023 05:36:07 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 01/10] drm/xe/xe2: Determine bios enablement for flat ccs
 on igfx
Date: Mon, 11 Dec 2023 19:13:47 +0530
Message-Id: <20231211134356.1645973-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
References: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If bios disables flat ccs on igfx make has_flat_ccs as 0 and notify
via drm_info.

Bspec:59255

v2:
 - Release forcewake.
 - Add registers in order.
 - drop dgfx condition and only add it back in the future
when the support for an Xe2 dgpu will be added.
- Use drm_dbg instead of drm_info. (Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_device.c       | 30 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 5f5a72e9d0d8..f5bf4c6d1761 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -162,6 +162,9 @@
 #define XEHP_SQCM				XE_REG_MCR(0x8724)
 #define   EN_32B_ACCESS				REG_BIT(30)
 
+#define XE2_FLAT_CCS_BASE_RANGE_LOWER		XE_REG_MCR(0x8800)
+#define   XE2_FLAT_CCS_ENABLE			REG_BIT(0)
+
 #define GSCPSMI_BASE				XE_REG(0x880c)
 
 #define	MIRROR_FUSE3				XE_REG(0x9118)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 2e0b2e40d8f3..91f5807d2d20 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -16,6 +16,7 @@
 #include <drm/xe_drm.h>
 
 #include "regs/xe_regs.h"
+#include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_debugfs.h"
 #include "xe_display.h"
@@ -26,6 +27,7 @@
 #include "xe_exec.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_gt_mcr.h"
 #include "xe_irq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -401,6 +403,30 @@ int xe_device_probe_early(struct xe_device *xe)
 	return 0;
 }
 
+static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
+{
+	u32 reg;
+	int err;
+
+	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
+		return 0;
+
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		return err;
+
+	reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
+	xe->info.has_flat_ccs = (reg & XE2_FLAT_CCS_ENABLE);
+
+	if (!xe->info.has_flat_ccs)
+		drm_dbg(&xe->drm,
+			 "Flat CCS has been disabled in bios, May lead to performance impact");
+
+	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -456,6 +482,10 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_irq_shutdown;
 	}
 
+	err = xe_device_set_has_flat_ccs(xe);
+	if (err)
+		return err;
+
 	err = xe_mmio_probe_vram(xe);
 	if (err)
 		goto err_irq_shutdown;
-- 
2.25.1

