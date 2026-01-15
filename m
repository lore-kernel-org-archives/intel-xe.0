Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943ACD3CCA8
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 03:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA0B10E6AD;
	Thu, 15 Jan 2026 03:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRqG9LmV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145C810E18E
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 03:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768447693; x=1799983693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iKxbx6MNsAwc9BHF2rUeLCcstm/k9DsEUuhr/epSuAU=;
 b=XRqG9LmVBh2RhyKudrL9Yt29DmIVUkUL8smW0XwMn/U2MhwLRFxrk5w9
 sc7tmGG1ATjb87zhi8TtIKGCVXRpKylOz1vxjdpF/H8D7LDnqz5g4GBOp
 I8/R1QfCKe64k4HqM9sgplZzvRqnyxG1BfezhRIzquCOCGjlnLe0beJec
 3DRASU5u2k02MCHU6S32bzbd8XScYkiz6wBEx5V/m5PDJq/4/YlXP3xeL
 P2OftXKQvnKHQFiIaFW7RrYzSVxK3E1WSoWs0bfuC4KsGsTGdoDhaSV1A
 8GvsHMv4rra8/GfaXV2kjTvHqHNSJ7okNHU4V+NchNXhgd/YztqYlXCgq g==;
X-CSE-ConnectionGUID: D1zgKpK6RzOYgwqN56gaqw==
X-CSE-MsgGUID: uit37WRHT2K65Cb2OaCArw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73596550"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="73596550"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 19:28:12 -0800
X-CSE-ConnectionGUID: YT2qTkv6SiKIgXuw0qum8w==
X-CSE-MsgGUID: Rq43XEFAS7yRwQbGGFWulQ==
X-ExtLoop1: 1
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 19:28:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: Cleanup unused header includes
Date: Wed, 14 Jan 2026 19:28:02 -0800
Message-ID: <20260115032803.4067824-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
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

clangd reports many "unused header" warnings throughout the Xe driver.
Start working to clean this up by removing unnecessary includes in our
.c files and/or replacing them with explicit includes of other headers
that were previously being included indirectly.

By far the most common offender here was unnecessary inclusion of
xe_gt.h.  That likely originates from the early days of xe.ko when
xe_mmio did not exist and all register accesses, including those
unrelated to GTs, were done with GT functions.

There's still a lot of additional #include cleanup that can be done in
the headers themselves; that will come as a followup series.

v2:
 - Squash the 79-patch series down to a single patch.  (MattB)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
