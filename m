Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C519CD6E7D
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 17:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB7C11A1DE;
	Thu,  4 Jun 2026 17:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="NKDaa2iA";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE5911A1DD
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 17:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780593302;
 bh=vAlkF0Irui5xD49fLNfN+g2exBdo5Olo42vAIwA1IU4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NKDaa2iAVY8IQVpivX7yt6kn6TaBK0Oje+cqlbkl8F8kQwLieVGgXn9UR0RaefGJm
 aOH1awzwYsUSmiXYvbBveK5ylAb/Ys2ORHm4Y4y5VySaY7ANvAHtqE3zY+xiXlJmzD
 Z6Yft9BUBMdgftZlrARBER90d72J0jGrX8Zivdmx8Kv5GyN3UfpGwMGewO/e1H5qXM
 Glm8IU6r1742voKJxKaH7zUB7DYa2BleqmmEOXSTebgFF10A8BYXmDwO7zuQF6LR+8
 jAz9LaZWd3nBvI/D3IiJqcqyt++C38ruQFpIuBoMrFIujPSydUk4OZT1mQ4FrUjqMw
 ZSF4YJR8WRQyA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 03/24] drm/xe: Decouple exec queue idle check from LRC
Date: Thu,  4 Jun 2026 19:14:39 +0200
Message-ID: <20260604171502.84047-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604171502.84047-1-dev@lankhorst.se>
References: <20260604171502.84047-1-dev@lankhorst.se>
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

From: Matthew Brost <matthew.brost@intel.com>

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
index 1b5ca3ce578a4..0ba8d79555b3b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1504,20 +1504,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
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
2.53.0

