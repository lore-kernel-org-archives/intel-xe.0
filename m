Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5821DE92FFA
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FFA10E1E1;
	Fri,  6 Oct 2023 10:00:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B78D10E105
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696586403; x=1728122403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gE4HEGlZ5EYXDB5dWWVsyjtm+cVTJrHQznCQZEclnlg=;
 b=hiBvvF5di2EzkjjMgrFClwWhFWEDee5vgPcKy2y1e3aGzHoQvSkip0IA
 2odqk4E4cjfMC23OoVhNYPPbJQpHP6bljT65rLB49d6I9RCq1M0PVkL0s
 G2WZuRsRuISjrxlcy36sK9OQNz4a449kELUFNAKgD0uSU8FcBLUdCFK8t
 xH8usIhshaG7EHVsmfIBqQaCtUxGhATTYPWyknzpaMHoCfld9oJrDO53+
 2rAe8UuSML95/pWhbG3WIUWAvZNw9DcIYhrYmz/TjSchlB3Ew2NUgf5Ot
 Bl8ZgAyKy3SuMuVhRCeEQLmmqXa0pncArZyiEq8ca/DQHvAymY21Y9a78 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447907148"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447907148"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745815826"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745815826"
Received: from triebel-mobl.ger.corp.intel.com (HELO 8688cc0b8d51.intel.com)
 ([10.252.41.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:01 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:59:30 +0000
Message-Id: <20231006095943.7-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
References: <20231006095943.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 07/20] drm/xe: Fix xe_exec_queue_is_idle for
 parallel exec queues
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Last little piece to support parallel exec queue is compute mode.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 744be293fe37..6f1e64896a2d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -867,8 +867,17 @@ bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
  */
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 {
-	if (XE_WARN_ON(xe_exec_queue_is_parallel(q)))
-		return false;
+	if (xe_exec_queue_is_parallel(q)) {
+		int i;
+
+		for (i = 0; i < q->width; ++i) {
+			if (xe_lrc_seqno(&q->lrc[i]) !=
+			    q->lrc[i].fence_ctx.next_seqno - 1)
+				return false;
+		}
+
+		return true;
+	}
 
 	return xe_lrc_seqno(&q->lrc[0]) ==
 		q->lrc[0].fence_ctx.next_seqno - 1;
-- 
2.34.1

