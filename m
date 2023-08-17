Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E63C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 20:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DCD10E0C7;
	Thu, 17 Aug 2023 20:19:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8623310E090
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 20:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692303566; x=1723839566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AX8eAZWT8uuaeWoSSA/rIrvlhxbLvQNpFUYLeVpltt0=;
 b=DEzdTbLrHcTw5yRdPBwFxVR5kAh9LpOTSebT4x0V0OusRw05d8/43k/C
 opMgA+6GnfXprxR1/tWtXXCdTO0Ylzfh/clk1PHyZNUkhWdcEt40GC634
 Xvf3mGclxm1ZuBe2Ucph8DYJZV0Tz/pncIuTaJyMnZBJBInL24k6UT3h/
 w9OI/Rxmx7jiAOwo2w5/L9/6ZyCHjGgcnYk89WNRZ1M4DDStnAsJCRXnZ
 wEURbwWoTbAWf57BWpbnL8sr778FlfoDTlOQWTVxoq5MBn/vCraVAwaY8
 MEPCnB4UsDJ4ZSh9kXoQnWx+G6aWllJU/L0v3zOpdfrCbVVghzOicRU0Y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363077723"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="363077723"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="878379324"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:51 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 13:18:28 -0700
Message-ID: <20230817201831.1583172-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
References: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/7] drm/xe: add GSCCS ring ops
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Like the BCS, the GSCCS doesn't have any special HW that needs handling
when emitting commands, so we can re-use the same emit_job code. To make
it clear that this is now a shared low-level function, it has been
renamed to use the "simple" postfix, instead of "copy", to indicate that
it applies to all engines that don't need any additional engine-specific
handling.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 4a474ab04f96..11a089ae79b2 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -205,8 +205,9 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
 	return !(job->q->flags & EXEC_QUEUE_FLAG_WA) ? BIT(8) : 0;
 }
 
-static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
-				  u64 batch_addr, u32 seqno)
+/* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
+static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
+				    u64 batch_addr, u32 seqno)
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 	u32 ppgtt_flag = get_ppgtt_flag(job);
@@ -374,6 +375,15 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
 
+static void emit_job_gen12_gsc(struct xe_sched_job *job)
+{
+	XE_WARN_ON(job->q->width > 1); /* no parallel submission for GSCCS */
+
+	__emit_job_gen12_simple(job, job->q->lrc,
+				job->batch_addr[0],
+				xe_sched_job_seqno(job));
+}
+
 static void emit_job_gen12_copy(struct xe_sched_job *job)
 {
 	int i;
@@ -385,9 +395,9 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
 	}
 
 	for (i = 0; i < job->q->width; ++i)
-		__emit_job_gen12_copy(job, job->q->lrc + i,
-				      job->batch_addr[i],
-				      xe_sched_job_seqno(job));
+		__emit_job_gen12_simple(job, job->q->lrc + i,
+				        job->batch_addr[i],
+				        xe_sched_job_seqno(job));
 }
 
 static void emit_job_gen12_video(struct xe_sched_job *job)
@@ -411,6 +421,10 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
 						xe_sched_job_seqno(job));
 }
 
+static const struct xe_ring_ops ring_ops_gen12_gsc = {
+	.emit_job = emit_job_gen12_gsc,
+};
+
 static const struct xe_ring_ops ring_ops_gen12_copy = {
 	.emit_job = emit_job_gen12_copy,
 };
@@ -427,6 +441,8 @@ const struct xe_ring_ops *
 xe_ring_ops_get(struct xe_gt *gt, enum xe_engine_class class)
 {
 	switch (class) {
+	case XE_ENGINE_CLASS_OTHER:
+		return &ring_ops_gen12_gsc;
 	case XE_ENGINE_CLASS_COPY:
 		return &ring_ops_gen12_copy;
 	case XE_ENGINE_CLASS_VIDEO_DECODE:
-- 
2.41.0

