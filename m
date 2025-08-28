Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E154CA0FF6
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 22:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8B410EAEF;
	Thu, 28 Aug 2025 22:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnI1G7uf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C5810EAEA
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 22:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756418719; x=1787954719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D0rXYm5t1vE9xwbMrrKUa2CvlkMu8lyu48OZUFbWewA=;
 b=dnI1G7ufUOOMsg7VTkypeiXKwv9cnZFGiMAMl6OHLTil2Qbz2GqRecy/
 ESoy6Sk0xhtDsAsRv2zdFyUfw7oVhUDtZsEQQpiE2bewzQ3wElsn9/yZ/
 ONZVgwCVYV+zQFWNS00QzsylzXVIYioEx3sAUAH5LHs26hsOY1oOeyzLM
 bk+hje1ZI8dDygxSVRsx8pTQNTGmtuqKnwWmuq2oTsz5PiCsIy3XReDZf
 neDO4wgtGUspzcE0P4g9aZ6KRh3p1SMEpNyHocm3eSZIBZ4jc7bRFZ24y
 pTi1cBQ8VTupjqAqUgHTbV5flLFuzX6AfeWG+rN0UIXioUSk9BmgEe1Yw g==;
X-CSE-ConnectionGUID: xMaXT6ERR52C8F7XQsOvMQ==
X-CSE-MsgGUID: 1hkfbUrUT+ygwoxKLObcxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84106382"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84106382"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:05:19 -0700
X-CSE-ConnectionGUID: xEyECIZgTw+wDsy0gmX+fQ==
X-CSE-MsgGUID: SlJEeb8cRJSgSstA/2anSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170126768"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:05:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/4] drm/xe/guc: Refactor GuC load to use poll_timeout_us()
Date: Thu, 28 Aug 2025 15:04:58 -0700
Message-ID: <20250828-xe-iopoll-v1-3-9832ccd1c8b1@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
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
 drivers/gpu/drm/xe/xe_guc.c | 269 ++++++++++++++++++++------------------------
 1 file changed, 125 insertions(+), 144 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 37d06c51180cb..130492405a982 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -5,6 +5,7 @@
 
 #include "xe_guc.h"
 
+#include <linux/iopoll.h>
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
@@ -981,21 +982,103 @@ static int guc_xfer_rsa(struct xe_guc *guc)
 	return 0;
 }
 
+static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
+{
+	u32 freq;
+	int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
+
+	return ret ? ret : freq;
+}
+
 /*
- * Check a previously read GuC status register (GUC_STATUS) looking for
- * known terminal states (either completion or failure) of either the
- * microkernel status field or the boot ROM status field. Returns +1 for
- * successful completion, -1 for failure and 0 for any intermediate state.
+ * Wait for the GuC to start up.
+ *
+ * Measurements indicate this should take no more than 20ms (assuming the GT
+ * clock is at maximum frequency). However, thermal throttling and other issues
+ * can prevent the clock hitting max and thus making the load take significantly
+ * longer. Allow up to 3s as a safety marging in norma builds. For
+ * CONFIG_DRM_XE_DEBUG allow up to 10s to account for slower execution, issues
+ * in PCODE, driver, fan, etc.
+ *
+ * Keep checking the GUC_STATUS every 10ms with a debug message every 100
+ * attempts as a "I'm slow, but alive" message.
+ *
+ * but emit a warning if greater than
+ * 200ms.
+ *
+ * However, bugs anywhere from KMD to GuC to PCODE to fan failure in a CI farm
+ * can lead to even longer times. E.g. if the GT is clamped to minimum frequency
+ * then the load times can be in the seconds range. So the timeout is increased
+ * for debug builds to ensure that problems can be correctly analysed. For
+ * release builds, the timeout is kept short so that users don't wait forever to
+ * find out that there is a problem. In either case, if the load took longer
+ * than is reasonable even with some 'sensible' throttling, then flag a warning
+ * because something is not right.
  */
-static int guc_load_done(u32 status)
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define GUC_LOAD_TIMEOUT_SEC	10
+#else
+#define GUC_LOAD_TIMEOUT_SEC	3
+#endif
+#define GUC_LOAD_TIME_WARN_MSEC	200
+
+static void print_bootrom_ukernel_err(struct xe_gt *gt, u32 bootrom, u32 ukernel)
 {
-	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, status);
-	u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, status);
+	switch (bootrom) {
+	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
+		xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
+			  xe_mmio_read32(&gt->mmio, GUC_HEADER_INFO));
+		break;
+	case XE_BOOTROM_STATUS_RSA_FAILED:
+		xe_gt_err(gt, "firmware signature verification failed\n");
+		break;
+	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
+		xe_gt_err(gt, "firmware production part check failure\n");
+		break;
+	}
+
+	switch (ukernel) {
+	case XE_GUC_LOAD_STATUS_HWCONFIG_START:
+		xe_gt_err(gt, "still extracting hwconfig table.\n");
+		break;
+	case XE_GUC_LOAD_STATUS_EXCEPTION:
+		xe_gt_err(gt, "firmware exception. EIP: %#x\n",
+			  xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(13)));
+		break;
+	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
+		xe_gt_err(gt, "illegal init/ADS data\n");
+		break;
+	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
+		xe_gt_err(gt, "illegal register in save/restore workaround list\n");
+		break;
+	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
+		xe_gt_err(gt, "illegal workaround KLV data\n");
+		break;
+	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
+		xe_gt_err(gt, "illegal feature flag specified\n");
+		break;
+	}
+}
 
