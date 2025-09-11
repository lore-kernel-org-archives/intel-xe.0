Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8E2CAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 17:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4C510E282;
	Thu, 11 Sep 2025 17:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcVojQ8U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B6210E282
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757611539; x=1789147539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=edHlUFKXaJg2Ja4i3YfbocQKCYme1pw0s4mUHYAwdRA=;
 b=CcVojQ8UJAp7kEWrpkNTniCGJoQsQc3loTC+T5s99rc938DrpiiKUtEr
 FHrgOZ67lUuKS6w56xKtDpOLDWiUQiteX9sF3WfxjYtWXiI2E9b0Z8Tkw
 OPSQ7cNYJzxQrWAwFeOygUZ6rEPXP3iBLsaHzymhupuMlWekfgLj99Ant
 n7zqoXlyGGaB2ptr9+L752gOLlACeUdUX75BUEqNhDhm4RF8B7hTgiRMn
 wEPKMUpIDoH3ThuvrxNvdXm+GZbjrlzVytyFYx1s+1RmO2T5aYOiT0AVt
 l6HgvVjYXebbElvoWi0TjvgMbyBNoragJhGeUkwjWHTHVR+6oXkwdxoSd Q==;
X-CSE-ConnectionGUID: iiLYP6tuRt+6CKvaZKTFXQ==
X-CSE-MsgGUID: hv6QxSKxQIemrvrgyURJSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59810769"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="59810769"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:25:38 -0700
X-CSE-ConnectionGUID: vfAKRTqOTQCXyY5KyKySMA==
X-CSE-MsgGUID: DQqkMgHBShiuN2nLFXXgHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178956840"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:25:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 2/5] drm/xe/guc_pc: Use poll_timeout_us() for waiting
Date: Thu, 11 Sep 2025 10:25:20 -0700
Message-ID: <20250911-xe-iopoll-v3-2-6a95f1cc3b0b@intel.com>
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

Convert wait_for_pc_state() and wait_for_act_freq_limit() to
poll_timeout_us(). This brings 2 changes in behavior: Drop the
exponential wait and fix a potential much longer sleep.

usleep_range() will wait anywhere between `wait` and `wait << 1`, so
it's not correct to assume `slept += wait`.  This code is not really
accurate. Pairing this with the exponential wait increase, it could be
waiting much longer than intended.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Simplify functions by removing helper variables and changing break
    condition on poll_timeout_us() call (Maarten)
v3: dial a little bit back from v2: better to have some helper vars
    and avoid the weird syntax (Jani)
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 42 ++++++++++++------------------------------
 1 file changed, 12 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 68a5bf8e39462..ecfe37836692f 100644
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
+static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 max_freq)
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
+			       freq <= max_freq,
+			       20, SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC, false);
 }
+
 static int pc_action_reset(struct xe_guc_pc *pc)
 {
 	struct xe_guc_ct *ct = pc_to_ct(pc);

-- 
2.50.1

