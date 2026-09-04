Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF35FC79F90
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A015D10FB4F;
	Fri,  4 Sep 2026 21:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XgD8nR2b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCF610E580
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556581; x=1820092581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hgrXcj2AaHl7zq7Q0NBqYjYNIWejKUMHsdXFbO5ZORA=;
 b=XgD8nR2btdjrjl6efjQNV5eiJ+Nkfbc9uOMZQfoEB7lUFNV6NRr2BXTQ
 eCwiAfMoKoKzGgrV/YFo53jnZVT8bajo3lanYvgWlJDp5ia+/Px8LjtBJ
 2rBM+apQZDfyQ4eiSk+x/uHifCXP+CdJzPGdGOZ+EDf5/nKD7EUzbKPY/
 XuazH+RLwiEGMEboni1hMTdsrUZjIet6O5Mjysvt/+ATPv0fEGMo2lDFU
 OZmZpATXSxofq+RG3gvPobkGnEqn8U+1h6mb+AVyjRl1M37zaH4Go1fO1
 3sZggXDuNruMPdpIzbykP4AJxWnZ5xHNX4mi1G8vwRdoPJZDGIPZ2zRf9 g==;
X-CSE-ConnectionGUID: 5m0Rhd2HSFCInuz5a8jBww==
X-CSE-MsgGUID: IVm6WxS1Q9G50vNqt4DDbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096800"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096800"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
X-CSE-ConnectionGUID: EVwNzqvQRTiGelOpL2wtWg==
X-CSE-MsgGUID: zT96ROSiSyyZum9At1Aoqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563414"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v6 03/24] drm/xe: Decouple exec queue idle check from LRC
Date: Fri,  4 Sep 2026 14:15:52 -0700
Message-Id: <20260904211613.3934307-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
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

