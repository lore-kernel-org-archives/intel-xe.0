Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE300C30658
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 16:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528CF10E6E5;
	Tue, 25 Jun 2024 16:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhWfNvpJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDE210E6E5
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719334699; x=1750870699;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VHWzOJ9J3lygCGrMOtJTJPldUZyriTffxwUB33OQFHE=;
 b=YhWfNvpJU8mOU6iRU3neoM+/MDQjbuwG40Cd0PUSjl86oXmKkb4b6GSI
 RMAyMANHjAt1qRJUjNgB2S0B/5nsdVibvCswgU1xIYQml3rcnMdhLVmSz
 3Xm6dosfie5I2uOAxipCe4xNdtg6AkwQUZTIuahwlc0xBFhC7F9OcOC6c
 u1fq+bWTr8xgO9/F75hMEeLiIWVrUX/cal0JC9xHzd8urBQFzZTQHBUEE
 oXvuHg//P9szqEZIKSi94pwPnqYvJbOGeXzjhy7G7uXLsM7yeQphUhVBY
 v1zwE3u+TUgZdScp1VTq5wp63PzYaR6CBZqFk6bsoZeps/w3AIuhYxLhg w==;
X-CSE-ConnectionGUID: xkg2tgSSTvK1dKMJfG10Sg==
X-CSE-MsgGUID: +UoXpVlJQBar8GVCB+seRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20178750"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20178750"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 09:58:18 -0700
X-CSE-ConnectionGUID: Hvmht5q9RpKl5GmwVud6Tw==
X-CSE-MsgGUID: 8I8WMGS0QwaBbzBFU6J+tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43524773"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 09:58:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH 2/2] drm/xe: Record utilization before destroying the exec
 queue
Date: Wed, 26 Jun 2024 00:58:12 +0800
Message-Id: <20240625165812.58411-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
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

Current code captures utilization at the exec queue level whenever a job
is completed and then accumulates it into the xe file stats whenever the
user queries for per client engine utilization. There is a case where
utilization may be lost if the exec queue is destroyed before the user
queries the utilization. To overcome that, record the utlization when
the exec queue is destroyed.

To do so

1) Wait for release of all other references to the exec queue. The wait
   uses the same timeout as the job scheduling timeout. On timeout, only
   a debug message is printed out since this is just a best effort to
   capture the utilization prior to destroying the queue.
2) Before releasing the last reference in xe_exec_queue_destroy_ioctl(),
   record the utilization in the xe file stats.

Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 11 +++++++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 4d90a16745d2..f1028eaf2d7f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -69,6 +69,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->lr.link);
 	INIT_LIST_HEAD(&q->multi_gt_link);
+	init_waitqueue_head(&q->wq);
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
@@ -825,6 +826,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_exec_queue_destroy *args = data;
 	struct xe_exec_queue *q;
+	int ret;
 
 	if (XE_IOCTL_DBG(xe, args->pad) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
@@ -838,6 +840,15 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 
 	xe_exec_queue_kill(q);
 
+	ret = wait_event_timeout(q->wq, kref_read(&q->refcount) == 1,
+			(q->sched_props.job_timeout_ms/1000) * HZ);
+	if (!ret)
+		drm_dbg(&xe->drm, "Timedout waiting for exec queue run ticks update\n");
+
+	mutex_lock(&xef->exec_queue.lock);
+	xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
+	mutex_unlock(&xef->exec_queue.lock);
+
 	trace_xe_exec_queue_close(q);
 	xe_exec_queue_put(q);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 201588ec33c3..2ae4221d2f61 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -143,6 +143,8 @@ struct xe_exec_queue {
 	u64 old_run_ticks;
 	/** @run_ticks: hw engine class run time in ticks for this exec queue */
 	u64 run_ticks;
+	/** @wq: wait queue to wait for cleanup */
+	wait_queue_head_t wq;
 	/** @lrc: logical ring context for this exec queue */
 	struct xe_lrc *lrc[];
 };
-- 
2.34.1

