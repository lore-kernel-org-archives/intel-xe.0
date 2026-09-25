Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF33C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD9610FC4E;
	Fri, 25 Sep 2026 20:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DH3PQTCj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204A210FC43
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790367332; x=1821903332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XTesxmVD4j5CsleaijoRJ+K/eUvOA9iUAlKjFFs2Wtk=;
 b=DH3PQTCjjUBPQBLDn1+eYz6cUC+KnuQLx21FKUK/GwgcdAkNex24LLc/
 BWrj2X4jPay13pyVgN1AMBqBc1t7BfVPG+t7WIF3O0H7cl8E5n7KhTly4
 9fUmizq6eh+hSp3rrnXX2aztqHIdCKHnXj2LPs+y/CEdiw/fzpYggecpK
 IrjyBTRXVX1QxZhj7fXJzGilFD39g2xx2FZIFSdiEKrjxxJVsyXm81joI
 NpWluTNNDrVuZs+UAmmSGDbmEcyFkxkoWeMHiakJOXxWx2cA0/PPHc4Uc
 OTLy2RhMpFzJAwSuv6t3qD2MLhDPs4Vg+aNk56pR6uLtab+dNG1e1xma+ Q==;
X-CSE-ConnectionGUID: 1Xx//kbURTiEERrrmH2LAA==
X-CSE-MsgGUID: UNKvJbpTRIGYa2Y+hEbKeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90377940"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="90377940"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:31 -0700
X-CSE-ConnectionGUID: +b2fxKQnSnKmbVkp5PACbQ==
X-CSE-MsgGUID: qQHvMRhZQKSk5TDiM/Teew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="274509849"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v8 04/24] drm/xe: Decouple exec queue idle check from LRC
Date: Fri, 25 Sep 2026 13:15:06 -0700
Message-Id: <20260925201526.1355279-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925201526.1355279-1-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
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
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index e63559a2f582..7bbb31431900 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1580,20 +1580,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
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

