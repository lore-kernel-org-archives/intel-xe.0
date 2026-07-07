Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBBAC43602
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 13:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18EC10ECF1;
	Tue,  7 Jul 2026 13:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mLPf2Per";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB22310ECED
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783429606; x=1814965606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WRJ75GUTXF+5zJL3Os9LtGBQw50IR9hPknxvAoOlwwQ=;
 b=mLPf2PerG0TFzWK6Mb6E/8YCCbob4/e4sPgJ/mekqSW+E0DpPiWkut9h
 GcEk3/yMeohMxSTjJ8hN/SIwuZRdd+/1GQsfFWTnNNl9TBfYrmqzSAF5x
 Ujah2EJZRiXg3VbJGeQ2Khg56vBwRDAedQ3awEorpasD3inLT/8BKkpsh
 D86is2aZ8GdZ6l8kNhNO+97b6StmBi44s7fXEOhxCkmwJCb+VT7qfNCBQ
 jis7j4oPednlT3sQOR7CnQVF98e7w4WQyKt52bvtyoG0m1FX8RjKkB7m3
 juaQn3s3eaZuNuEWZ0DoEpMyxvs8+60M4kpFYU0t9dGoCqJoEdV0HdobA w==;
X-CSE-ConnectionGUID: Om4engE7S6O177KLYPCWcQ==
X-CSE-MsgGUID: s5eeQAgjS4W6JktApUEmHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84050117"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84050117"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 06:06:46 -0700
X-CSE-ConnectionGUID: A89SiY1jQEaMRcqnkDvP+g==
X-CSE-MsgGUID: R9V2O+NMQO+ALyBAGlvkpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="250006195"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 06:06:44 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V11 03/11] drm/xe: Link LRC BO and its execution Queue
Date: Tue,  7 Jul 2026 18:36:16 +0530
Message-ID: <20260707130617.970638-16-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260707130617.970638-13-tejas.upadhyay@intel.com>
References: <20260707130617.970638-13-tejas.upadhyay@intel.com>
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

To establish a link between an LRC BO (Logical Ring Context
Buffer Object) and its corresponding execution Queue in the
drm/xe driver, you need to store a back-pointer to the queue
within the BO's private data structure. This allows the
driver to identify and take corrective action on the specific
queue if the LRC BO encounters an error (e.g., memory
corruption or eviction issues).

V2(MattB):
- Handle multiqueue

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h   | 3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c | 5 +++++
 drivers/gpu/drm/xe/xe_lrc.c        | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index fcc63ae3f455..3d456f0fc14e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -20,6 +20,7 @@
 struct xe_device;
 struct xe_mem_pool_node;
 struct xe_vm;
+struct xe_exec_queue;
 
 #define XE_BO_MAX_PLACEMENTS	3
 
@@ -40,6 +41,8 @@ struct xe_bo {
 	u32 flags;
 	/** @vm: VM this BO is attached to, for extobj this will be NULL */
 	struct xe_vm *vm;
+	/** @q: Queue this BO is attached to, mostly for LRC BO, NULL otherwise */
+	struct xe_exec_queue *q;
 	/** @tile: Tile this BO is attached to (kernel BO only) */
 	struct xe_tile *tile;
 	/** @placements: valid placements for this BO */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b5ca3ce578a..835d2f336777 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -390,6 +390,11 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 				goto err_lrc;
 			}
 
+			/*
+			 * The queue ref counts the LRCs, thus it safe for the LRC BO to hold a
+			 * pointer to queue without reference.
+			 */
+			lrc->bo->q = xe_exec_queue_multi_queue_primary(q);
 			xe_exec_queue_set_lrc(q, lrc, i);
 
 			if (__lrc)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3e7c995085d0..27b0037a1cf8 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1066,6 +1066,7 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 static void xe_lrc_finish(struct xe_lrc *lrc)
 {
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
+	lrc->bo->q = NULL;
 	xe_bo_unpin_map_no_vm(lrc->bo);
 	xe_bo_unpin_map_no_vm(lrc->seqno_bo);
 }
-- 
2.52.0

