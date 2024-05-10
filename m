Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51970C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 20:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B3710E14F;
	Fri, 10 May 2024 20:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvAitvRY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B16410E0E7
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715371257; x=1746907257;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S7o7iuNfjAvW+spDMjbKR89C6UOWEdh0cfiyJeJtwZk=;
 b=FvAitvRYZsgAbJfp47CKhu0Ki1so8UZM4Bers6xIQAJ+T48G3NL4GIjD
 f3T/8XcGpN5W/KqMUckPRdiN6BUKpr4lSRoD10at5Hhak94OyTM0G7x3B
 7mOqBa4KZ44Kyl9JgIatrX6m9kB3JRdI2X5YPSD6GqjCPPWLNVVkYcJ5b
 oWwhcQN9vQlQd27+bFmyY4H0fRxuQNMSgHFVOBtQvdG7EUcpJprYjpH6F
 xWyK4ScaqZQg2U7jx5A4muBhktbYe0ySJUJ8jF4atVjgQaPkejUlruUep
 ec5ETC2Ap0RO9jEuViz4+sPJ2hUB1rq1K2aaYkeXzSXbBDtJmneEREeGu g==;
X-CSE-ConnectionGUID: FMiMmTwvQmejVcmHt78QnQ==
X-CSE-MsgGUID: 0UtJor7fTzuGte6SjVN8FQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="21948545"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="21948545"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:00:56 -0700
X-CSE-ConnectionGUID: GiwXv9LuQGCWsYuzKY3IlA==
X-CSE-MsgGUID: z29PGK3gT02nZKvyDVNYEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29566566"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:00:57 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	saurabhg.gupta@intel.com
Subject: [PATCH v7 1/3] drm/xe/xe_guc_submit: Fix exec queue stop race
 condition
Date: Fri, 10 May 2024 12:45:38 -0700
Message-Id: <20240510194540.3246991-1-jonathan.cavitt@intel.com>
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

Reorder the xe_sched_tdr_queue_imm and set_exec_queue_banned calls in
guc_exec_queue_stop.  This prevents a possible race condition between
the two events in which it's possible for xe_sched_tdr_queue_imm to
wake the ufence waiter before the exec queue is banned, causing the
ufence waiter to miss the banned state.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index fde527d34f583..3a8e501f2bc25 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1491,8 +1491,8 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 			    !xe_sched_job_completed(job)) ||
 			    xe_sched_invalidate_job(job, 2)) {
 				trace_xe_sched_job_ban(job);
-				xe_sched_tdr_queue_imm(&q->guc->sched);
 				set_exec_queue_banned(q);
+				xe_sched_tdr_queue_imm(&q->guc->sched);
 			}
 		}
 	}
-- 
2.25.1

