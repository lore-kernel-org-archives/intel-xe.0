Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB16C7883B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 13:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D93710E0D9;
	Fri, 20 Sep 2024 13:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqnuHjZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C0510E0D9
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726838329; x=1758374329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aLkRDMlRWmOx7rhnlzWk7OocI2lTMgOJHmrwc1FJ69s=;
 b=LqnuHjZUjKEj530oVIhqiOehm+R/JUhVnt4ZvbbnrTm40FN26yhDnJCY
 HOStAHrBabvmnOK1KV8bp9IfQVlcRWvYPVR+LXiYiurH5ToYRegi5RJSR
 6zxZRhjrJ2II2RFoep1JODo5h420lGktrSOJQ2LU0Sk4TRnX5kAytVtMn
 IUKbXCd5fWqw62ea5PjKqU3MXG1EWzImVbLWx00/SKy6uMVRzAUH5RmAV
 GDyaygKikIbl0DYIf7cU09DZnyGdGHuxLto2ZYMo41DhN5Q2oG7qISjnV
 9nSW6Lqa19DtdTl0peMSB54vJL/bmrirJmbbKOjH2tWM3Epme3R71PM1v A==;
X-CSE-ConnectionGUID: WCBm3+V2RvOVlLFDLThD4Q==
X-CSE-MsgGUID: MMXB6qLkSXWDMpg7Jaj2Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29738883"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29738883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:18:49 -0700
X-CSE-ConnectionGUID: ALbcQ3XYQq+28IGLfR131Q==
X-CSE-MsgGUID: enqsTXCdQLKbi9cmV+hZKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="75249608"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:18:47 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2] drm/xe: Use fault injection infrastructure to find issues
 at probe time
Date: Fri, 20 Sep 2024 15:18:34 +0200
Message-ID: <20240920131834.3368299-1-francois.dugast@intel.com>
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
handling during probe. In particular, ALLOW_ERROR_INJECTION() is added
directly to functions which fullfill the injectable functions
requirements:
fault-injection.html#requirements-for-the-error-injectable-functions

Otherwise a helper function is added and called in the beginning of the
function where the fault is to be injected.

The return code of the functions using ALLOW_ERROR_INJECTION() can be
conditionnally modified at runtime by tuning some debugfs entries. This
requires CONFIG_FUNCTION_ERROR_INJECTION (among others).

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

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c    | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c      |  2 ++
 drivers/gpu/drm/xe/xe_guc_ads.c   | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c    | 11 +++++++++++
 drivers/gpu/drm/xe/xe_guc_log.c   | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_relay.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_pm.c        | 11 +++++++++++
 drivers/gpu/drm/xe/xe_sriov.c     | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_tile.c      | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.c     | 11 +++++++++++
 drivers/gpu/drm/xe/xe_wa.c        | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_wopcm.c     |  3 +++
 12 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cb5a9fd820cf..d26352ecf75e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -6,6 +6,7 @@
 #include "xe_device.h"
 
 #include <linux/delay.h>
+#include <linux/fault-inject.h>
 #include <linux/units.h>
 
 #include <drm/drm_aperture.h>
@@ -300,12 +301,22 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
+static noinline int fault_inject_device_create(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(fault_inject_device_create, ERRNO);
+
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
 	struct xe_device *xe;
 	int err;
 
+	err = fault_inject_device_create();
+	if (err)
+		return ERR_PTR(err);
+
 	xe_display_driver_set_hooks(&driver);
 
 	err = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
@@ -548,6 +559,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO);
 
 static void update_device_info(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f68af56c3f86..4906e3f3150b 100644
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
+ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO);
 
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 66d4e5e95abd..e366043eb4b8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -5,6 +5,8 @@
 
 #include "xe_guc_ads.h"
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
@@ -396,12 +398,23 @@ static int calculate_waklv_size(struct xe_guc_ads *ads)
 
 #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
 
