Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73DA607D371
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q+hCUNUl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FACF10EE3D;
	Mon, 19 Oct 2026 15:03:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4F010EE09;
 Mon, 19 Oct 2026 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792422181; x=1823958181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vAB7yjViqyXDKNwkSlfaIHIHMUM6ozbdWe+AJtM43yo=;
 b=Q+hCUNUl9vfWGxM2vOjC/YP7vt6U7a2u6L+7bwTsHBGU0G/sMUCwnqVA
 VeU6MBfUcEReGCgewbviMk4PHIU/mfbgEOUbemd5h6tmQb5xI3/QjbonP
 M+uFwt1IlaWnTrSSTy4H8el/euimdqwJdqC7qbEOIhyiwR71yCIkYT0Hr
 ESmfiwI7ddOc8Xm34Q+Dk0NClYJFqGZGVuVIUyXqO1CVVtlL55E8dmqOr
 HLciCKTtoNLHRDsRp9Ya8OSG7bL0+Wk+sCEKQfxOITjhZZv4M9wun/JQW
 bRhpUP32BwSqJ9Mz2ZMl2nhJf5KnGlzBDa7VmyFOPPZ39YE8egRUW/lAN Q==;
X-CSE-ConnectionGUID: cl0gDX9BSXSarN2Bh7HLJQ==
X-CSE-MsgGUID: qT5/bic6RVSdRgJnmAbizw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="991012"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="991012"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:03:00 -0700
X-CSE-ConnectionGUID: L20DgNjEQK+LUC6aZzIv1A==
X-CSE-MsgGUID: tJgBfp5vQXaYGB58dOXBXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2633868"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:02:57 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v2 3/3] drm/i915/dp: only complain about a busy AUX engine
 when it's unexpected
Date: Mon, 19 Oct 2026 17:53:01 +0300
Message-ID: <20261019150226.734375-4-luciano.coelho@intel.com>
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

When intel_dp_aux_xfer() gives up on a transaction because the AUX
engine is still busy, the DRM helpers retry almost immediately.  If
the engine still hasn't recovered by then, the pre-transaction busy
check reports "not started" as an error, even though this is the
expected outcome of our own earlier decision to leave the engine
alone.

Remember when we left the engine busy and only log a debug message in
that case.  Keep the error for the unexpected cases, namely when
someone else is using the channel or the engine is hung without us
having given up on it first.

Once we leave the engine busy, later transfers fail the busy check
before a new transaction is started, so the 100ms timeout error is not
reported again even if the engine never recovers.  To still catch a
permanently hung engine, only treat the busy state as expected for up
to 1s after we left it busy, which covers the longest LTTPR stall
we've seen, and report the "not started" error again after that.

For that to work, aux_busy_last_status has to be reset as well, since
a hung engine tends to come back with the same CH_CTL value and would
otherwise be deduplicated away.  Clear it whenever a transfer finds
the engine idle.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  8 +++++
 drivers/gpu/drm/i915/display/intel_dp_aux.c   | 35 +++++++++++++++----
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0e3083e852d5..ad831c3cd770 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1891,6 +1891,14 @@ struct intel_dp {
 	struct drm_dp_desc desc;
 	struct drm_dp_aux aux;
 	u32 aux_busy_last_status;
+
+	struct {
+		/* TODO: move the rest of the aux specific fields here */
+		/* we left the AUX engine busy and are waiting for it to recover */
+		bool left_busy;
+		u64 left_busy_since;
+	} dp_aux;
+
 	u8 train_set[4];
 
 	struct intel_pps pps;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index a6871a5492d7..66d2b952da5c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -348,18 +348,39 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 
 	if (try == 3) {
 		const u32 status = intel_de_read(display, ch_ctl);
-
-		if (status != intel_dp->aux_busy_last_status) {
-			drm_err(display->drm,
-				"%s: not started (status 0x%08x)\n",
-				intel_dp->aux.name, status);
-			intel_dp->aux_busy_last_status = status;
+		/*
+		 * If we recently left the engine busy ourselves, treat it as
+		 * still recovering for up to a second, the longest LTTPR
+		 * stall we've seen.  Otherwise someone else is using the
+		 * channel, or it's hung.
+		 */
+		const unsigned int left_busy_timeout_ms = 1000;
+
+		if (intel_dp->dp_aux.left_busy &&
+		    time_is_after_jiffies64(intel_dp->dp_aux.left_busy_since +
+					    msecs_to_jiffies(left_busy_timeout_ms))) {
+			drm_dbg_kms(display->drm,
+				    "%s: not started, still waiting for the AUX engine to recover (status 0x%08x)\n",
+				    intel_dp->aux.name, status);
+		} else {
+			intel_dp->dp_aux.left_busy = false;
+
+			if (status != intel_dp->aux_busy_last_status) {
+				drm_err(display->drm,
+					"%s: not started (status 0x%08x)\n",
+					intel_dp->aux.name, status);
+				intel_dp->aux_busy_last_status = status;
+			}
 		}
 
 		ret = -EBUSY;
 		goto out;
 	}
 
+	/* the engine recovered, report a new busy period again */
+	intel_dp->dp_aux.left_busy = false;
+	intel_dp->aux_busy_last_status = 0;
+
 	/* Only 5 data registers! */
 	if (drm_WARN_ON(display->drm, send_bytes > 20 || recv_size > 20)) {
 		ret = -E2BIG;
@@ -392,6 +413,8 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 			 * alone, the caller will retry the transaction later.
 			 */
 			if (status & DP_AUX_CH_CTL_SEND_BUSY) {
+				intel_dp->dp_aux.left_busy = true;
+				intel_dp->dp_aux.left_busy_since = get_jiffies_64();
 				ret = -EBUSY;
 				goto out;
 			}
-- 
2.53.0

