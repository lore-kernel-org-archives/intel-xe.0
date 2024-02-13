Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6B4C4829E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 00:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA89310E380;
	Tue, 13 Feb 2024 00:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDu8dv5j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433FF10E742
 for <Intel-Xe@lists.freedesktop.org>; Tue, 13 Feb 2024 00:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707784613; x=1739320613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k+RwGELr5PyO9KxbWFxapev5tlIFZfG3hloBAljFEiA=;
 b=WDu8dv5jQK4c/FZv89odBX2E3f1BQdr4+sSmq1ITRkhMU/RkuLJvzTOj
 91OVNSoQgje/lwB3MlTlGBIKWJ6UAeQAlFDV4h6x99hqoncB07sWB24bD
 2/av155/x4MjJwjSKgHq/aJDgGSmBvMnj+PJNOIlrBDucs2XBhZxBgzXF
 NOyvBaM6IYDDmfGWMaqyD6orz3mHII3uyhzBooMjXyw3ZuN3kUt859xiJ
 6H+gJdNY4af1S2/mxZ24yJNblo+wFr5iOo3cjI7kkTxvANtx5X0bgBUH4
 tjp0IuDeGVhQ3eB6QBpOx0excVgQTWAOU89ZCxUOP4g8ma8R7zVBmVYJh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1923027"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="1923027"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 16:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="7479354"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 12 Feb 2024 16:36:52 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 2/2] drm/xe/guc: Port over the slow GuC loading support
 from i915
Date: Mon, 12 Feb 2024 16:34:26 -0800
Message-ID: <20240213003426.3943662-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
References: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 +++-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
 drivers/gpu/drm/xe/xe_guc.c             | 197 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_macros.h          |  32 ++++
 4 files changed, 214 insertions(+), 43 deletions(-)

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
index 92320bbc9d3d..a30e179e662e 100644
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
index 868208a39829..82514d395704 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -16,6 +16,7 @@
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
+#include "xe_gt_freq.h"
 #include "xe_guc_ads.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_hwconfig.h"
@@ -427,58 +428,172 @@ static int guc_xfer_rsa(struct xe_guc *guc)
 	return 0;
 }
 
