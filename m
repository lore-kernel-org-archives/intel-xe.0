Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C40C3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 10:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432EE10E264;
	Wed, 14 Aug 2024 10:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l53T7Xq3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CCE10E264
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723630726; x=1755166726;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m7xL6HET5M74cvtFiqb1JLRUQeU9qGOaf8cgP4Q/wOQ=;
 b=l53T7Xq3fwvVZrMlyzwsJH8MMjCHOHJVY/Le6lYbfR7fPZN5EBZkwq9u
 YT5A6BNE72OqhRUXxgx+8q/JHMPsl8NF2+Rp50FysfbcZmMw8xYYkxAyZ
 E9H6156FY1gtmeiVbv9tq07KvHWR6V6ulH1eF8OsJCcVl5HbP52b7giff
 BPqJO4jGA0DDgRIFXxXnizTSy8GYS+HvWxYrOryGN78n2PQBsoG4+Wnth
 qHeNZWSsIuMt1kISZTTwQ1m+0ZjMzLY/0xE9X4TKHzeslzZiG/XHKHbG9
 PckVd4hcM/BJ9MRNNzKvyLASp/zD4CSe65yxdHRMlCs6GCGurmreR97ks g==;
X-CSE-ConnectionGUID: C9yOqmvUR9e14MC2sIWIWA==
X-CSE-MsgGUID: fd/NhYI1RVeqewvhi0hL2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33243351"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="33243351"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 03:18:45 -0700
X-CSE-ConnectionGUID: FPeA9VE4RHar61YjBZjuQg==
X-CSE-MsgGUID: +DZih79/RnqkSu/zHYs2qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="82186596"
Received: from singhapo-nuc7i7bnh.iind.intel.com ([10.145.169.50])
 by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2024 03:18:44 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH] drm/xe: Add NULL check before deferencing pointer
Date: Wed, 14 Aug 2024 15:47:50 +0530
Message-Id: <20240814101750.857665-1-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Apoorva Singh <apoorva.singh@intel.com>

- Add NULL check before deferencing of lrc->bo in
  xe_lrc_snapshot_capture()

Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 974a9cd8c379..e31d9bc64ff6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1652,20 +1652,24 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (lrc->bo && lrc->bo->vm)
 		xe_vm_get(lrc->bo->vm);
 
-	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
-	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
-	snapshot->head = xe_lrc_ring_head(lrc);
-	snapshot->tail.internal = lrc->ring.tail;
-	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
-	snapshot->start_seqno = xe_lrc_start_seqno(lrc);
-	snapshot->seqno = xe_lrc_seqno(lrc);
-	snapshot->lrc_bo = xe_bo_get(lrc->bo);
-	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
-	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
-	snapshot->lrc_snapshot = NULL;
-	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
-	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
-	return snapshot;
+	if (lrc->bo) {
+		snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
+		snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
+		snapshot->head = xe_lrc_ring_head(lrc);
+		snapshot->tail.internal = lrc->ring.tail;
+		snapshot->tail.memory = xe_lrc_ring_tail(lrc);
+		snapshot->start_seqno = xe_lrc_start_seqno(lrc);
+		snapshot->seqno = xe_lrc_seqno(lrc);
+		snapshot->lrc_bo = xe_bo_get(lrc->bo);
+		snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
+		snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
+		snapshot->lrc_snapshot = NULL;
+		snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
+		snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
+		return snapshot;
+	}
+	kfree(snapshot);
+	return NULL;
 }
 
 void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
-- 
2.34.1