This squashes together the original series from 
https://lore.kernel.org/all/20260113230315.3081153-81-matthew.d.roper@intel.com/

 drivers/gpu/drm/xe/tests/xe_bo.c              | 1 +
 drivers/gpu/drm/xe/xe_bb.c                    | 3 +--
 drivers/gpu/drm/xe/xe_bo.c                    | 1 -
 drivers/gpu/drm/xe/xe_devcoredump.c           | 3 +--
 drivers/gpu/drm/xe/xe_device.c                | 1 -
 drivers/gpu/drm/xe/xe_exec.c                  | 1 -
 drivers/gpu/drm/xe/xe_exec_queue.c            | 2 --
 drivers/gpu/drm/xe/xe_execlist.c              | 3 +--
 drivers/gpu/drm/xe/xe_ggtt.c                  | 3 +--
 drivers/gpu/drm/xe/xe_gsc_debugfs.c           | 5 ++---
 drivers/gpu/drm/xe/xe_gsc_proxy.c             | 2 +-
 drivers/gpu/drm/xe/xe_gsc_submit.c            | 2 --
 drivers/gpu/drm/xe/xe_gt.c                    | 2 --
 drivers/gpu/drm/xe/xe_gt_clock.c              | 6 +-----
 drivers/gpu/drm/xe/xe_gt_debugfs.c            | 1 -
 drivers/gpu/drm/xe/xe_gt_idle.c               | 1 -
 drivers/gpu/drm/xe/xe_gt_mcr.c                | 1 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 2 --
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 1 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 1 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 5 ++---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 1 -
 drivers/gpu/drm/xe/xe_gt_stats.c              | 2 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c              | 2 +-
 drivers/gpu/drm/xe/xe_gt_throttle.c           | 2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               | 2 --
 drivers/gpu/drm/xe/xe_guc_buf.c               | 1 -
 drivers/gpu/drm/xe/xe_guc_capture.c           | 5 +----
 drivers/gpu/drm/xe/xe_guc_debugfs.c           | 5 ++---
 drivers/gpu/drm/xe/xe_guc_hwconfig.c          | 4 ++--
 drivers/gpu/drm/xe/xe_guc_log.c               | 2 +-
 drivers/gpu/drm/xe/xe_guc_relay.c             | 3 +--
 drivers/gpu/drm/xe/xe_guc_submit.c            | 2 --
 drivers/gpu/drm/xe/xe_heci_gsc.c              | 1 -
 drivers/gpu/drm/xe/xe_huc.c                   | 1 -
 drivers/gpu/drm/xe/xe_huc_debugfs.c           | 5 ++---
 drivers/gpu/drm/xe/xe_hw_engine.c             | 1 -
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 2 +-
 drivers/gpu/drm/xe/xe_hw_fence.c              | 4 +---
 drivers/gpu/drm/xe/xe_i2c.c                   | 4 ++--
 drivers/gpu/drm/xe/xe_irq.c                   | 1 -
 drivers/gpu/drm/xe/xe_memirq.c                | 2 --
 drivers/gpu/drm/xe/xe_mmio.c                  | 4 ----
 drivers/gpu/drm/xe/xe_mocs.c                  | 2 --
 drivers/gpu/drm/xe/xe_module.c                | 2 +-
 drivers/gpu/drm/xe/xe_nvm.c                   | 1 -
 drivers/gpu/drm/xe/xe_page_reclaim.c          | 4 ----
 drivers/gpu/drm/xe/xe_pci.c                   | 1 -
 drivers/gpu/drm/xe/xe_psmi.c                  | 2 +-
 drivers/gpu/drm/xe/xe_pxp.c                   | 1 -
 drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                | 5 +----
 drivers/gpu/drm/xe/xe_reg_whitelist.c         | 1 -
 drivers/gpu/drm/xe/xe_ring_ops.c              | 4 +---
 drivers/gpu/drm/xe/xe_rtp.c                   | 1 -
 drivers/gpu/drm/xe/xe_sa.c                    | 2 +-
 drivers/gpu/drm/xe/xe_sched_job.c             | 2 +-
 drivers/gpu/drm/xe/xe_sriov_packet.c          | 1 -
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 1 -
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 1 -
 drivers/gpu/drm/xe/xe_step.c                  | 3 ++-
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 1 -
 drivers/gpu/drm/xe/xe_tile.c                  | 3 +--
 drivers/gpu/drm/xe/xe_tlb_inval.c             | 7 ++-----
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        | 1 -
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           | 1 -
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          | 1 -
 drivers/gpu/drm/xe/xe_uc.c                    | 2 --
 drivers/gpu/drm/xe/xe_uc_debugfs.c            | 2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 | 2 +-
 drivers/gpu/drm/xe/xe_validation.c            | 1 -
 drivers/gpu/drm/xe/xe_vm.c                    | 1 -
 drivers/gpu/drm/xe/xe_vram.c                  | 2 --
 drivers/gpu/drm/xe/xe_vram_freq.c             | 1 -
 drivers/gpu/drm/xe/xe_vsec.c                  | 1 -
 drivers/gpu/drm/xe/xe_wa.c                    | 2 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c       | 1 -
 drivers/gpu/drm/xe/xe_wopcm.c                 | 2 +-
 80 files changed, 45 insertions(+), 129 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 2278e589a493..b7d8e45804cf 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -18,6 +18,7 @@
 #include "tests/xe_test.h"
 
 #include "xe_bo_evict.h"
+#include "xe_gt.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
 
diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 6d20229c11de..8b678297aaa2 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -7,10 +7,9 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "xe_assert.h"
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
-#include "xe_hw_fence.h"
 #include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 917e50c276ac..e9180b01a4e4 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -26,7 +26,6 @@
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
 #include "xe_ggtt.h"
