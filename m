Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9D7CCF9E4
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 15:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD4010EA57;
	Wed, 25 Sep 2024 15:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFBtyFHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A7E10E129
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 15:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727279776; x=1758815776;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xK8t+TqHMYfLVtgWyj/iAmW+PFqOzr4P0O36UkIA5jI=;
 b=XFBtyFHlBd68n/kNO2VF/SL+tOJUl/w+FLi2+h1rCvK7EKiHx+G9EubQ
 jzZUt99sebNrWJ3mh4KH1ReAlKahMips+tVKC4ROlJsSnFbcgRvPAthvs
 KALiETyIrxYtJC8PppvzOxb+tWdPwVS0jYfZdzuXOAVqwjavRvZyFrC1c
 eUlgi3SwIwIBzzZC55d/+NaXcnNWE0CUW6GcmXqeDNrADArJKqtduQ5NJ
 SifchUJX6Uyuc7YhQnNC/CxbYD71dn7ARuj3nd8DX3wQ6xdkSNJs7Pb1j
 F/kLLWOj/PMnWMU+ZqvDRzHrFxOyoRIYoSJF469OEJ4Hc7AIZul7iHRS2 g==;
X-CSE-ConnectionGUID: 1/M/LLzgQIqP7O9FMJOlLQ==
X-CSE-MsgGUID: 2YeKYA9ETMKJfJB6AoMtJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="30047776"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="30047776"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:56:16 -0700
X-CSE-ConnectionGUID: 55C1kWDIT62XrX4NXdsiZw==
X-CSE-MsgGUID: 9pDrTp0PS4ekEazV8Zf+aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="102585478"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.31])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:56:14 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3] drm/xe: Use fault injection infrastructure to find issues
 at probe time
Date: Wed, 25 Sep 2024 17:55:46 +0200
Message-ID: <20240925155546.76630-1-francois.dugast@intel.com>
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

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c    | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c      |  8 ++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c   | 10 ++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c    |  9 +++++++++
 drivers/gpu/drm/xe/xe_guc_log.c   | 10 ++++++++++
 drivers/gpu/drm/xe/xe_guc_relay.c |  8 ++++++++
 drivers/gpu/drm/xe/xe_pm.c        |  9 +++++++++
 drivers/gpu/drm/xe/xe_sriov.c     | 10 ++++++++++
 drivers/gpu/drm/xe/xe_tile.c      |  9 +++++++++
 drivers/gpu/drm/xe/xe_uc_fw.c     |  9 +++++++++
 drivers/gpu/drm/xe/xe_wa.c        |  8 ++++++++
 drivers/gpu/drm/xe/xe_wopcm.c     |  9 +++++++++
 12 files changed, 116 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 53dcece40fc5..f84327f8d2bf 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -6,6 +6,7 @@
 #include "xe_device.h"
 
 #include <linux/delay.h>
+#include <linux/fault-inject.h>
 #include <linux/units.h>
 
 #include <drm/drm_aperture.h>
@@ -298,6 +299,13 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
+/*
+ * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
+ * runtime and use a provided return value, in order to test errors paths in the
+ * callers. The requirements for the error injectable functions are not strictly
+ * fullfilled but this is acceptable because the caller only propagates the error
+ * up the stack without cleanup of resources potentially allocated here.
+ */
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
@@ -378,6 +386,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 err:
 	return ERR_PTR(err);
 }
+ALLOW_ERROR_INJECTION(xe_device_create, ERRNO);
 
 static bool xe_driver_flr_disabled(struct xe_device *xe)
 {
@@ -500,6 +509,13 @@ static bool verify_lmem_ready(struct xe_device *xe)
 	return !!val;
 }
 
+/*
+ * This function fullfills the requirements for the error injectable functions
+ * fault-injection.html#requirements-for-the-error-injectable-functions so the
+ * ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
+ * runtime and use a provided return value, in order to test errors paths in
+ * the callers.
+ */
 static int wait_for_lmem_ready(struct xe_device *xe)
 {
 	unsigned long timeout, start;
@@ -546,6 +562,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO);
 
 static void update_device_info(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f68af56c3f86..a55f4afff4d6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -5,6 +5,7 @@
 
 #include "xe_ggtt.h"
 
+#include <linux/fault-inject.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/sizes.h>
 
@@ -209,6 +210,12 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
  * initial clear done to it yet. That will happen in the regular, non-early
  * GGTT initialization.
  *
+ * This function fullfills the requirements for the error injectable functions
+ * fault-injection.html#requirements-for-the-error-injectable-functions so the
+ * ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
+ * runtime and use a provided return value, in order to test errors paths in
+ * the callers.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
@@ -264,6 +271,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO);
 
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 66d4e5e95abd..74a2d600e811 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -5,6 +5,8 @@
 
 #include "xe_guc_ads.h"
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
@@ -396,6 +398,13 @@ static int calculate_waklv_size(struct xe_guc_ads *ads)
 
 #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
 
