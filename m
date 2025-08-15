Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC13CA0EE8
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 08:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B1510E8DB;
	Fri, 15 Aug 2025 08:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MtmPXwPl";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35FF10E8DB
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 08:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5wyJj6a0GDD1eksSur7PZTowssQ1DAYYFThZmc+TgkY=; b=MtmPXwPl4CyMoxtpA4POYtQks6
 3SrAeGC9g790PODeLzxqOix6+L/JyckigcoVVBMIgp5aHjJkLwLYITv9PtRzjOYx7StK3sswpJm8V
 sc0sKtlDs3a3H0mSFNF16jY7gVHRcMX5pV7dV/HrwKn3JJuzGIRWawBcvw9nCiYbDg5MiI0VnpyP/
 vUCYA7mAeCgODOf6YhidWhG4sgVLtWY2oJ4lzHDF2FMPef1SxdBKUk5VA6NA585TUxHiMN/F98hnd
 d/Fo2MvFBIeZaRyPx1uVbNNcycjY/jOtBzKu1P5Rl4RSmwLpXB3M/r3aqXvhbsWY3+oZpwPajGR9n
 UJJ5+/jQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1umqCU-00EXy9-36; Fri, 15 Aug 2025 10:54:14 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v10 02/12] drm/xe/xelp: Quiesce memory traffic before
 invalidating auxccs
Date: Fri, 15 Aug 2025 09:53:51 +0100
Message-ID: <20250815085402.19188-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250815085402.19188-1-tvrtko.ursulin@igalia.com>
References: <20250815085402.19188-1-tvrtko.ursulin@igalia.com>
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

According to i915 before invalidating auxccs we must quiesce the memory
traffic by an extra flush.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c       | 7 ++++++-
 drivers/gpu/drm/xe/xe_ring_ops_types.h | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 761740d7769f..f56506ebbeca 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -358,10 +358,15 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
+	const bool aux_ccs = has_aux_ccs(xe);
 	u32 mask_flags = 0;
 
 	i = emit_copy_timestamp(lrc, dw, i);
 
+	/* hsdes: 1809175790 */
+	if (aux_ccs)
+		i = emit_render_cache_flush(job, dw, i);
+
 	dw[i++] = preparser_disable(true);
 	if (lacks_render)
 		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
@@ -372,7 +377,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
 
 	/* hsdes: 1809175790 */
-	if (has_aux_ccs(xe))
+	if (aux_ccs)
 		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
 
 	dw[i++] = preparser_disable(false);
diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
index d7e3e150a9a5..477dc7defd72 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
@@ -8,7 +8,7 @@
 
 struct xe_sched_job;
 
-#define MAX_JOB_SIZE_DW 58
+#define MAX_JOB_SIZE_DW 70
 #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
 
 /**
-- 
2.48.0

