Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA72C54E76
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 10:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1796610E395;
	Mon, 20 Nov 2023 10:37:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F1210E395
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700476655; x=1732012655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2rS3RJAxFEdR8u5OlyuBaXhMpq62p0BwO5xYxYmvbiA=;
 b=SK0fpHLjhwkiSxFOEexjr9MJ5HqKbYB5idHMejz5SaREcO8W3SReue3J
 FJJxjGVzKTuZcBlBuHdPV9DrgAIQrTbz9bUdj3GzI+ind9lNhBstJe34r
 pXBrSiLcD0kPALXmt/r75r/GT3nKCOwYgguaNg2YHXx/C9JDD5/blgq5l
 Z6bviBS0c7OuYB8zIV5nHqM4FmiBLuBLTUYchlbHoRAIO6QeIi7uc2omM
 fts8yP5QpjNbwnxQ40EAQQgw7Fn0bRQnHTxnKL5Ckka8AmJtdPpcjs/+W
 ie917CPDXWlr7xue+2EX3M84bcM4Gj8OtYgtlC6xSIGCwzXENQWE5jtkC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="388732789"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="388732789"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 02:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="769853345"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="769853345"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga007.fm.intel.com with ESMTP; 20 Nov 2023 02:37:33 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 16:16:45 +0530
Message-Id: <20231120104645.3570901-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16020292621
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

Workaround applies to Graphics 20.00 as part of ring
submission

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c   | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 59e0aa2d6a4c..42eff69dff9e 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -184,6 +184,22 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	return i;
 }
 
+static int emit_stalling_pipe_control(struct xe_sched_job *job, u32 *dw, int i)
+{
+	struct xe_gt *gt = job->q->gt;
+
+	if (XE_WA(gt, 16020292621)) {
+		dw[i++] = GFX_OP_PIPE_CONTROL(6);
+		dw[i++] = PIPE_CONTROL_CS_STALL;
+		dw[i++] = 0;
+		dw[i++] = 0;
+		dw[i++] = 0;
+		dw[i++] = 0;
+	}
+
+	return i;
+}
+
 static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
 			      int i)
 {
@@ -294,6 +310,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	i = emit_user_interrupt(dw, i);
 
+	i = emit_stalling_pipe_control(job, dw, i);
+
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
@@ -342,6 +360,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	i = emit_user_interrupt(dw, i);
 
+	i = emit_stalling_pipe_control(job, dw, i);
+
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
@@ -374,6 +394,8 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_user_interrupt(dw, i);
 
+	i = emit_stalling_pipe_control(job, dw, i);
+
 	xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 752842d734be..0b9d29f8897c 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -20,3 +20,4 @@
 16017236439	PLATFORM(PVC)
 22010954014	PLATFORM(DG2)
 14019821291	MEDIA_VERSION_RANGE(1300, 2000)
+16020292621	GRAPHICS_VERSION(2000)
-- 
2.25.1

