Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F06C79F81
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821FB10F801;
	Thu,  3 Sep 2026 23:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lW/lX+cY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B30110E198
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479930; x=1820015930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=it/6/n0hJV3i2+RB2XSzk7B98ZeS8lGQTh8GyM7KbrI=;
 b=lW/lX+cYlBtR61/SMabAoqiJOTMJUxrBdvwqdsww0KBIL3JyLCBAUzWB
 ogtfFIGSIb9l4/XP2u9C1Q29wKTLhkhOerrwjzkQjRE2Vl6Ch6FVUJZ3c
 nYIXVkenU7dNi1Xr3UQwiB6Qfvxrvyban/94HEO1rU5xOyuuapVpFey0Y
 TwtzVqg7gGXJ+dTRoo2pnNOAyuJ1u6XF7n98Gn+/Qe5TEskWm0anaABvR
 2XBkWOIb5sFnK6Ux55Y4SNYX/JFuj6YbHLp21eyYHik3hR8fji1qbQKA0
 FJfbPyzhgw/y3PR6wUv6chMANsva69vQ2G833RODFndPZSdU4tV6E/mIF w==;
X-CSE-ConnectionGUID: O0mIUAWuTsWp5gvIvw5j3g==
X-CSE-MsgGUID: c5wiMda4TEu8i7aTxiK97A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637803"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637803"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:49 -0700
X-CSE-ConnectionGUID: La4J8UZCQSOHszvWoNAK9w==
X-CSE-MsgGUID: Nw9fMzv6T6aK7V2cXrgQaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029037"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v4 03/25] drm/xe: Decouple exec queue idle check from LRC
Date: Thu,  3 Sep 2026 16:58:20 -0700
Message-Id: <20260903235842.3401722-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
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

