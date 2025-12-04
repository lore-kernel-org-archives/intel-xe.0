Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA8AD29FB2
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 20:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFD310E20D;
	Thu,  4 Dec 2025 20:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ex45jenW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E2F10E20D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 20:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764878748; x=1796414748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0jaJBLu3qxJzpD4306Z6J4AGoAl2hwBAF8qfSlx3ELE=;
 b=ex45jenWj7fagEZ3GjyAtM2As1omFArn7bHXS1VxWTGk5S0S5pD9kWZp
 kc34nU1uEG6QSo2lrwnZZrCN2melwJcPOuK4NeQD8hR1nOCr15TrcRnUr
 c1l32vpbc0DTJ3skvrZEmzSyUqAXm5tAWg8VOJ1zFJC5yBQaCoxCQq8Yu
 5F4JnAAwUQbK6IVwbWn7VLIW+7pwaHyKce3sVnTGXkHR49Xvvv9vuCJFl
 BsxdSDyrwiY5/wRPjqJ6pfBStGzDiyC75jxJIG6Xn6fkG/c60PdBTo60u
 i8o7IELlk+0DoPLtMwaxSCIa5yAm1+Q+g2UQSvFwFIXZomlVccc5mimux Q==;
X-CSE-ConnectionGUID: TDL8XRMnSgmDVbdLZ6bT8w==
X-CSE-MsgGUID: VuFp7+KWSryP6yJJLWcllw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="54459593"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="54459593"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:05:47 -0800
X-CSE-ConnectionGUID: L3gjGxlRSC+yRx3z8qG6Yg==
X-CSE-MsgGUID: U07HeUfJSEWRtJ9i1XyhNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="195880285"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa010.fm.intel.com with ESMTP; 04 Dec 2025 12:05:46 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v1] drm/xe/vf: Stop waiting for ring space on VF post
 migration recovery
Date: Thu,  4 Dec 2025 21:08:20 +0100
Message-Id: <20251204200820.2206168-1-tomasz.lis@intel.com>
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

If wait for ring space started just before migration, it can delay
the recovery process, by waiting without bailout path for up to 2
seconds.

Two second wait for recovery is not acceptable, and if the ring was
completely filled even without the migration temporarily stopping
execution, then such a wait will result in up to a thousand new jobs
(assuming constant flow) being added while the wait is happening.

While this will not cause data corruption, it will lead to warning
messages getting logged due to reset being scheduled on a GT under
recovery. Also several seconds of unresponsiveness, as the backlog
of jobs gets progressively executed.

Add a bailout condition, to make sure the recovery starts without
much delay. The recovery is expected to finish in about 100 ms when
under moderate stress, so the condition verification period needs to be
below that - settling at 64 ms.

The theoretical max time which the recovery can take depends on how
many requests can be emitted to engine rings and be pending execution.
While stress testing, it was possible to reach 10k pending requests
on rings when a platform with two GTs was used. This resulted in max
recovery time of 5 seconds. But in real life situations, it is very
unlikely that the amount of pending requests will ever exceed 100,
and for that the recovery time will be around 50 ms - well within our
claimed limit of 100ms.

Fixes: a4dae94aad6a ("drm/xe/vf: Wakeup in GuC backend on VF post migration recovery")
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f3f2c8556a66..ff6fda84bf0f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -722,21 +722,23 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
-	unsigned int sleep_period_ms = 1;
+	unsigned int sleep_period_ms = 1, sleep_total_ms = 0;
 
 #define AVAILABLE_SPACE \
 	CIRC_SPACE(q->guc->wqi_tail, q->guc->wqi_head, WQ_SIZE)
 	if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
 try_again:
 		q->guc->wqi_head = parallel_read(xe, map, wq_desc.head);
-		if (wqi_size > AVAILABLE_SPACE) {
-			if (sleep_period_ms == 1024) {
+		if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
+			if (sleep_total_ms > 2000) {
 				xe_gt_reset_async(q->gt);
 				return -ENODEV;
 			}
 
 			msleep(sleep_period_ms);
-			sleep_period_ms <<= 1;
+			sleep_total_ms += sleep_period_ms;
+			if (sleep_period_ms < 64)
+				sleep_period_ms <<= 1;
 			goto try_again;
 		}
 	}
-- 
2.25.1

