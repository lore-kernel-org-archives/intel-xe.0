Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C669C624C9
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B384910E634;
	Mon, 31 Aug 2026 06:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TldxMG4S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4288310E615
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159067; x=1819695067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F/HkHoKY8y3LsYdiatBCROMcEddK2BymCNq6/qrjRhU=;
 b=TldxMG4SuhX4Pimbu/72xZAckdz2xcxjZYBaHEw6Nau4b/1HimakXDHs
 DfIT4TzFOHWZwiMDtJdvy3McVnFTvpxe6cBODbOEDejOqY24PrwFAYCzk
 ZqFFL+XuK6EFdSFU/75lr5yjgIWTvBDdctcJm2/xQEfwz8Y8Wq/2KfnJ9
 MLgImtSxgmHg4lD3WiF9symwm+FOaMZbwmKqFIZFsaHJ5kWAgfX6etWXn
 MGk5ru0KJTEG1OTG4+M49pkD7iO7lz/Miu7pfFAivJWQPGcErbfnzGJY8
 DUL56YoezIWJkAyGzpkJTVm9qLLkg94E0ZnPNbe2ycT/yXEd26zVtuUxd Q==;
X-CSE-ConnectionGUID: DPN49+K/RSmSUr9DMT2SHw==
X-CSE-MsgGUID: 4mr2bx/qQNOTQTD0fFhlRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106081708"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106081708"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:17 -0700
X-CSE-ConnectionGUID: aaEGME9WRXePn/xIt65RwQ==
X-CSE-MsgGUID: UwAwVNipQ8C9M3MBx3HcSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="269302846"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:15 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V19 06/15] drm/xe: Guard teardown paths against purged BOs
Date: Mon, 31 Aug 2026 12:19:48 +0530
Message-ID: <20260831064942.315720-23-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260831064942.315720-17-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
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

v4(Sashiko):
- Move bo purge check in xe_bo_unpin() to handle all instances
v3(Sashiko):
- Remove dma_resv is already held
v2(Himal):
- take dma_resv lock before calling xe_bo_is_purged()

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 3 +++
 drivers/gpu/drm/xe/xe_dma_buf.c    | 3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c255327669da..b162753cebb7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3267,6 +3267,9 @@ void xe_bo_unpin(struct xe_bo *bo)
 	struct ttm_place *place = &bo->placements[0];
 	struct xe_device *xe = xe_bo_device(bo);
 
+	if (xe_bo_is_purged(bo))
+		return;
+
 	xe_assert(xe, !bo->ttm.base.import_attach);
 	xe_assert(xe, xe_bo_is_pinned(bo));
 
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
index 91ed6c0fac84..91e4f3cb5617 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1572,8 +1572,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
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
-- 
2.52.0

