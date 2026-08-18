Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0763CC5DF70
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 10:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAECC10EABE;
	Tue, 18 Aug 2026 10:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfSHZqOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BD610EABE
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 10:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787049724; x=1818585724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mV0KyafHCKUKxhiPpY7VpQVoLYtPfHhZycNJNpf15HM=;
 b=LfSHZqOC/6fFDx5Xw4OBlROfA3EIS7iAjjFZE+jrEpI8/hSMltdN/KxY
 MkuCIQEWXoClazXbnh0f8AtCE9YIR7+KJGSBh2LPyBSIQ5rwLKYLboR/J
 GqgmWLssW26xyKNndapP7MHEKOcOTFBmxhhgsCLpU+3wcxjyH0IPg2bU+
 GwVFk7Wkc34exiiM5wlj28FLcOdTlrvLyfGbBLrrthV+FbzzWdgCMOv8u
 u7jCHXCItUo/PY0P7YtNMDDjf9vVxO0Tzq4UUsLW7HKjk5RegJRGW5Ufa
 BLhDHzfZZZzFmfGVKUNs5u74K4l6Ok5nrX0Swi7DKVZsTU+acDlLYE5nZ w==;
X-CSE-ConnectionGUID: wKxn9QpYSF6NgLf1twAASA==
X-CSE-MsgGUID: efIiAG5RSDy/crVG/O6bvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98691901"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98691901"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:42:04 -0700
X-CSE-ConnectionGUID: TfmWOlGKSv+NnKL7bZ1EJQ==
X-CSE-MsgGUID: 0Q5R3aTlQ4GP7Z2UF0SSKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="295117568"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:42:02 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V17 05/12] drm/xe: Guard teardown paths against purged BOs
Date: Tue, 18 Aug 2026 16:11:00 +0530
Message-ID: <20260818104055.3833974-19-tejas.upadhyay@intel.com>
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

