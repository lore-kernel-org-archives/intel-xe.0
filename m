Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2697AC6FA99
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 19:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD75810E187;
	Tue, 21 Feb 2023 19:41:21 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F4B10E366
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677008478; x=1708544478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VHQRc7dqMKlgPaXd3v0g8Bgn1HSrLciTj/s2jhbTSL4=;
 b=dqjCEHx3smVZwRbpjgbIrSDKb/jgJ/XQu2z/MXkL6ZMw7TeyWijEKQY0
 UzC30RopDYwMmSgAwAA8J0IjFcdPvGgBZdGEQbT9v09ga7qBFsvsZ4HmD
 x6TQkIKCpfqE2v2zen5bJdwyNppN7Y5PFuFgCXba0Sx7mCqx5a0cEni90
 tAplZOL8FIIi/Ao4FiFpa+xRNStGWZwrk/wDFamD/xfbvmqVhguu5qKtD
 p6E6PoOEGwE5hEUKbpYxwpn5T89lpXdexcMrHPmoK0crmtu/rei3bmfuP
 H6UibVBtfT7oNyewensM+FFq47bSgvGzxAr1mzaSce374JxbZbFrEuD0p A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332735710"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="332735710"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621622224"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="621622224"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 11:40:01 -0800
Message-Id: <20230221194002.819026-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221194002.819026-1-lucas.demarchi@intel.com>
References: <20230221194002.819026-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 12/13] drm/xe: Add xe_reg_defs.h
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Wrap the include of i915_reg_defs.h into an xe-only header so the i915
include doesn't need to be spread across the driver.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  2 +-
 drivers/gpu/drm/xe/regs/xe_reg_defs.h    | 11 +++++++++++
 drivers/gpu/drm/xe/regs/xe_regs.h        |  2 +-
 drivers/gpu/drm/xe/xe_device.c           |  3 +--
 drivers/gpu/drm/xe/xe_gt_mcr.h           |  2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c     |  3 +--
 drivers/gpu/drm/xe/xe_gt_topology.c      |  3 +--
 drivers/gpu/drm/xe/xe_guc.c              |  2 --
 drivers/gpu/drm/xe/xe_guc_reg.h          |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c          |  3 +--
 drivers/gpu/drm/xe/xe_pcode_api.h        |  2 +-
 drivers/gpu/drm/xe/xe_reg_sr_types.h     |  2 --
 drivers/gpu/drm/xe/xe_rtp.h              |  2 --
 drivers/gpu/drm/xe/xe_rtp_types.h        |  2 --
 drivers/gpu/drm/xe/xe_step.c             |  3 +--
 16 files changed, 22 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_reg_defs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 6dfa3cf2fd43..2aa67d001c34 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -8,7 +8,7 @@
 
 #include <asm/page.h>
 
-#include "i915_reg_defs.h"
+#include "regs/xe_reg_defs.h"
 
 #define RING_TAIL(base)				_MMIO((base) + 0x30)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index ab8c9e51f62e..1d4063eb3773 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -6,7 +6,7 @@
 #ifndef _XE_GT_REGS_H_
 #define _XE_GT_REGS_H_
 
-#include "i915_reg_defs.h"
+#include "regs/xe_reg_defs.h"
 
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0				_MMIO(0xd00)
diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
new file mode 100644
index 000000000000..5f6735697d9c
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_REG_DEFS_H_
+#define _XE_REG_DEFS_H_
+
+#include "../../i915/i915_reg_defs.h"
+
+#endif
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 53f1ed54fb1c..74588d42a339 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -5,7 +5,7 @@
 #ifndef _XE_REGS_H_
 #define _XE_REGS_H_
 
-#include "i915_reg_defs.h"
+#include "regs/xe_reg_defs.h"
 
 #define GU_CNTL					_MMIO(0x101010)
 #define   LMEM_INIT				REG_BIT(7)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8f2b2acd4024..87d3d2cde665 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -12,6 +12,7 @@
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
+#include "regs/xe_reg_defs.h"
 #include "xe_bo.h"
 #include "xe_debugfs.h"
 #include "xe_display.h"
