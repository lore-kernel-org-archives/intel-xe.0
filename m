Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9429EC5DF74
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 06:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F8D10E663;
	Mon, 17 Aug 2026 06:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3yg349q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD39E10E663
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 06:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786949477; x=1818485477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mV0KyafHCKUKxhiPpY7VpQVoLYtPfHhZycNJNpf15HM=;
 b=M3yg349qRweRVLnGkvCPLZXuEaAFOaKOozhSuz2T5/nL4egzo+dQyckk
 kO1+W/rVXuvJk+M3iN51rsB/iA4kXpK0q/qfaBopcMrxxEVoCCYi7xsOJ
 WJ7ziifrryCpM9ox30aHxznpRr59p8NPMUOW4H68WhD1jP0fQ/PdDIb5o
 /fxh/kE1WnOa40YRo9pJTx+kJUgLM2eUUFfWWFFhMg1yVZiZ1eUlJVDTB
 Z7Nqwdmg9/7l9RpMy17eDn2WFtoj89V8/P4ty3dWfikLlzzX/gwvrfuGa
 4LCGKwescpEUTBbLQfW3hn4OHoWyYGHoAB5fjLbnat3JFGuE78zsb9jMg Q==;
X-CSE-ConnectionGUID: Armkj9UHSDCm0qT8LyfHTQ==
X-CSE-MsgGUID: DAvYfXjCQUigzs2tImTGhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91289554"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="91289554"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 23:51:17 -0700
X-CSE-ConnectionGUID: fCeB6iK7RwKnajghgHBe0w==
X-CSE-MsgGUID: d3tQrN8NS0utn0PwSItYpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="264383792"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 23:51:15 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V16 05/12] drm/xe: Guard teardown paths against purged BOs
Date: Mon, 17 Aug 2026 12:21:00 +0530
Message-ID: <20260817065055.3734576-19-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
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

VRAM page offlining can purge BOs that are still referenced by page
tables, exec queues, and DMA-buf exports. Add xe_bo_is_purged()
guards in the teardown paths to prevent unpinning or mapping an
already-purged BO:

- xe_bo_unpin_map_no_vm(): skip unpin if purged
- xe_dma_buf_map(): return -ENOENT early if purged
- xe_exec_queue_update_run_ticks(): skip LRC timestamp read if purged
- xe_pt_destroy(): skip unpin if purged

v2(Himal):
- take dma_resv lock before calling xe_bo_is_purged()

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h         | 3 ++-
 drivers/gpu/drm/xe/xe_dma_buf.c    | 3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++--
 drivers/gpu/drm/xe/xe_pt.c         | 5 ++++-
 4 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index eede678ad303..dfcd0e57073b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -364,7 +364,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
 	if (likely(bo)) {
 		xe_bo_lock(bo, false);
-		xe_bo_unpin(bo);
+		if (!xe_bo_is_purged(bo))
+			xe_bo_unpin(bo);
 		xe_bo_unlock(bo);
 
 		xe_bo_put(bo);
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index bf0728838ead..5d9f1cd24b7f 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -104,6 +104,9 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 	struct sg_table *sgt;
 	int r = 0;
 
+	if (xe_bo_is_purged(bo))
+		return ERR_PTR(-ENOENT);
+
 	if (!attach->peer2peer && !xe_bo_can_migrate(bo, XE_PL_TT))
 		return ERR_PTR(-EOPNOTSUPP);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d6c7f346f49b..5432710c1cfb 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1575,8 +1575,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	 * errors.
 	 */
 	lrc = q->lrc[0];
-	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
-	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
+	xe_bo_lock(lrc->bo, false);
+	if (!xe_bo_is_purged(lrc->bo)) {
+		new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
+		q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
+	}
+	xe_bo_unlock(lrc->bo);
 
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5d990c1c3740..b6575a6bada4 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -212,7 +212,10 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 		return;
 
 	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
-	xe_bo_unpin(pt->bo);
+	xe_bo_lock(pt->bo, false);
+	if (!xe_bo_is_purged(pt->bo))
+		xe_bo_unpin(pt->bo);
+	xe_bo_unlock(pt->bo);
 	xe_bo_put_deferred(pt->bo, deferred);
 
 	if (pt->level > 0 && pt->num_live) {
-- 
2.52.0

