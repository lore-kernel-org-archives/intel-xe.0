Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3EEC4725D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 10:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0BF10EC72;
	Mon, 22 Jan 2024 10:14:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907B010EC72
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705918480; x=1737454480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IGQJcMQ313n7IchEADiiwaRhej+V/jmG2lYW+TuKLzU=;
 b=kkjKHELmc2xS4+u8m7yCbAdmAnek4WDWZ5Ngvk4MIlEwjwpgKucb2O2F
 KCQj6W/MaXfKtI3f4bq7vvANecE5zI/Tt8OMaREcaOfmHc5xA+hXh6wHX
 97/iOr3XyIxISLLLX35hmg9S7n5iIkQFrW+ASH178cqTegC08E8NNNumI
 FiQbHHKSLuTYT+9IgL2JjUW1ABXiG38zjS6pSLnAj/A5ESisduevnh+ji
 2zlISh1UGUG3OtiPipGR6Mbv4OuKDzRr5AxpFSqn0OGKf8bsy1EERUpic
 mpmDwoqnK4ZPq2jbIg7uffVpKZNdCpFbl4kpPYM4by5bEZ8TlENXqb8Jp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="8543086"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8543086"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 02:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="958689297"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="958689297"
Received: from mshelego-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.40.242])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 02:14:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: drop display/ subdir from include directories
Date: Mon, 22 Jan 2024 12:14:28 +0200
Message-Id: <20240122101428.2683468-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240122101428.2683468-1-jani.nikula@intel.com>
References: <20240122101428.2683468-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There are very few places that need to include anything from under
display/. Require the display/ prefix in #include directives, and drop
the subdirectory from the header search path.

Sort the include lists while at it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile    | 1 -
 drivers/gpu/drm/xe/xe_device.c | 6 +++---
 drivers/gpu/drm/xe/xe_irq.c    | 2 +-
 drivers/gpu/drm/xe/xe_pci.c    | 2 +-
 drivers/gpu/drm/xe/xe_pm.c     | 2 +-
 5 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e06f99def559..789d310cb5bc 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -165,7 +165,6 @@ xe-$(CONFIG_DRM_XE_KUNIT_TEST) += \
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-I$(srctree)/$(src)/display/ext \
 	-I$(srctree)/$(src)/compat-i915-headers \
-	-I$(srctree)/drivers/gpu/drm/xe/display/ \
 	-I$(srctree)/drivers/gpu/drm/i915/display/ \
 	-Ddrm_i915_gem_object=xe_bo \
 	-Ddrm_i915_private=xe_device
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ab417f4f7d2a..eea0b259ae85 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -15,20 +15,21 @@
 #include <drm/drm_print.h>
 #include <drm/xe_drm.h>
 
+#include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_debugfs.h"
-#include "xe_display.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
 #include "xe_drv.h"
-#include "xe_exec_queue.h"
 #include "xe_exec.h"
+#include "xe_exec_queue.h"
 #include "xe_ggtt.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_hwmon.h"
 #include "xe_irq.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
@@ -43,7 +44,6 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_wait_user_fence.h"
-#include "xe_hwmon.h"
 
 #ifdef CONFIG_LOCKDEP
 struct lockdep_map xe_device_mem_access_lockdep_map = {
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 2fd8cc26fc9f..d31e87de5a1c 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -9,10 +9,10 @@
 
 #include <drm/drm_managed.h>
 
+#include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_device.h"
-#include "xe_display.h"
 #include "xe_drv.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index df6b3b31f419..09c50471331c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -15,9 +15,9 @@
 #include <drm/drm_drv.h>
 #include <drm/xe_pciids.h>
 
+#include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
-#include "xe_display.h"
 #include "xe_drv.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index d5f219796d7e..4d3984ae4ff1 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -10,11 +10,11 @@
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_placement.h>
 
+#include "display/xe_display.h"
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_device.h"
 #include "xe_device_sysfs.h"
-#include "xe_display.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
-- 
2.39.2

