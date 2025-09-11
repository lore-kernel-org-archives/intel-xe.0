Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE29CAC58E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 17:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBB610E3CA;
	Thu, 11 Sep 2025 17:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ClHoIf4R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727E310E3B5
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 17:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757611540; x=1789147540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zCgqL9e5FKWRXiSfLBibOYZI7L0r31sJzW88Enfeszw=;
 b=ClHoIf4Rnp+G1BNn+bTwo/6tNhDRdQXbTn0TbgdvZLpoC3/uGHZffhqA
 QdIXYZ5wv4m5NT4Sf7jouKQTF+D1YEt0F/xVneOqpOaVG61ljLlJpkW60
 5Lrr1GpNtpk7jHnWf9NWqgsR9J9smpTkZwALSsWzZFxvEay9a58upRrYp
 czDMItozW/PXTIckZmzGaiVBOtnfh/d4c0bmjdplC/nxeNNlyjjOnt7RJ
 GGxdv0sqDHumQv5CORSeTTPVJdEv21HMXiE71+A8g3m7JxxOoe79beWAI
 x9nPE6YMIKZqOfpcbxGtnE87j2oJ8ENTN2aLQ3YqQL3kaqSFEObx5tGuZ g==;
X-CSE-ConnectionGUID: NAEoCICrScebhc9AD+S/HQ==
X-CSE-MsgGUID: rXWe53ayRjqT4jkcsGQqlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59810776"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="59810776"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:25:39 -0700
X-CSE-ConnectionGUID: PLMFugIxST2l1b1cL+fLOg==
X-CSE-MsgGUID: rq5jtDw2TN+9Js8w1F5p9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178956850"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:25:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 5/5] drm/xe/guc: Refactor GuC load to use poll_timeout_us()
Date: Thu, 11 Sep 2025 10:25:23 -0700
Message-ID: <20250911-xe-iopoll-v3-5-6a95f1cc3b0b@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
References: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Currently there are 2 wait loops for loading GuC: one in
xe_mmio_wait32_not() and one guc_wait_ucode(). Now that there's a
generic poll_timeout_us(), refactor the code to use that and be more
readable.

Main change in behavior is that there's no exponential wait anymore:
that is now replaced by a 10msec retry.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Fix typos and leftover comment (John Harrison)
v3: Leave the addition of print_bootrom_ukernel_err() to another commit
---
 drivers/gpu/drm/xe/xe_guc.c | 213 +++++++++++++++++++-------------------------
 1 file changed, 93 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index da1bb4939c6b8..389576055cc5d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -5,6 +5,7 @@
 
 #include "xe_guc.h"
 
+#include <linux/iopoll.h>
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
@@ -972,82 +973,27 @@ static int guc_xfer_rsa(struct xe_guc *guc)
 	return 0;
 }
 
