Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64FBCAC5AA
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 19:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F59610E50C;
	Mon, 22 Sep 2025 19:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYLbXi0H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201E910E50B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 19:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758571128; x=1790107128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hOZHV7OmwPnY8vqzyqp14X/SJNNrZhri3/M4OlTwtZ8=;
 b=AYLbXi0HMw0Bv24hmMif6hWcZLuvXhb2h27gihhUoqmSZa6SfEk9Q1lo
 fgJ1imtq9jZ7uwJQ7Zc11cdjm8n8KfGtEMletorO0OzncNJm0tFNrVyLG
 5UyNv0RTFzErJPM8z77RHTEk2PiUJFgsB1Q5kEmIaXawCRZ1TKOIKCY9s
 MpZrK/kN6Hn0KPQaJc/koedbJXsF2HO3BUI4cYq3aBbIX1ry0d5PqKAh7
 qDJyOnU5J6EDjjpa/Ragh/icwVdf2SuNpMhOotRrVVTkp0bVznWCXi9mJ
 Yo9EP6SHAUGYU+8ayMVSSLt9+ChK/7Rd8n0LbQIh8sHbt102nbYyHxP2V w==;
X-CSE-ConnectionGUID: ANCZ2gQFSrmWVXxI2Ml+Xw==
X-CSE-MsgGUID: mth9Z6mYQweTlZR4HVQxLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72267350"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="72267350"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:58:47 -0700
X-CSE-ConnectionGUID: JM8jPhJoTLqPeOgpL2gJTw==
X-CSE-MsgGUID: Y6IlMCNkSuu3J0+q2m315Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="207306248"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:58:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 2/5] drm/xe/guc_pc: Use poll_timeout_us() for waiting
Date: Mon, 22 Sep 2025 12:58:30 -0700
Message-ID: <20250922-xe-iopoll-v4-2-06438311a63f@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
References: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
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

Convert wait_for_pc_state() and wait_for_act_freq_limit() to
poll_timeout_us(). This brings 2 changes in behavior: Drop the
exponential wait and fix a potential much longer sleep.

usleep_range() will wait anywhere between `wait` and `wait << 1`, so
it's not correct to assume `slept += wait`.  This code is not really
accurate. Pairing this with the exponential wait increase, it could be
waiting much longer than intended.

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Simplify functions by removing helper variables and changing break
    condition on poll_timeout_us() call (Maarten)
v3: dial a little bit back from v2: better to have some helper vars
    and avoid the weird syntax (Jani)
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 44 +++++++++++++-----------------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 53fdf59524c41..3c0feb50a1e2f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -7,6 +7,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/jiffies.h>
 #include <linux/ktime.h>
 #include <linux/wait_bit.h>
@@ -130,26 +131,16 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
 	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
 
 static int wait_for_pc_state(struct xe_guc_pc *pc,
-			     enum slpc_global_state state,
+			     enum slpc_global_state target_state,
 			     int timeout_ms)
 {
-	int timeout_us = 1000 * timeout_ms;
-	int slept, wait = 10;
+	enum slpc_global_state state;
 
 	xe_device_assert_mem_access(pc_to_xe(pc));
 
-	for (slept = 0; slept < timeout_us;) {
-		if (slpc_shared_data_read(pc, header.global_state) == state)
-			return 0;
-
-		usleep_range(wait, wait << 1);
-		slept += wait;
-		wait <<= 1;
-		if (slept + wait > timeout_us)
-			wait = timeout_us - slept;
-	}
-
-	return -ETIMEDOUT;
+	return poll_timeout_us(state = slpc_shared_data_read(pc, header.global_state),
+			       state == target_state,
+			       20, timeout_ms * USEC_PER_MSEC, false);
 }
 
 static int wait_for_flush_complete(struct xe_guc_pc *pc)
@@ -164,24 +155,15 @@ static int wait_for_flush_complete(struct xe_guc_pc *pc)
 	return 0;
 }
 
-static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
+static int wait_for_act_freq_max_limit(struct xe_guc_pc *pc, u32 max_limit)
 {
-	int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
-	int slept, wait = 10;
-
-	for (slept = 0; slept < timeout_us;) {
-		if (xe_guc_pc_get_act_freq(pc) <= freq)
-			return 0;
-
-		usleep_range(wait, wait << 1);
-		slept += wait;
-		wait <<= 1;
-		if (slept + wait > timeout_us)
-			wait = timeout_us - slept;
-	}
+	u32 freq;
 
-	return -ETIMEDOUT;
+	return poll_timeout_us(freq = xe_guc_pc_get_act_freq(pc),
+			       freq <= max_limit,
+			       20, SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC, false);
 }
+
 static int pc_action_reset(struct xe_guc_pc *pc)
 {
 	struct xe_guc_ct *ct = pc_to_ct(pc);
@@ -983,7 +965,7 @@ void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc)
 	 * Wait for actual freq to go below the flush cap: even if the previous
 	 * max was below cap, the current one might still be above it
 	 */
-	ret = wait_for_act_freq_limit(pc, BMG_MERT_FLUSH_FREQ_CAP);
+	ret = wait_for_act_freq_max_limit(pc, BMG_MERT_FLUSH_FREQ_CAP);
 	if (ret)
 		xe_gt_err_once(gt, "Actual freq did not reduce to %u, %pe\n",
 			       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));

-- 
2.50.1

