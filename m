Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE66CD3439
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 22:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2AA10EEF4;
	Wed,  6 May 2026 22:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuYmgsI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9856810EF04
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778106912; x=1809642912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h6euy45NAI6oJshVGCaVQnV81K9AE34cwWrymDDXKZk=;
 b=TuYmgsI3n/Cxlf/BEx0pR4jc4SDElBfUkjMkPrIFuzIgkSqlrD4uno4N
 N7rV9tNsO7efVq4rhRydgxT7tRtcVowX5+t8E3QW1j0vpo2+1OMFDrGB2
 spi+1Y3NeQbUoi3EZzOU540X+LUIj9YDnIwS4n6OqYRDuCrC/TISl8YzN
 Bj52rkdRWABPg8IJ2ZX8fsJ3WOntZE9OFDg1gBgcdyHOdrD+aW+Pe6/US
 GhYodPOEz0ukb+d0ibBKNdt46nh4YHb2TCH6d8nBVuBI5oNn53ZIQYH06
 Rx5YADBHq0qT3jum/1J6wFD+5pcFIR1ivmZhUXAcBVGTAVuyOGv1I9+HN g==;
X-CSE-ConnectionGUID: UTHIRa2YTESK6h46TbYGhA==
X-CSE-MsgGUID: 734Z1T+vTOuy0ScfvQQ9Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90429714"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="90429714"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:11 -0700
X-CSE-ConnectionGUID: H4DHc1jIQOyrKSGqoSy6Kg==
X-CSE-MsgGUID: NBNCQbx1QRa7Q1xEhKtQMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="259707476"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:11 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v4 05/11] drm/xe/multi_queue: Store primary LRC and position
 info in LRC
Date: Wed,  6 May 2026 15:35:06 -0700
Message-ID: <20260506223500.3769614-18-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
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

For an LRC belonging to the secondary queue, in order to check if its
context group is active, we need to check the LRC of the primary queue.
In addition to that we want to compare the secondary queue position to
CSMQDEBUG register to check if the queue itself is active.

To do so, store primary LRC and position information in the LRC.

A note on references involved:

- In general the Queue takes a ref on its LRC.
- In addition, for multi-queue,
a. Primary Queue takes a ref for each Secondary LRC.
b. Each Secondary Queue takes a ref to the Primary Queue

In the current patch, each LRC in the queue group is storing a pointer
to primary LRC. Both primary and secondary LRCs are freed only when
primary queue is destroyed. At this time, all secondary queues are
already destroyed, so there is no one using secondary LRCs. We should be
good without taking any additional references.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2:
- Store primary LRC instead of primary queue (Niranjana)
- Drop the valid flag and check if primary_lrc is NULL (Niranjana)
- Document/Revisit references (Matt/Umesh)

v3:
- Drop the reference logic since it's not needed (Niranjana)
- Move lrc->multi_queue initialization to a later point (Niranjana)

v4: (Niranjana)
- Set lrc[0].multi_queue.primary_lrc in xe_exec_queue_set_lrc
- Set lrc[0].multi_queue.pos in xe_exec_queue_group_add
- Include primary_context_desc and pos in snapshot
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  6 +++++-
 drivers/gpu/drm/xe/xe_lrc.c        | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  9 +++++++++
 drivers/gpu/drm/xe/xe_lrc_types.h  |  8 ++++++++
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 62a75c8fe72f..4647a24dcffb 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -275,8 +275,11 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
 {
 	xe_assert(gt_to_xe(q->gt), idx < q->width);
 
-	scoped_guard(spinlock, &q->lrc_lookup_lock)
+	scoped_guard(spinlock, &q->lrc_lookup_lock) {
 		q->lrc[idx] = lrc;
+		if (xe_exec_queue_is_multi_queue(q))
+			q->lrc[idx]->multi_queue.primary_lrc = q->multi_queue.group->primary->lrc[0];
+	}
 }
 
 /**
@@ -907,6 +910,7 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
 	}
 
 	q->multi_queue.pos = pos;
+	q->lrc[0]->multi_queue.pos = pos;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index b31525bd2a4c..3def999ce48a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2466,6 +2466,14 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
 	snapshot->ctx_timestamp_ms =
 		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
+	if (xe_lrc_is_multi_queue(lrc)) {
+		snapshot->multi_queue.primary_context_desc =
+			xe_lrc_ggtt_addr(lrc->multi_queue.primary_lrc);
+		snapshot->multi_queue.pos = lrc->multi_queue.pos;
+	} else {
+		snapshot->multi_queue.primary_context_desc = 0;
+		snapshot->multi_queue.pos = 0;
+	}
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
 	return snapshot;
 }
@@ -2521,6 +2529,12 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
 	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
+	if (snapshot->multi_queue.primary_context_desc) {
+		drm_printf(p, "\tMulti queue primary Context Desc: 0x%08x\n",
+			   snapshot->multi_queue.primary_context_desc);
+		drm_printf(p, "\tMulti queue position: %d\n",
+			   snapshot->multi_queue.pos);
+	}
 
 	if (!snapshot->lrc_snapshot)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index d280e6572398..d0deb916e4f1 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -40,6 +40,10 @@ struct xe_lrc_snapshot {
 	u64 ctx_timestamp;
 	u64 ctx_timestamp_ms;
 	u32 ctx_job_timestamp;
+	struct {
+		u32 primary_context_desc;
+		u8 pos;
+	} multi_queue;
 };
 
 #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
@@ -91,6 +95,11 @@ static inline size_t xe_lrc_ring_size(void)
 	return SZ_16K;
 }
 
+static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
+{
+	return lrc->multi_queue.primary_lrc;
+}
+
 size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 5a718f759ed6..0a5c13ec2ad7 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -63,6 +63,14 @@ struct xe_lrc {
 
 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
 	u64 ctx_timestamp;
+
+	/** @multi_queue: Multi queue LRC related information */
+	struct {
+		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
+		struct xe_lrc *primary_lrc;
+		/** @multi_queue.pos: Position of LRC within the multi-queue group */
+		u8 pos;
+	} multi_queue;
 };
 
 struct xe_lrc_snapshot;
-- 
2.51.0

