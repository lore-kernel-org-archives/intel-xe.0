Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F1D3B7FC
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 03:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0200C10E47F;
	Tue,  9 Dec 2025 03:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXrFrvVv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E8F10E37F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 03:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250465; x=1796786465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g++0e1ZMZWH6LvcRM0/3zzRxHmq3NeCaygZYCdJz8ok=;
 b=hXrFrvVv9ecE+UzMVWDt7UpxPHSIfNJ+CPD3lhs/6A49kd2ezoV6yKOH
 HPJQe9qYQgt3E8ALh1C+mePQHWDsXHOB7ZetSQzXO9vAg+GV+k5P9FJTH
 QCANtqFZEDUvZ8tdDoOJ4BJv9H/RCwS5QQhCGQ7a7pMLT93fZZGv91q/K
 NgB6AgEda9E8lDppjQDRUZZ+erZq4GQweQULgw3l9QSixQohfiFYKH/Tb
 71mFnJ8p4omWhq5IwARlexAENs6k/ffE/MN0Mm1hpA8jnNcji36g4a4Qd
 Jj1hSzCshgMcll85Q5dN9RS42bahDOizevpd6FEa9BZwd7cqU1GafYK87 w==;
X-CSE-ConnectionGUID: XytP5iF4QqmHxnYa9jjn+w==
X-CSE-MsgGUID: O6u0kyCiSOCbTphIW+wiDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67254145"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67254145"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:05 -0800
X-CSE-ConnectionGUID: XD+B4+k4T72RAJnK++OZbw==
X-CSE-MsgGUID: IxDs/AmNTSyZ/Wa638T5YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200289635"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:05 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v4 08/18] drm/xe/multi_queue: Add multi queue information to
 guc_info dump
Date: Mon,  8 Dec 2025 19:20:58 -0800
Message-ID: <20251209032055.1539229-28-niranjana.vishwanathapura@intel.com>
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

Dump multi queue specific information in the guc exec queue
dump.

v2: Move multi queue related fields inside the multi_queue
    sub-structure (Matt Brost)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ce00e51a79aa..0282c8642a13 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3098,6 +3098,11 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	if (snapshot->parallel_execution)
 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
 
+	if (xe_exec_queue_is_multi_queue(q)) {
+		snapshot->multi_queue.valid = true;
+		snapshot->multi_queue.primary = xe_exec_queue_multi_queue_primary(q)->guc->id;
+		snapshot->multi_queue.pos = q->multi_queue.pos;
+	}
 	spin_lock(&sched->base.job_list_lock);
 	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
 	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
@@ -3180,6 +3185,11 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 	if (snapshot->parallel_execution)
 		guc_exec_queue_wq_snapshot_print(snapshot, p);
 
+	if (snapshot->multi_queue.valid) {
+		drm_printf(p, "\tMulti queue primary GuC ID: %d\n", snapshot->multi_queue.primary);
+		drm_printf(p, "\tMulti queue position: %d\n", snapshot->multi_queue.pos);
+	}
+
 	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
 	     i++)
 		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index dc7456c34583..25e29e85502c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -135,6 +135,19 @@ struct xe_guc_submit_exec_queue_snapshot {
 		u32 wq[WQ_SIZE / sizeof(u32)];
 	} parallel;
 
+	/** @multi_queue: snapshot of the multi queue information */
+	struct {
+		/**
+		 * @multi_queue.primary: GuC id of the primary exec queue
+		 * of the multi queue group.
+		 */
+		u32 primary;
+		/** @multi_queue.pos: Position of the exec queue within the multi queue group */
+		u8 pos;
+		/** @valid: The exec queue is part of a multi queue group */
+		bool valid;
+	} multi_queue;
+
 	/** @pending_list_size: Size of the pending list snapshot array */
 	int pending_list_size;
 	/** @pending_list: snapshot of the pending list info */
-- 
2.43.0

