Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C11CD3435
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 00:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E7E10F64F;
	Sat,  2 May 2026 00:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGE7KUx/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E05910E281
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777683221; x=1809219221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AXw0RaKbc4SF/tsuE1AVrNvfD0krMM/5UzDDVENMSPk=;
 b=VGE7KUx/IWJkOj52PMQsPoEy7wxKE0Mz3gSZbjGZKDoypNqq7N2gOHSO
 lRBtsrP+Z95XBHHYm/fVTWTFt9nQcsAVB3C8Njw4qa+p3hnVrY/gvzUDv
 eCGd97Yqo+v1Ssx7/2ZXlehIGg4lW+JFueH5Y0jjSWr7NvIKMtl8pWjPe
 Y47tyNV8Ua0mnSKM7a9UGJ6EGk4PjotRq+dTWc5boUqj9wD1qOuSy5aDF
 hnXnEE2DPSc9mD37Jcy4lIVg3mQM3Kl6ZqbV8Wr7aco77fSUBYbizdrgF
 mJSq+hwmY//AeuCb0Gfw4GuwLjTuThhsO4abCE9CEPQiBaq/JuvZUk2sE g==;
X-CSE-ConnectionGUID: hne4GYErTcaJikKqIodkEw==
X-CSE-MsgGUID: bLJEbzoZS9OUqCvv58haDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78841558"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="78841558"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:40 -0700
X-CSE-ConnectionGUID: d22A3iErT6OhTXlih0aODw==
X-CSE-MsgGUID: sIR027u5Tx+vV/SDY2j93A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="228510943"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v2 3/9] drm/xe/multi_queue: Store primary LRC and position
 info in LRC
Date: Fri,  1 May 2026 17:53:36 -0700
Message-ID: <20260502005332.3135977-14-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
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

Given an LRC belonging to the secondary queue, in order to check if its
context group is active, we need to check the LRC of the primary queue.
In addition to that we want to compare the secondary queue position to
CSMQDEBUG register to check if the queue itself is active.

To do so, store primary LRC and position information in the LRC as well
as take a reference to the primary LRC from each LRC in the queue group.

A note on references involved:

- In general the Queue takes a ref on its LRC.
- In addition, for multi-queue,
a. Primary Queue takes a ref for each Secondary LRC.
b. Each Secondary Queue takes a ref to the Primary Queue

In the current patch, each LRC in the queue group is storing a pointer
to Primary LRC. There is a small window of time in the primary queue
free path where the primary LRC may be freed before the secondary LRC.

__xe_exec_queue_fini(q); // frees|puts primary q LRCs
...
window where secondary Q LRC is pointing to invalid primary LRC
...
__xe_exec_queue_free(q); // frees|puts secondary q LRCs in multi-Q case

In this window the reference in Secondary LRC is invalid. While there
may be nothing accessing the secondary LRCs reference, to be safe, this
patch is taking a reference to Primary LRC from the secondary LRC.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2:
- Store primary LRC instead of primary queue (Niranjana)
- Drop the valid flag and check if primary_lrc is NULL (Niranjana)
- Document/Revisit references (Matt/Umesh)
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 23 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_lrc.h        |  5 +++++
 drivers/gpu/drm/xe/xe_lrc_types.h  |  8 ++++++++
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b287d0e0e60a..e34601d28520 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -129,8 +129,14 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
 		return;
 
 	/* Primary queue cleanup */
-	xa_for_each(&group->xa, idx, lrc)
+	xa_for_each(&group->xa, idx, lrc) {
+		/* drop secondary lrc ref to primary lrc */
+		xe_lrc_put(lrc->multi_queue.primary_lrc);
+		/* drop primary queue ref to secondary lrc */
 		xe_lrc_put(lrc);
+	}
+	/* drop primary lrc ref to itself */
+	xe_lrc_put(q->lrc[0]);
 
 	xa_destroy(&group->xa);
 	mutex_destroy(&group->list_lock);
@@ -275,8 +281,15 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
 {
 	xe_assert(gt_to_xe(q->gt), idx < q->width);
 
-	scoped_guard(spinlock, &q->lrc_lookup_lock)
+	scoped_guard(spinlock, &q->lrc_lookup_lock) {
 		q->lrc[idx] = lrc;
+		if (xe_exec_queue_is_multi_queue(q)) {
+			struct xe_lrc *primary_lrc = q->multi_queue.group->primary->lrc[0];
+
+			lrc->multi_queue.pos = q->multi_queue.pos;
+			lrc->multi_queue.primary_lrc = xe_lrc_get(primary_lrc);
+		}
+	}
 }
 
 /**
@@ -388,8 +401,12 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 
 			xe_exec_queue_set_lrc(q, lrc, i);
 
-			if (__lrc)
+			if (__lrc) {
+				if (xe_exec_queue_is_multi_queue(q))
+					xe_lrc_put(__lrc->multi_queue.primary_lrc);
+
 				xe_lrc_put(__lrc);
+			}
 			__lrc = lrc;
 
 		} while (marker != xe_vf_migration_fixups_complete_count(q->gt));
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 97aef0327fc8..3d0bf4a7bfa0 100644
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
2.43.0

