Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB25D3B7FD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 03:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B56E10E483;
	Tue,  9 Dec 2025 03:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYjDBvOF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FBA10E47E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 03:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250466; x=1796786466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EE6WNFakT5r9Y8Lr/1x3dhXOmFJlV2IHCu2u96HaoPw=;
 b=YYjDBvOFFsShaBq7rcDeReDaqXDiF77OMqoN3QxbFtXGHiw1qT3TfBFe
 F8fGr30JztuIloMLFiMiclZuUswNBA+MRRlp0lk+WATsPCNPV8SBoXSDu
 lxFgap3VaREzJwmlaecVXFRO0zAP076Y1pCVNl9f+1nAJRhdOYzoj/2d5
 pLxpNpnbI8xJ7yNarlLQEkF5a3mBMCsz+/bwKPLgLEN12jq9WX88rrZgD
 I4Aap2YJAFII1pBPJk8/9jeKXJ2qUR3qsmXoBzPY/OUGXHD+mEjlSYnxu
 SFKHXwIsbWjM/WE0m0L8W+D2v3TsDvgp/RMzSOP3H1IVQgvSybug1/Mcp w==;
X-CSE-ConnectionGUID: 4uUO5F5cTaeeor7dUMtfHw==
X-CSE-MsgGUID: VfjXWls+R3ihdmnMwl9fmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67254150"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67254150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:05 -0800
X-CSE-ConnectionGUID: rzAGaeVjTMCdA1aHDiYEcA==
X-CSE-MsgGUID: TQG+3qiWRvipck6tAS/ovg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200289652"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:05 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v4 13/18] drm/xe/multi_queue: Teardown group upon job timeout
Date: Mon,  8 Dec 2025 19:21:03 -0800
Message-ID: <20251209032055.1539229-33-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
References: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
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

Upon a job timeout, teardown the multi-queue group by
triggering TDR on all queues of the multi-queue group
and by skipping timeout checks in them.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 8a954ee62505..5fc516b0bb77 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -64,6 +64,8 @@ struct xe_exec_queue_group {
 	struct mutex list_lock;
 	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
 	bool sync_pending;
+	/** @banned: Group banned */
+	bool banned;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 509433f132d0..3d6eda29a819 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -602,6 +602,8 @@ static void xe_guc_exec_queue_group_trigger_cleanup(struct xe_exec_queue *q)
 	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
 		     xe_exec_queue_is_multi_queue(q));
 
+	/* Group banned, skip timeout check in TDR */
+	WRITE_ONCE(group->banned, true);
 	xe_guc_exec_queue_trigger_cleanup(primary);
 
 	mutex_lock(&group->list_lock);
@@ -1485,6 +1487,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		exec_queue_killed_or_banned_or_wedged(q) ||
 		exec_queue_destroyed(q);
 
+	/* Skip timeout check if multi-queue group is banned */
+	if (xe_exec_queue_is_multi_queue(q) &&
+	    READ_ONCE(q->multi_queue.group->banned))
+		skip_timeout_check = true;
+
 	/*
 	 * If devcoredump not captured and GuC capture for the job is not ready
 	 * do manual capture first and decide later if we need to use it
@@ -1637,7 +1644,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
 
-	xe_guc_exec_queue_trigger_cleanup(q);
+	xe_guc_exec_queue_group_trigger_cleanup(q);
 
 	/* Mark all outstanding jobs as bad, thus completing them */
 	spin_lock(&sched->base.job_list_lock);
-- 
2.43.0

