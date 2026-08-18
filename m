Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7911C5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 10:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDB410EAB6;
	Tue, 18 Aug 2026 10:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVZYVnFv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDF210EAB6
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 10:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787049720; x=1818585720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RbWh2wKrRIrRA+DOE4wuQX3UMBrye5InTonZcRezolU=;
 b=AVZYVnFvA/9CB8x2mB83pFpVIrJ59GLl73pEqARCVntePLh57Ykap2vJ
 kACYhf3lQ+PXscp90Hgcz6Azrm1hqhTGObVUlAKg8TEAGHv1/CvcrDJeU
 duPB5iN+n7lYmxXhXtMseQ1VDpyoideBRfVim5tScXUQa/VQXfO+WO/3u
 RAWa39Lap3KqM4coaM4G/Fb3o2kimdhbn22OEMFvoZP5B2qMCRAGdr/7+
 AW571MxdIEgXlL1xLlhYhOJ/5/8CqJWcIUmZUuHXBkx9Ag6Fyks43ZgZb
 Ua4Q44hdovqcSh0ifFBUweqDz76z5g5qxlAmS6fG2Xq6v/Ua0JYDHef9M A==;
X-CSE-ConnectionGUID: wDMDo79TQIKKZTbfD/VRcQ==
X-CSE-MsgGUID: DVzjlgK8Q4CQ7XUhgn4tkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98691891"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98691891"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:42:00 -0700
X-CSE-ConnectionGUID: 64pvESzDSFyppxvlGmnyDA==
X-CSE-MsgGUID: llVI+AfqSTSxOkhCB0et2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="295117542"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:41:58 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V17 02/12] drm/xe: Link LRC BO and its execution Queue
Date: Tue, 18 Aug 2026 16:10:57 +0530
Message-ID: <20260818104055.3833974-16-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
References: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
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

V3(Sashiko):
- Placeholder of 8 byte for non-lrc bo is acceptable
- Assign bo-q is safe just use READ_ONCE/WRITE_ONCE
V2(MattB):
- Handle multiqueue

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h   | 3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c | 6 ++++++
 drivers/gpu/drm/xe/xe_lrc.c        | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index e45f24301050..a9c48e440669 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -20,6 +20,7 @@
 struct xe_device;
 struct xe_mem_pool_node;
 struct xe_vm;
+struct xe_exec_queue;
 
 #define XE_BO_MAX_PLACEMENTS	3
 
@@ -42,6 +43,8 @@ struct xe_bo {
 	u32 flags;
 	/** @vm: VM this BO is attached to, for extobj this will be NULL */
 	struct xe_vm *vm;
+	/** @q: Queue this BO is attached to, mostly for LRC BO, NULL otherwise */
+	struct xe_exec_queue *q;
 	/** @tile: Tile this BO is attached to (kernel BO only) */
 	struct xe_tile *tile;
 	/** @placements: valid placements for this BO */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 9f3d022a1463..d6c7f346f49b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -390,6 +390,12 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 				goto err_lrc;
 			}
 
+			/*
+			 * The queue ref counts the LRCs, thus it safe for the LRC BO to hold a
+			 * pointer to queue without reference.  The reader holds dma_resv (
+			 * xe_bo_lock) which serializes with xe_lrc_finish().
+			 */
+			WRITE_ONCE(lrc->bo->q, xe_exec_queue_multi_queue_primary(q));
 			xe_exec_queue_set_lrc(q, lrc, i);
 
 			if (__lrc)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 35b4e8289b5f..675902753735 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1066,6 +1066,7 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 static void xe_lrc_finish(struct xe_lrc *lrc)
 {
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
+	WRITE_ONCE(lrc->bo->q, NULL);
 	xe_bo_unpin_map_no_vm(lrc->bo);
 	xe_bo_unpin_map_no_vm(lrc->seqno_bo);
 }
-- 
2.52.0

