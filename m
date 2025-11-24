Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D3ECFD317
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 22:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF2610E321;
	Mon, 24 Nov 2025 22:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arE3lQmU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B6F10E328
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 22:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764023197; x=1795559197;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0wf/diQneqqTkIq9xxNd/FAM4HUPNBknPHwBYnY532g=;
 b=arE3lQmUIctg7D8JZ5HMSkQV88GiMpATrHn/7/DmWQFZxlyoRmd50Z8c
 ESzVmUbj+3hw0k3hRxNv+d3mF3M/LBGGC4YIgEB8+9tbbCgUeD7E9bvoW
 fOycxdP9xsg+/8aLWDyFEvBnpyk7uFeQ+srdR7R9wMzA/SKmmDJsZKSu0
 u/Kag0QfEsLlHXyWCmybNCWOrX48YKN5PnOSk73aSShFa2vlmZ7eFhwFH
 GmjG3x8p8M1lgSc8Hi0uTzQwZoSN2cqJK/5EQ8jJN/n10lMLc0SjKc04P
 APBKKMTneYdubJC9+Qb6PCBgv+hBzGipJtJqID/HwIQdUYk7TTaodM2hc Q==;
X-CSE-ConnectionGUID: sLCyujCeQ5GpxYLDVfRvtA==
X-CSE-MsgGUID: VRqV4nIwSPCrNOVDr8SGuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66195945"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="66195945"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 14:26:37 -0800
X-CSE-ConnectionGUID: UcoY/3/dRR2ujOiyG5Lflg==
X-CSE-MsgGUID: jwISu+fyTE2voBaRf8FUlg==
X-ExtLoop1: 1
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 24 Nov 2025 14:26:35 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v1] drm/xe: Protect against unset LRC when pausing submissions
Date: Mon, 24 Nov 2025 23:28:53 +0100
Message-Id: <20251124222853.1900800-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

While pausing submissions, it is possible to encouner an exec queue
which is during creation, and therefore doesn't have a valid xe_lrc
struct reference.

Protect agains such situation, by checking for NULL before access.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Fixes: c25c1010df88 ("drm/xe/vf: Replay GuC submission state on pause / unpause")
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7e0882074a99..f57000c2cb9d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2107,6 +2107,18 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 	q->guc->resume_time = 0;
 }
 
+static void lrc_parallel_clear(struct xe_lrc *lrc)
+{
+	struct xe_device *xe = gt_to_xe(lrc->gt);
+	struct iosys_map map = xe_lrc_parallel_map(lrc);
+	int i;
+
+	for (i = 0; i < WQ_SIZE / sizeof(u32); ++i)
+		parallel_write(xe, map, wq[i],
+			       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
+			       FIELD_PREP(WQ_LEN_MASK, 0));
+}
+
 /*
  * This function is quite complex but only real way to ensure no state is lost
  * during VF resume flows. The function scans the queue state, make adjustments
@@ -2130,8 +2142,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 	guc_exec_queue_revert_pending_state_change(guc, q);
 
 	if (xe_exec_queue_is_parallel(q)) {
-		struct xe_device *xe = guc_to_xe(guc);
-		struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
+		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
+		struct xe_lrc *lrc = READ_ONCE(q->lrc[0]);
 
 		/*
 		 * NOP existing WQ commands that may contain stale GGTT
@@ -2139,10 +2151,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 		 * seems to get confused if the WQ head/tail pointers are
 		 * adjusted.
 		 */
-		for (i = 0; i < WQ_SIZE / sizeof(u32); ++i)
-			parallel_write(xe, map, wq[i],
-				       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
-				       FIELD_PREP(WQ_LEN_MASK, 0));
+		if (lrc)
+			lrc_parallel_clear(lrc);
 	}
 
 	job = xe_sched_first_pending_job(sched);
-- 
2.25.1

