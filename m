Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0417CDD1BA
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 15:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B82510E0BC;
	Fri, 27 Sep 2024 15:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lu1rTADa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C47510E0BC
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727449940; x=1758985940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x9L3d98PF7YIQg/zWJOw27LlTURi8JJo06V0gfzZlgA=;
 b=lu1rTADaKFQUx116/qCHDJyAX/gU+NqNqOXgQdvu2ZmtA8Y4PZJ2jcCg
 JvhFqGnXW8l3hA506kaGrz39z560qJ8Jzyd7ypEskEHPb1ubrK3gzTpqi
 uWgjQkE0n5+VYDDZwk8KGyt0VhXcri1yu3ZOlSKJwyeqZGv5g+AKVucPT
 QPKrCc31u5uT7tf/rRG+FCTsRFHzymWmuUuWnzU4EZi2cAk8zVYCUlIJy
 NNs5pLt6AMRQKA+tkuoBAjJIYratTpiHR+822a94STqdcK6Qs3dFFjBcs
 /REfQLYEYERSZYiCSdptwq1bit+dj8GzNW5Eb1MfWE+zcAfs1kuSiuqGZ Q==;
X-CSE-ConnectionGUID: S3z5lrqHRbq8HBQoaESvIA==
X-CSE-MsgGUID: KeXFgr1CSsKo444BhM8vSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30488710"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="30488710"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 08:12:19 -0700
X-CSE-ConnectionGUID: i5JarI5zTneswfM6jwiX6w==
X-CSE-MsgGUID: ymQf5YG+RFeN/W4HtjuSaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="77348682"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.199])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 08:12:17 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4] drm/xe: Use fault injection infrastructure to find issues
 at probe time
Date: Fri, 27 Sep 2024 17:12:06 +0200
Message-ID: <20240927151207.399354-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

The kernel fault injection infrastructure is used to test proper error
handling during probe. The return code of the functions using
ALLOW_ERROR_INJECTION() can be conditionnally modified at runtime by
tuning some debugfs entries. This requires CONFIG_FUNCTION_ERROR_INJECTION
(among others).

One way to use fault injection at probe time by making each of those
functions fail one at a time is:

    FAILTYPE=fail_function
    DEVICE="0000:00:08.0" # depends on the system
    ERRNO=-12 # -ENOMEM, can depend on the function

    echo N > /sys/kernel/debug/$FAILTYPE/task-filter
    echo 100 > /sys/kernel/debug/$FAILTYPE/probability
    echo 0 > /sys/kernel/debug/$FAILTYPE/interval
    echo -1 > /sys/kernel/debug/$FAILTYPE/times
    echo 0 > /sys/kernel/debug/$FAILTYPE/space
    echo 1 > /sys/kernel/debug/$FAILTYPE/verbose

    modprobe xe
    echo $DEVICE > /sys/bus/pci/drivers/xe/unbind

    grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | \
    cut -d ' ' -f 1 | while read -r FUNCTION ; do
        echo "Injecting fault in $FUNCTION"
        echo "" > /sys/kernel/debug/$FAILTYPE/inject
        echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
        printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
        echo $DEVICE > /sys/bus/pci/drivers/xe/bind
    done

    rmmod xe

It will also be integrated into IGT for systematic execution by CI.

v2: Wrappers are not needed in the cases covered by this patch, so
    remove them and use ALLOW_ERROR_INJECTION() directly.

v3: Document the use of fault injection at probe time in xe_pci_probe
    and refer to it where ALLOW_ERROR_INJECTION() is used.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c    |  3 +++
 drivers/gpu/drm/xe/xe_ggtt.c      |  2 ++
 drivers/gpu/drm/xe/xe_guc_ads.c   |  3 +++
 drivers/gpu/drm/xe/xe_guc_ct.c    |  2 ++
 drivers/gpu/drm/xe/xe_guc_log.c   |  3 +++
 drivers/gpu/drm/xe/xe_guc_relay.c |  2 ++
 drivers/gpu/drm/xe/xe_pci.c       | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.c        |  2 ++
 drivers/gpu/drm/xe/xe_sriov.c     |  3 +++
 drivers/gpu/drm/xe/xe_tile.c      |  3 +++
 drivers/gpu/drm/xe/xe_uc_fw.c     |  2 ++
 drivers/gpu/drm/xe/xe_wa.c        |  2 ++
 drivers/gpu/drm/xe/xe_wopcm.c     |  3 +++
 13 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8e9b551c7033..ad70a1bdd476 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -6,6 +6,7 @@
 #include "xe_device.h"
 
 #include <linux/delay.h>
+#include <linux/fault-inject.h>
 #include <linux/units.h>
 
 #include <drm/drm_aperture.h>
@@ -382,6 +383,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 err:
 	return ERR_PTR(err);
 }
+ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
 
 static bool xe_driver_flr_disabled(struct xe_device *xe)
 {
@@ -550,6 +552,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
 
 static void update_device_info(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f68af56c3f86..47bfd9d2635d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -5,6 +5,7 @@
 
 #include "xe_ggtt.h"
 
+#include <linux/fault-inject.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/sizes.h>
 
@@ -264,6 +265,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
 
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 66d4e5e95abd..04485461aa20 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -5,6 +5,8 @@
 
 #include "xe_guc_ads.h"
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
@@ -418,6 +420,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
 
 /**
  * xe_guc_ads_init_post_hwconfig - initialize ADS post hwconfig load
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4b95f75b1546..816dc897e29f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/circ_buf.h>
 #include <linux/delay.h>
+#include <linux/fault-inject.h>
 
 #include <kunit/static_stub.h>
 
@@ -209,6 +210,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	ct->state = XE_GUC_CT_STATE_DISABLED;
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
 
 #define desc_read(xe_, guc_ctb__, field_)			\
 	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index a37ee3419428..651543721ce5 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -5,6 +5,8 @@
 
 #include "xe_guc_log.h"
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include "xe_bo.h"
@@ -96,3 +98,4 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index ade6162dc259..8f62de026724 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/fault-inject.h>
 
 #include <drm/drm_managed.h>
 
@@ -355,6 +356,7 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
 
 	return drmm_add_action_or_reset(&xe->drm, __fini_relay, relay);
 }
+ALLOW_ERROR_INJECTION(xe_guc_relay_init, ERRNO); /* See xe_pci_probe() */
 
 static u32 to_relay_error(int err)
 {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 41445245a287..7ffee06fab13 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -770,6 +770,25 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	pci_set_drvdata(pdev, NULL);
 }
 
+/*
+ * Probe the PCI device, initialize various parts of the driver.
+ *
+ * Fault injection is used to test the error paths of some initialization
+ * functions called either directly from xe_pci_probe() or indirectly for
+ * example through xe_device_probe(). Those functions use the kernel fault
+ * injection capabilities infrastructure, see
+ * Documentation/fault-injection/fault-injection.rst for details. The macro
+ * ALLOW_ERROR_INJECTION() is used to conditionally skip function execution
+ * at runtime and use a provided return value. The first requirement for
+ * error injectable functions is proper handling of the error code by the
+ * caller for recovery, which is always the case here. The second
+ * requirement is that no state is changed before the first error return.
+ * It is not strictly fullfilled for all initialization functions using the
+ * ALLOW_ERROR_INJECTION() macro but this is acceptable because for those
+ * error cases at probe time, the error code is simply propagated up by the
+ * caller. Therefore there is no consequence on those specific callers when
+ * function error injection skips the whole function.
+ */
 static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 33eb039053e4..40f7c844ed44 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -5,6 +5,7 @@
 
 #include "xe_pm.h"
 
+#include <linux/fault-inject.h>
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_managed.h>
@@ -263,6 +264,7 @@ int xe_pm_init_early(struct xe_device *xe)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
 
 /**
  * xe_pm_init - Initialize Xe Power Management
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 69a066ef20c0..ef10782af656 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include "regs/xe_regs.h"
@@ -119,6 +121,7 @@ int xe_sriov_init(struct xe_device *xe)
 
 	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
 }
+ALLOW_ERROR_INJECTION(xe_sriov_init, ERRNO); /* See xe_pci_probe() */
 
 /**
  * xe_sriov_print_info - Print basic SR-IOV information.
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index dda5268507d8..07cf7cfe4abd 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include "xe_device.h"
@@ -129,6 +131,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 
 static int tile_ttm_mgr_init(struct xe_tile *tile)
 {
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index eab9456e051f..087fb96f707e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/fault-inject.h>
 #include <linux/firmware.h>
 
 #include <drm/drm_managed.h>
@@ -797,6 +798,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 
 	return err;
 }
+ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO); /* See xe_pci_probe() */
 
 static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
 {
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 22c148b1e996..94ea76b098ed 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 #include <kunit/visibility.h>
 #include <linux/compiler_types.h>
+#include <linux/fault-inject.h>
 
 #include <generated/xe_wa_oob.h>
 
@@ -850,6 +851,7 @@ int xe_wa_init(struct xe_gt *gt)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_wa_init, ERRNO); /* See xe_pci_probe() */
 
 void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
 {
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index 93c82825d896..ada0d0aa6b74 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -5,6 +5,8 @@
 
 #include "xe_wopcm.h"
 
+#include <linux/fault-inject.h>
+
 #include "regs/xe_guc_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
@@ -268,3 +270,4 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 
 	return ret;
 }
+ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO); /* See xe_pci_probe() */
-- 
2.43.0

