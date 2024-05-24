Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E209C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 20:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C661E10F287;
	Fri, 24 May 2024 20:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsndRLIu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B1E10F287;
 Fri, 24 May 2024 20:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716582365; x=1748118365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XTdv7LXc795a9hHiGjyt8EFvPlzOSk/P+ikkhwOg7sQ=;
 b=ZsndRLIuwHu0tzM27PHSOKex3dtkPJQAku7E6+c77c9t/VF1Oekz1Ers
 fNIga+dsRgV0l1EkTnPa+yqedHfVC/UnIuoEzEC+MEty+pHL5R6/kJV5D
 v8diZCW4LhJlyxFuDhkHI+KVQ8F2bVpLP3Ljnk47ln5LyokW1ba7GwN2B
 sgEDj8H8w2Mk0FM5iHn2i2vHoxVpCTjMeBfHS5+X94QvpjFdMtubhNKTv
 T/Fbb/UrJfQg5Rt9R9aHaNdWNP9YTZDxZDANFVifLi3XuhC3E7pAXeQmI
 34kPvZtXWv4GqlAwRe5A10ISlzK3T/0SmtkMArSHUzvESns1rZ735Gv4N Q==;
X-CSE-ConnectionGUID: W+PW+lgTQHSFayzCwWOkRg==
X-CSE-MsgGUID: sX8wL7QpQ7mBMz4q9CpPhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="16810702"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="16810702"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 13:26:04 -0700
X-CSE-ConnectionGUID: CEUuaqwCSHSkUZN1afyJYA==
X-CSE-MsgGUID: XSx3m/SXTE2kH6VMDcutbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="34720203"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa007.jf.intel.com with ESMTP; 24 May 2024 13:26:03 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 kernel test robot <lkp@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Fei Yang <fei.yang@intel.com>, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Fix uninitialised count in GuC load debug prints
Date: Fri, 24 May 2024 13:26:03 -0700
Message-ID: <20240524202603.4011656-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The debug prints about how long the GuC load takes have a loop
counter. However that was neither initialised nor incremented! Plus,
counting loops is no longer meaningful given the wait function returns
early for any change in the status value. So fix it to only count
loops due to actual timeouts.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405250151.IbH0l8FG-lkp@intel.com/
Fixes: b0ac1b42dbdc ("drm/xe/guc: Port over the slow GuC loading support from i915")
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: intel-xe@lists.freedesktop.org
---
 drivers/gpu/drm/xe/xe_guc.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index f7886c00af01..086a048876ba 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -591,7 +591,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
 	ktime_t before, after, delta;
 	int load_done;
 	u32 status = 0;
-	int count;
+	int count = 0;
 	u64 delta_ms;
 	u32 before_freq;
 
@@ -604,6 +604,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
 	 */
 	do {
 		u32 last_status = status & (GS_UKERNEL_MASK | GS_BOOTROM_MASK);
+		int ret;
 
 		/*
 		 * Wait for any change (intermediate or terminal) in the status register.
@@ -612,9 +613,10 @@ static void guc_wait_ucode(struct xe_guc *guc)
 		 * timeouts rather than allowing a huge timeout each time. So basically, need
 		 * to treat a timeout no different to a value change.
 		 */
-		xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
-				   last_status, 1000 * 1000, &status, false);
-
+		ret = xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
+					 last_status, 1000 * 1000, &status, false);
+		if (ret < 0)
+			count++;
 		after = ktime_get();
 		delta = ktime_sub(after, before);
 		delta_ms = ktime_to_ms(delta);
@@ -626,7 +628,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
 		if (delta_ms >= (GUC_LOAD_RETRY_LIMIT * 1000))
 			break;
 
-		xe_gt_dbg(gt, "load still in progress, count = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
+		xe_gt_dbg(gt, "load still in progress, timeouts = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
 			  count, xe_guc_pc_get_act_freq(guc_pc),
 			  guc_pc_get_cur_freq(guc_pc), status,
 			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
@@ -678,13 +680,13 @@ static void guc_wait_ucode(struct xe_guc *guc)
 
 		xe_device_declare_wedged(gt_to_xe(gt));
 	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
-		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, count = %d]\n",
+		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
 			   delta_ms, status, count);
 		xe_gt_warn(gt, "excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
 			   xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
 			   before_freq, xe_gt_throttle_get_limit_reasons(gt));
 	} else {
-		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, count = %d\n",
+		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, timeouts = %d\n",
 			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
 			  before_freq, status, count);
 	}
-- 
2.43.2

