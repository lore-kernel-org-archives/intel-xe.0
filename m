Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F91EC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DC410E140;
	Thu,  3 Sep 2026 16:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHAGuzDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C8F10E140
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 16:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788452186; x=1819988186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9XsWCITvGtKNQJ8y9WAXy45Ckhxd5siGQK339YInmBw=;
 b=CHAGuzDjz2ofHP1kCwj/f4FLduQRM9hMwy1SerS78+A67h0CmnqJqO6x
 G4cril1JlGSPoOLCBFueXQQmqo8YvHi8lw25g2/HZXRLHIAGxxxqbrTcq
 w3Sc1iXp4FE2G0ZOqxzDnn06NteQ5Dmpsyf2UqwFfVTcH4MkuOWwLExEk
 JieCFGloobHCN5UTdlGcb72FaOZAq412WWc96Vi/AFoQ5a+hBCVpisqOs
 xJXmkN0PG9EzQX0Jko7hgw2HbuhnhMoZEZ8eH6blLN1CM5r0PpUtX7IhD
 jg/eeXd8AjuEHYqiwYigBmUdInYvgZGzVGIVzNczi6RUXRJuoToKsheye w==;
X-CSE-ConnectionGUID: QRX7tyegRmOxoukypinYMA==
X-CSE-MsgGUID: 90ecLe84RreMDAI9ws4ZxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="114487020"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="114487020"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:25 -0700
X-CSE-ConnectionGUID: J9N2A8WuRhSMmblv0rMFzA==
X-CSE-MsgGUID: EUg8wbJvRSeDWEuRQ8PVKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268461482"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:24 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V21 06/15] drm/xe: Guard teardown paths against purged BOs
Date: Thu,  3 Sep 2026 21:45:59 +0530
Message-ID: <20260903161553.528932-23-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260903161553.528932-17-tejas.upadhyay@intel.com>
References: <20260903161553.528932-17-tejas.upadhyay@intel.com>
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

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
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
index f3ea4807ac33..e63559a2f582 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1630,8 +1630,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
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

