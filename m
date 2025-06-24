Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87745C77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 17:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A9510E09E;
	Tue, 24 Jun 2025 17:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RI9rZrxN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68EE10E09E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750786766; x=1782322766;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h6vegOyLbfA/pNDpyt8Ob5VpcocHhniMkUMTkb5Buhc=;
 b=RI9rZrxN/TErPfLOMdHKgAAvybA8i7u4JfCL1Pp+fDlW5+eEuD2I+LZ1
 5Od/IfqE1UpEJ1bm4qeSEJKqGW8shDJSfrSri+VSfeeOdS8/h8qOu/2/q
 r/JpadL3aWIYsdqnTm+fVxHJ4iMPDlVCLg9KP098FuD3LEuonVVAUpci3
 z5R36mYr+7230yC4X6xXIiUNrRCJ6IjnPhQBu3eEha8fuaQabCvrd/Ojy
 XirbwBOuv+cti8w/GjPhOlpIch1Yelg4ifESEwak7ANxQ69oduM4xzMcE
 TxFgIDlDgY4q+Pm5Sm0W44W8w0m97r3p66YA/RK/6Oh/5YbdPWCNkTZ4B Q==;
X-CSE-ConnectionGUID: E40rT8FmSxuL2asn/8NXJw==
X-CSE-MsgGUID: DbyAC3m6RX6zRWxE1z04XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63639804"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="63639804"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 10:39:25 -0700
X-CSE-ConnectionGUID: Oqxxgy+RTg25P5sSYLEycg==
X-CSE-MsgGUID: sr6XdMENSreLhAVBncj5kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="157472282"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 10:39:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH] drm/xe: Do not wedge device on killed exec queues
Date: Tue, 24 Jun 2025 10:41:03 -0700
Message-Id: <20250624174103.2707941-1-matthew.brost@intel.com>
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

When a user closes an exec queue or interrupts an app with Ctrl-C,
this does not warrant wedging the device in mode 2.

Avoid this by skipping the wedge check for killed exec queues in
the TDR and LR exec queue cleanup worker.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index df7a5a4eec74..72477ccc5c5e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -908,12 +908,13 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_gpu_scheduler *sched = &ge->sched;
-	bool wedged;
+	bool wedged = false;
 
 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
 
-	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
+	if (!exec_queue_killed(q))
+		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
 	/* Kill the run_job / process_msg entry points */
 	xe_sched_submission_stop(sched);
@@ -1084,7 +1085,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int err = -ETIME;
 	pid_t pid = -1;
 	int i = 0;
-	bool wedged, skip_timeout_check;
+	bool wedged = false, skip_timeout_check;
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -1130,7 +1131,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
 	 * genuine timeouts.
 	 */
-	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
+	if (!exec_queue_killed(q))
+		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
 	/* Engine state now stable, disable scheduling to check timestamp */
 	if (!wedged && exec_queue_registered(q)) {
-- 
2.34.1