+/*
+ * Read the GuC status register (GUC_STATUS) and store it in the
+ * specified location; then return a boolean indicating whether
+ * the value matches either completion or a known failure code.
+ *
+ * This is used for polling the GuC status in an xe_wait_for()
+ * loop below.
+ */
+static inline bool guc_load_done(struct xe_gt *gt, u32 *status, bool *success)
+{
+	u32 val = xe_mmio_read32(gt, GUC_STATUS);
+	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
+	u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, val);
+
+	*status = val;
+	switch (uk_val) {
+	case XE_GUC_LOAD_STATUS_READY:
+		*success = true;
+		return true;
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
+		*success = false;
+		return true;
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
+		*success = false;
+		return true;
+	}
+
+	return false;
+}
+
+/*
+ * Wait for the GuC to start up.
+ *
+ * Measurements indicate this should take no more than 20ms (assuming the GT
+ * clock is at maximum frequency). However, thermal throttling and other issues
+ * can prevent the clock hitting max and thus making the load take significantly
+ * longer. Indeed, if the GT is clamped to minimum frequency then the load times
+ * can be in the seconds range. As, there is a limit on how long an individual
+ * usleep_range() can wait for, the wait is wrapped in a loop. The loop count
+ * is increased for debug builds so that problems can be detected and analysed.
+ * For release builds, the timeout is kept short so that user's don't wait
+ * forever to find out there is a problem. In either case, if the load took longer
+ * than is reasonable even with some 'sensible' throttling, then flag a warning
+ * because something is not right.
+ *
+ * Note that the only reason an end user should hit the timeout is in case of
+ * extreme thermal throttling. And a system that is that hot during boot is
+ * probably dead anyway!
+ */
+#if defined(CONFIG_DRM_XE_DEBUG)
+#define GUC_LOAD_RETRY_LIMIT	20
+#else
+#define GUC_LOAD_RETRY_LIMIT	3
+#endif
+#define GUC_LOAD_TIME_WARN      200
+
 static int guc_wait_ucode(struct xe_guc *guc)
 {
-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
+	ktime_t before, after, delta;
+	bool success;
 	u32 status;
-	int ret;
+	int ret, count;
+	u64 delta_ms;
+	u32 before_freq;
+
+	before_freq = xe_guc_pc_get_act_freq(guc_pc);
+	before = ktime_get();
+	for (count = 0; count < GUC_LOAD_RETRY_LIMIT; count++) {
+		ret = xe_wait_for(guc_load_done(gt, &status, &success), 1000 * 1000);
+		if (!ret || !success)
+			break;
+
+		xe_gt_dbg(gt, "load still in progress, count = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
+			  count, xe_guc_pc_get_act_freq(guc_pc),
+			  xe_guc_pc_get_act_freq(guc_pc), status,
+			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
+			  REG_FIELD_GET(GS_UKERNEL_MASK, status));
+	}
+	after = ktime_get();
+	delta = ktime_sub(after, before);
+	delta_ms = ktime_to_ms(delta);
+	if (ret || !success) {
+		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
+		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
+
+		xe_gt_info(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), ret = %d\n",
+			   status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
+			   xe_guc_pc_get_act_freq(guc_pc), ret);
+		xe_gt_info(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
+			   REG_FIELD_GET(GS_MIA_IN_RESET, status),
+			   bootrom, ukernel,
+			   REG_FIELD_GET(GS_MIA_MASK, status),
+			   REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
+
+		switch (bootrom) {
+		case XE_BOOTROM_STATUS_NO_KEY_FOUND:
+			xe_gt_info(gt, "invalid key requested, header = 0x%08X\n",
+				   xe_mmio_read32(gt, GUC_HEADER_INFO));
+			ret = -ENOEXEC;
+			break;
 
-	/*
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
-	 */
-	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
-			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
-			     200000, &status, false);
+		case XE_BOOTROM_STATUS_RSA_FAILED:
+			xe_gt_info(gt, "firmware signature verification failed\n");
+			ret = -ENOEXEC;
+			break;
 
-	if (ret) {
-		struct drm_device *drm = &xe->drm;
-
-		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
-		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
-			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
-			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
-			 REG_FIELD_GET(GS_MIA_MASK, status),
-			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
-
-		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
-			drm_info(drm, "GuC firmware signature verification failed\n");
+		case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
+			xe_gt_info(gt, "firmware production part check failure\n");
 			ret = -ENOEXEC;
+			break;
 		}
 
-		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
-		    XE_GUC_LOAD_STATUS_EXCEPTION) {
-			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
-				 xe_mmio_read32(guc_to_gt(guc),
-						SOFT_SCRATCH(13)));
+		switch (ukernel) {
+		case XE_GUC_LOAD_STATUS_EXCEPTION:
+			xe_gt_info(gt, "firmware exception. EIP: %#x\n",
+				   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
 			ret = -ENXIO;
+			break;
+
+		case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
+			xe_gt_info(gt, "illegal register in save/restore workaround list\n");
+			ret = -EPERM;
+			break;
+
+		case XE_GUC_LOAD_STATUS_HWCONFIG_START:
+			xe_gt_info(gt, "still extracting hwconfig table.\n");
+			ret = -ETIMEDOUT;
+			break;
 		}
+
+		/* Uncommon/unexpected error, see earlier status code print for details */
+		if (ret == 0)
+			ret = -ENXIO;
+	} else if (delta_ms > GUC_LOAD_TIME_WARN) {
+		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
+			   delta_ms, status, count, ret);
+		xe_gt_warn(gt, "excessive init time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
+			   xe_guc_pc_get_act_freq(guc_pc), before_freq,
+			   xe_read_perf_limit_reasons(gt));
 	} else {
-		drm_dbg(&xe->drm, "GuC successfully loaded");
+		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
+			  delta_ms, xe_guc_pc_get_act_freq(guc_pc),
+			  before_freq, status, count, ret);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..eac8f2c9fba5 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -15,4 +15,36 @@
 			    "Ioctl argument check failed at %s:%d: %s", \
 			    __FILE__, __LINE__, #cond), 1))
 
+/*
+ * xe_wait_for - magic wait macro
+ *
+ * Macro to help avoid open coding check/wait/timeout patterns. Note that it's
+ * important that we check the condition again after having timed out, since the
+ * timeout could be due to preemption or similar and we've never had a chance to
+ * check the condition before the timeout.
+ */
+#define xe_wait_for(COND, US) ({ \
+	const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * (US)); \
+	long wait__ = 10; /* recommended min for usleep is 10 us */	\
+	int ret__;							\
+	might_sleep();							\
+	for (;;) {							\
+		const bool expired__ = ktime_after(ktime_get_raw(), end__); \
+		/* Guarantee COND check prior to timeout */		\
+		barrier();						\
+		if (COND) {						\
+			ret__ = 0;					\
+			break;						\
+		}							\
+		if (expired__) {					\
+			ret__ = -ETIMEDOUT;				\
+			break;						\
+		}							\
+		usleep_range(wait__, wait__ * 2);			\
+		if (wait__ < (1000))					\
+			wait__ <<= 1;					\
+	}								\
+	ret__;								\
+})
+
 #endif
-- 
2.43.0

