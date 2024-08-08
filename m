Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBE2C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 17:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0418210E7B3;
	Thu,  8 Aug 2024 17:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxf7/30n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B0510E7C2
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723138909; x=1754674909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eWefXCfoxxL6uZvHuSny+1pGd1QHGUfy1NjJRSSUQ8U=;
 b=dxf7/30nSpTe5vm6VDLmIyhJUmsc0gufF2rXW+tx020qvt5t/TnLZR5j
 oJeQDcOkPhQkVmfSsQvfgJhcbmtAGo7wdna+Ldh5bPfMUngk5NbhEhlRg
 HW4tzgAze1myQt1roOt0Cix7Yt1M/caYCt+D6ycyC8Eg54IJxDfZ9yiYY
 OFFNw5zKiIkYoOTuFZ3S6adzi4emobG3vOi4jl4S19mijJknvzJTGB04X
 7ow5qBdkGhXcOgMG0fYTYTx4XxWa/3jvZ744xWwyrnIAHxm1UItiZ+p/y
 UPpBuqf0l1P4it5i/1MTwVHb+UrTLW1f4cLzctxNKnYIKgA403w2MXVvb Q==;
X-CSE-ConnectionGUID: nNw9eTi/TridNdiMS21aHQ==
X-CSE-MsgGUID: VSgSGUs7SJmwLs1jBXNIMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21256062"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="21256062"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:41:49 -0700
X-CSE-ConnectionGUID: 1l372fz0QCaplMPuHlksYg==
X-CSE-MsgGUID: fCp9mXXHS9q6qXm77VjLHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57850451"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:41:49 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [PATCH 4/8] drm/xe/oa: Add input fence dependencies
Date: Thu,  8 Aug 2024 10:41:35 -0700
Message-ID: <20240808174139.4027534-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index ba8f2e9d95b7f..416e031ac454b 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -578,10 +578,10 @@ static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
 }
 
 static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb,
-			   struct dma_fence **fence)
+			   bool add_deps, struct dma_fence **fence)
 {
 	struct xe_sched_job *job;
-	int err = 0;
+	int i, err = 0;
 
 	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
 	job = xe_bb_create_job(stream->k_exec_q, bb);
@@ -590,9 +590,23 @@ static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb,
 		goto exit;
 	}
 
+	if (add_deps) {
+		for (i = 0; i < stream->num_syncs && !err; i++)
+			err = xe_sync_entry_add_deps(&stream->syncs[i], job);
+		if (err) {
+			drm_dbg(&stream->oa->xe->drm, "xe_sync_entry_add_deps err %d\n", err);
+			goto err_put_job;
+		}
+	}
+
 	xe_sched_job_arm(job);
 	*fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
+
+	return 0;
+
+err_put_job:
+	xe_sched_job_put(job);
 exit:
 	return err;
 }
@@ -670,7 +684,7 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
 
 	xe_oa_store_flex(stream, lrc, bb, flex, count);
 
-	err = xe_oa_submit_bb(stream, bb, &fence);
+	err = xe_oa_submit_bb(stream, bb, false, &fence);
 	xe_bb_free(bb, fence);
 	dma_fence_put(fence);
 exit:
@@ -691,7 +705,7 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 
 	write_cs_mi_lri(bb, reg_lri, 1);
 
-	err = xe_oa_submit_bb(stream, bb, &fence);
+	err = xe_oa_submit_bb(stream, bb, false, &fence);
 	xe_bb_free(bb, fence);
 	dma_fence_put(fence);
 exit:
@@ -971,7 +985,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
 		goto exit;
 	}
 
-	err = xe_oa_submit_bb(stream, oa_bo->bb, &fence);
+	err = xe_oa_submit_bb(stream, oa_bo->bb, true, &fence);
 	if (err)
 		goto exit;
 
-- 
2.41.0