-#include "xe_gt.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
 #include "xe_pat.h"
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 7263c2a5f3a8..cf41bb6d2172 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -15,14 +15,13 @@
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
-#include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_types.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_log.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
-#include "xe_module.h"
 #include "xe_pm.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7190b208e3da..495310a624b5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -35,7 +35,6 @@
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
-#include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 730a5c9c2637..a5485fe6e3f1 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -11,7 +11,6 @@
 #include <uapi/drm/xe_drm.h>
 #include <linux/delay.h>
 
-#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_hw_engine_group.h"
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b5737563ee14..a940849bb6c7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -21,13 +21,11 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
-#include "xe_hw_fence.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
-#include "xe_ring_ops_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 #include "xe_pxp.h"
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 46c17a18a3f4..8bf330aeaec0 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -15,8 +15,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
-#include "xe_gt.h"
-#include "xe_hw_fence.h"
+#include "xe_gt_types.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index cb23d97845a8..60665ad1415b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,9 +20,8 @@
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
-#include "xe_device.h"
-#include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_types.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
diff --git a/drivers/gpu/drm/xe/xe_gsc_debugfs.c b/drivers/gpu/drm/xe/xe_gsc_debugfs.c
index b13928b50eb9..d4977e666946 100644
--- a/drivers/gpu/drm/xe/xe_gsc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gsc_debugfs.c
@@ -7,11 +7,10 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
-#include "xe_device.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_gsc.h"
-#include "xe_macros.h"
 #include "xe_pm.h"
 
 static struct xe_gt *
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index e7573a0c5e5d..42438b21f235 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -18,8 +18,8 @@
 #include "xe_force_wake.h"
 #include "xe_gsc.h"
 #include "xe_gsc_submit.h"
-#include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_types.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c b/drivers/gpu/drm/xe/xe_gsc_submit.c
index 9ede483d37ef..08082b596501 100644
--- a/drivers/gpu/drm/xe/xe_gsc_submit.c
+++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
@@ -11,12 +11,10 @@
 #include "xe_assert.h"
 #include "xe_bb.h"
 #include "xe_exec_queue.h"
-#include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_map.h"
 #include "xe_sched_job.h"
 #include "instructions/xe_gsc_commands.h"
-#include "regs/xe_gsc_regs.h"
 
 #define GSC_HDR_SIZE (sizeof(struct intel_gsc_mtl_header)) /* shorthand define */
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 04dbf995a18b..9d090d0f2438 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -13,13 +13,11 @@
 #include <generated/xe_wa_oob.h>
 
 #include "instructions/xe_alu_commands.h"
-#include "instructions/xe_gfxpipe_commands.h"
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_bb.h"
-#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_eu_stall.h"
 #include "xe_exec_queue.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index bfc25c46f798..53b3835192da 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -8,12 +8,8 @@
 #include "xe_gt_clock.h"
 
 #include "regs/xe_gt_regs.h"
-#include "regs/xe_regs.h"
-#include "xe_assert.h"
-#include "xe_device.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_gt_printk.h"
-#include "xe_macros.h"
 #include "xe_mmio.h"
 
 #define f19_2_mhz	19200000
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index e4f38b5150fc..4363bc9c3606 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -22,7 +22,6 @@
 #include "xe_guc_hwconfig.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
-#include "xe_macros.h"
 #include "xe_mocs.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index c1c9bec3c487..7a569e1730a4 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -13,7 +13,6 @@
 #include "xe_gt_sysfs.h"
 #include "xe_guc_pc.h"
 #include "regs/xe_gt_regs.h"
-#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 164010860664..7c1fe9ac120d 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -7,7 +7,6 @@
 
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
-#include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_topology.h"
 #include "xe_gt_types.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 9f2525f3cb37..23601ce79348 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -24,13 +24,11 @@
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_db_mgr.h"
-#include "xe_guc_fwif.h"
 #include "xe_guc_id_mgr.h"
 #include "xe_guc_klv_helpers.h"
 #include "xe_guc_klv_thresholds_set.h"
 #include "xe_guc_submit.h"
 #include "xe_lmtt.h"
-#include "xe_map.h"
 #include "xe_migrate.h"
 #include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 47d288c53539..f97abb02aebd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -8,7 +8,6 @@
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
 