-/*
- * Check a previously read GuC status register (GUC_STATUS) looking for
- * known terminal states (either completion or failure) of either the
- * microkernel status field or the boot ROM status field. Returns +1 for
- * successful completion, -1 for failure and 0 for any intermediate state.
- */
-static int guc_load_done(u32 status)
-{
-	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, status);
-	u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, status);
-
-	switch (uk_val) {
-	case XE_GUC_LOAD_STATUS_READY:
-		return 1;
-
-	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
-	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
-	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
-	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
-	case XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH:
-	case XE_GUC_LOAD_STATUS_DPC_ERROR:
-	case XE_GUC_LOAD_STATUS_EXCEPTION:
-	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
-	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
-	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
-	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
-	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
-		return -1;
-	}
-
-	switch (br_val) {
-	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
-	case XE_BOOTROM_STATUS_RSA_FAILED:
-	case XE_BOOTROM_STATUS_PAVPC_FAILED:
-	case XE_BOOTROM_STATUS_WOPCM_FAILED:
-	case XE_BOOTROM_STATUS_LOADLOC_FAILED:
-	case XE_BOOTROM_STATUS_JUMP_FAILED:
-	case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
-	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
-	case XE_BOOTROM_STATUS_EXCEPTION:
-	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
-		return -1;
-	}
-
-	return 0;
-}
-
 /*
  * Wait for the GuC to start up.
  *
  * Measurements indicate this should take no more than 20ms (assuming the GT
  * clock is at maximum frequency). However, thermal throttling and other issues
  * can prevent the clock hitting max and thus making the load take significantly
- * longer. Allow up to 200ms as a safety margin for real world worst case situations.
- *
- * However, bugs anywhere from KMD to GuC to PCODE to fan failure in a CI farm can
- * lead to even longer times. E.g. if the GT is clamped to minimum frequency then
- * the load times can be in the seconds range. So the timeout is increased for debug
- * builds to ensure that problems can be correctly analysed. For release builds, the
- * timeout is kept short so that users don't wait forever to find out that there is a
- * problem. In either case, if the load took longer than is reasonable even with some
- * 'sensible' throttling, then flag a warning because something is not right.
+ * longer. Allow up to 3s as a safety margin in normal builds. For
+ * CONFIG_DRM_XE_DEBUG allow up to 10s to account for slower execution, issues
+ * in PCODE, driver, fan, etc.
  *
- * Note that there is a limit on how long an individual usleep_range() can wait for,
- * hence longer waits require wrapping a shorter wait in a loop.
- *
- * Note that the only reason an end user should hit the shorter timeout is in case of
- * extreme thermal throttling. And a system that is that hot during boot is probably
- * dead anyway!
+ * Keep checking the GUC_STATUS every 10ms with a debug message every 100
+ * attempts as a "I'm slow, but alive" message. Regardless, if it takes more
+ * than 200ms, emit a warning.
  */
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-#define GUC_LOAD_RETRY_LIMIT	20
+#define GUC_LOAD_TIMEOUT_SEC	10
 #else
-#define GUC_LOAD_RETRY_LIMIT	3
+#define GUC_LOAD_TIMEOUT_SEC	3
 #endif
-#define GUC_LOAD_TIME_WARN_MS      200
+#define GUC_LOAD_TIME_WARN_MSEC	200
 
 static void print_bootrom_ukernel_err(struct xe_gt *gt, u32 bootrom, u32 ukernel)
 {
@@ -1087,66 +1033,94 @@ static void print_bootrom_ukernel_err(struct xe_gt *gt, u32 bootrom, u32 ukernel
 	}
 }
 
+/*
+ * Check GUC_STATUS looking for known terminal states (either completion or
+ * failure) of either the microkernel status field or the boot ROM status field.
+ *
+ * Returns 1 for successful completion, -1 for failure and 0 for any
+ * intermediate state.
+ */
+static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
+{
+	u32 ukernel, bootrom;
+
+	*status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
+	ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, *status);
+	bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, *status);
+
+	switch (ukernel) {
+	case XE_GUC_LOAD_STATUS_READY:
+		return 1;
+	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
+	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
+	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
+	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
+	case XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH:
+	case XE_GUC_LOAD_STATUS_DPC_ERROR:
+	case XE_GUC_LOAD_STATUS_EXCEPTION:
+	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
+	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
+	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
+	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
+	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
+		return -1;
+	}
+
+	switch (bootrom) {
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
+	if (++*tries >= 100) {
+		struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
+
+		*tries = 0;
+		xe_gt_dbg(gt, "GuC load still in progress, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
+			  xe_guc_pc_get_act_freq(guc_pc),
+			  xe_guc_pc_get_cur_freq_fw(guc_pc),
+			  *status, ukernel, bootrom);
+	}
+
+	return 0;
+}
+
 static void guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	struct xe_mmio *mmio = &gt->mmio;
 	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
-	ktime_t before, after, delta;
-	int load_done;
-	u32 status = 0;
-	int count = 0;
+	u32 before_freq, act_freq, cur_freq;
+	u32 status = 0, tries = 0;
+	ktime_t before;
 	u64 delta_ms;
