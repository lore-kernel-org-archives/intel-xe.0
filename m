Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9652CA5FF5
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 12:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCEC10EC9F;
	Mon,  5 Oct 2026 12:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZj9kkkg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C9710EC99;
 Mon,  5 Oct 2026 12:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791202999; x=1822738999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PrQFw1WhTTziZJDvLMNr2uokEESw/JzlhZMw6vTUTvE=;
 b=mZj9kkkgF40N+5rvLqmVhRuzcFwg7o6oVMdV97uWohczxUzElToJO08P
 SYHjiZocEVSU2bZnag5b3IPzKoaQ9c1bkffTts6YPLrFFjogb3TUu8Zut
 GiF14Z0nmuidzwWjKY44cazYxlKRNuugy7aFLTCGVbvP2c+OxUwbSjAnw
 tBLV7lrG2W9WyCzX2yasMUVGPuPvKQPhnvZGOsNKtC4zggUp6AFJBzYdQ
 2z+9X388+eEbUXRTPfUvYQUvoPzvXqt0w9H9Q/2yd5IDU4cD9Q6Sc4GBM
 /sfI9V7QnczvHoB+V5X2aSyQ0MmCA41Z7woT9yijOZ6zyMK8igWGoPNIr Q==;
X-CSE-ConnectionGUID: XU+GN3scT7KARTDCSzt+Mw==
X-CSE-MsgGUID: 9xiuCxvsStqy6PbJdpqKuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109361044"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="109361044"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 05:23:19 -0700
X-CSE-ConnectionGUID: NmJ8+RveSG6NxWGd8ZffLA==
X-CSE-MsgGUID: ti0oxQ+pRZKJ8GDWtjNkGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="304763346"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.184])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 05:23:18 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/dp: don't touch the AUX engine while it's still
 busy
Date: Mon,  5 Oct 2026 15:22:08 +0300
Message-ID: <20261005122302.110968-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005122302.110968-1-luciano.coelho@intel.com>
References: <20261005122302.110968-1-luciano.coelho@intel.com>
MIME-Version: 1.0
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

When an AUX transaction doesn't finish within our 10ms software
timeout, intel_dp_aux_xfer() writes PORT_AUX_CTL with Send Busy still
set and re-triggers the transaction.  The Bspecs explicitly forbid
changing the register or writing Send Busy again while it is asserted.

On NVL_S with an LTTPR dock the engine can remain busy for 10-20ms.
Re-triggering it causes repeated 10ms errors and can lead to "not done"
followed by a "not started" WARN.

Give each transaction up to 100ms to finish.  If the engine remains
busy, return -EBUSY without touching the control register and let the
DRM helpers retry.  Demote the 10ms error to a debug message, since it
can occur while a transaction is still in progress, and turn the
pre-transaction "not started" WARN into a plain error, since the
backtrace doesn't add anything.

Bspec: 69695
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9090
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9092
Assisted-by: LLM
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 78 +++++++++++++++------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 3cb07b0a901c..2e8261cd641a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -55,35 +55,59 @@ static void intel_dp_aux_unpack(u32 src, u8 *dst, int dst_bytes)
 		dst[i] = src >> ((3 - i) * 8);
 }
 
-static u32
-intel_dp_aux_wait_done(struct intel_dp *intel_dp)
+static bool
+__intel_dp_aux_wait_done(struct intel_dp *intel_dp, unsigned int timeout_ms,
+			 u32 *status)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	intel_reg_t ch_ctl = intel_dp->aux_ch_ctl_reg(intel_dp);
-	const unsigned int timeout_ms = 10;
-	bool done = true;
-	u32 status;
-	int ret;
 
 	if (intel_parent_irq_enabled(display)) {
-#define C (((status = intel_de_read_notrace(display, ch_ctl)) & DP_AUX_CH_CTL_SEND_BUSY) == 0)
-		done = wait_event_timeout(display->gmbus.wait_queue, C,
+#define C (((*status = intel_de_read_notrace(display, ch_ctl)) & DP_AUX_CH_CTL_SEND_BUSY) == 0)
+		return wait_event_timeout(display->gmbus.wait_queue, C,
 					  msecs_to_jiffies_timeout(timeout_ms));
-
 #undef C
 	} else {
-		ret = intel_de_wait_ms(display, ch_ctl,
-				       DP_AUX_CH_CTL_SEND_BUSY, 0,
-				       timeout_ms, &status);
-
-		if (ret == -ETIMEDOUT)
-			done = false;
+		return intel_de_wait_ms(display, ch_ctl,
+					DP_AUX_CH_CTL_SEND_BUSY, 0,
+					timeout_ms, status) == 0;
 	}
+}
 
-	if (!done)
-		drm_err(display->drm,
-			"%s: did not complete or timeout within %ums (status 0x%08x)\n",
-			intel_dp->aux.name, timeout_ms, status);
+static u32
+intel_dp_aux_wait_done(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	/*
+	 * The longest HW timeout is 4ms, so a transaction is expected to
+	 * complete, with or without an error, well within this.
+	 */
+	const unsigned int timeout_ms = 10;
+	/*
+	 * Occasionally the AUX engine stays busy well past the HW timeout
+	 * without flagging a completion or a timeout.  This has been
+	 * observed while an LTTPR between the source and the sink is going
+	 * through a power state transition and takes a long time to
+	 * recover.  The engine does recover by itself though, typically
+	 * within a few 10s of ms.
+	 */
+	const unsigned int stuck_timeout_ms = 100;
+	u32 status;
+
+	if (__intel_dp_aux_wait_done(intel_dp, timeout_ms, &status))
+		return status;
+
+	drm_dbg_kms(display->drm,
+		    "%s: did not complete or timeout within %ums (status 0x%08x), waiting for the AUX engine to recover\n",
+		    intel_dp->aux.name, timeout_ms, status);
+
+	if (__intel_dp_aux_wait_done(intel_dp, stuck_timeout_ms - timeout_ms,
+				     &status))
+		return status;
+
+	drm_err(display->drm,
+		"%s: did not complete or timeout within %ums (status 0x%08x)\n",
+		intel_dp->aux.name, stuck_timeout_ms, status);
 
 	return status;
 }
@@ -336,9 +360,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 		const u32 status = intel_de_read(display, ch_ctl);
 
 		if (status != intel_dp->aux_busy_last_status) {
-			drm_WARN(display->drm, 1,
-				 "%s: not started (status 0x%08x)\n",
-				 intel_dp->aux.name, status);
+			drm_err(display->drm,
+				"%s: not started (status 0x%08x)\n",
+				intel_dp->aux.name, status);
 			intel_dp->aux_busy_last_status = status;
 		}
 
@@ -372,6 +396,16 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 
 			status = intel_dp_aux_wait_done(intel_dp);
 
+			/*
+			 * The bspecs specify that we cannot change any fields
+			 * while Send Busy is asserted.  Leave the stuck engine
+			 * alone, the caller will retry the transaction later.
+			 */
+			if (status & DP_AUX_CH_CTL_SEND_BUSY) {
+				ret = -EBUSY;
+				goto out;
+			}
+
 			/* Clear done status and any errors */
 			intel_de_write(display, ch_ctl,
 				       status | DP_AUX_CH_CTL_DONE |
-- 
2.53.0

