Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C97CFD35A
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 21:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FDB10E262;
	Mon, 24 Nov 2025 21:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5YaDWtl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCA610E262
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 21:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764019269; x=1795555269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=odU0ravUNNNpxPoxlfJUh6jbJUnZSRj5mRvY8ucIArs=;
 b=h5YaDWtlkTrAQgrvsNNvYbPW0bpY9xgXz4Y+myOuBl8dG7kDb5PCnnEx
 LjhVuQ1KH53+DL2G//6CA1roVfQ00sj+jE0l60EMUDMfvLa824IldeCth
 Twf8xNql5eDdGO7oLj87GM+/xY3cb5JNOfpgZei+E6d/bpUYxTehiJtmH
 h2qqdjn6oVyqJX6ww/auZIbuiDDuaIEz2xvn8uW9LH8qdvWB83qCfOwug
 U27y7+Hg+sYzrCmPaCxsk7jZezPt7weGz5llyon63pouijgAAjVEzLpPG
 bGZzLjEwLCcOKYU06neu1p2CpjOm0c4kjWJHFK+Z17KsbUy/Rh14B79Ct w==;
X-CSE-ConnectionGUID: VuglUltJQGWa8i6OhUJwZw==
X-CSE-MsgGUID: h880/9DOQdyLWcNjHQ5Vkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69886387"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="69886387"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:21:09 -0800
X-CSE-ConnectionGUID: bHRSnhUsRnCVIX/kL2xBxw==
X-CSE-MsgGUID: 7ocCDxyfRwm+AOttyeCSxw==
X-ExtLoop1: 1
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 24 Nov 2025 13:21:07 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v1] drm/xe: Protect against unset LRC when pausing submissions
Date: Mon, 24 Nov 2025 22:23:25 +0100
Message-Id: <20251124212325.1900462-1-tomasz.lis@intel.com>
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

