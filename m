Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975D6C52D6F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 09:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A0810E2B1;
	Tue, 27 Aug 2024 09:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvTnFis9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC0B10E2B1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 09:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724750146; x=1756286146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M8jwb2+QwZutIGoptsze2DY+XF6Pnt+bNVpWlXwcu48=;
 b=bvTnFis9VQ0IrVpaJGOjs1LxkGxwPvqCTuYgETPZIQj5y6uBEvZPch9G
 C3E4NcaiCKD11mLTt4QNZCMc3UDTcvNDmIRKmx84VO6zrYdaStKWVTNjo
 gPeqMHzxVzLRbHEorshmmPzPP7vmUGUwlNlN4XZwJdzYN4HBi+p9/mdaj
 UUbO1zx8Yk5jdkHXnOxVWOP96BUDdf5Ii5kQ1LMc6FUVo0J/B9+lghU8h
 wL3w7ybhyz6Y7nEDi2tiFTuAp/ohB0y6dz8lKLjJcmh0KyP8dNgpLqUxg
 6IraaIJfTSIEfUbT5jliYSBb1Bq6xr7E/XC3pD6NRJRRGLzJeOCjFgNF9 Q==;
X-CSE-ConnectionGUID: CYKoAYw0TxOqaJCdn0ONNw==
X-CSE-MsgGUID: Zis6XIA7Sw+KPxbVjt3NlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="40684990"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="40684990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:15:45 -0700
X-CSE-ConnectionGUID: 6RdIYQtNSl62e0yf/HoJWQ==
X-CSE-MsgGUID: BOuNO0clS6eqkzy0304Ebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62474081"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:15:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/xe: replace #include <drm/xe_drm.h> with
 <uapi/drm/xe_drm.h>
Date: Tue, 27 Aug 2024 12:15:39 +0300
Message-Id: <20240827091539.4136838-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

include/drm/xe_drm.h does not exist. Prefer the explicit uapi include.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c   | 2 +-
 drivers/gpu/drm/xe/xe_bo.c              | 2 +-
 drivers/gpu/drm/xe/xe_device.c          | 2 +-
 drivers/gpu/drm/xe/xe_drm_client.c      | 2 +-
 drivers/gpu/drm/xe/xe_exec.c            | 2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c      | 2 +-
 drivers/gpu/drm/xe/xe_gt.c              | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c         | 2 +-
 drivers/gpu/drm/xe/xe_oa.c              | 2 +-
 drivers/gpu/drm/xe/xe_oa_types.h        | 2 +-
 drivers/gpu/drm/xe/xe_observation.c     | 2 +-
 drivers/gpu/drm/xe/xe_pat.c             | 2 +-
 drivers/gpu/drm/xe/xe_query.c           | 2 +-
 drivers/gpu/drm/xe/xe_rtp.c             | 2 +-
 drivers/gpu/drm/xe/xe_sched_job.c       | 2 +-
 drivers/gpu/drm/xe/xe_sync.c            | 2 +-
 drivers/gpu/drm/xe/xe_vm.c              | 2 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 2 +-
 20 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 78a884ddd499..e91d4d00e004 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -10,7 +10,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include "soc/intel_dram.h"
 #include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 13db6c0530b3..cedd3e88a6fb 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -3,7 +3,7 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include <kunit/test.h>
 #include <kunit/visibility.h>
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cbe7bf098970..0fc93d100c8c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -13,7 +13,7 @@
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include "xe_device.h"
 #include "xe_dma_buf.h"
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b6db7e082d88..1a0d7fdd094b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -15,7 +15,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include "display/xe_display.h"
 #include "instructions/xe_gpu_commands.h"
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 7ddd59908334..e64f4b645e2e 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -5,7 +5,7 @@
 #include "xe_drm_client.h"
 
 #include <drm/drm_print.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/types.h>
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 484acfbe0e61..7b38485817dc 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -8,7 +8,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_exec.h>
 #include <drm/drm_file.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 #include <linux/delay.h>
 
 #include "xe_bo.h"
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index e53937fafd14..5a9cbc97f0be 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -9,7 +9,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include "xe_device.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 08a004d698d4..1bb66db47265 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -8,7 +8,7 @@
 #include <linux/minmax.h>
 
 #include <drm/drm_managed.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include <generated/xe_wa_oob.h>
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 18980238a2ea..6e4569aaf869 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -8,7 +8,7 @@
 #include <linux/nospec.h>
 
 #include <drm/drm_managed.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cbf54be224c9..cfd31ae49cc1 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -10,7 +10,7 @@
 
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_tt.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include <generated/xe_wa_oob.h>
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4d4541e0b24c..63286ed8457f 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -10,7 +10,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include "abi/guc_actions_slpc_abi.h"
 #include "instructions/xe_mi_commands.h"
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 540c3ec53a6d..8862eca73fbe 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -11,7 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 #include "regs/xe_reg_defs.h"
 #include "xe_hw_engine_types.h"
 
diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
index a78c92a44ec2..8ec1b84cbb9e 100644
--- a/drivers/gpu/drm/xe/xe_observation.c
+++ b/drivers/gpu/drm/xe/xe_observation.c
@@ -6,7 +6,7 @@
 #include <linux/errno.h>
 #include <linux/sysctl.h>
 
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include "xe_oa.h"
 #include "xe_observation.h"
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 722278cc23fc..f291a1730024 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -5,7 +5,7 @@
 
 #include "xe_pat.h"
 
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include <generated/xe_wa_oob.h>
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 73ef6e4c2dc9..28d9bb3b825d 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -9,7 +9,7 @@
 #include <linux/sched/clock.h>
 
 #include <drm/ttm/ttm_placement.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index e78ba324dd18..86c705d18c0d 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -7,7 +7,7 @@
 
 #include <kunit/visibility.h>
 
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include "xe_gt.h"
 #include "xe_gt_topology.h"
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 9628f9deb3c0..e9b67df8cfdd 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -5,7 +5,7 @@
 
 #include "xe_sched_job.h"
 
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 #include <linux/dma-fence-chain.h>
 #include <linux/slab.h>
 
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index ca826aeb41ea..43b3b1d310de 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -12,7 +12,7 @@
 
 #include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include "xe_device_types.h"
 #include "xe_exec_queue.h"
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4cc13eddb6b3..a670de50cf4a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -12,7 +12,7 @@
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_tt.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 #include <linux/ascii85.h>
 #include <linux/delay.h>
 #include <linux/kthread.h>
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index f69721339201..d46fa8374980 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -8,7 +8,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/drm_utils.h>
-#include <drm/xe_drm.h>
+#include <uapi/drm/xe_drm.h>
 
 #include "xe_device.h"
 #include "xe_gt.h"
-- 
2.39.2

