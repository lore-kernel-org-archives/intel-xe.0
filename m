Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93952F364BF
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 20:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B4110E834;
	Thu,  9 Apr 2026 20:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JyV3+btz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8595310E052
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 20:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775767041; x=1807303041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M+jv38BVhbfJtMgZ1BvlEFk0McBorUMjm/u9cF9QxDI=;
 b=JyV3+btzIcjXla4f1MjC7NAEYl1Yn06FOMTA2Svk8slFcVFlTdiJ2vjy
 JMyDmZ9E/CS3UNBozmOdCEQmRSrgt+rJUYzfRtat/7mLOg+HCtOunoqMj
 U+02ngujEitHxESjkmA7W9VxWoBmNeH+rnwkLGmZtUgNQv2fnlcu2DIyb
 e0kbVYUIiHeqeJ1X2KnLxgtRbaPq5RR0/dU5sUMp+FPQ9CNCLUNe+3GHM
 /HuEZpl4jaTMDhXyVhlAS15ePa6AU8ohkOFPbW29I76tQnuZPnAkLJdVD
 J2tNXYnD11afkUdqjVDm62U67fGwhB6cR6hH+TtwNeUylRqVEnr2Jruo1 A==;
X-CSE-ConnectionGUID: h1uGXSbmQJi5hGRTU3XtpA==
X-CSE-MsgGUID: 45Y3PwYfRsuDIiuWYM73fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76692621"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76692621"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:21 -0700
X-CSE-ConnectionGUID: XAPjJs7lTAW2QdsN9w8i2Q==
X-CSE-MsgGUID: Qkwq1vkoS/CHuykd4iEIww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="227881116"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH 1/5] drm/xe/multi_queue: Store primary queue and position info
 in LRC
Date: Thu,  9 Apr 2026 13:37:16 -0700
Message-ID: <20260409203714.1887402-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
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

To do so, store primary queue and position information int the LRC.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  8 +++++++-
 drivers/gpu/drm/xe/xe_lrc.h        |  5 +++++
 drivers/gpu/drm/xe/xe_lrc_types.h  | 10 ++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b287d0e0e60a..4fb02eda77b4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -275,8 +275,14 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
 {
 	xe_assert(gt_to_xe(q->gt), idx < q->width);
 
-	scoped_guard(spinlock, &q->lrc_lookup_lock)
+	scoped_guard(spinlock, &q->lrc_lookup_lock) {
 		q->lrc[idx] = lrc;
+		if (xe_exec_queue_is_multi_queue(q)) {
+			lrc->multi_queue.primary = q->multi_queue.group->primary;
+			lrc->multi_queue.pos = q->multi_queue.pos;
+			lrc->multi_queue.valid = 1;
+		}
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index e7c975f9e2d9..b544c8169967 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -90,6 +90,11 @@ static inline size_t xe_lrc_ring_size(void)
 	return SZ_16K;
 }
 
+static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
+{
+	return lrc->multi_queue.valid;
+}
+
 size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 5a718f759ed6..93972536214a 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -63,6 +63,16 @@ struct xe_lrc {
 
 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
 	u64 ctx_timestamp;
+
+	/** @multi_queue: Multi queue LRC related information */
+	struct {
+		/** @multi_queue.primary: Primary queue corresponding to this LRC */
+		struct xe_exec_queue *primary;
+		/** @multi_queue.valid: LRC belongs to a multi queue group */
+		u8 valid;
+		/** @multi_queue.pos: Position of LRC within the multi-queue group */
+		u8 pos;
+	} multi_queue;
 };
 
 struct xe_lrc_snapshot;
-- 
2.43.0