@@ -31,8 +32,6 @@
 #include "xe_vm_madvise.h"
 #include "xe_wait_user_fence.h"
 
-#include "../i915/i915_reg_defs.h"
-
 #define SOFTWARE_FLAGS_SPR33         _MMIO(0x4F084)
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index c31987d2177c..2a6cd38c8cb7 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -6,7 +6,7 @@
 #ifndef _XE_GT_MCR_H_
 #define _XE_GT_MCR_H_
 
-#include "i915_reg_defs.h"
+#include "regs/xe_reg_defs.h"
 
 struct drm_printer;
 struct xe_gt;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 19403dbea9f5..062430394a33 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 
+#include "regs/xe_reg_defs.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
@@ -20,8 +21,6 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
-#include "../i915/i915_reg_defs.h"
-
 struct pagefault {
 	u64 page_addr;
 	u32 asid;
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 3f7510abfc26..697c1c5f6982 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -7,11 +7,10 @@
 
 #include <linux/bitmap.h>
 
+#include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
 #include "xe_mmio.h"
 
-#include "../i915/i915_reg_defs.h"
-
 #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8e3069598f75..cd001181fd42 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -22,8 +22,6 @@
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
-#include "i915_reg_defs.h"
-
 /* TODO: move to common file */
 #define GUC_PVC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
 #define PVC_MOCS_UC_INDEX		1
diff --git a/drivers/gpu/drm/xe/xe_guc_reg.h b/drivers/gpu/drm/xe/xe_guc_reg.h
index 513a7e0c8a5a..b5ebec30140d 100644
--- a/drivers/gpu/drm/xe/xe_guc_reg.h
+++ b/drivers/gpu/drm/xe/xe_guc_reg.h
@@ -9,7 +9,7 @@
 #include <linux/compiler.h>
 #include <linux/types.h>
 
-#include "i915_reg_defs.h"
+#include "regs/xe_reg_defs.h"
 
 /* Definitions of GuC H/W registers, bits, etc */
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index d845f7cadbd4..4872adadeb8e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -11,6 +11,7 @@
 #include <drm/ttm/ttm_tt.h>
 #include <drm/xe_drm.h>
 
+#include "regs/xe_reg_defs.h"
 #include "regs/xe_gpu_commands.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
@@ -28,8 +29,6 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
-#include "../i915/i915_reg_defs.h"
-
 /**
  * struct xe_migrate - migrate context.
  */
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 2103f684a8b5..4e689cd4b23b 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -5,7 +5,7 @@
 
 /* Internal to xe_pcode */
 
-#include "../i915/i915_reg_defs.h"
+#include "regs/xe_reg_defs.h"
 
 #define PCODE_MAILBOX			_MMIO(0x138124)
 #define   PCODE_READY			REG_BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
index 2fa7ff3966ba..8a317ce428a4 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
@@ -9,8 +9,6 @@
 #include <linux/xarray.h>
 #include <linux/types.h>
 
-#include "i915_reg_defs.h"
-
 struct xe_reg_sr_entry {
 	u32		clr_bits;
 	u32		set_bits;
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 1ac3fd1c0734..099047af89b4 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -11,8 +11,6 @@
 
 #include "xe_rtp_types.h"
 
-#include "i915_reg_defs.h"
-
 /*
  * Register table poke infrastructure
  */
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index fac0bd6d5b1e..e87f1b280d96 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -8,8 +8,6 @@
 
 #include <linux/types.h>
 
-#include "i915_reg_defs.h"
-
 struct xe_hw_engine;
 struct xe_gt;
 
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index e5e77cb9ea09..f78a7dc3049f 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -5,11 +5,10 @@
 
 #include "xe_step.h"
 
+#include "regs/xe_reg_defs.h"
 #include "xe_device.h"
 #include "xe_platform_types.h"
 
-#include "../i915/i915_reg_defs.h"
-
 /*
  * Provide mapping between PCI's revision ID to the individual GMD
  * (Graphics/Media/Display) stepping values that can be compared numerically.
-- 
2.39.0

