Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73569CCF9E5
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E1310E6B0;
	Wed, 22 Oct 2025 05:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9buyTKt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB31210E6A7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 05:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761110318; x=1792646318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+wri0rc+od8ThFNYfgpDYFi+WOIuKkRtA1odTKvyLfI=;
 b=S9buyTKtnSaxGenO/LAG9upQ9LFnEI7pOTQVPfzjjrduLRoZTVNbjlVc
 5+YLTQIFpoG8yH7JnDHeImV0FFmHUth8iYhHU7Zv94IwUDPSZ6hQlT8y7
 UZmhxIcMaRY1VKmLEsDa8SQ+FAyvsVVql8n6lW9i36GnR5OPhjCjYfrvj
 rEnqdNpgoNQg6oGaNtiQT3RKUYlnHwg/HRCQD8WVkYK/nUQ2LP/DFqmys
 JrPGMHUNZriDdzRRTzzAjq+Kt3424GJtu7bpuRe/tD90x+zFDcevo5HCC
 qscogmLnXtyVG9X3wUwDyhTr9s6pl7EQ93/HmLrVyqWJRaqvkdSIk+tJP Q==;
X-CSE-ConnectionGUID: srRM5RoiSCiZmnd+9LkSkg==
X-CSE-MsgGUID: /cz3YDjqQqCuFNw1xuIF9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67083979"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67083979"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
X-CSE-ConnectionGUID: F5X4rdhHS/aNmk7tY/l6fA==
X-CSE-MsgGUID: gMnkxBk+Tx2gYXpbzlFxmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220959707"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 09/12] drm/xe/pf: Configure LMTT in MERT
Date: Tue, 21 Oct 2025 22:17:41 -0700
Message-ID: <20251021-cri-v1-9-bf11e61d9f49@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

On platforms with standalone MERT, the PF driver needs to program LMTT
in MERT's LMEM_CFG register.

While at it, sort the includes in drivers/gpu/drm/xe/xe_lmtt.c.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_mert_regs.h | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_lmtt.c           | 12 ++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
new file mode 100644
index 0000000000000..5b7c15e08747e
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
index 4dc1de482eeed..e9f19b2a7b5e1 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -8,16 +8,18 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_mert_regs.h"
 
 #include "xe_assert.h"
 #include "xe_bo.h"
-#include "xe_tlb_inval.h"
 #include "xe_lmtt.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_res_cursor.h"
 #include "xe_sriov.h"
+#include "xe_tile.h"
 #include "xe_tile_sriov_printk.h"
+#include "xe_tlb_inval.h"
 
 /**
  * DOC: Local Memory Translation Table
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
2.51.0