+/*
+ * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
+ * runtime and use a provided return value, in order to test errors paths in the
+ * callers. The requirements for the error injectable functions are not strictly
+ * fullfilled but this is acceptable because the caller only propagates the error
+ * up the stack without cleanup of resources potentially allocated here.
+ */
 int xe_guc_ads_init(struct xe_guc_ads *ads)
 {
 	struct xe_device *xe = ads_to_xe(ads);
@@ -418,6 +427,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO);
 
 /**
  * xe_guc_ads_init_post_hwconfig - initialize ADS post hwconfig load
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4b95f75b1546..41900d1da5e8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/circ_buf.h>
 #include <linux/delay.h>
+#include <linux/fault-inject.h>
 
 #include <kunit/static_stub.h>
 
@@ -165,6 +166,13 @@ static void primelockdep(struct xe_guc_ct *ct)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
+/*
+ * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
+ * runtime and use a provided return value, in order to test errors paths in the
+ * callers. The requirements for the error injectable functions are not strictly
+ * fullfilled but this is acceptable because the caller only propagates the error
+ * up the stack without cleanup of resources potentially allocated here.
+ */
 int xe_guc_ct_init(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
@@ -209,6 +217,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	ct->state = XE_GUC_CT_STATE_DISABLED;
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO);
 
 #define desc_read(xe_, guc_ctb__, field_)			\
 	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index a37ee3419428..d448c7f09c01 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -5,6 +5,8 @@
 
 #include "xe_guc_log.h"
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include "xe_bo.h"
@@ -77,6 +79,13 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 	}
 }
 
+/*
+ * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
+ * runtime and use a provided return value, in order to test errors paths in the
+ * callers. The requirements for the error injectable functions are not strictly
+ * fullfilled but this is acceptable because the caller only propagates the error
+ * up the stack without cleanup of resources potentially allocated here.
+ */
 int xe_guc_log_init(struct xe_guc_log *log)
 {
 	struct xe_device *xe = log_to_xe(log);
@@ -96,3 +105,4 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO);
diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index ade6162dc259..d077e2ddb531 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/fault-inject.h>
 
 #include <drm/drm_managed.h>
 
@@ -327,6 +328,12 @@ static void __fini_relay(struct drm_device *drm, void *arg)
  * Initialize remaining members of &xe_guc_relay that may depend
  * on the SR-IOV mode.
  *
+ * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
+ * runtime and use a provided return value, in order to test errors paths in the
+ * callers. The requirements for the error injectable functions are not strictly
+ * fullfilled but this is acceptable because the caller only propagates the error
+ * up the stack without cleanup of resources potentially allocated here.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_guc_relay_init(struct xe_guc_relay *relay)
@@ -355,6 +362,7 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
 
 	return drmm_add_action_or_reset(&xe->drm, __fini_relay, relay);
 }
+ALLOW_ERROR_INJECTION(xe_guc_relay_init, ERRNO);
 
 static u32 to_relay_error(int err)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 33eb039053e4..b2f0cd1adc88 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -5,6 +5,7 @@
 
 #include "xe_pm.h"
 
+#include <linux/fault-inject.h>
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_managed.h>
@@ -247,6 +248,13 @@ static void xe_pm_runtime_init(struct xe_device *xe)
 	pm_runtime_put(dev);
 }
 
