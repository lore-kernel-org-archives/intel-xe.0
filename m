Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DB9CE7B1A
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 10:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E7310E60D;
	Thu, 28 Sep 2023 10:59:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8426310E609
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 10:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695898746; x=1727434746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gE4HEGlZ5EYXDB5dWWVsyjtm+cVTJrHQznCQZEclnlg=;
 b=TD+EHXbawKLDskgi2D8fHeHgz7Vmaq9MgBgv6nqwmiJ2Z2axM5tQHHHw
 93qjYlByEwZSMfUjXIvnTd7iQSUIrK3BDU6QkjtjzILCYzG7XDkMyNYG2
 SyYn9QC4oRs0L8wy6zlEWmSVYgoAfuAnygxMCkTYmZtTn6ScR7WYWsrnF
 mnQY65PgUswW2uvJpjmIJro/qafrF7Z/7XfrHyhfPD5RLn8Bsjfh7fcki
 zq/HgHjZi5P345LCofGxVzPYBhaGKsZKP35TLX4lBy+O6VOvA6RziE40L
 UtxO7zwl4ahdr5hVLYzWznSLvcbBFW4GerrPHhjYzsGP1aSDXzjkIHD2R g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="640150"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="640150"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="923174437"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="923174437"
Received: from nsolmsdo-mobl.ger.corp.intel.com (HELO 8b338166fae8.intel.com)
 ([10.251.220.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:59:03 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 10:58:30 +0000
Message-Id: <20230928105843.7-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928105843.7-1-francois.dugast@intel.com>
References: <20230928105843.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 07/20] drm/xe: Fix xe_exec_queue_is_idle for
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

