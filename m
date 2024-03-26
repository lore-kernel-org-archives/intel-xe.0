Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2448ACD11DD
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 13:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD11310EF7B;
	Tue, 26 Mar 2024 13:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WoESnonj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A6810EF7B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711458656; x=1742994656;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cWBcoFD5HM033mGLqu6StK1rKLIqhXk4rL9GgMY60E0=;
 b=WoESnonjrOLg+MxLRGZobHNFUqDQeJCZYaersY6FDpiV02OBtqGnRGjs
 5YhaQGb9b8R3ZoxzeOsN9m32GXy+Tu77dt2EcH2iaHnJuimccKJ3lUlIm
 0v0W/TLXKuNtxlr11C+cbgYPwVZ3/r+DLeGTVCW/4kw5DvIGmgti1bk2r
 XGzoWKvtypXLSiSpv1VU/NVKzvOxRaZFaVChzk4eFOnwbzclEhCLJlJE3
 UEJE9Pm5YRP51AX1f9x8cC1JNkHTTV6+Qhecq43aBn5h41yyRHKJZw0EA
 aJmEkiMKyxF5nRhqkCIdpKq4qH01zFqCYvEyS+IZ1fNfWWZLmkfPg8prP Q==;
X-CSE-ConnectionGUID: Ru07fSr3TtKq8MXpSelqjg==
X-CSE-MsgGUID: Bl3NxGMSTIOOGbXFB0c71w==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10300790"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="10300790"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 06:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20504073"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.156.251])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 06:10:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Move HW GGTT definitions to dedicated file
Date: Tue, 26 Mar 2024 14:10:42 +0100
Message-Id: <20240326131042.319-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It's better to keep all hardware GGTT definitions separated from
the driver code. It also helps to avoid duplicated definitions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c          |  7 +------
 drivers/gpu/drm/xe/xe_guc.c           |  4 ++--
 3 files changed, 17 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gtt_defs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
new file mode 100644
index 000000000000..9196d71bad37
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GTT_DEFS_H_
+#define _XE_GTT_DEFS_H_
+
+#define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
+#define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
+
+#define GUC_GGTT_TOP		0xFEE00000
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f54523d7d03c..f659af221bd8 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -12,6 +12,7 @@
 #include <drm/i915_drm.h>
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_gtt_defs.h"
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
@@ -23,12 +24,6 @@
 #include "xe_sriov.h"
 #include "xe_wopcm.h"
 
-#define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
-#define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
-
-/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
-#define GUC_GGTT_TOP	0xFEE00000
-
 static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 				   u16 pat_index)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c558d978462a..77be3bc2d7c0 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -12,6 +12,7 @@
 #include "abi/guc_actions_abi.h"
 #include "abi/guc_errors_abi.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_gtt_defs.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -33,14 +34,13 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
-/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
-#define GUC_GGTT_TOP    0xFEE00000
 static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 			    struct xe_bo *bo)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	u32 addr = xe_bo_ggtt_addr(bo);
 
+	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
 	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
 	xe_assert(xe, addr < GUC_GGTT_TOP);
 	xe_assert(xe, bo->size <= GUC_GGTT_TOP - addr);
-- 
2.43.0

