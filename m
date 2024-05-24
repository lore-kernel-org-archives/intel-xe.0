Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE442C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 18:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4BD10F642;
	Fri, 24 May 2024 18:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzJMATcs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117D710F642
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 18:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716576605; x=1748112605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EWcCKWAcIJTGy461BdaNBnerzpaaB+IGBjIp/JV7y/s=;
 b=YzJMATcs5aE98/sNdPN3jF+JLyv+4c3ye7Ap2YFnnHRSrO6wrckTI6X9
 3nrGGNZaQi6WABp3+d7QucPCOH0gZWk8MZJkV2Kho0s9xuZOZoj9Cnmhd
 6ArA+i83m7QGI+N8PU6A4cC3qCrl6OTRt50tQfPuHhvDvXoQx0PBTFMPD
 aXo8WjvzgB5Lmps/vYawodIAdpKYj5EonbBStBFva3gxaRbRAI0u7Ayej
 zO2klciFMygRQTkM34cAGh+kQKHuG0FXlehxgGAt4tB5d43bzN37Vv4PE
 A0NUP8pjDXmF4ioBXHuxRuUQqqtWWZMcntNHRhZfuj8bsTT3cLOXZCFJo A==;
X-CSE-ConnectionGUID: hk4hNTa/SrCdATopRnfd8A==
X-CSE-MsgGUID: jGma46zlTAKotNWyTFmz8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13089617"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="13089617"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 11:50:03 -0700
X-CSE-ConnectionGUID: GLtJ16UyQ0CyiXdTtiFbKQ==
X-CSE-MsgGUID: pK8SiXd6Sfuvu6aCwGhfdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="38691855"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 11:50:02 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.saarinen@intel.com, matthew.auld@intel.com, lucas.demarchi@intel.com
Subject: [PATCH] drm/xe: Do not access xe file when updating exec queue runtime
Date: Fri, 24 May 2024 11:49:58 -0700
Message-Id: <20240524184958.1344787-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
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
closed before the exec queue runtime can be updated. This is occuring in
the xe_file_close path. To fix that, do not access xe file when updating
the exec queue runtime. Instead store the exec queue runtime locally in
the exec queue object and accumulate it when the user dumps the drm
client stats. We know that the xe file is valid when user is dumping the
runtime stats for the drm client, so this effectively removes the
dependency on xe file object in xe_exec_queue_update_runtime().

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1908
Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c       | 4 +++-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 5 +----
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index af404c9e5cc0..a6a15562b8f7 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -251,8 +251,10 @@ static void show_runtime(struct drm_printer *p, struct drm_file *file)
 
 	/* Accumulate all the exec queues from this client */
 	mutex_lock(&xef->exec_queue.lock);
-	xa_for_each(&xef->exec_queue.xa, i, q)
+	xa_for_each(&xef->exec_queue.xa, i, q) {
 		xe_exec_queue_update_runtime(q);
+		xef->runtime[q->class] += q->runtime - xef->runtime[q->class];
+	}
 	mutex_unlock(&xef->exec_queue.lock);
 
 	/* Get the total GPU cycles */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0fd61fb4d104..a0775a96efb1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -765,7 +765,6 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
  */
 void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
 {
-	struct xe_file *xef;
 	struct xe_lrc *lrc;
 	u32 old_ts, new_ts;
 
@@ -777,8 +776,6 @@ void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
 	if (!q->vm || !q->vm->xef)
 		return;
 
-	xef = q->vm->xef;
-
 	/*
 	 * Only sample the first LRC. For parallel submission, all of them are
 	 * scheduled together and we compensate that below by multiplying by
@@ -789,7 +786,7 @@ void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
 	 */
 	lrc = &q->lrc[0];
 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
-	xef->runtime[q->class] += (new_ts - old_ts) * q->width;
+	q->runtime += (new_ts - old_ts) * q->width;
 }
 
 void xe_exec_queue_kill(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ee78d497d838..085a7dce7565 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -151,6 +151,8 @@ struct xe_exec_queue {
 	 * Protected by @vm's resv. Unused if @vm == NULL.
 	 */
 	u64 tlb_flush_seqno;
+	/** @runtime: hw engine class runtime in ticks for this exec queue*/
+	u64 runtime;
 	/** @lrc: logical ring context for this exec queue */
 	struct xe_lrc lrc[];
 };
-- 
2.34.1

