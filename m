Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F6BC64ED6
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 00:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D139C10E3C1;
	Fri, 17 Feb 2023 00:53:07 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0603F10E138
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 00:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676595185; x=1708131185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bg6UTQBG3PagnjPdYUchdIjhGPos488voi3ZqrxaRjs=;
 b=SqV6kdXVvePwxi3R1MBILi9/e3ARMUuTQOr0T6ybXSttkMHZD+2dyWmY
 eLuUhtZ5B6qSpvJcSAGx0HCZ6Os9LuhrKc/TkNlXnHmvMZWJ7H+9axaAR
 3kKSv9wiYVEVVoxK+0eYhTAlB8549eGv5HOc2YOJTxJr7rBNLu92WqUsO
 wGwI+ZX3wE1OjXb9aonCmJ+vINUr2L2TFd+i/Le7A3ZhSqHcF+d6y9zj2
 JJ//UAjrJDoXQsGBh7Vn6ASY5i2s+RgiDfmwD1sZOydwoLqFY/3hoG4Ra
 jUCLlETIXHTF3F6uRC3iQc1Iym9/q60jBF1YRlRRndCAlXZQLCjn8Pyyt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="329602195"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="329602195"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672417772"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="672417772"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:04 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 16:52:17 -0800
Message-Id: <20230217005226.106499-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217005226.106499-1-lucas.demarchi@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 02/11] drm/xe: Sort includes
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
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Sort includes and split them in blocks:

1) .h corresponding to the .c. Example: xe_bb.c should have a "#include
   "xe_bb.h" first.
2) #include <linux/...>
3) #include <drm/...>
4) local includes
5) i915 includes

This is accomplished by running
`clang-format --style=file -i --sort-includes drivers/gpu/drm/xe/*.c`
and ignoring all the changes after the includes. There are also some
manual tweaks to split the blocks.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c                  |  4 ++--
 drivers/gpu/drm/xe/xe_bo.c                  |  2 --
 drivers/gpu/drm/xe/xe_bo_evict.c            |  2 +-
 drivers/gpu/drm/xe/xe_debugfs.c             |  2 +-
 drivers/gpu/drm/xe/xe_device.c              |  9 ++++-----
 drivers/gpu/drm/xe/xe_display.c             | 12 ++++++------
 drivers/gpu/drm/xe/xe_dma_buf.c             |  8 +++-----
 drivers/gpu/drm/xe/xe_engine.c              |  4 ++--
 drivers/gpu/drm/xe/xe_exec.c                |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c            |  9 ++++-----
 drivers/gpu/drm/xe/xe_force_wake.c          |  4 ++--
 drivers/gpu/drm/xe/xe_ggtt.c                |  7 +++----
 drivers/gpu/drm/xe/xe_gt.c                  |  2 +-
 drivers/gpu/drm/xe/xe_gt_clock.c            |  8 ++++----
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |  2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c              |  2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |  2 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c            |  4 +++-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
 drivers/gpu/drm/xe/xe_gt_topology.c         |  2 +-
 drivers/gpu/drm/xe/xe_guc.c                 | 13 +++++++------
 drivers/gpu/drm/xe/xe_guc_ads.c             |  5 +++--
 drivers/gpu/drm/xe/xe_guc_ct.c              |  4 ++--
 drivers/gpu/drm/xe/xe_guc_debugfs.c         |  2 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c        |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c             |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              | 12 +++++++-----
 drivers/gpu/drm/xe/xe_guc_submit.c          |  6 +++---
 drivers/gpu/drm/xe/xe_huc.c                 |  2 +-
 drivers/gpu/drm/xe/xe_huc_debugfs.c         |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c           |  3 +--
 drivers/gpu/drm/xe/xe_hw_fence.c            |  1 -
 drivers/gpu/drm/xe/xe_irq.c                 |  5 +++--
 drivers/gpu/drm/xe/xe_lrc.c                 |  7 +++----
 drivers/gpu/drm/xe/xe_migrate.c             | 11 ++++++-----
 drivers/gpu/drm/xe/xe_mmio.c                |  3 +--
 drivers/gpu/drm/xe/xe_mocs.c                |  4 ++--
 drivers/gpu/drm/xe/xe_module.c              |  1 +
 drivers/gpu/drm/xe/xe_pci.c                 |  5 ++---
 drivers/gpu/drm/xe/xe_pcode.c               | 10 ++++------
 drivers/gpu/drm/xe/xe_pm.c                  |  4 ++--
 drivers/gpu/drm/xe/xe_preempt_fence.c       |  2 +-
 drivers/gpu/drm/xe/xe_pt.c                  |  4 ++--
 drivers/gpu/drm/xe/xe_query.c               | 11 ++++++-----
 drivers/gpu/drm/xe/xe_reg_sr.c              |  5 ++---
 drivers/gpu/drm/xe/xe_reg_whitelist.c       |  7 +++----
 drivers/gpu/drm/xe/xe_ring_ops.c            |  4 ++--
 drivers/gpu/drm/xe/xe_rtp.c                 |  1 -
 drivers/gpu/drm/xe/xe_sa.c                  |  3 ++-
 drivers/gpu/drm/xe/xe_sched_job.c           |  1 -
 drivers/gpu/drm/xe/xe_sync.c                |  5 +++--
 drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c         |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c      |  2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c        |  2 +-
 drivers/gpu/drm/xe/xe_tuning.c              |  2 +-
 drivers/gpu/drm/xe/xe_uc.c                  |  4 ++--
 drivers/gpu/drm/xe/xe_vm.c                  |  2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c          |  8 +++++---
 drivers/gpu/drm/xe/xe_wopcm.c               |  2 +-
 59 files changed, 128 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 8b9209571fd0..a25079d4e710 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -2,12 +2,12 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
