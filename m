Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B126DC25B74
	for <intel-xe@archiver.kernel.org>; Sat, 18 May 2024 04:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1292110E034;
	Sat, 18 May 2024 04:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E29695d2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6935810E055
 for <Intel-Xe@lists.freedesktop.org>; Sat, 18 May 2024 04:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716007022; x=1747543022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eOCGJZWHI264LEt9YzAQ+k4S3A+mEItuz1CbBPwEUTM=;
 b=E29695d2EYog5Be0uX9Gly0iUgfJc455yFBpCpAWPa8LwLQNV6EHx+Z9
 uL2WVjihTHA6REpyzreaJSeUqCt9tWUwQxjS2jOoS11DOoAgBEOfe5wlL
 efHagwyfsdel1JR8DeGDwphgnpAdUQ3LSNgo8DVEEjHcVC9ZeLu9jH8PP
 we3zrqDVPp1M1ku+8U9rT9FwZyHBB6lIHnK3McUBHOsm+rpouQYUIqdDm
 A1mgl8zxLY4h1OokFSibFkmQSOycpB9tHBji/FQojbR334IVghnnjURvI
 Awd4aWH67Ax4+Pk7xZyAXp2VmAd+8Tmoy2t7D3keiApzgKcWaabTOrYoe g==;
X-CSE-ConnectionGUID: 9xHqYNsrRLiAf30URUqzOA==
X-CSE-MsgGUID: UEIF/sYQTmeFE7VrYBgA8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="23343736"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="23343736"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 21:37:01 -0700
X-CSE-ConnectionGUID: 4yoTAXCiS+WcYI4I8nS1Jw==
X-CSE-MsgGUID: DDct3gpOSwq6U4F0cHrJfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="32572959"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 17 May 2024 21:37:01 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 2/2] drm/xe/guc: Port over the slow GuC loading support
 from i915
Date: Fri, 17 May 2024 21:36:59 -0700
Message-ID: <20240518043700.3264362-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240518043700.3264362-1-John.C.Harrison@Intel.com>
References: <20240518043700.3264362-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

GuC loading can take longer than it is supposed to for various
reasons. So add in the code to cope with that and to report it when it
happens. There are also many different reasons why GuC loading can
fail, so add in the code for checking for those and for reporting
issues in a meaningful manner rather than just hitting a timeout and
saying 'fail: status = %x'.

Also, remove the 'FIXME' comment about an i915 bug that has never been
applicable to Xe!

v2: Actually report the requested and granted frequencies rather than
showing granted twice (review feedback from Badal).
v3: Locally code all the timeout and end condition handling because a
helper function is not allowed (review feedback from Lucas/Rodrigo).
v4: Add more documentation comments and rename a define to add units
(review feedback from Lucas).
v5: Fix copy/paste error in xe_mmio_wait32_not (review feedback from
Lucas) and rebase (no more return value from guc_wait_ucode).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 ++-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
 drivers/gpu/drm/xe/xe_guc.c             | 203 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_mmio.c            |  61 +++++++
 drivers/gpu/drm/xe/xe_mmio.h            |   2 +
 5 files changed, 260 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
