Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780D9CCF9EE
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 08:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3168910EABD;
	Fri, 31 Oct 2025 08:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvUBgG1+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BEB10EABE
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 08:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897948; x=1793433948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zto6c7Rh2iQbuwTFp8ITZXLqNZZM1hfRlyo6YzMAatg=;
 b=NvUBgG1+hHJhI8n80J9TylEuqxImERssucl86xTiv5riX/o+OLBf497W
 XTI54vL1vrtXxTZNHiaw3OyJn3VcJElMlKTbVtlCLZebsbFHXv1hFmH18
 48jDzLvgk9eQhg6CD2X6YV9vG9CQDqecsEGvBUc0opQiy4ESNydDGgCzs
 RRu8FdPMqIYY1qswSiELnKAfMwEUK72KcHJpFA80wU4S7HA5QW0Xnt3WL
 0hAb5CrnZfy7bX+sWJUWCPSCg1HdrL7uu5hLk6zCcDRkra57xEBiMrXKh
 Nbc3y2UfmYkV66T8W7LJqO1KNLjEaAoh+17AYCHVSoUqLVHPAMcFBwKZy g==;
X-CSE-ConnectionGUID: TqSaAJbLSDexIC1/Mx/AaA==
X-CSE-MsgGUID: FJ9eKtz0Sm+3JqfhA9VylQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75503188"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75503188"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:05:48 -0700
X-CSE-ConnectionGUID: /jX0e5V/SGK1Fyz9yn0Zag==
X-CSE-MsgGUID: KOxJ/hW4QaGTPuV+Bn2Bvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186631615"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:05:46 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 2/4] drm/xe/pf: Configure LMTT in MERT
Date: Fri, 31 Oct 2025 09:04:59 +0100
Message-Id: <20251031080501.844-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251031080501.844-1-lukasz.laguna@intel.com>
References: <20251031080501.844-1-lukasz.laguna@intel.com>
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

