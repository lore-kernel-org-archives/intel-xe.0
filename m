Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E1CC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 17:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2143C10E11B;
	Wed,  6 Dec 2023 17:14:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFD210E112
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 17:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701882845; x=1733418845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JOGdkA2l5fTrhxEOKXz6r4rbO0noa2mwHk1BnC3QukI=;
 b=MRD1oOJ4PKyshOACIGUm0kHUEn0KFrzmWGakWnHG9HliW3t97WNjoz8F
 S6vk9AtGW3Utq4Jxera3NGmo7hNjO4ElRewau9RMkQyVwNFQvzlYLosPO
 NYoA3oaC9oImCWLzeAQIAXdcRLveNS0TnD7C7pYVUPGnQ3tDkHaOW3nL+
 CIfn0uSKK4tuMch9SNoa5HUhXbSmdTHqLGCjEOeFubGSGhvLaRB30zpFR
 uIEVOMN235lHmHVDqQlla+K0/0G4WgKjcy5emX7Nq+05X2wimnKYyqW/f
 0UWzL+gpY4faXq/W/f8q5z1XjebNxXs5IisjulwR8X1FVr48tPRp+XKFy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391262385"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="391262385"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 09:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1018631897"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="1018631897"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga006.fm.intel.com with ESMTP; 06 Dec 2023 09:12:43 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 22:50:19 +0530
Message-Id: <20231206172027.1184366-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206172027.1184366-1-himal.prasad.ghimiray@intel.com>
References: <20231206172027.1184366-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 1/9] drm/xe/xe2: Determine bios enablement for
 flat ccs on igfx
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

If bios disables flat ccs on igfx make has_flat_ccs as 0 and notify
via drm_info.

Bspec:59255

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_device.c       | 29 ++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index e8dc463a49f6..de5e0cbb05be 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -146,6 +146,9 @@
 #define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
 #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
 
+#define XE2_FLAT_CCS_BASE_RANGE_LOWER		XE_REG_MCR(0x8800)
+#define   XE2_FLAT_CCS_ENABLE			REG_BIT(0)
+
 #define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
 #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8423c817111b..400fa1ac6168 100644
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
@@ -392,6 +394,29 @@ int xe_device_probe_early(struct xe_device *xe)
 	return 0;
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
@@ -447,6 +472,10 @@ int xe_device_probe(struct xe_device *xe)
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