-
 #include "xe_bb.h"
-#include "xe_sa.h"
+
 #include "xe_device.h"
 #include "xe_engine_types.h"
 #include "xe_hw_fence.h"
+#include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9b7b9c8f84be..4d7852efc807 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2,8 +2,6 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
-
-
 #include "xe_bo.h"
 
 #include <linux/dma-buf.h>
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 3fb3c8c77efa..a594eb6fec03 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -2,9 +2,9 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_bo_evict.h"
 
 #include "xe_bo.h"
-#include "xe_bo_evict.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index b0f8b157ffa3..f4dbaa666575 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_debugfs.h"
 
 #include <linux/string_helpers.h>
 
@@ -9,7 +10,6 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_debugfs.h"
 #include "xe_gt_debugfs.h"
 #include "xe_step.h"
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a028efa8eebe..4426ab06b796 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -2,15 +2,14 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
-
 #include "xe_device.h"
 
-#include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_aperture.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
-#include <drm/xe_drm.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_atomic_helper.h>
+#include <drm/xe_drm.h>
 
 #include "xe_bo.h"
 #include "xe_debugfs.h"
@@ -21,8 +20,8 @@
 #include "xe_exec.h"
 #include "xe_gt.h"
 #include "xe_irq.h"
-#include "xe_module.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 47a16a3f85fa..6e7b6cfce4d9 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -6,12 +6,16 @@
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 
 #include "xe_display.h"
-#include "xe_module.h"
+
+#include <linux/fb.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
+#include "display/ext/i915_irq.h"
+#include "display/ext/intel_dram.h"
+#include "display/ext/intel_pm.h"
 #include "display/intel_acpi.h"
 #include "display/intel_audio.h"
 #include "display/intel_bw.h"
@@ -22,11 +26,7 @@
 #include "display/intel_hdcp.h"
 #include "display/intel_hotplug.h"
 #include "display/intel_opregion.h"
-#include "display/ext/i915_irq.h"
-#include "display/ext/intel_dram.h"
-#include "display/ext/intel_pm.h"
-
-#include <linux/fb.h>
+#include "xe_module.h"
 
 /* Xe device functions */
 
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index d09ff25bd940..355afe492bd1 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -2,21 +2,19 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_dma_buf.h"
 
