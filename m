Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB06C369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 17:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918AC10E227;
	Mon, 28 Apr 2025 17:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDjns9OF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C6E10E227
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745862826; x=1777398826;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tGW1dQhs69tQAJ2/FKENv3ghtegLsBs7XBX6fNXwb4U=;
 b=nDjns9OFx0kw6o+RxQse5+RBuu1XSO4uSEbQsRRILyo9MQfatzFCFnm+
 e8GX5hQAAm1uEHkSyMVCJngRA08qVn6dh2ucDpDXCv+dS7wSl70AhA46u
 GgF8qxG1XIMIkI876rSWXc3d3C2k7tMTphqes1UmyQyQveBVn2Z5wkKvK
 8tP4C9TrJkQxsiryYjS0UO5ufX4b7ROFAOVXC1HoHSVGP8edWMKQi9APF
 ViI9ron2nViiqlzwGOLWBAxtvjyQ8TJiiYpTETiZgIP6zZ1G5ZdqeDK1j
 W55ivecJcSM0KbtBaWHKsjoiQVhpVRNV9XbUsX3S2itM643AS3YvEeCEx w==;
X-CSE-ConnectionGUID: m1frF4+TTQW1JpWseDBBTw==
X-CSE-MsgGUID: HwHwh1X+Q+KlNeIEZANPHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="46709752"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="46709752"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 10:53:45 -0700
X-CSE-ConnectionGUID: uAynXo/NT5eH2DH/bokPyQ==
X-CSE-MsgGUID: lFciAoz2R1mLaDxl6pZItg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="164547866"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 10:53:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Do not print timedout job message on killed exec
 queues
Date: Mon, 28 Apr 2025 10:55:05 -0700
Message-Id: <20250428175505.935694-1-matthew.brost@intel.com>
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

If a user ctrl-c an app while something is running on the GPU, jobs are
expected to timeout. Do not spam dmesg with timedout job messages in
this case.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 813c3c0bb250..369be36f7dc5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1179,9 +1179,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		process_name = q->vm->xef->process_name;
 		pid = q->vm->xef->pid;
 	}
-	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
-		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
-		     q->guc->id, q->flags, process_name, pid);
+
+	if (!exec_queue_killed(q))
+		xe_gt_notice(guc_to_gt(guc),
+			     "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
+			     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+			     q->guc->id, q->flags, process_name, pid);
 
 	trace_xe_sched_job_timedout(job);
 
-- 
2.34.1