+static noinline int fault_inject_guc_ads_init(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(fault_inject_guc_ads_init, ERRNO);
+
 int xe_guc_ads_init(struct xe_guc_ads *ads)
 {
 	struct xe_device *xe = ads_to_xe(ads);
 	struct xe_gt *gt = ads_to_gt(ads);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
+	int ret;
+
+	ret = fault_inject_guc_ads_init();
+	if (ret)
+		return ret;
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4b95f75b1546..61967ddd319f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/circ_buf.h>
 #include <linux/delay.h>
+#include <linux/fault-inject.h>
 
 #include <kunit/static_stub.h>
 
@@ -165,6 +166,12 @@ static void primelockdep(struct xe_guc_ct *ct)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
+static noinline int fault_inject_guc_ct_init(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(fault_inject_guc_ct_init, ERRNO);
+
 int xe_guc_ct_init(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
@@ -173,6 +180,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	struct xe_bo *bo;
 	int err;
 
+	err = fault_inject_guc_ct_init();
+	if (err)
+		return err;
+
 	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
 
 	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", 0);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index a37ee3419428..a3e54f1bb0c3 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -5,6 +5,8 @@
 
 #include "xe_guc_log.h"
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include "xe_bo.h"
@@ -77,11 +79,22 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 	}
 }
 
+static noinline int fault_inject_guc_log_init(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(fault_inject_guc_log_init, ERRNO);
+
 int xe_guc_log_init(struct xe_guc_log *log)
 {
 	struct xe_device *xe = log_to_xe(log);
 	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
 	struct xe_bo *bo;
+	int err;
+
+	err = fault_inject_guc_log_init();
+	if (err)
+		return err;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
 					  XE_BO_FLAG_SYSTEM |
diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index ade6162dc259..ede7fd3e7785 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/fault-inject.h>
 
 #include <drm/drm_managed.h>
 
@@ -320,6 +321,12 @@ static void __fini_relay(struct drm_device *drm, void *arg)
 	mempool_exit(&relay->pool);
 }
 
+static noinline int fault_inject_guc_relay_init(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(fault_inject_guc_relay_init, ERRNO);
+
 /**
  * xe_guc_relay_init - Initialize a &xe_guc_relay
  * @relay: the &xe_guc_relay to initialize
@@ -335,6 +342,10 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
 	struct xe_device *xe = relay_to_xe(relay);
 	int err;
 
+	err = fault_inject_guc_relay_init();
+	if (err)
+		return err;
+
 	relay_assert(relay, !relay_is_ready(relay));
 
 	if (!IS_SRIOV(xe))
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 33eb039053e4..87075aed885d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -5,6 +5,7 @@
 
 #include "xe_pm.h"
 
+#include <linux/fault-inject.h>
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_managed.h>
@@ -247,10 +248,20 @@ static void xe_pm_runtime_init(struct xe_device *xe)
 	pm_runtime_put(dev);
 }
 
+static noinline int fault_inject_pm_init_early(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(fault_inject_pm_init_early, ERRNO);
+
 int xe_pm_init_early(struct xe_device *xe)
 {
 	int err;
 
+	err = fault_inject_pm_init_early();
+	if (err)
+		return err;
+
 	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
 
 	err = drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 69a066ef20c0..f1dafcfd4eae 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include "regs/xe_regs.h"
@@ -91,6 +93,12 @@ static void fini_sriov(struct drm_device *drm, void *arg)
 	xe->sriov.wq = NULL;
 }
 
+static noinline int fault_inject_sriov_init(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(fault_inject_sriov_init, ERRNO);
+
 /**
  * xe_sriov_init - Initialize SR-IOV specific data.
  * @xe: the &xe_device to initialize
@@ -102,11 +110,16 @@ static void fini_sriov(struct drm_device *drm, void *arg)
  */
 int xe_sriov_init(struct xe_device *xe)
 {
+	int err = fault_inject_sriov_init();
+
+	if (err)
+		return err;
+
 	if (!IS_SRIOV(xe))
 		return 0;
 
 	if (IS_SRIOV_PF(xe)) {
-		int err = xe_sriov_pf_init_early(xe);
+		err = xe_sriov_pf_init_early(xe);
 
 		if (err)
 			return err;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index dda5268507d8..c82b4278c03e 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_managed.h>
 
 #include "xe_device.h"
@@ -99,6 +101,12 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+static noinline int fault_inject_tile_init_early(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(fault_inject_tile_init_early, ERRNO);
+
 /**
  * xe_tile_init_early - Initialize the tile and primary GT
  * @tile: Tile to initialize
@@ -114,6 +122,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 {
 	int err;
 
+	err = fault_inject_tile_init_early();
+	if (err)
+		return err;
+
 	tile->xe = xe;
 	tile->id = id;
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index eab9456e051f..8fff0fd7c675 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/fault-inject.h>
 #include <linux/firmware.h>
 
 #include <drm/drm_managed.h>
@@ -776,11 +777,21 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
 	return err;
 }
 
+static noinline int fault_inject_uc_fw_init(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(fault_inject_uc_fw_init, ERRNO);
+
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	const struct firmware *fw = NULL;
 	int err;
 
+	err = fault_inject_uc_fw_init();
+	if (err)
+		return err;
+
 	err = uc_fw_request(uc_fw, &fw);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 22c148b1e996..121443b790bf 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 #include <kunit/visibility.h>
 #include <linux/compiler_types.h>
+#include <linux/fault-inject.h>
 
 #include <generated/xe_wa_oob.h>
 
@@ -818,6 +819,12 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
 	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
 }
 
+static noinline int fault_inject_wa_init(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(fault_inject_wa_init, ERRNO);
+
 /**
  * xe_wa_init - initialize gt with workaround bookkeeping
  * @gt: GT instance to initialize
@@ -829,6 +836,11 @@ int xe_wa_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	size_t n_oob, n_lrc, n_engine, n_gt, total;
 	unsigned long *p;
+	int err;
+
+	err = fault_inject_wa_init();
+	if (err)
+		return err;
 
 	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
 	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index 93c82825d896..88a201122a22 100644
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
+ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO);
-- 
2.43.0

