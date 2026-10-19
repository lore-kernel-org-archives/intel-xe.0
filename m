Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC8F607D367
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Khct3kPn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B3410EE2F;
	Mon, 19 Oct 2026 15:03:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204C910EE2F;
 Mon, 19 Oct 2026 15:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792422178; x=1823958178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OietMGVEWDJtVT6suCuel6ZZ36hS1rbhPRrMEkfwfFk=;
 b=Khct3kPnSdJpbAWvuLhaXZCT8SuuoGTGI0e3PhphfYaKADfVggJDNis8
 fcCW8hNVysV2N3pdVqaoAgm3w7aXF5jdE//APHRdOyb1x4f9eATSJa3h/
 f8adadiPF4JfcuC8vF5mKAIbhfAj59z0eWCUw+m/RZy4phi5ThEuXApFV
 JeOyNAVFXN3qoD7knHLe/AI+dODaMqYx0pTWvTe8AzzpPPMKCx0LWVf9P
 Pe90+iPark2EhkYDY0DgnYislTn9wSc6ML3Ftd0EdXlOyNq0CA9EV/I1I
 bdwqo/WuRhzVymAn7NpvOmPLlEChecz9httE0Dy53HvR45OZq7rkfUqJE A==;
X-CSE-ConnectionGUID: mbCj1JoUQIClBoRnzJK0LQ==
X-CSE-MsgGUID: Kct7BrQeTranPBYi2XwWOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="991005"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="991005"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:02:58 -0700
X-CSE-ConnectionGUID: /0vqgkOVQUquMOgi95/+kw==
X-CSE-MsgGUID: o9WlGo7kTdCZwpjHoiV5Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2633865"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:02:55 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v2 2/3] drm/i915/dp: don't touch the AUX engine while it's
 still busy
Date: Mon, 19 Oct 2026 17:53:00 +0300
Message-ID: <20261019150226.734375-3-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019150226.734375-1-luciano.coelho@intel.com>
References: <20261019150226.734375-1-luciano.coelho@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When an AUX transaction doesn't finish within the driver's 10ms
timeout, intel_dp_aux_xfer() writes PORT_AUX_CTL with Send Busy still
set and re-triggers the transaction.  The Bspec explicitly forbids
changing the register or writing Send Busy again while it is asserted.

In the bugs mentioned here, we can observe that on NVL_S with an LTTPR
dock the engine can remain busy for up to ~20ms.  Re-triggering it
causes repeated 10ms errors and can lead to "not done" followed by a
"not started" WARN.

Give each attempt up to 100ms to finish.  If the engine remains busy,
return -EBUSY without touching the control register and let the DRM
helpers retry.  Demote the 10ms error to a debug message, since it can
occur while a transaction is still in progress, and turn the
pre-transaction "not started" WARN into a plain error, since the
backtrace doesn't add anything.

The 100ms applies per attempt, not per transfer, so a misbehaving
engine can keep intel_dp_aux_xfer() busy for up to 5 x 100ms per clock
divider instead of 5 x 10ms.

Bspec: 69695
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9090
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9092
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 71 ++++++++++++++-------
 1 file changed, 49 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 394326d17e0d..a6871a5492d7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -54,35 +54,52 @@ static void intel_dp_aux_unpack(u32 src, u8 *dst, int dst_bytes)
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
-#define C (((status = intel_de_read(display, ch_ctl)) & DP_AUX_CH_CTL_SEND_BUSY) == 0)
-		done = wait_event_timeout(display->gmbus.wait_queue, C,
+#define C (((*status = intel_de_read(display, ch_ctl)) & DP_AUX_CH_CTL_SEND_BUSY) == 0)
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
+	 * The HW timeout is 4ms, but a downstream LTTPR recovering from a
+	 * power state transition can keep the engine busy much longer, so
+	 * give it up to 100ms before giving up.
+	 */
+	const unsigned int timeout_ms = 10;
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
@@ -333,9 +350,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
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
 
@@ -369,6 +386,16 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 
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

