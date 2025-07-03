Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF272C83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 06:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B7D10E142;
	Thu,  3 Jul 2025 06:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvzQHwJd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B0910E142
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 06:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751523858; x=1783059858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jR2fb7Wh9ayAPPeV36JDgi4AS1cI59UD6pDxGae7OWM=;
 b=JvzQHwJd1LQMEDbylpXurIQATbkgTHtKvZFkXSTF7PIfLmoICW/M5IY7
 B5lbFSXio10h1QS7uh2EZ42/SxeO/B5ya00R8yqdnHVJNCWop3t1xqxfU
 eNCZG+NDfBseRgJXj0/Nval2iiiCmaQmfFM4A1S1XrhIdrAiD8PVl5f/Y
 yBa+ar5I9ctEHD6XqbY6rYPWIM+jDnXdpx2z6MS6UXX5R6FxHF7paCyQ/
 vDc9yEC1CTrbcbeZx1HSx4wPMlx/JShsqW94FUTTu6sFwTrfTYc3tzc4Z
 8My5AZLuE4g7MUeMk8h2LCOn7sugzyUto9Uf38HgQDXnTb/s2LYoznKf/ A==;
X-CSE-ConnectionGUID: 3yC1m3zjQH6uZJuFfAL6oQ==
X-CSE-MsgGUID: JIGo3IiCQESKa+xROZKg7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64885888"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="64885888"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:24:17 -0700
X-CSE-ConnectionGUID: gx1PNIFBTWmP+ugxCvS0RA==
X-CSE-MsgGUID: zujBSk9SSsCj7rW9b4gLVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="154634309"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa009.fm.intel.com with ESMTP; 02 Jul 2025 23:24:15 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe: Remove unused code in devcoredump_snapshot()
Date: Thu,  3 Jul 2025 06:20:26 +0000
Message-ID: <20250703062024.3441918-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703062024.3441918-4-shuicheng.lin@intel.com>
References: <20250703062024.3441918-4-shuicheng.lin@intel.com>
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

The deleted code is no longer needed bacause patch ecb633646391("drm/xe/guc: Plumb GuC-capture
into dev coredump") has removed the related usage code.
Remove the code to tidy up the function.

Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 7a8af2311318..94625010abc4 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -313,13 +313,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	u32 adj_logical_mask = q->logical_mask;
-	u32 width_mask = (0x1 << q->width) - 1;
 	const char *process_name = "no process";
-
 	unsigned int fw_ref;
 	bool cookie;
-	int i;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
@@ -335,14 +331,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
 
 	cookie = dma_fence_begin_signalling();
-	for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
-		if (adj_logical_mask & BIT(i)) {
-			adj_logical_mask |= width_mask << i;
-			i += q->width;
-		} else {
-			++i;
-		}
-	}
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
 	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
-- 
2.49.0

