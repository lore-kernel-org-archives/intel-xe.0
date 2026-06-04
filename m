Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5689CCD6E77
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 17:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F7E11A1DF;
	Thu,  4 Jun 2026 17:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="EfNKzZ3J";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CC911A1DD
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780593303;
 bh=EZU9kHYes+8veWwr9bS0ra60LzeKJz7Xwp1ItOlVf9k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EfNKzZ3Jx2V2H0wEKbKaXWiFsqKqVesjoIRPbvv0scOWlGR+Ju4GrT6KNt7EvRH5X
 9h8370wchrkWAW6bMbU/X2zZ1O/mu+V5j42PhMsrsSWMvnrHdkQkS3Y7HE+Tre+kgM
 uofGvGqS9xaQmOp9CRSyGe2AeFIQ7Ergy3p2N4iMuUoZ6sw0YZmn8+mY1A3eDI6RhU
 DhG3f9dggjuCd1e5dV/2gNUaviHnaVEMZDgpLNc1wCGYIX25VRPjA6p6l41wfNF0bB
 PjlvoHJlhWWmNCumzKoBAVGvw2YLIglAOabbTBKCzuihMCf27FifrOQY4lF7kqqdIy
 XuL0frK1Gaa6Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 04/24] drm/xe: Add job count to GuC exec queue snapshot
Date: Thu,  4 Jun 2026 19:14:40 +0200
Message-ID: <20260604171502.84047-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604171502.84047-1-dev@lankhorst.se>
References: <20260604171502.84047-1-dev@lankhorst.se>
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

From: Matthew Brost <matthew.brost@intel.com>

Add the job count to the GuC exec queue snapshot, as this is useful
debug information.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-5-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_guc_submit.c       | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4b247a3019d2d..1780fb975e83b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3171,6 +3171,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	snapshot->logical_mask = q->logical_mask;
 	snapshot->width = q->width;
 	snapshot->refcount = kref_read(&q->refcount);
+	snapshot->jobcount = atomic_read(&q->job_cnt);
 	snapshot->sched_timeout = sched->base.timeout;
 	snapshot->sched_props.timeslice_us = q->sched_props.timeslice_us;
 	snapshot->sched_props.preempt_timeout_us =
@@ -3243,6 +3244,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
 	drm_printf(p, "\tWidth: %d\n", snapshot->width);
 	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
+	drm_printf(p, "\tJob count: %d\n", snapshot->jobcount);
 	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
 	drm_printf(p, "\tTimeslice: %u (us)\n",
 		   snapshot->sched_props.timeslice_us);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index 7824f61b12906..8271702e692e8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -77,6 +77,8 @@ struct xe_guc_submit_exec_queue_snapshot {
 	u16 width;
 	/** @refcount: ref count of this exec queue */
 	u32 refcount;
+	/** @jobcount: job count of this exec queue */
+	u32 jobcount;
 	/**
 	 * @sched_timeout: the time after which a job is removed from the
 	 * scheduler.
-- 
2.53.0