index ec83551bf9c0..d0b5fed6876f 100644
--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
@@ -7,8 +7,12 @@
 #define _ABI_GUC_ERRORS_ABI_H
 
 enum xe_guc_response_status {
-	XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
-	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
+	XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
+	XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
+	XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
+	XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
+	XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
+	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
 };
 
 enum xe_guc_load_status {
@@ -17,6 +21,9 @@ enum xe_guc_load_status {
 	XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
 	XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
 	XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
+	XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
+	XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
+	XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
 	XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
 	XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
 	XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
@@ -34,4 +41,19 @@ enum xe_guc_load_status {
 	XE_GUC_LOAD_STATUS_READY                            = 0xF0,
 };
 
+enum xe_bootrom_load_status {
+	XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
+	XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
+	XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
+	XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
+	XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
+	XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
+	XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
+	XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
+	XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
+	XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
+	XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
+	XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 11682e675e0f..a5fd14307f94 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -40,6 +40,8 @@
 #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
 #define   GS_MIA_IN_RESET			REG_BIT(0)
 
+#define GUC_HEADER_INFO				XE_REG(0xc014)
+
 #define GUC_WOPCM_SIZE				XE_REG(0xc050)
 #define   GUC_WOPCM_SIZE_MASK			REG_GENMASK(31, 12)
 #define   GUC_WOPCM_SIZE_LOCKED			REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e52b544ac690..72a48e9f0c8e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -20,6 +20,7 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_gt_throttle.h"
 #include "xe_guc_ads.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_db_mgr.h"
@@ -461,53 +462,191 @@ static int guc_xfer_rsa(struct xe_guc *guc)
 	return 0;
 }
 
+/*
+ * Check a previously read GuC status register (GUC_STATUS) looking for
+ * known terminal states (either completion or failure) of either the
+ * microkernel status field or the boot ROM status field. Returns +1 for
+ * successful completion, -1 for failure and 0 for any intermediate state.
+ */
+static int guc_load_done(u32 status)
+{
+	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, status);
+	u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, status);
+
+	switch (uk_val) {
+	case XE_GUC_LOAD_STATUS_READY:
+		return 1;
+
+	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
+	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
+	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
+	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
+	case XE_GUC_LOAD_STATUS_DPC_ERROR:
+	case XE_GUC_LOAD_STATUS_EXCEPTION:
+	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
+	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
+	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
+		return -1;
+	}
+
+	switch (br_val) {
+	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
+	case XE_BOOTROM_STATUS_RSA_FAILED:
+	case XE_BOOTROM_STATUS_PAVPC_FAILED:
+	case XE_BOOTROM_STATUS_WOPCM_FAILED:
+	case XE_BOOTROM_STATUS_LOADLOC_FAILED:
+	case XE_BOOTROM_STATUS_JUMP_FAILED:
+	case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
+	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
+	case XE_BOOTROM_STATUS_EXCEPTION:
+	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
+		return -1;
+	}
+
+	return 0;
+}
+
+static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
+{
+	u32 freq;
+	int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
+
+	return ret ? ret : freq;
+}
+
+/*
+ * Wait for the GuC to start up.
+ *
+ * Measurements indicate this should take no more than 20ms (assuming the GT
+ * clock is at maximum frequency). However, thermal throttling and other issues
+ * can prevent the clock hitting max and thus making the load take significantly
+ * longer. Allow up to 200ms as a safety margin for real world worst case situations.
+ *
+ * However, bugs anywhere from KMD to GuC to PCODE to fan failure in a CI farm can
+ * lead to even longer times. E.g. if the GT is clamped to minimum frequency then
+ * the load times can be in the seconds range. So the timeout is increased for debug
+ * builds to ensure that problems can be correctly analysed. For release builds, the
+ * timeout is kept short so that users don't wait forever to find out that there is a
+ * problem. In either case, if the load took longer than is reasonable even with some
+ * 'sensible' throttling, then flag a warning because something is not right.
+ *
+ * Note that there is a limit on how long an individual usleep_range() can wait for,
+ * hence longer waits require wrapping a shorter wait in a loop.
+ *
+ * Note that the only reason an end user should hit the shorter timeout is in case of
+ * extreme thermal throttling. And a system that is that hot during boot is probably
+ * dead anyway!
+ */
+#if defined(CONFIG_DRM_XE_DEBUG)
+#define GUC_LOAD_RETRY_LIMIT	20
+#else
+#define GUC_LOAD_RETRY_LIMIT	3
+#endif
+#define GUC_LOAD_TIME_WARN_MS      200
+
 static void guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	u32 status;
-	int ret;
-
+	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
+	ktime_t before, after, delta;
+	int load_done;
+	u32 status = 0;
+	int count;
+	u64 delta_ms;
+	u32 before_freq;
+
+	before_freq = xe_guc_pc_get_act_freq(guc_pc);
+	before = ktime_get();
 	/*
-	 * Wait for the GuC to start up.
-	 * NB: Docs recommend not using the interrupt for completion.
-	 * Measurements indicate this should take no more than 20ms
-	 * (assuming the GT clock is at maximum frequency). So, a
-	 * timeout here indicates that the GuC has failed and is unusable.
-	 * (Higher levels of the driver may decide to reset the GuC and
-	 * attempt the ucode load again if this happens.)
-	 *
-	 * FIXME: There is a known (but exceedingly unlikely) race condition
-	 * where the asynchronous frequency management code could reduce
-	 * the GT clock while a GuC reload is in progress (during a full
-	 * GT reset). A fix is in progress but there are complex locking
-	 * issues to be resolved. In the meantime bump the timeout to
-	 * 200ms. Even at slowest clock, this should be sufficient. And
-	 * in the working case, a larger timeout makes no difference.
+	 * Note, can't use any kind of timing information from the call to xe_mmio_wait.
+	 * It could return a thousand intermediate stages at random times. Instead, must
+	 * manually track the total time taken and locally implement the timeout.
 	 */