-#include "xe_bo.h"
 #include "xe_debugfs.h"
 #include "xe_device.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 7410e7b93256..87a164efcc33 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -14,7 +14,6 @@
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
-#include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc.h"
@@ -25,6 +24,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
 
 #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index c28606ca6623..848e24926ecd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -7,7 +7,6 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 
-#include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_policy.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 2eb21610e5a0..b5e0a5b7723e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -5,20 +5,19 @@
 
 #include <drm/drm_managed.h>
 
-#include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_relay_actions_abi.h"
 
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
-#include "regs/xe_regs.h"
 
+#include "xe_assert.h"
 #include "xe_mmio.h"
 #include "xe_gt_sriov_printk.h"
-#include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_service.h"
 #include "xe_gt_sriov_pf_service_types.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_hxg_helpers.h"
+#include "xe_sriov.h"
 #include "xe_sriov_pf_service.h"
 
 static const struct xe_reg tgl_runtime_regs[] = {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index d91c65dc3496..30e8c2cf5f09 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -15,7 +15,6 @@
 #include "abi/guc_klvs_abi.h"
 #include "abi/guc_relay_actions_abi.h"
 #include "regs/xe_gt_regs.h"
-#include "regs/xe_gtt_defs.h"
 
 #include "xe_assert.h"
 #include "xe_device.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 8294bcd40310..37506434d7a3 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -7,8 +7,8 @@
 
 #include <drm/drm_print.h>
 
-#include "xe_gt.h"
 #include "xe_gt_stats.h"
+#include "xe_gt_types.h"
 
 /**
  * xe_gt_stats_incr - Increments the specified stats counter
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index ec2b8246204b..1448be047b4a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -10,7 +10,7 @@
 
 #include <drm/drm_managed.h>
 
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 
 static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 570358310e97..1e7e3a31aa69 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -6,7 +6,7 @@
 #include <drm/drm_managed.h>
 
 #include <regs/xe_gt_regs.h>
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_gt.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 7e1cb6093de7..f4cbc030f4c8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -28,8 +28,6 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
-#include "xe_platform_types.h"
-#include "xe_uc_fw.h"
 #include "xe_wa.h"
 
 /* Slack of a few additional entries per engine */
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index c36fc31e0438..11f77decd8d1 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -6,7 +6,6 @@
 #include <linux/cleanup.h>
 #include <drm/drm_managed.h>
 
-#include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index bdd700ac1e54..2f5816c78fba 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -13,17 +13,14 @@
 #include "abi/guc_log_abi.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
-#include "regs/xe_guc_regs.h"
-#include "regs/xe_regs.h"
 
-#include "xe_bo.h"
+#include "xe_bo_types.h"
 #include "xe_device.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
-#include "xe_guc_ads.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_capture_types.h"
 #include "xe_guc_ct.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 23827e87450f..2f23119686d4 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -8,13 +8,12 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
-#include "xe_device.h"
-#include "xe_gt.h"
+#include "xe_device_types.h"
+#include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_log.h"
 #include "xe_guc_pc.h"
-#include "xe_macros.h"
 #include "xe_pm.h"
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index af2c817d552c..b300901dbb8e 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -10,8 +10,8 @@
 
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
-#include "xe_device.h"
-#include "xe_gt.h"
+#include "xe_device_types.h"
+#include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_map.h"
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index d7473b9673bb..acac66a4eca7 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -15,8 +15,8 @@
 #include "xe_bo.h"
 #include "xe_devcoredump.h"
 #include "xe_force_wake.h"
-#include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_types.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index 0c0ff24ba62a..577a315854af 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -17,8 +17,7 @@
 #include "abi/guc_relay_communication_abi.h"
 
 #include "xe_assert.h"
-#include "xe_device.h"
-#include "xe_gt.h"
+#include "xe_device_types.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_pf_service.h"
 #include "xe_guc.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index be8fa76baf1d..a27ea931b956 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -17,7 +17,6 @@
 #include "abi/guc_actions_abi.h"
 #include "abi/guc_actions_slpc_abi.h"
 #include "abi/guc_klvs_abi.h"
-#include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_devcoredump.h"
@@ -36,7 +35,6 @@
 #include "xe_guc_klv_helpers.h"
 #include "xe_guc_submit_types.h"
 #include "xe_hw_engine.h"
-#include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_map.h"
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 495cdd4f948d..c1f15313f92e 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -11,7 +11,6 @@
 #include <drm/drm_print.h>
 
 #include "xe_device_types.h"
-#include "xe_drv.h"
 #include "xe_heci_gsc.h"
 #include "regs/xe_gsc_regs.h"
 #include "xe_platform_types.h"
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 4212162913af..57afe21444b1 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -12,7 +12,6 @@
 #include "abi/gsc_pxp_commands_abi.h"
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_guc_regs.h"
-#include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
index df9c4d79b710..80829967b3d7 100644
--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
@@ -7,11 +7,10 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
-#include "xe_device.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_huc.h"
-#include "xe_macros.h"
 #include "xe_pm.h"
 
 static struct xe_gt *
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 6a9e2a4272dd..4d3ee5226e3a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -33,7 +33,6 @@
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
-#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_reg_sr.h"
 #include "xe_reg_whitelist.h"
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index cb45cdceef67..3c65becb39ad 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -7,7 +7,7 @@
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
 
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_pm.h"
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index f69a32c27458..2ef33dfbe3a2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -6,7 +6,7 @@
 #include <drm/drm_managed.h>
 
 #include "xe_assert.h"
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_stats.h"
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 6b5bc67767d3..ae8ed15b64c5 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -8,9 +8,7 @@
 #include <linux/device.h>
 #include <linux/slab.h>
 
-#include "xe_bo.h"
-#include "xe_device.h"
-#include "xe_gt.h"
+#include "xe_device_types.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
 #include "xe_map.h"
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index befc77e46eae..1e1fb72e49bf 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2025 Intel Corporation.
  */
 
+#include <drm/drm_print.h>
 #include <linux/array_size.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
@@ -26,11 +27,10 @@
 #include "regs/xe_i2c_regs.h"
 #include "regs/xe_irq_regs.h"
 
-#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
-#include "xe_platform_types.h"
+#include "xe_sriov.h"
 #include "xe_survivability_mode.h"
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index baf5d2c6e802..7560a45f7f64 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -10,7 +10,6 @@
 #include <drm/drm_managed.h>
 
 #include "display/xe_display.h"
-#include "regs/xe_guc_regs.h"
 #include "regs/xe_irq_regs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index b0c7ce0a5d1e..811e07136efb 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -7,7 +7,6 @@
 
 #include "regs/xe_guc_regs.h"
 #include "regs/xe_irq_regs.h"
-#include "regs/xe_regs.h"
 
 #include "xe_assert.h"
 #include "xe_bo.h"
@@ -16,7 +15,6 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
-#include "xe_map.h"
 #include "xe_memirq.h"
 #include "xe_tile_printk.h"
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 350dca1f0925..bcb6674b7dac 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -14,12 +14,8 @@
 #include <drm/drm_print.h>
 
 #include "regs/xe_bars.h"
-#include "regs/xe_regs.h"
 #include "xe_device.h"
-#include "xe_gt.h"
-#include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
-#include "xe_macros.h"
 #include "xe_sriov.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 0b7225bd77e0..54822497c21e 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -6,7 +6,6 @@
 #include "xe_mocs.h"
 
 #include "regs/xe_gt_regs.h"
-#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
@@ -17,7 +16,6 @@
 #include "xe_platform_types.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
-#include "xe_step_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define mocs_dbg xe_gt_dbg
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 9934f90691fd..a0048f64ed12 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -10,7 +10,7 @@
 
 #include <drm/drm_module.h>
 
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_drv.h"
 #include "xe_configfs.h"
 #include "xe_hw_fence.h"
diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 01510061d4d4..437375046517 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -6,7 +6,6 @@
 #include <linux/intel_dg_nvm_aux.h>
 #include <linux/pci.h>
 
-#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_mmio.h"
 #include "xe_nvm.h"
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index a8f35919a9da..e13c71a89da2 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -10,15 +10,11 @@
 
 #include "xe_page_reclaim.h"
 
-#include "regs/xe_gt_regs.h"
-#include "xe_assert.h"
 #include "xe_gt_stats.h"
 #include "xe_macros.h"
-#include "xe_mmio.h"
 #include "xe_pat.h"
 #include "xe_sa.h"
 #include "xe_tlb_inval_types.h"
-#include "xe_vm.h"
 
 /**
  * xe_page_reclaim_skip() - Decide whether PRL should be skipped for a VMA
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5c705124270e..2c3656126751 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -24,7 +24,6 @@
 #include "xe_gt.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
-#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pci_rebar.h"
diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
index 6a54e38b81ba..899b01f72ba3 100644
--- a/drivers/gpu/drm/xe/xe_psmi.c
+++ b/drivers/gpu/drm/xe/xe_psmi.c
@@ -6,7 +6,7 @@
 #include <linux/debugfs.h>
 
 #include "xe_bo.h"
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_configfs.h"
 #include "xe_psmi.h"
 
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 508f4c128a48..d61446bf9c19 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -15,7 +15,6 @@
 #include "xe_force_wake.h"
 #include "xe_guc_submit.h"
 #include "xe_gsc_proxy.h"
-#include "xe_gt.h"
 #include "xe_gt_types.h"
 #include "xe_huc.h"
 #include "xe_mmio.h"
diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.c b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
index 525a2f6bb076..d6e2e41bc88c 100644
--- a/drivers/gpu/drm/xe/xe_pxp_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
@@ -11,7 +11,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_pxp.h"
 #include "xe_pxp_types.h"
 #include "regs/xe_irq_regs.h"
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 1a465385f909..d3e13ea33123 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -13,16 +13,13 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
-#include "regs/xe_engine_regs.h"
-#include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
-#include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
-#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_rtp_types.h"
 
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 1391cb6ec9c6..1d36c09681aa 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -8,7 +8,6 @@
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_oa_regs.h"
-#include "regs/xe_regs.h"
 #include "xe_device.h"
 #include "xe_gt_types.h"
 #include "xe_gt_printk.h"
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a1fd99f2d539..248620b0901d 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -11,11 +11,9 @@
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
-#include "regs/xe_lrc_layout.h"
 #include "xe_exec_queue.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_lrc.h"
-#include "xe_macros.h"
 #include "xe_sched_job.h"
 #include "xe_sriov.h"
 #include "xe_vm_types.h"
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index ed509b1c8cfc..b7c26e2fb411 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -12,7 +12,6 @@
 #include "xe_configfs.h"
 #include "xe_gt.h"
 #include "xe_gt_topology.h"
-#include "xe_macros.h"
 #include "xe_reg_sr.h"
 #include "xe_sriov.h"
 
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index a87c1436c7c1..b738102575d4 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -10,7 +10,7 @@
 #include <drm/drm_managed.h>
 
 #include "xe_bo.h"
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_map.h"
 
 static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 39aec7f6d86d..3927666fe556 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -11,7 +11,7 @@
 
 #include "xe_device.h"
 #include "xe_exec_queue.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index 2cefefaed9ba..7a4c3de662e5 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -6,7 +6,6 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_guc_klv_helpers.h"
-#include "xe_printk.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
 #include "xe_sriov_pf_helpers.h"
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index e84bdde9bc80..81b377830d6d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -16,7 +16,6 @@
 #include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_provision.h"
 #include "xe_sriov_pf_service.h"
-#include "xe_sriov_printk.h"
 #include "xe_tile_sriov_pf_debugfs.h"
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 1b75405b8d02..29894bd081c0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -6,7 +6,6 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
-#include "xe_gt.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
 #include "xe_sriov_printk.h"
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 10e88f2c9615..2860986f82f7 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -5,10 +5,11 @@
 
 #include "xe_step.h"
 
+#include <drm/drm_print.h>
 #include <kunit/visibility.h>
 #include <linux/bitfield.h>
 
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_platform_types.h"
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 31456f432fc8..6578ffc77bd5 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -12,7 +12,6 @@
 
 #include "xe_configfs.h"
 #include "xe_device.h"
-#include "xe_gt.h"
 #include "xe_heci_gsc.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index eb262aad11da..c465aae7883c 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -9,9 +9,8 @@
 #include <drm/drm_pagemap_util.h>
 
 #include "xe_bo.h"
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_ggtt.h"
-#include "xe_gt.h"
 #include "xe_memirq.h"
 #include "xe_migrate.h"
 #include "xe_pcode.h"
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 61b99cf0a733..e837888367c4 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -5,13 +5,10 @@
 
 #include <drm/drm_managed.h>
 
-#include "abi/guc_actions_abi.h"
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_force_wake.h"
-#include "xe_gt.h"
-#include "xe_gt_printk.h"
 #include "xe_gt_stats.h"
-#include "xe_guc.h"
+#include "xe_gt_types.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_tlb_inval.h"
 #include "xe_mmio.h"
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 1bddecfb723a..27c9d72222cf 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -17,7 +17,6 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_mmio.h"
 #include "xe_res_cursor.h"
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 3e404eb8d098..99fb7e99eb7f 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -13,7 +13,6 @@
 #include <drm/ttm/ttm_tt.h>
 
 #include "xe_bo.h"
-#include "xe_gt.h"
 
 struct xe_ttm_sys_node {
 	struct ttm_buffer_object *tbo;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9f70802fce92..6553a19f7cf2 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -12,7 +12,6 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_gt.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 157520ea1783..3f63c2a7e86d 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -8,7 +8,6 @@
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gsc.h"
-#include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
@@ -17,7 +16,6 @@
 #include "xe_guc_engine_activity.h"
 #include "xe_huc.h"
 #include "xe_sriov.h"
-#include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
 static struct xe_gt *
diff --git a/drivers/gpu/drm/xe/xe_uc_debugfs.c b/drivers/gpu/drm/xe/xe_uc_debugfs.c
index 24a4209051ee..45119993f5cb 100644
--- a/drivers/gpu/drm/xe/xe_uc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_uc_debugfs.c
@@ -7,12 +7,12 @@
 
 #include <drm/drm_debugfs.h>
 
-#include "xe_gt.h"
 #include "xe_gsc_debugfs.h"
 #include "xe_guc_debugfs.h"
 #include "xe_huc_debugfs.h"
 #include "xe_macros.h"
 #include "xe_uc_debugfs.h"
+#include "xe_uc_types.h"
 
 void xe_uc_debugfs_register(struct xe_uc *uc, struct dentry *parent)
 {
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 7455ac3300c6..6a8e692fd7a1 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -14,9 +14,9 @@
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gsc.h"
-#include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
index 826cd09966ef..a611438eaafe 100644
--- a/drivers/gpu/drm/xe/xe_validation.c
+++ b/drivers/gpu/drm/xe/xe_validation.c
@@ -2,7 +2,6 @@
 /*
  * Copyright © 2024 Intel Corporation
  */
-#include "xe_bo.h"
 #include <drm/drm_exec.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gpuvm.h>
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 694f592a0f01..4a316bd49135 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -33,7 +33,6 @@
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
 #include "xe_pxp.h"
-#include "xe_res_cursor.h"
 #include "xe_sriov_vf.h"
 #include "xe_svm.h"
 #include "xe_sync.h"
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 4f807eade2b7..0538dcb8b18c 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -13,12 +13,10 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
-#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
-#include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_tile_sriov_vf.h"
 #include "xe_ttm_vram_mgr.h"
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index 17bc84da4cdc..6f8281e0b96a 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -5,7 +5,6 @@
 #include <linux/sysfs.h>
 #include <drm/drm_managed.h>
 
-#include "xe_gt_types.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
 #include "xe_tile.h"
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index c83ea3d48fae..4ebb4dbe1c9b 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -12,7 +12,6 @@
 
 #include "xe_device.h"
 #include "xe_device_types.h"
-#include "xe_drv.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_pm.h"
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a93717e77da0..a991ee2b8781 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -19,7 +19,7 @@
 #include "regs/xe_regs.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 5b4264ea38bd..51eb940ceb4e 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -11,7 +11,6 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_device.h"
-#include "xe_gt.h"
 #include "xe_macros.h"
 #include "xe_exec_queue.h"
 
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index ada0d0aa6b74..dde4f4967ca3 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -10,7 +10,7 @@
 #include "regs/xe_guc_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_mmio.h"
 #include "xe_uc_fw.h"
 
-- 
2.52.0

