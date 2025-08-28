Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88853CA0FF6
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 22:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6C310EAEA;
	Thu, 28 Aug 2025 22:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yq5qrerD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7384110E00A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 22:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756418719; x=1787954719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oTewiC86leXvdfH6l1bIq7LeUWKDAoaOHHVLgF1Z5uo=;
 b=Yq5qrerDEznzihBUuWj7Pz21/+YHN5N1wWyztl1w9Fr33u/mLyqSothh
 epwfHwm4DoPe7kR2JZMSLe/ZJ3myBzr1WrMBhb8dVH7TEQ2Y8Ghw8VKtq
 kF9T+QSEym+I+PjuBNJe2+NWRnpryuxY9FNjn4XQfBwfeUJPczS7KtZC4
 HYbFcmuqiSUhHMwsBeVGb/wlu5RipE2EwCU4zkpHD0YuEcFtRVUnLdy+Z
 wEubqGKSJHgfRW3ln1qMuxB2TzW5K1pBdwopEO9sR0AhoLwywTVP7wrME
 zGLFrsBCTSedL4C8bbb7GNYHJhvEzkVk5iuyER34JmOPiUJ5+zlZojCR7 w==;
X-CSE-ConnectionGUID: ELYIWf65Rq6FYv6pE4E/GQ==
X-CSE-MsgGUID: FcjbLlm8QZOLj0JaOPbcwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84106381"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84106381"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:05:19 -0700
X-CSE-ConnectionGUID: ACWKgIepQB+II5I0HGaAyw==
X-CSE-MsgGUID: fGHWBW6DRQS+qQRnd6shzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170126765"
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
Subject: [PATCH 2/4] drm/xe/guc_pc: Use poll_timeout_us() for waiting
Date: Thu, 28 Aug 2025 15:04:57 -0700
Message-ID: <20250828-xe-iopoll-v1-2-9832ccd1c8b1@intel.com>
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

Convert wait_for_pc_state() and wait_for_act_freq_limit() to
poll_timeout_us(). This brings 2 changes in behavior: Drop the
exponential wait and fix a potential much longer sleep.

usleep_range() will wait anywhere between `wait` and `wait << 1`, so
it's not correct to assume `slept += wait`.  This code is not really
accurate. Pairing this with the exponential wait increase, it could be
waiting much longer than intended.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 40 ++++++++++++++--------------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 88557e86d6371..2299a2b2ec81b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -7,6 +7,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/jiffies.h>
 #include <linux/ktime.h>
 #include <linux/wait_bit.h>
@@ -128,23 +129,16 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
 			     enum slpc_global_state state,
 			     int timeout_ms)
 {
-	int timeout_us = 1000 * timeout_ms;
-	int slept, wait = 10;
+	const unsigned long timeout_usec = timeout_ms * USEC_PER_MSEC,
+			    wait_usec = 20;
+	int ret;
 
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
+	ret = poll_timeout_us(ret = slpc_shared_data_read(pc, header.global_state) == state,
+			      ret, wait_usec, timeout_usec, false);
 
-	return -ETIMEDOUT;
+	return ret;
 }
 
 static int wait_for_flush_complete(struct xe_guc_pc *pc)
@@ -161,22 +155,16 @@ static int wait_for_flush_complete(struct xe_guc_pc *pc)
 
 static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
 {
-	int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
-	int slept, wait = 10;
-
-	for (slept = 0; slept < timeout_us;) {
-		if (xe_guc_pc_get_act_freq(pc) <= freq)
-			return 0;
+	const unsigned long timeout_usec = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC,
+			    wait_usec = 20;
+	int ret;
 
-		usleep_range(wait, wait << 1);
-		slept += wait;
-		wait <<= 1;
-		if (slept + wait > timeout_us)
-			wait = timeout_us - slept;
-	}
+	ret = poll_timeout_us(ret = xe_guc_pc_get_act_freq(pc) <= freq,
+			      ret, wait_usec, timeout_usec, false);
 
-	return -ETIMEDOUT;
+	return ret;
 }
+
 static int pc_action_reset(struct xe_guc_pc *pc)
 {
 	struct xe_guc_ct *ct = pc_to_ct(pc);

-- 
2.50.1

