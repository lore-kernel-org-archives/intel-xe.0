Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB3EC27C53
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 02:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB1B10E960;
	Thu, 13 Jun 2024 02:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5JGMQLy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C42010E960
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 02:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718246060; x=1749782060;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aVGkwoTPGE7fQfP929lbsUPGwpiBYJ2IpYNALfqIO1U=;
 b=d5JGMQLyk6HTBCW3j000+pBA4yH+5qSKd31m96+QLlhx3q3EEnSI+Q7V
 08BjpDVfoeUlNh7cHLtKr9A21HTTZt6FhktVqKmBfDQsd1CM4EYzYOC1u
 776J6SWdRyJjOXyDjFwhYJBzq3LFtUT6wqkg37i4KsB3T8DDocu+t88dX
 2grxWLy+RUUF9t8d/+XDmcYnUnMvsregi1mYeFFRnnpTE6dYU/MgUoC5B
 v3QgsZhkFSBdERauOjq8iXDLcjP0aSALLDZpAgyYTot4icAQ8vNHPvXNy
 BLOo5b1CCn66NtuqjUhZzYgW7xpn/+TptfgDJAorHQinaNrsgUNYkyU99 A==;
X-CSE-ConnectionGUID: N852IGIDR2GOHcfRN7b4CQ==
X-CSE-MsgGUID: U5cymNNvQamyuKu6Y2eibQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25621021"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="25621021"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 19:34:19 -0700
X-CSE-ConnectionGUID: vAxQOTV5Q/2TSdc6f6aZ8A==
X-CSE-MsgGUID: wACyeVBKTD2do9KwalIZQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40091362"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 19:34:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Invert runnable_state / pending enable check and
 assert
Date: Wed, 12 Jun 2024 19:34:52 -0700
Message-Id: <20240613023452.2913247-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Rather than checking for pending enable and asserting runnable_state ==
1 in sched done handler, invert these. This is more robust code taking
action based on the G2H message and asserting KMD tracking state is
correct.

Suggested-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 74552391dc5a..373447758a60 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1782,8 +1782,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 {
 	trace_xe_exec_queue_scheduling_done(q);
 
-	if (exec_queue_pending_enable(q)) {
-		xe_gt_assert(guc_to_gt(guc), runnable_state == 1);
+	if (runnable_state == 1) {
+		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_enable(q));
 
 		q->guc->resume_time = ktime_get();
 		clear_exec_queue_pending_enable(q);
-- 
2.34.1

