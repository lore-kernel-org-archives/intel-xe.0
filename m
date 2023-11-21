Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E554C5ACB3
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 10:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D013110E256;
	Tue, 21 Nov 2023 10:01:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1C710E255
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700560903; x=1732096903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+fHEB5J7okSY+UluWB3WXVxLGWhW+TCon5ecMvOduKY=;
 b=Kb6zaiC6Lr289bGjcGwxrPLAZ7imHgOmwbyxxAD+EuX0DZcdB7d9ywWa
 0uhXSRMq+8mwttis8Og2RQFsUSrVv3Y/e6tPIR+Zd78GE4g/tiQaw4dr2
 EE7/3dHTrzoZqHMoD+ohAd7bMTaAimrqg18odGB0/1H6J8l0i8xwCOD1x
 kxBBeWBOvhtzhxrC3dIfwlO0wPE4PABbZiXG3Xl42LTEiS51mDRmm7jxX
 8nqwfSGmpsNddTTB/+8t76jlDZM9e/2QszKAWUistElUIIuc7eI2BFVVY
 gn2KlwH0DiDuHa0Z5/3VM0XeRfBTluZ5zVw+y8/W7q28fM0kNf+MU7p+h g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394646799"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="394646799"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 02:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="857283628"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="857283628"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2023 02:01:41 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 15:39:02 +0530
Message-Id: <20231121100906.3587649-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v2 2/6] drm/xe/xe2: Determine bios enablement for
 flat ccs on igfx.
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

If bios disables flat ccs on igfx  make has_flat_ccs as 0 and notify
via drm_info.

Bspec:59255

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_device.c       | 30 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cc27fe8fc363..b642301947f5 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -142,6 +142,9 @@
 #define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
 #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
 
+#define XE2_FLAT_CCS_BASE_RANGE_LOWER		XE_REG_MCR(0x8800)
+#define   XE2_FLAT_CCS_ENABLE			REG_BIT(0)
+
 #define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
 #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8be765adf702..07a3e4cf48d1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -16,6 +16,7 @@
 #include <drm/xe_drm.h>
 
 #include "regs/xe_regs.h"
+#include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_debugfs.h"
 #include "xe_display.h"
@@ -25,6 +26,7 @@
 #include "xe_exec_queue.h"
 #include "xe_exec.h"
 #include "xe_gt.h"
+#include "xe_gt_mcr.h"
 #include "xe_irq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -342,6 +344,29 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
 		xe_gt_sanitize(gt);
 }
 
+static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
+{
+	u32 reg;
+	int err;
+
+	if (IS_DGFX(xe) || GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
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
+		drm_info(&xe->drm,
+			 "Flat CCS has been disabled in bios, May lead to performance impact");
+	return 0;
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -352,6 +377,7 @@ int xe_device_probe(struct xe_device *xe)
 	xe_pat_init_early(xe);
 
 	xe->info.mem_region_mask = 1;
+
 	err = xe_display_init_nommio(xe);
 	if (err)
 		return err;
@@ -390,6 +416,10 @@ int xe_device_probe(struct xe_device *xe)
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