-	ret = xe_mmio_wait32(gt, GUC_STATUS, GS_UKERNEL_MASK,
-			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
-			     200000, &status, false);
+	do {
+		u32 last_status = status & (GS_UKERNEL_MASK | GS_BOOTROM_MASK);
 
-	if (ret) {
-		xe_gt_err(gt, "GuC load failed: status = 0x%08X\n", status);
-		xe_gt_err(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
-			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
+		/*
+		 * Wait for any change (intermediate or terminal) in the status register.
+		 * Note, the return value is a don't care. The only failure code is timeout
+		 * but the timeouts need to be accumulated over all the intermediate partial
+		 * timeouts rather than allowing a huge timeout each time. So basically, need
+		 * to treat a timeout no different to a value change.
+		 */
+		xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
+				   last_status, 1000 * 1000, &status, false);
+
+		after = ktime_get();
+		delta = ktime_sub(after, before);
+		delta_ms = ktime_to_ms(delta);
+
+		load_done = guc_load_done(status);
+		if (load_done != 0)
+			break;
+
+		if (delta_ms >= (GUC_LOAD_RETRY_LIMIT * 1000))
+			break;
+
+		xe_gt_dbg(gt, "load still in progress, count = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
+			  count, xe_guc_pc_get_act_freq(guc_pc),
+			  guc_pc_get_cur_freq(guc_pc), status,
 			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			  REG_FIELD_GET(GS_UKERNEL_MASK, status),
+			  REG_FIELD_GET(GS_UKERNEL_MASK, status));
+	} while (1);
+
+	if (load_done != 1) {
+		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
+		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
+
+		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), done = %d\n",
+			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
+			  guc_pc_get_cur_freq(guc_pc), load_done);
+		xe_gt_err(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
+			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
+			  bootrom, ukernel,
 			  REG_FIELD_GET(GS_MIA_MASK, status),
 			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
 
-		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
-			xe_gt_err(gt, "GuC firmware signature verification failed\n");
+		switch (bootrom) {
+		case XE_BOOTROM_STATUS_NO_KEY_FOUND:
+			xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
+				  xe_mmio_read32(gt, GUC_HEADER_INFO));
+			break;
+
+		case XE_BOOTROM_STATUS_RSA_FAILED:
+			xe_gt_err(gt, "firmware signature verification failed\n");
+			break;
 
-		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
-		    XE_GUC_LOAD_STATUS_EXCEPTION)
-			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
+		case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
+			xe_gt_err(gt, "firmware production part check failure\n");
+			break;
+		}
+
+		switch (ukernel) {
+		case XE_GUC_LOAD_STATUS_EXCEPTION:
+			xe_gt_err(gt, "firmware exception. EIP: %#x\n",
 				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
+			break;
+
+		case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
+			xe_gt_err(gt, "illegal register in save/restore workaround list\n");
+			break;
+
+		case XE_GUC_LOAD_STATUS_HWCONFIG_START:
+			xe_gt_err(gt, "still extracting hwconfig table.\n");
+			break;
+		}
 
 		xe_device_declare_wedged(gt_to_xe(gt));
+	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
+		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, count = %d]\n",
+			   delta_ms, status, count);
+		xe_gt_warn(gt, "excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
+			   xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
+			   before_freq, xe_gt_throttle_get_limit_reasons(gt));
 	} else {
-		xe_gt_dbg(gt, "GuC successfully loaded\n");
+		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, count = %d\n",
+			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
+			  before_freq, status, count);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 05edab0e085d..3adeb4061b18 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -594,3 +594,64 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
 
 	return ret;
 }
+
+/**
+ * xe_mmio_wait32_not() - Wait for a register to return anything other than the given masked value
+ * @gt: MMIO target GT
+ * @reg: register to read value from
+ * @mask: mask to be applied to the value read from the register
+ * @val: value to match after applying the mask
+ * @timeout_us: time out after this period of time. Wait logic tries to be
+ * smart, applying an exponential backoff until @timeout_us is reached.
+ * @out_val: if not NULL, points where to store the last unmasked value
+ * @atomic: needs to be true if calling from an atomic context
+ *
+ * This function polls for a masked value to change from a given value and
+ * returns zero on success or -ETIMEDOUT if timed out.
+ *
+ * Note that @timeout_us represents the minimum amount of time to wait before
+ * giving up. The actual time taken by this function can be a little more than
+ * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
+ * it is possible that this function succeeds even after @timeout_us has passed.
+ */
+int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
+		       u32 *out_val, bool atomic)
+{
+	ktime_t cur = ktime_get_raw();
+	const ktime_t end = ktime_add_us(cur, timeout_us);
+	int ret = -ETIMEDOUT;
+	s64 wait = 10;
+	u32 read;
+
+	for (;;) {
+		read = xe_mmio_read32(gt, reg);
+		if ((read & mask) != val) {
+			ret = 0;
+			break;
+		}
+
+		cur = ktime_get_raw();
+		if (!ktime_before(cur, end))
+			break;
+
+		if (ktime_after(ktime_add_us(cur, wait), end))
+			wait = ktime_us_delta(end, cur);
+
+		if (atomic)
+			udelay(wait);
+		else
+			usleep_range(wait, wait << 1);
+		wait <<= 1;
+	}
+
+	if (ret != 0) {
+		read = xe_mmio_read32(gt, reg);
+		if ((read & mask) != val)
+			ret = 0;
+	}
+
+	if (out_val)
+		*out_val = read;
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 445ec6a0753e..1705c2e605a1 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -35,6 +35,8 @@ int xe_mmio_probe_vram(struct xe_device *xe);
 u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
 int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
 		   u32 *out_val, bool atomic);
+int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
+		       u32 *out_val, bool atomic);
 
 static inline u32 xe_mmio_adjusted_addr(const struct xe_gt *gt, u32 addr)
 {
-- 
2.43.2

