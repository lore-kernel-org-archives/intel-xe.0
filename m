Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9E5C52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 15:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E19410E373;
	Wed, 21 Aug 2024 15:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhWvSN3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FE510E31F
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 15:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724254113; x=1755790113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZbSVlEPCcX9Q7yCSI6t5/vgyW+0sBK7RkBI4j0TYz9k=;
 b=XhWvSN3ZFNdnPzU6SY8V59GtXt5qur/66EsVz3fgTr9lXQS8GIGiHHur
 da7Pvkx7UYKWA9PqWBavKlftrR3AGOHjcTbBQLk2on79nfn5McdertXGG
 UcDZCQEW3/GU5GmuFiHdPnLWNAoCCrypr/YKfxPuX2gJmMAFqBjAnMW4E
 QLGx0WWUYjTOoOlaaPl+z1L3dZKP4nVo/vlpJBaPWqnh2XNDEYHFiDCws
 FtTSuVk43nXH/MkXlrTLLZFDL7LVt5LgHP3Vzd6HCD+DCwoEl2v8yfQof
 K+KrYbKVqBFKLNd+0TxLUyGT7iTahHosoMdvfnTk/bdGExF9nYfhQrLua w==;
X-CSE-ConnectionGUID: /Z7s9KBuSWqRILB9pNZMTQ==
X-CSE-MsgGUID: vCWVc9lgQ9WTGQHWuKdI/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22427399"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22427399"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 08:28:32 -0700
X-CSE-ConnectionGUID: gq3QBcxlRai/TqnqqUVPgg==
X-CSE-MsgGUID: Ev/zYpaOQrempT0WzsMo2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61877118"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 08:28:34 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 3/7] drm/xe/oa: Add input fence dependencies
Date: Wed, 21 Aug 2024 08:28:26 -0700
Message-ID: <20240821152830.1495276-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240821152830.1495276-1-ashutosh.dixit@intel.com>
References: <20240821152830.1495276-1-ashutosh.dixit@intel.com>
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

Add input fence dependencies which will make OA configuration wait till
these dependencies are met (till input fences signal).

v2: Change add_deps arg to xe_oa_submit_bb from bool to enum (Matt Brost)

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index bf63bbc9428f2..cad8f54500a10 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -42,6 +42,11 @@
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
 #define XE_OA_UNIT_INVALID U32_MAX
 
+enum xe_oa_submit_deps {
+	XE_OA_SUBMIT_NO_DEPS,
+	XE_OA_SUBMIT_ADD_DEPS,
+};
+
 struct xe_oa_reg {
 	struct xe_reg addr;
 	u32 value;
@@ -568,7 +573,8 @@ static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
 	return ret;
 }
 
-static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
+static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, enum xe_oa_submit_deps deps,
+					 struct xe_bb *bb)
 {
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
@@ -581,11 +587,22 @@ static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_
 		goto exit;
 	}
 
+	if (deps == XE_OA_SUBMIT_ADD_DEPS) {
+		for (int i = 0; i < stream->num_syncs && !err; i++)
+			err = xe_sync_entry_add_deps(&stream->syncs[i], job);
+		if (err) {
+			drm_dbg(&stream->oa->xe->drm, "xe_sync_entry_add_deps err %d\n", err);
+			goto err_put_job;
+		}
+	}
+
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 
 	return fence;
+err_put_job:
+	xe_sched_job_put(job);
 exit:
 	return ERR_PTR(err);
 }
@@ -663,7 +680,7 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
 
 	xe_oa_store_flex(stream, lrc, bb, flex, count);
 
-	fence = xe_oa_submit_bb(stream, bb);
+	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 		goto free_bb;
@@ -692,7 +709,7 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 
 	write_cs_mi_lri(bb, reg_lri, 1);
 
-	fence = xe_oa_submit_bb(stream, bb);
+	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 		goto free_bb;
@@ -943,7 +960,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
 		goto exit;
 	}
 
-	fence = xe_oa_submit_bb(stream, oa_bo->bb);
+	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 		goto exit;
-- 
2.41.0

