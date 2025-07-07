Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7DDC83F07
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 00:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFFE10E3E4;
	Mon,  7 Jul 2025 00:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tk4kp04T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151C310E3E4
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751849433; x=1783385433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oVfApZz1pv+BXYfczruuuxGo94oW2UMLIllN6BzmFdw=;
 b=Tk4kp04T8BY+3VBM/oXi5YaqjUDAUCsW0bx0PJaDz3RHhY645Fo4PN5R
 Gjc68DCn5S4Kqt2dgvIBH/7y1CED9Q5OTwwrfoQ1fZ3llMBhscwC64NoR
 cHi9V0bQymWC18KXCcBC6waULWuo59mC5Gq4uPCp8kRXnc0MQi8HiSriT
 p1MSVhW9cVn72Y9HouIBVEWyv/Q3RV2dAYbJMO3AMiSaWhqxz3TZKv/Ml
 VF0xgavBlwrzPYVlz8W3i36A5+6pz9I8afWu5XizkXOp0Wxv8VF+Y7wmg
 HfyCZJFkYyxzNu6MOshnuBm2qx3qAzs/M/6uQiYsHOetw+qA6uPzerkxY A==;
X-CSE-ConnectionGUID: fkHY2UVyS9qxEDDw91OIAQ==
X-CSE-MsgGUID: ZjEy9qQPTDaTQ2NQ9I3+7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54204996"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="54204996"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 17:50:32 -0700
X-CSE-ConnectionGUID: /cS7oyi/QyePZPlabuSbww==
X-CSE-MsgGUID: VV2zKNygT0avA7ohmnFggg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="155564847"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa008.jf.intel.com with ESMTP; 06 Jul 2025 17:50:31 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, Shuicheng Lin <shuicheng.lin@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 1/2] drm/xe: Remove unused code in devcoredump_snapshot()
Date: Mon,  7 Jul 2025 00:49:13 +0000
Message-ID: <20250707004911.3502904-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707004911.3502904-4-shuicheng.lin@intel.com>
References: <20250707004911.3502904-4-shuicheng.lin@intel.com>
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

The deleted code is no longer needed because patch ecb633646391("drm/xe/guc: Plumb GuC-capture
into dev coredump") has removed the related usage code.
Remove the code to tidy up the function.

v2: s/bacause/because

Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

