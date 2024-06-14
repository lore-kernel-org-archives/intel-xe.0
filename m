Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C09DC27C77
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 06:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318A510EC3C;
	Fri, 14 Jun 2024 06:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFErvniC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5FF10EC3C
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 06:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718345589; x=1749881589;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EjBmYK/NYlpfFgO8CD/mruXaI9IzcsEMmwjdcT/fVxI=;
 b=oFErvniCRtgoPkBjhRSCkZay14s5smnlgUXPMq4/AuWexoc2gSAjX06E
 PT7cT+WHLumvBuAxh5aTtPQk/91vnM1fdEGLtWHevsWm8tQEmJrButQP9
 KNr5kSq3nDr/eIMJdgorp8SVCyRY3VG1mcR3ivz/K+cC4V2k4ZWs/FUfr
 yG7craH6STpWft34h7kkALRZ414s6xtxN54d1nRY+HwiLdxvD1By61jhY
 THW4G+72HbnfWdtfN3hosaaRNzgQ8rooLgT74UiPI54NaElcVy4ST+kKn
 9QZyj0lAILy5IF6Rzmo5tYwY64SR22ZGp4c7xqUPfXB6P8UluIYZruVLn A==;
X-CSE-ConnectionGUID: FUYL7W3YQbaMJhIpyp4xvw==
X-CSE-MsgGUID: awwTD12bTGyG6xRQ5RqnDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="32694552"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="32694552"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 23:13:08 -0700
X-CSE-ConnectionGUID: qtf9RsUPTWSTbsFO/11m6g==
X-CSE-MsgGUID: aS6DCL7dS9iCKNYJRaymvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="77873911"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 23:13:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Invert runnable_state / pending enable check and
 assert
Date: Thu, 13 Jun 2024 23:13:43 -0700
Message-Id: <20240614061343.2931649-1-matthew.brost@intel.com>
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
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

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