-	switch (uk_val) {
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
 	case XE_GUC_LOAD_STATUS_READY:
 		return 1;
-
 	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
 	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
 	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
@@ -1011,7 +1094,7 @@ static int guc_load_done(u32 status)
 		return -1;
 	}
 
-	switch (br_val) {
+	switch (bootrom) {
 	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
 	case XE_BOOTROM_STATUS_RSA_FAILED:
 	case XE_BOOTROM_STATUS_PAVPC_FAILED:
@@ -1025,165 +1108,63 @@ static int guc_load_done(u32 status)
 		return -1;
 	}
 
-	return 0;
-}
+	if (++*tries >= 100) {
+		struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
 
-static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
-{
-	u32 freq;
-	int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
+		*tries = 0;
+		xe_gt_dbg(gt, "GuC load still in progress, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
+			  xe_guc_pc_get_act_freq(guc_pc),
+			  guc_pc_get_cur_freq(guc_pc),
+			  *status, ukernel, bootrom);
+	}
 
-	return ret ? ret : freq;
+	return 0;
 }
 
-/*
- * Wait for the GuC to start up.
- *
- * Measurements indicate this should take no more than 20ms (assuming the GT
- * clock is at maximum frequency). However, thermal throttling and other issues
- * can prevent the clock hitting max and thus making the load take significantly
- * longer. Allow up to 200ms as a safety margin for real world worst case situations.
- *
- * However, bugs anywhere from KMD to GuC to PCODE to fan failure in a CI farm can
- * lead to even longer times. E.g. if the GT is clamped to minimum frequency then
- * the load times can be in the seconds range. So the timeout is increased for debug
- * builds to ensure that problems can be correctly analysed. For release builds, the
- * timeout is kept short so that users don't wait forever to find out that there is a
- * problem. In either case, if the load took longer than is reasonable even with some
- * 'sensible' throttling, then flag a warning because something is not right.
- *
- * Note that there is a limit on how long an individual usleep_range() can wait for,
- * hence longer waits require wrapping a shorter wait in a loop.
- *
- * Note that the only reason an end user should hit the shorter timeout is in case of
- * extreme thermal throttling. And a system that is that hot during boot is probably
- * dead anyway!
- */
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-#define GUC_LOAD_RETRY_LIMIT	20
-#else
-#define GUC_LOAD_RETRY_LIMIT	3
-#endif
-#define GUC_LOAD_TIME_WARN_MS      200
-
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
-			  guc_pc_get_cur_freq(guc_pc), status,
-			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			  REG_FIELD_GET(GS_UKERNEL_MASK, status));
-	} while (1);
+	delta_ms = ktime_to_ms(ktime_sub(ktime_get(), before));
+	act_freq = xe_guc_pc_get_act_freq(guc_pc);
+	cur_freq = guc_pc_get_cur_freq(guc_pc);
 
-	if (load_done != 1) {
+	if (ret) {
 		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
 		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
 
-		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), done = %d\n",
-			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
-			  guc_pc_get_cur_freq(guc_pc), load_done);
-		xe_gt_err(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
+		xe_gt_err(gt, "GuC load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
+			  status, delta_ms, act_freq, cur_freq);
+		xe_gt_err(gt, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
 			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
 			  bootrom, ukernel,
 			  REG_FIELD_GET(GS_MIA_MASK, status),
 			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
 
-		switch (bootrom) {
-		case XE_BOOTROM_STATUS_NO_KEY_FOUND:
-			xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
-				  xe_mmio_read32(mmio, GUC_HEADER_INFO));
-			break;
-
-		case XE_BOOTROM_STATUS_RSA_FAILED:
-			xe_gt_err(gt, "firmware signature verification failed\n");
-			break;
-
-		case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
-			xe_gt_err(gt, "firmware production part check failure\n");
-			break;
-		}
-
-		switch (ukernel) {
-		case XE_GUC_LOAD_STATUS_HWCONFIG_START:
-			xe_gt_err(gt, "still extracting hwconfig table.\n");
-			break;
-
-		case XE_GUC_LOAD_STATUS_EXCEPTION:
-			xe_gt_err(gt, "firmware exception. EIP: %#x\n",
-				  xe_mmio_read32(mmio, SOFT_SCRATCH(13)));
-			break;
-
-		case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
-			xe_gt_err(gt, "illegal init/ADS data\n");
-			break;
-
-		case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
-			xe_gt_err(gt, "illegal register in save/restore workaround list\n");
-			break;
-
-		case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
-			xe_gt_err(gt, "illegal workaround KLV data\n");
-			break;
-
-		case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
-			xe_gt_err(gt, "illegal feature flag specified\n");
-			break;
-		}
-
+		print_bootrom_ukernel_err(gt, bootrom, ukernel);
 		xe_device_declare_wedged(gt_to_xe(gt));
-	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
-		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
-			   delta_ms, status, count);
-		xe_gt_warn(gt, "excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
-			   xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
-			   before_freq, xe_gt_throttle_get_limit_reasons(gt));
+	} else if (delta_ms > GUC_LOAD_TIME_WARN_MSEC) {
+		xe_gt_warn(gt, "GuC load: excessive init time: %lldms! [status = 0x%08X]\n",
+			   delta_ms, status);
+		xe_gt_warn(gt, "GuC load: excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
+			   act_freq, cur_freq, before_freq,
+			   xe_gt_throttle_get_limit_reasons(gt));
 	} else {
-		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, timeouts = %d\n",
-			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
-			  before_freq, status, count);
+		xe_gt_dbg(gt, "GuC load: init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X\n",
+			  delta_ms, act_freq, cur_freq, before_freq, status);
 	}
 }
 

-- 
2.50.1

