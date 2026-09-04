Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67ADC79F8C
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1AF10F844;
	Fri,  4 Sep 2026 02:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUQn5n/7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5393910E07F
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788488535; x=1820024535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=it/6/n0hJV3i2+RB2XSzk7B98ZeS8lGQTh8GyM7KbrI=;
 b=FUQn5n/70/tHB33jyZesF28Im9oxEyFXKEzQ5FJoRnX4RKy6Nr0d48ZA
 j3KYrXS4bupH097te7HEFTaw2uueSOZNT/jpmGuQOwg7hfKkznyuV3gtr
 fbjgnqvlAUiZmgRaNB4Yqii+42Bv2NskGoIsVUVOA5z+9jADwHRcstL8M
 78H2K6Xy5JZjRiNoaYDaLCheKwaC1ByMSWT46+PepII51MUd2RRq1Q/nS
 IfmYzCD68dID8Nsj0sz66H9Yp5HxUdwM+L1WLys3jTgKtF03wN33/200W
 fmHs7rhHT252/CaQlDKc+rXtCGscomed6O2WMlngYh8N5Zb4bJRb+ZJju Q==;
X-CSE-ConnectionGUID: ByBD03gyT5ahIllGZQ+7tA==
X-CSE-MsgGUID: xcU8BM6jQ7+JC3qI6Hswng==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106506275"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="106506275"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:14 -0700
X-CSE-ConnectionGUID: DSlxFW3tTf2O6Pr8UVBDVw==
X-CSE-MsgGUID: zfRpQoqXTQ2giHEwbp666A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275185112"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 03/25] drm/xe: Decouple exec queue idle check from LRC
Date: Thu,  3 Sep 2026 19:21:45 -0700
Message-Id: <20260904022207.3490018-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904022207.3490018-1-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
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

We already maintain a job count for each exec queue, so simplify the idle
check to rely on the job count rather than the LRC state. This decouples
exec queues from LRC-based backends and avoids unnecessarily coupling idle
detection to backend-specific implementation details.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-4-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c4213bb9c137..a894551c3ea6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1516,20 +1516,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
  */
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 {
-	if (xe_exec_queue_is_parallel(q)) {
-		int i;
-
-		for (i = 0; i < q->width; ++i) {
-			if (xe_lrc_seqno(q->lrc[i]) !=
-			    q->lrc[i]->fence_ctx.next_seqno - 1)
-				return false;
-		}
-
-		return true;
-	}
-
-	return xe_lrc_seqno(q->lrc[0]) ==
-		q->lrc[0]->fence_ctx.next_seqno - 1;
+	return !atomic_read(&q->job_cnt);
 }
 
 /**
-- 
2.34.1

