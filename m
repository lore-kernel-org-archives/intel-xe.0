Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F06C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 23:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EA710E068;
	Fri, 24 May 2024 23:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W57NYnxY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56C810E068
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 23:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716594469; x=1748130469;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7rzIO+auwzXiBIbZPc3Xw0WOdu1VDL9QcTaW6e1+BLo=;
 b=W57NYnxYqfQT6ukDKj8GTBmltQvifOrmPP/fK0t1aenhE4XRY2j+Fkph
 T5SQLyjSg9g6zNwVTY7tKP44yhTh4o99wy12FqQyyzAn/WdPUdlOUWXeH
 YS38u2XEIHgwekCI1O5fNBy8Q/5vuvsLl5qLhzHb+4HxFa53OW/xgOd+T
 zCeEwQVwwZW8qm1T2Fq4cxpoWLqssLhYDm5Mi2UVjCAKkjjQQalTrmJ9m
 hNd3bMLYRgDNkEV6M2wAQ4sOeEBXxagSaFlWeEbmOeJz3ScNwxk6+DyFq
 rlS7irLwCKjvf05BXn8V5LXrY21oo0KTC7fyYA3u3FCeNyamyXPL0s+sR g==;
X-CSE-ConnectionGUID: Vf3IbkgsR2uzNqR1T45N3w==
X-CSE-MsgGUID: ri5c5Jr4TjCB76+ojkF6Fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12771177"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="12771177"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 16:47:48 -0700
X-CSE-ConnectionGUID: iXyfOOsKS9uuzzK8p88oSA==
X-CSE-MsgGUID: EFj6iv0jS9WmXjCpHsXPWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="71580686"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 16:47:48 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Do not access xe file when updating exec queue
 run_ticks
Date: Fri, 24 May 2024 16:47:44 -0700
Message-Id: <20240524234744.1352543-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240524234744.1352543-1-umesh.nerlige.ramappa@intel.com>
References: <20240524234744.1352543-1-umesh.nerlige.ramappa@intel.com>
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

The current code is running into a use after free case where xe file is
closed before the exec queue run_ticks can be updated. This is occurring
in the xe_file_close path. To fix that, do not access xe file when
updating the exec queue run_ticks. Instead store the exec queue run_ticks
locally in the exec queue object and accumulate it when the user dumps
the drm client stats. We know that the xe file is valid when user is
dumping the run_ticks for the drm client, so this effectively
removes the dependency on xe file object in
xe_exec_queue_update_run_ticks().

v2:
- Fix the accumulation of q->run_ticks delta into xe file run_ticks
- s/runtime/run_ticks/ (Rodrigo)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1908
Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c       | 5 ++++-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 5 +----
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 4 ++++
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 1dcae0e6d66d..4a19b771e3a0 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -251,8 +251,11 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
 	/* Accumulate all the exec queues from this client */
 	mutex_lock(&xef->exec_queue.lock);
-	xa_for_each(&xef->exec_queue.xa, i, q)
+	xa_for_each(&xef->exec_queue.xa, i, q) {
 		xe_exec_queue_update_run_ticks(q);
+		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
+		q->old_run_ticks = q->run_ticks;
+	}
 	mutex_unlock(&xef->exec_queue.lock);
 
 	/* Get the total GPU cycles */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 841d3ea71e0d..4e9cee088f25 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -765,7 +765,6 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
  */
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 {
-	struct xe_file *xef;
 	struct xe_lrc *lrc;
 	u32 old_ts, new_ts;
 
@@ -777,8 +776,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	if (!q->vm || !q->vm->xef)
 		return;
 
-	xef = q->vm->xef;
-
 	/*
 	 * Only sample the first LRC. For parallel submission, all of them are
 	 * scheduled together and we compensate that below by multiplying by
@@ -789,7 +786,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	 */
 	lrc = &q->lrc[0];
 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
-	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
+	q->run_ticks += (new_ts - old_ts) * q->width;
 }
 
 void xe_exec_queue_kill(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ee78d497d838..6551e45933a3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -151,6 +151,10 @@ struct xe_exec_queue {
 	 * Protected by @vm's resv. Unused if @vm == NULL.
 	 */
 	u64 tlb_flush_seqno;
+	/** @old_run_ticks: prior hw engine class run time in ticks for this exec queue */
+	u64 old_run_ticks;
+	/** @run_ticks: hw engine class run time in ticks for this exec queue */
+	u64 run_ticks;
 	/** @lrc: logical ring context for this exec queue */
 	struct xe_lrc lrc[];
 };
-- 
2.34.1

