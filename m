Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA17C52D6F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 00:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5819610E36D;
	Tue, 20 Aug 2024 00:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9yfVKN4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547CC10E34B
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 00:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724115495; x=1755651495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZbSVlEPCcX9Q7yCSI6t5/vgyW+0sBK7RkBI4j0TYz9k=;
 b=I9yfVKN4YuF/HDkkdD5vQIk1nf962g57T16d439vAxFIrxyoexACJ/jP
 oIgCk6BShY59ibTnZnRI+oVOgEsLgnZ3CsVHDit+sGH7486lWnxqQV6ht
 fssoLwB1B3FA2J1X6DJzL6RdUGV9C3k8huh74koOclB6hvMGPRFN7UD0l
 blmAbMupGWVZ8hoMl80Omxk74TcSxAW/f3s5pieiTCjQ2gVQwslXaCwIB
 BAPAJKhlWeqAVftMOysHfaBO5ph7Ja9SPedk3eNvpRGPK+cK3WJ/gYfFJ
 Rn2ae1fhPBymid0BNBtIvk+oOtJMajaHfARyo3r/Fht9JRVsH+76XbDJ3 w==;
X-CSE-ConnectionGUID: fAY03s5wRuSUXXdSWg9l4w==
X-CSE-MsgGUID: xyo32GVdR0695EuZALXSOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33057762"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="33057762"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:58:15 -0700
X-CSE-ConnectionGUID: jgwpYyV9TvyMKwV7AFaLRA==
X-CSE-MsgGUID: fTPi/AFqS9iXnoYszhXzfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="91319933"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:58:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 3/7] drm/xe/oa: Add input fence dependencies
Date: Mon, 19 Aug 2024 17:58:04 -0700
Message-ID: <20240820005808.1412649-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
References: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
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

