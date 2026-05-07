Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264C7CD37A7
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892CA10F206;
	Thu,  7 May 2026 16:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGjRwP4k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B3710F207
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778170825; x=1809706825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nWkaThPzDFFc2rb5y3NZQcXF1FTqhwCyAvTw4NJo2hQ=;
 b=gGjRwP4k+PGMdJ5z/u8B0jyUK8KtPgv/m7MX2OW5ynRqC3jZsyySskf6
 Zv/jWwe0bUjdJ+OpTsTJY035CpIU/CHWpE2Hjjqgnr5yGGP7nWxf6Vt+8
 w9njino0leBRC5GtvJIGtrlRwQIrnbG0g6pAeSLTC8+p+3Xcdgqbw8z+9
 6exbLoJNXILmWbJn2fby3vTYD82N8Su0H0wYqRtY3NlWJ6r3bJxeNoHwV
 Gjzq4qiXkGBn/94nBJWnDot9x0Q/br+c+HQ4c9l1w4z0rP8/nRdtw+Ho3
 r7H7iHCNnu82uySbcThAHzI5UBs2XDqIgRk7DTNyPxvAFWBVKIH/1COII g==;
X-CSE-ConnectionGUID: Zl/7v7VJSW6knus040EJgQ==
X-CSE-MsgGUID: o9YzY6JlTHmSZPfFp/9OaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79063603"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79063603"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
X-CSE-ConnectionGUID: CBcmpwiaT3mrhjfy+N2oAw==
X-CSE-MsgGUID: 1zf2WqIJQoiw719gzu7a2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="266876575"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v5 05/11] drm/xe/multi_queue: Store primary LRC and position
 info in LRC
Date: Thu,  7 May 2026 09:20:22 -0700
Message-ID: <20260507162016.3888309-18-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
References: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
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
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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

v5:
- Drop primary_context_desc and pos from lrc snapshot (Niranjana)
- Fix checkpatch warning
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 7 ++++++-
 drivers/gpu/drm/xe/xe_lrc.h        | 5 +++++
 drivers/gpu/drm/xe/xe_lrc_types.h  | 8 ++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 62a75c8fe72f..1b5ca3ce578a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -275,8 +275,12 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
 {
 	xe_assert(gt_to_xe(q->gt), idx < q->width);
 
-	scoped_guard(spinlock, &q->lrc_lookup_lock)
+	scoped_guard(spinlock, &q->lrc_lookup_lock) {
 		q->lrc[idx] = lrc;
+		if (xe_exec_queue_is_multi_queue(q))
+			q->lrc[idx]->multi_queue.primary_lrc =
+				q->multi_queue.group->primary->lrc[0];
+	}
 }
 
 /**
@@ -907,6 +911,7 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
 	}
 
 	q->multi_queue.pos = pos;
+	q->lrc[0]->multi_queue.pos = pos;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index d280e6572398..557dce004d48 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -91,6 +91,11 @@ static inline size_t xe_lrc_ring_size(void)
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

