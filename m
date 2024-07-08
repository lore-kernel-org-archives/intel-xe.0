Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36490C41513
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 20:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C5210E408;
	Mon,  8 Jul 2024 20:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZzknY1d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B2F10E408
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 20:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720470070; x=1752006070;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FXYZpgMEnjzigqw/E6Pdr88CkT9wEQXGnJKnID1vu5c=;
 b=WZzknY1dleNCYT53W10bs7n6v6TOaGBQMcK5JET9cdXCCmHHgMYWiO/J
 Ruuioz0qqS/mV4w/jZJuZTlRN9BiVREl8erl4qprudhQRPyk8CES4j3Fu
 Tl4ulJcK6RyV1WZr8/FoMCPRzcmv7wMtIzEQEHUVegiacyzoLuGnaaWVW
 U7yuzNbMbKq/EcYdBApDe8e91x6uxZMW1j0+Of4Vm+IB5RwhGDFFyUfs6
 IxxzV2SrTVEM9InW32wyApuY7B/wVD7I5MaMZ1haJPDhqmn25/0bDaPHY
 K2nwbjHJNwEAyt+uiWY4vY5EH+dnG9GHDVBgKjGuBMGVj+pewFUC5m3kk A==;
X-CSE-ConnectionGUID: tMj3U9QtSi6B6QP2pufe8A==
X-CSE-MsgGUID: wdXmf5ZJQ8GwDDo/nZEBwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="43114143"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="43114143"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 13:21:09 -0700
X-CSE-ConnectionGUID: q15H12lYQsmkwuVgWS1crg==
X-CSE-MsgGUID: LdrTN1EBQ9ONlhrbJeO4DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47495022"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 13:21:08 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH 5/5] Revert "drm/xe: Do not access xe file when updating exec
 queue run_ticks"
Date: Mon,  8 Jul 2024 13:21:03 -0700
Message-Id: <20240708202103.3347869-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
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

This reverts commit ce62827bc294ba5f8b3909bfa5d7dbf9de8aab6b.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c       | 5 +----
 drivers/gpu/drm/xe/xe_exec_queue.c       | 5 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 4 ----
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 6a26923fa10e..7ddd59908334 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
 	/* Accumulate all the exec queues from this client */
 	mutex_lock(&xef->exec_queue.lock);
-	xa_for_each(&xef->exec_queue.xa, i, q) {
+	xa_for_each(&xef->exec_queue.xa, i, q)
 		xe_exec_queue_update_run_ticks(q);
-		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
-		q->old_run_ticks = q->run_ticks;
-	}
 	mutex_unlock(&xef->exec_queue.lock);
 
 	/* Get the total GPU cycles */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b01eccdd75ba..719a70878fe2 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -768,6 +768,7 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
  */
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 {
+	struct xe_file *xef;
 	struct xe_lrc *lrc;
 	u32 old_ts, new_ts;
 
@@ -779,6 +780,8 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	if (!q->vm || !q->vm->xef)
 		return;
 
+	xef = q->vm->xef;
+
 	/*
 	 * Only sample the first LRC. For parallel submission, all of them are
 	 * scheduled together and we compensate that below by multiplying by
@@ -789,7 +792,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	 */
 	lrc = q->lrc[0];
 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
-	q->run_ticks += (new_ts - old_ts) * q->width;
+	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
 }
 
 void xe_exec_queue_kill(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index f768e48f31e4..b5343cdd0632 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -142,10 +142,6 @@ struct xe_exec_queue {
 	 * Protected by @vm's resv. Unused if @vm == NULL.
 	 */
 	u64 tlb_flush_seqno;
-	/** @old_run_ticks: prior hw engine class run time in ticks for this exec queue */
-	u64 old_run_ticks;
-	/** @run_ticks: hw engine class run time in ticks for this exec queue */
-	u64 run_ticks;
 	/** @lrc: logical ring context for this exec queue */
 	struct xe_lrc *lrc[];
 };
-- 
2.38.1

