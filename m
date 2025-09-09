Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DB2CAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 16:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C63B10E7AF;
	Tue,  9 Sep 2025 16:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGGqchWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FAC10E247
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757433775; x=1788969775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C/eQIr1B3V74ToWplUh6XYoFLLUffnqizsP9omPzcsM=;
 b=kGGqchWnSj69rtQCfFp0VOzX3/pm/wxTx5kzAfAcEcH0g3mwFA0gSw8D
 FMwEQ0E3Eymkr+P0z+btmDytN8ozy4kTx2L0tg3ok4qoK7swFixFNSf7x
 LOxeV1GprM2jzA/umFeDwB+x+irOZoSJIDtzWtLMEPDCQ0XIh6K+9jLCO
 w86HxCjrKmfZjiXS6OaueKY44j1QGk0zOrDs6PXyf+Sz6Iko/92OyUWE6
 0T7/W8q2rltMNAJd55i1Bfupg0LbLDNBdF23WYyOJj9gomsDfv69Popvt
 u8Ycn1LyuKQbkJ4Peg9ffSopYD/HWol2PVAM/A44VPM6xQKFrQmK487dm Q==;
X-CSE-ConnectionGUID: 9s3eVpRMQMCKa+QXci82HQ==
X-CSE-MsgGUID: wIdpnOHLQF6exiiv9qa0rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="47296499"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="47296499"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:02:53 -0700
X-CSE-ConnectionGUID: A82r7bBuRsKJjjuP3a/ZQw==
X-CSE-MsgGUID: WnuEAHCdTdK93avZ3OfOhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172993660"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:02:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 2/4] drm/xe/guc_pc: Use poll_timeout_us() for waiting
Date: Tue,  9 Sep 2025 09:02:36 -0700
Message-ID: <20250909-xe-iopoll-v2-2-4c7ae9726e8e@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909-xe-iopoll-v2-0-4c7ae9726e8e@intel.com>
References: <20250909-xe-iopoll-v2-0-4c7ae9726e8e@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 36 ++++++------------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 88557e86d6371..31b291bc77543 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -7,6 +7,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/jiffies.h>
 #include <linux/ktime.h>
 #include <linux/wait_bit.h>
@@ -128,23 +129,10 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
 			     enum slpc_global_state state,
 			     int timeout_ms)
 {
-	int timeout_us = 1000 * timeout_ms;
-	int slept, wait = 10;
-
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
+	return poll_timeout_us({}, slpc_shared_data_read(pc, header.global_state) == state,
+			       20, timeout_ms * USEC_PER_MSEC, false);
 }
 
 static int wait_for_flush_complete(struct xe_guc_pc *pc)
@@ -161,22 +149,10 @@ static int wait_for_flush_complete(struct xe_guc_pc *pc)
 
 static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
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
-
-	return -ETIMEDOUT;
+	return poll_timeout_us({}, xe_guc_pc_get_act_freq(pc) <= freq,
+			       20, SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC, false);
 }
+
 static int pc_action_reset(struct xe_guc_pc *pc)
 {
 	struct xe_guc_ct *ct = pc_to_ct(pc);

-- 
2.50.1

