Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01187C2A07B
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3173B10E289;
	Mon,  5 Jan 2026 04:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDBfeAXD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEB010E372
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585766; x=1799121766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gB4OnKMagsed6Fs82mWDZP3+QI7F/a0dQc5YYU0gPao=;
 b=JDBfeAXDPlrur84m0K5K/I2yQHfQfYBIStmxy/1DWtMq7FHGBoOQORE9
 cGL3jLeHVgeDjAfZ3yDFrgVItNi+zf8GaObAEsYfAx/8mpy2anpjW9Ab5
 gVXiRR5ObXzWyPIjLX6tsFrVFvGhQHf1uCesQigryHJ8/P6l6EgnmBhSr
 IRLjXcWAox3uTobmbppgsFZywSmnr+enMM3isYvJIcEmMewrwjZflc6Gv
 emvUR0vPBzJxjYH7/Ooyg+ifUO/V4ooEEmmNvj3FjnVZhv4yKCdCQNoEo
 Gd9RLBwRe5E9DEqksxCYY4RIOKGbjtxydFKpAHlkXRbOLei1l/7vYbnRY g==;
X-CSE-ConnectionGUID: 0NecL6CJT3Kl6KT8keiEKg==
X-CSE-MsgGUID: xf5qRaSmQXKkEGiMHlme9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856271"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856271"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:45 -0800
X-CSE-ConnectionGUID: ICPWp3jyRIetPnh9ZWbKUQ==
X-CSE-MsgGUID: bvn8ERXFRiGcned1/ZsMLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060688"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 18/22] drm/xe: Add timestamp_ms to LRC snapshot
Date: Sun,  4 Jan 2026 20:02:33 -0800
Message-Id: <20260105040237.1307873-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Add a timestamp in milliseconds to the LRC snapshot to make it easier to
reason about how long the LRC has been running and the average duration
of each job.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++++
 drivers/gpu/drm/xe/xe_lrc.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index eccc7f2642bf..f3ada74d297e 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -22,6 +22,7 @@
 #include "xe_drm_client.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
+#include "xe_gt_clock.h"
 #include "xe_gt_printk.h"
 #include "xe_hw_fence.h"
 #include "xe_map.h"
@@ -2289,6 +2290,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->replay_size = lrc->replay_size;
 	snapshot->lrc_snapshot = NULL;
 	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
+	snapshot->ctx_timestamp_ms =
+		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
 	return snapshot;
 }
@@ -2342,6 +2345,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
 	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
+	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
 
 	if (!snapshot->lrc_snapshot)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 3d72b4c0da8e..59413d9fc1ff 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -39,6 +39,7 @@ struct xe_lrc_snapshot {
 	u32 seqno;
 	u32 ctx_timestamp;
 	u32 ctx_job_timestamp;
+	u64 ctx_timestamp_ms;
 };
 
 #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
-- 
2.34.1

