Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF191CFD34E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 19:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40BA10E253;
	Mon, 24 Nov 2025 19:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3KqVqg+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F09010E253
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764010974; x=1795546974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZNdE0jSmw8ayWTXav8lwEKgGtjarvozSXj7bmOStSxI=;
 b=j3KqVqg++bj3EH+Tr2/SAJcilK5WD5BLe3Iqb1otg1GZDyrfj3zOzloG
 6eMHoeX3TNyr5LsY5XYiMbMSXFF2dZ+P5sJ0qkfKL4akV5eQf8S4cDJzY
 vZRbCF7SAoF4+SFVl8pn4WSYmHBwec4I6P66NOP81KBBueV0LmUcfYT1Q
 dpCT4BN3U9FCgxNWjIlUx5+sWtarGFmXQ75bOEXDX89DoG+HJ0TXVDyIm
 uwuNTAhI7cZ1U9WSqTnlspEWrOK8w6qJGPrUUFbKwOmmWxZmCYCROnlf/
 KAxvDLCGxQdVvIf7bVsG8mcszOut1YuxtxE8Gj2mEBnZAfb2hmURQqwn+ A==;
X-CSE-ConnectionGUID: H0CEGPTRSRiDjca97AA4zQ==
X-CSE-MsgGUID: yW9pZiLYRuujwaaHv+fteQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83410037"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="83410037"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:02:54 -0800
X-CSE-ConnectionGUID: WWAw39hQTYSQjC4pYiMudA==
X-CSE-MsgGUID: M7vItW59S0yl9gin8swexg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="196858146"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:02:52 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v3 2/4] drm/xe/pf: Configure LMTT in MERT
Date: Mon, 24 Nov 2025 20:02:35 +0100
Message-Id: <20251124190237.20503-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251124190237.20503-1-lukasz.laguna@intel.com>
References: <20251124190237.20503-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

On platforms with standalone MERT, the PF driver needs to program LMTT
in MERT's LMEM_CFG register.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_mert_regs.h | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_lmtt.c           | 10 +++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mert_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
new file mode 100644
index 000000000000..5b7c15e08747
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_MERT_REGS_H_
+#define _XE_MERT_REGS_H_
+
+#include "regs/xe_reg_defs.h"
+
+#define MERT_LMEM_CFG				XE_REG(0x1448b0)
+
+#endif /* _XE_MERT_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 4dc1de482eee..f50c5a4b9edf 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_mert_regs.h"
 
 #include "xe_assert.h"
 #include "xe_bo.h"
@@ -17,6 +18,7 @@
 #include "xe_mmio.h"
 #include "xe_res_cursor.h"
 #include "xe_sriov.h"
+#include "xe_tile.h"
 #include "xe_tile_sriov_printk.h"
 
 /**
@@ -196,16 +198,22 @@ static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
 	struct xe_device *xe = tile_to_xe(tile);
 	dma_addr_t offset = xe_bo_main_addr(lmtt->pd->bo, XE_PAGE_SIZE);
 	struct xe_gt *gt;
+	u32 config;
 	u8 id;
 
 	lmtt_debug(lmtt, "DIR offset %pad\n", &offset);
 	lmtt_assert(lmtt, xe_bo_is_vram(lmtt->pd->bo));
 	lmtt_assert(lmtt, IS_ALIGNED(offset, SZ_64K));
 
+	config = LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K);
+
 	for_each_gt_on_tile(gt, tile, id)
 		xe_mmio_write32(&gt->mmio,
 				GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG,
-				LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K));
+				config);
+
+	if (xe_device_has_mert(xe) && xe_tile_is_root(tile))
+		xe_mmio_write32(&tile->mmio, MERT_LMEM_CFG, config);
 }
 
 /**
-- 
2.40.0