+#include <kunit/test.h>
 #include <linux/dma-buf.h>
+#include <linux/pci-p2pdma.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_prime.h>
-
 #include <drm/ttm/ttm_tt.h>
 
-#include <kunit/test.h>
-#include <linux/pci-p2pdma.h>
-
 #include "tests/xe_test.h"
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_dma_buf.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index e478d0417e49..7b11602a4249 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -2,13 +2,13 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
-
 #include "xe_engine.h"
 
+#include <linux/nospec.h>
+
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/xe_drm.h>
-#include <linux/nospec.h>
 
 #include "xe_device.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 00f298acc436..81248b5f232b 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_exec.h"
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
@@ -10,7 +11,6 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_engine.h"
-#include "xe_exec.h"
 #include "xe_macros.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index d555d77cbf49..5633259482ed 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -2,16 +2,15 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
+#include "xe_execlist.h"
 
 #include <drm/drm_managed.h>
 
-#include "xe_execlist.h"
-
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_engine.h"
-#include "xe_hw_fence.h"
 #include "xe_gt.h"
+#include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
@@ -19,11 +18,11 @@
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 
-#include "i915_reg.h"
+#include "gt/intel_engine_regs.h"
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_lrc_reg.h"
-#include "gt/intel_engine_regs.h"
+#include "i915_reg.h"
 
 #define XE_EXECLIST_HANG_LIMIT 1
 
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index d2080e6fbe10..188197c3a8fe 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -2,14 +2,14 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_force_wake.h"
 
 #include <drm/drm_util.h>
 
-#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_mmio.h"
-#include "gt/intel_gt_regs.h"
 
+#include "gt/intel_gt_regs.h"
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index d5bd9bc18c57..53a1edaee02d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -2,24 +2,23 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
-
 #include "xe_ggtt.h"
 
 #include <linux/sizes.h>
-#include <drm/i915_drm.h>
 
 #include <drm/drm_managed.h>
+#include <drm/i915_drm.h>
 
-#include "xe_device.h"
 #include "xe_bo.h"
+#include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_wopcm.h"
 
-#include "i915_reg.h"
 #include "gt/intel_gt_regs.h"
+#include "i915_reg.h"
 
 /* FIXME: Common file, preferably auto-gen */
 #define MTL_GGTT_PTE_PAT0	BIT_ULL(52)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 20dbc08d3685..5c7c2757bb49 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_gt.h"
 
 #include <linux/minmax.h>
 
@@ -14,7 +15,6 @@
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
-#include "xe_gt.h"
 #include "xe_gt_clock.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_pagefault.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 575433e9718a..e50117103e1e 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -2,16 +2,16 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
-
-#include "i915_reg.h"
-#include "gt/intel_gt_regs.h"
+#include "xe_gt_clock.h"
 
 #include "xe_device.h"
 #include "xe_gt.h"