+/*
+ * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
+ * runtime and use a provided return value, in order to test errors paths in the
+ * callers. The requirements for the error injectable functions are not strictly
+ * fullfilled but this is acceptable because the caller only propagates the error
+ * up the stack without cleanup of resources potentially allocated here.
+ */
 int xe_pm_init_early(struct xe_device *xe)
 {
 	int err;
@@ -263,6 +271,7 @@ int xe_pm_init_early(struct xe_device *xe)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO);
 
 /**
  * xe_pm_init - Initialize Xe Power Management
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 69a066ef20c0..b714825c209c 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include "regs/xe_regs.h"
@@ -98,6 +100,13 @@ static void fini_sriov(struct drm_device *drm, void *arg)
  * In this function we create dedicated workqueue that will be used
  * by the SR-IOV specific workers.
  *
+ * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip
+ * execution at runtime and use a provided return value, in order to
+ * test errors paths in the callers. The requirements for the error
+ * injectable functions are not strictly fullfilled but this is
+ * acceptable because the caller only propagates the error up the
+ * stack without cleanup of resources potentially allocated here.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_sriov_init(struct xe_device *xe)
@@ -119,6 +128,7 @@ int xe_sriov_init(struct xe_device *xe)
 
 	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
 }
+ALLOW_ERROR_INJECTION(xe_sriov_init, ERRNO);
 
 /**
  * xe_sriov_print_info - Print basic SR-IOV information.
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index dda5268507d8..fe56fb6327a9 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include "xe_device.h"
@@ -108,6 +110,12 @@ static int xe_tile_alloc(struct xe_tile *tile)
  * Initializes per-tile resources that don't require any interactions with the
  * hardware or any knowledge about the Graphics/Media IP version.
  *
+ * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
+ * runtime and use a provided return value, in order to test errors paths in the
+ * callers. The requirements for the error injectable functions are not strictly
+ * fullfilled but this is acceptable because the caller only propagates the error
+ * up the stack without cleanup of resources potentially allocated here.
+ *
  * Returns: 0 on success, negative error code on error.
  */
 int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
@@ -129,6 +137,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO);
 
 static int tile_ttm_mgr_init(struct xe_tile *tile)
 {
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index eab9456e051f..8f43b0990947 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/fault-inject.h>
 #include <linux/firmware.h>
 
 #include <drm/drm_managed.h>
@@ -776,6 +777,13 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
 	return err;
 }
 
+/*
+ * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
+ * runtime and use a provided return value, in order to test errors paths in the
+ * callers. The requirements for the error injectable functions are not strictly
+ * fullfilled but this is acceptable because the caller only propagates the error
+ * up the stack without cleanup of resources potentially allocated here.
+ */
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	const struct firmware *fw = NULL;
@@ -797,6 +805,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 
 	return err;
 }
+ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO);
 
 static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
 {
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 22c148b1e996..3c9d36fd1a2c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 #include <kunit/visibility.h>
 #include <linux/compiler_types.h>
+#include <linux/fault-inject.h>
 
 #include <generated/xe_wa_oob.h>
 
@@ -822,6 +823,12 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
  * xe_wa_init - initialize gt with workaround bookkeeping
  * @gt: GT instance to initialize
  *
+ * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
+ * runtime and use a provided return value, in order to test errors paths in the
+ * callers. The requirements for the error injectable functions are not strictly
+ * fullfilled but this is acceptable because the caller only propagates the error
+ * up the stack without cleanup of resources potentially allocated here.
+ *
  * Returns 0 for success, negative error code otherwise.
  */
 int xe_wa_init(struct xe_gt *gt)
@@ -850,6 +857,7 @@ int xe_wa_init(struct xe_gt *gt)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_wa_init, ERRNO);
 
 void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
 {
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index 93c82825d896..1ea9ddf32c2a 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -5,6 +5,8 @@
 
 #include "xe_wopcm.h"
 
+#include <linux/fault-inject.h>
+
 #include "regs/xe_guc_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
@@ -193,6 +195,12 @@ u32 xe_wopcm_size(struct xe_device *xe)
  * enforce platform dependent hardware restrictions on GuC WOPCM offset and
  * size. It will fail the WOPCM init if any of these checks fail, so that the
  * following WOPCM registers setup and GuC firmware uploading would be aborted.
+ *
+ * This function fullfills the requirements for the error injectable functions
+ * fault-injection.html#requirements-for-the-error-injectable-functions so the
+ * ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
+ * runtime and use a provided return value, in order to test errors paths in
+ * the callers.
  */
 int xe_wopcm_init(struct xe_wopcm *wopcm)
 {
@@ -268,3 +276,4 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 
 	return ret;
 }
+ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO);
-- 
2.43.0