-	u32 before_freq;
+	int ret;
 
 	before_freq = xe_guc_pc_get_act_freq(guc_pc);
 	before = ktime_get();
-	/*
-	 * Note, can't use any kind of timing information from the call to xe_mmio_wait.
-	 * It could return a thousand intermediate stages at random times. Instead, must
-	 * manually track the total time taken and locally implement the timeout.
-	 */
-	do {
-		u32 last_status = status & (GS_UKERNEL_MASK | GS_BOOTROM_MASK);
-		int ret;
 
-		/*
-		 * Wait for any change (intermediate or terminal) in the status register.
-		 * Note, the return value is a don't care. The only failure code is timeout
-		 * but the timeouts need to be accumulated over all the intermediate partial
-		 * timeouts rather than allowing a huge timeout each time. So basically, need
-		 * to treat a timeout no different to a value change.
-		 */
-		ret = xe_mmio_wait32_not(mmio, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
-					 last_status, 1000 * 1000, &status, false);
-		if (ret < 0)
-			count++;
-		after = ktime_get();
-		delta = ktime_sub(after, before);
-		delta_ms = ktime_to_ms(delta);
-
-		load_done = guc_load_done(status);
-		if (load_done != 0)
-			break;
+	ret = poll_timeout_us(ret = guc_load_done(gt, &status, &tries), ret,
+			      10 * USEC_PER_MSEC,
+			      GUC_LOAD_TIMEOUT_SEC * USEC_PER_SEC, false);
 
-		if (delta_ms >= (GUC_LOAD_RETRY_LIMIT * 1000))
-			break;
-
-		xe_gt_dbg(gt, "load still in progress, timeouts = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
-			  count, xe_guc_pc_get_act_freq(guc_pc),
-			  xe_guc_pc_get_cur_freq_fw(guc_pc), status,
-			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			  REG_FIELD_GET(GS_UKERNEL_MASK, status));
-	} while (1);
+	delta_ms = ktime_to_ms(ktime_sub(ktime_get(), before));
+	act_freq = xe_guc_pc_get_act_freq(guc_pc);
+	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
 
-	if (load_done != 1) {
+	if (ret) {
 		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
 		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
 
-		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), done = %d\n",
-			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
-			  xe_guc_pc_get_cur_freq_fw(guc_pc), load_done);
-		xe_gt_err(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
+		xe_gt_err(gt, "GuC load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
+			  status, delta_ms, act_freq, cur_freq);
+		xe_gt_err(gt, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
 			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
 			  bootrom, ukernel,
 			  REG_FIELD_GET(GS_MIA_MASK, status),
@@ -1154,16 +1128,15 @@ static void guc_wait_ucode(struct xe_guc *guc)
 
 		print_bootrom_ukernel_err(gt, bootrom, ukernel);
 		xe_device_declare_wedged(gt_to_xe(gt));
-	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
-		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
-			   delta_ms, status, count);
-		xe_gt_warn(gt, "excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
-			   xe_guc_pc_get_act_freq(guc_pc), xe_guc_pc_get_cur_freq_fw(guc_pc),
-			   before_freq, xe_gt_throttle_get_limit_reasons(gt));
+	} else if (delta_ms > GUC_LOAD_TIME_WARN_MSEC) {
+		xe_gt_warn(gt, "GuC load: excessive init time: %lldms! [status = 0x%08X]\n",
+			   delta_ms, status);
+		xe_gt_warn(gt, "GuC load: excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
+			   act_freq, cur_freq, before_freq,
+			   xe_gt_throttle_get_limit_reasons(gt));
 	} else {
-		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, timeouts = %d\n",
-			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), xe_guc_pc_get_cur_freq_fw(guc_pc),
-			  before_freq, status, count);
+		xe_gt_dbg(gt, "GuC load: init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X\n",
+			  delta_ms, act_freq, cur_freq, before_freq, status);
 	}
 }
 

-- 
2.50.1