-#include "xe_gt_clock.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 
+#include "gt/intel_gt_regs.h"
+#include "i915_reg.h"
+
 static u32 read_reference_ts_freq(struct xe_gt *gt)
 {
 	u32 ts_override = xe_mmio_read32(gt, GEN9_TIMESTAMP_OVERRIDE.reg);
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c320e58810ce..6bd9b8a908ff 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_gt_debugfs.h"
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
@@ -10,7 +11,6 @@
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
-#include "xe_gt_debugfs.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_engine.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 7617f0340879..43910e48bdc9 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -2,9 +2,9 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_gt_mcr.h"
 
 #include "xe_gt.h"
-#include "xe_gt_mcr.h"
 #include "xe_gt_topology.h"
 #include "xe_gt_types.h"
 #include "xe_mmio.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index ce79eb48feb8..78dcb8b04036 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_gt_pagefault.h"
 
 #include <linux/circ_buf.h>
 
@@ -10,7 +11,6 @@
 
 #include "xe_bo.h"
 #include "xe_gt.h"
-#include "xe_gt_pagefault.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index 2d966d935b8e..717193671f3c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -2,12 +2,14 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_gt_sysfs.h"
 
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
+
 #include <drm/drm_managed.h>
+
 #include "xe_gt.h"
-#include "xe_gt_sysfs.h"
 
 static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 2521c8a65690..24cf81aa46e5 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -2,9 +2,9 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+#include "xe_gt_tlb_invalidation.h"
 
 #include "xe_gt.h"
-#include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_trace.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 8e02e362ba27..e3be481ac8be 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -2,11 +2,11 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_gt_topology.h"
 
 #include <linux/bitmap.h>
 
 #include "xe_gt.h"
-#include "xe_gt_topology.h"
 #include "xe_mmio.h"
 
 #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 5cdfdfd0de40..88cc912fa7eb 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -2,25 +2,26 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_guc.h"
 
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_guc.h"
+#include "xe_force_wake.h"
+#include "xe_gt.h"
 #include "xe_guc_ads.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_guc_log.h"
-#include "xe_guc_reg.h"
 #include "xe_guc_pc.h"
+#include "xe_guc_reg.h"
 #include "xe_guc_submit.h"
-#include "xe_gt.h"
+#include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
-#include "xe_mmio.h"
-#include "xe_force_wake.h"
-#include "i915_reg_defs.h"
+
 #include "gt/intel_gt_regs.h"
+#include "i915_reg_defs.h"
 
 /* TODO: move to common file */
 #define GUC_PVC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 0c08cecaca40..1ea1b25e7170 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -2,21 +2,22 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_guc_ads.h"
 
 #include <drm/drm_managed.h>
 
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
-#include "xe_guc_ads.h"
 #include "xe_guc_reg.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
-#include "gt/intel_gt_regs.h"
+
 #include "gt/intel_engine_regs.h"
+#include "gt/intel_gt_regs.h"
 
 /* Slack of a few additional entries per engine */
 #define ADS_REGSET_EXTRA_MAX	8
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 84d4302d4e72..97fd25eea129 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_guc_ct.h"
 
 #include <linux/bitfield.h>
 #include <linux/circ_buf.h>
@@ -12,10 +13,9 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
-#include "xe_guc.h"
-#include "xe_guc_ct.h"
 #include "xe_gt_pagefault.h"
 #include "xe_gt_tlb_invalidation.h"
+#include "xe_guc.h"
 #include "xe_guc_submit.h"
 #include "xe_map.h"
 #include "xe_trace.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 916e9633b322..d19a7f0f8f0b 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_guc_debugfs.h"
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
@@ -10,7 +11,6 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
-#include "xe_guc_debugfs.h"
 #include "xe_guc_log.h"
 #include "xe_macros.h"
 
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index 57640d608787..f6fd3f51fea4 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_guc_hwconfig.h"
 
 #include <drm/drm_managed.h>
 
@@ -9,7 +10,6 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
-#include "xe_guc_hwconfig.h"
 #include "xe_map.h"
 
 static struct xe_gt *
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 7ec1b2bb1f8e..795e6a955676 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -2,12 +2,12 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_guc_log.h"
 
 #include <drm/drm_managed.h>
 
 #include "xe_bo.h"
 #include "xe_gt.h"
-#include "xe_guc_log.h"
 #include "xe_map.h"
 #include "xe_module.h"
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 3ba0c8a35109..1d4ac0c26d3c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -2,22 +2,24 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_guc_pc.h"
+
+#include <linux/delay.h>
 
 #include <drm/drm_managed.h>
+
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
-#include "xe_gt_types.h"
 #include "xe_gt_sysfs.h"
+#include "xe_gt_types.h"
 #include "xe_guc_ct.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
-#include "i915_reg_defs.h"
-#include "i915_reg.h"
-
-#include <linux/delay.h>
 
+#include "i915_reg.h"
+#include "i915_reg_defs.h"
 #include "intel_mchbar_regs.h"
 
 /* For GEN6_RP_STATE_CAP.reg to be merged when the definition moves to Xe */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a54f7f82d04d..305a0e061778 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_guc_submit.h"
 
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
@@ -13,12 +14,11 @@
 
 #include "xe_device.h"
 #include "xe_engine.h"
+#include "xe_force_wake.h"
+#include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_engine_types.h"
-#include "xe_guc_submit.h"
-#include "xe_gt.h"
-#include "xe_force_wake.h"
 #include "xe_hw_engine.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 82e7fb3a6292..b9fdcc623108 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_huc.h"
 
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -9,7 +10,6 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_reg.h"
-#include "xe_huc.h"
 #include "xe_mmio.h"
 #include "xe_uc_fw.h"
 
diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
index 268bac36336a..dc170c35057e 100644
--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_huc_debugfs.h"
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
@@ -9,7 +10,6 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_huc.h"
-#include "xe_huc_debugfs.h"
 #include "xe_macros.h"
 
 static struct xe_gt *
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index fd89dd90131c..edc59d9b124f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -2,7 +2,6 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
-
 #include "xe_hw_engine.h"
 
 #include <drm/drm_managed.h>
@@ -22,8 +21,8 @@
 #include "xe_wa.h"
 
 #include "gt/intel_engine_regs.h"
-#include "i915_reg.h"
 #include "gt/intel_gt_regs.h"
+#include "i915_reg.h"
 
 #define MAX_MMIO_BASES 3
 struct engine_info {
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index e56ca2867545..8930135aca1c 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -2,7 +2,6 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
-
 #include "xe_hw_fence.h"
 
 #include <linux/device.h>
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 7b7ddd11c2b8..f30fd2b14c22 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
+#include "xe_irq.h"
 
 #include <linux/sched/clock.h>
 
@@ -10,13 +11,13 @@
 #include "xe_device.h"
 #include "xe_display.h"
 #include "xe_drv.h"
-#include "xe_guc.h"
 #include "xe_gt.h"
+#include "xe_guc.h"
 #include "xe_hw_engine.h"
 #include "xe_mmio.h"
 
-#include "i915_reg.h"
 #include "gt/intel_gt_regs.h"
+#include "i915_reg.h"
 
 static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
 {
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 347ff9b34494..45503c39240a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2,22 +2,21 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
-
 #include "xe_lrc.h"
 
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_engine_types.h"
 #include "xe_gt.h"
-#include "xe_map.h"
 #include "xe_hw_fence.h"
+#include "xe_map.h"
 #include "xe_vm.h"
 
-#include "i915_reg.h"
+#include "gt/intel_engine_regs.h"
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_lrc_reg.h"
-#include "gt/intel_engine_regs.h"
+#include "i915_reg.h"
 
 #define GEN8_CTX_VALID				(1 << 0)
 #define GEN8_CTX_L3LLC_COHERENT			(1 << 5)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cbcc355cd391..3d2f8d04bc3a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -4,6 +4,12 @@
  */
 #include "xe_migrate.h"
 
+#include <linux/sizes.h>
+
+#include <drm/drm_managed.h>
+#include <drm/ttm/ttm_tt.h>
+#include <drm/xe_drm.h>
+
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_engine.h"
@@ -20,11 +26,6 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
-#include <linux/sizes.h>
-#include <drm/drm_managed.h>
-#include <drm/ttm/ttm_tt.h>
-#include <drm/xe_drm.h>
-
 #include "gt/intel_gpu_commands.h"
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 8a953df2b468..57788afe206e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -2,7 +2,6 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
-
 #include "xe_mmio.h"
 
 #include <drm/drm_managed.h>
@@ -14,9 +13,9 @@
 #include "xe_macros.h"
 #include "xe_module.h"
 
-#include "i915_reg.h"
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
+#include "i915_reg.h"
 
 #define XEHP_MTCFG_ADDR		_MMIO(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 86b966fffbe5..99d3cc6c7164 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -2,14 +2,14 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_mocs.h"
 
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_engine.h"
 #include "xe_gt.h"
-#include "xe_platform_types.h"
 #include "xe_mmio.h"
-#include "xe_mocs.h"
+#include "xe_platform_types.h"
 #include "xe_step_types.h"
 
 #include "gt/intel_gt_regs.h"
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 9cd1663f83f6..314025b54e7d 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
+#include "xe_module.h"
 
 #include <linux/init.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 25598de3a1fc..b0e5c402190c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -2,7 +2,6 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
-
 #include "xe_pci.h"
 
 #include <linux/device/driver.h>
@@ -10,12 +9,12 @@
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 
-#include <drm/drm_drv.h>
 #include <drm/drm_color_mgmt.h>
+#include <drm/drm_drv.h>
 #include <drm/xe_pciids.h>
 
-#include "xe_drv.h"
 #include "xe_device.h"
+#include "xe_drv.h"
 #include "xe_macros.h"
 #include "xe_module.h"
 #include "xe_pm.h"
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 1a76fe478853..17c8416b4179 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -2,16 +2,14 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
-
-#include "xe_pcode_api.h"
 #include "xe_pcode.h"
 
-#include "xe_gt.h"
-#include "xe_mmio.h"
-
+#include <linux/delay.h>
 #include <linux/errno.h>
 
-#include <linux/delay.h>
+#include "xe_gt.h"
+#include "xe_mmio.h"
+#include "xe_pcode_api.h"
 
 /**
  * DOC: PCODE
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 44c38e670587..02a05aa6783e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_pm.h"
 
 #include <linux/pm_runtime.h>
 
@@ -11,9 +12,8 @@
 #include "xe_bo_evict.h"
 #include "xe_device.h"
 #include "xe_display.h"
-#include "xe_pm.h"
-#include "xe_gt.h"
 #include "xe_ggtt.h"
+#include "xe_gt.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
 
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 6ab9ff442766..20ea4f8f0702 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -2,11 +2,11 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_preempt_fence.h"
 
 #include <linux/slab.h>
 
 #include "xe_engine.h"
-#include "xe_preempt_fence.h"
 #include "xe_vm.h"
 
 static void preempt_fence_work_func(struct work_struct *w)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 435cc30d88c9..a9ed29d06cc1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_pt.h"
 
 #include <drm/drm_pt_walk.h>
 
@@ -10,12 +11,11 @@
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
-#include "xe_pt.h"
 #include "xe_pt_types.h"
-#include "xe_vm.h"
 #include "xe_res_cursor.h"
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
+#include "xe_vm.h"
 
 struct xe_pt_dir {
 	struct xe_pt pt;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 6e904e97f456..8f241f5625be 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -2,18 +2,19 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_query.h"
 
-#include <drm/xe_drm.h>
-#include <drm/ttm/ttm_placement.h>
 #include <linux/nospec.h>
 
+#include <drm/ttm/ttm_placement.h>
+#include <drm/xe_drm.h>
+
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_gt.h"
-#include "xe_macros.h"
-#include "xe_query.h"
 #include "xe_ggtt.h"
+#include "xe_gt.h"
 #include "xe_guc_hwconfig.h"
+#include "xe_macros.h"
 
 static const enum xe_engine_class xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index f7eceb84e647..dc96d0e48688 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -2,23 +2,22 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
-
 #include "xe_reg_sr.h"
 
 #include <linux/align.h>
 #include <linux/string_helpers.h>
 #include <linux/xarray.h>
 
-#include <drm/drm_print.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
-#include "xe_rtp_types.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
+#include "xe_rtp_types.h"
 
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index a34617a642ec..3951460307e2 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -2,15 +2,14 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
-
 #include "xe_reg_whitelist.h"
 
-#include "xe_platform_types.h"
 #include "xe_gt_types.h"
+#include "xe_platform_types.h"
 #include "xe_rtp.h"
 
-#include "../i915/gt/intel_engine_regs.h"
-#include "../i915/gt/intel_gt_regs.h"
+#include "gt/intel_engine_regs.h"
+#include "gt/intel_gt_regs.h"
 
 #undef _MMIO
 #undef MCR_REG
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 370ab1e729fa..5049367bc92d 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -2,19 +2,19 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_ring_ops.h"
 
 #include "xe_engine_types.h"
 #include "xe_gt.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
-#include "xe_ring_ops.h"
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
 
-#include "i915_reg.h"
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_lrc_reg.h"
+#include "i915_reg.h"
 
 static u32 preparser_disable(bool state)
 {
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 5b1316b588d8..f2b8a7d46ebc 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -2,7 +2,6 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
-
 #include "xe_rtp.h"
 
 #include <drm/xe_drm.h>
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index e432f40b9bfe..b4f76c1caec0 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -2,15 +2,16 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include "xe_sa.h"
 
 #include <linux/kernel.h>
+
 #include <drm/drm_managed.h>
 
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_map.h"
-#include "xe_sa.h"
 
 static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
 {
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 2985caa6097b..630d67a3d574 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -2,7 +2,6 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
-
 #include "xe_sched_job.h"
 
 #include <linux/dma-fence-array.h>
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 0fbd8d0978cf..99f1ed87196d 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -8,13 +8,14 @@
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
 #include <linux/uaccess.h>
-#include <drm/xe_drm.h>
+
 #include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
+#include <drm/xe_drm.h>
 
 #include "xe_device_types.h"
-#include "xe_sched_job_types.h"
 #include "xe_macros.h"
+#include "xe_sched_job_types.h"
 
 #define SYNC_FLAGS_TYPE_MASK 0x3
 #define SYNC_FLAGS_FENCE_INSTALLED	0x10000
diff --git a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c b/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
index a0ba8bba84d1..8075781070f2 100644
--- a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
@@ -6,8 +6,8 @@
 
 #include <drm/drm_managed.h>
 
-#include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_tt.h>
 
 #include "xe_bo.h"
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index b4e9c88644e4..1c3783becefd 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -8,8 +8,8 @@
 #include <drm/drm_mm.h>
 
 #include <drm/ttm/ttm_device.h>
-#include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_range_manager.h>
 
 #include "../i915/i915_reg.h"
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index c7e21673b8fd..643365b18bc7 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -6,8 +6,8 @@
 
 #include <drm/drm_managed.h>
 
-#include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_range_manager.h>
 
 #include "xe_bo.h"
 #include "xe_device.h"
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 3cc32e3e7a90..5f8c56baaeba 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -5,8 +5,8 @@
 
 #include "xe_tuning.h"
 
-#include "xe_platform_types.h"
 #include "xe_gt_types.h"
+#include "xe_platform_types.h"
 #include "xe_rtp.h"
 
 #include "gt/intel_gt_regs.h"
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 7886c8b85397..a27e6c1a6aff 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -3,13 +3,13 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include "xe_uc.h"
 #include "xe_device.h"
-#include "xe_huc.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_pc.h"
 #include "xe_guc_submit.h"
-#include "xe_uc.h"
+#include "xe_huc.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7276a375e2e0..a0e35627e45e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -25,8 +25,8 @@
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
-#include "xe_trace.h"
 #include "xe_sync.h"
+#include "xe_trace.h"
 
 #define TEST_VM_ASYNC_OPS_ERROR
 
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 1e4e3a1b0631..29815852985a 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -3,13 +3,15 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <drm/xe_drm.h>
-#include <drm/ttm/ttm_tt.h>
+#include "xe_vm_madvise.h"
+
 #include <linux/nospec.h>
 
+#include <drm/ttm/ttm_tt.h>
+#include <drm/xe_drm.h>
+
 #include "xe_bo.h"
 #include "xe_vm.h"
-#include "xe_vm_madvise.h"
 
 static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
 				       struct xe_vma **vmas, int num_vmas,
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index 8fe182afa06c..e9ac560be57f 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -3,13 +3,13 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include "xe_wopcm.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc_reg.h"
 #include "xe_mmio.h"
 #include "xe_uc_fw.h"
-#include "xe_wopcm.h"
 
 /**
  * DOC: Write Once Protected Content Memory (WOPCM) Layout
-- 
2.39.0

