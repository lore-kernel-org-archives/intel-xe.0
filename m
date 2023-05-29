Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940AEC77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 19:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4552010E2E3;
	Mon, 29 May 2023 19:56:22 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AAC10E2E3
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 19:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685390179; x=1716926179;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ngvQqVTlDpxRJmLXiCG06x1419XuZ0hYxfcqZut+RUo=;
 b=G90VpVIcnx3cNtky0NMcRXC0EROho9xEEuaBO702UDR2jdidY78xCzM4
 UzLaMqRoFV0Ab5zGpy2bBVGo7VV0YeAnEVY/SArzoBfsPa+bMX9ZMd89m
 q0ZGlqrwF0pa5N+riXn7zOseIm4ydZnkI7MsZxixhqI1JYlJIStmIi44a
 sajlXwR0e4GVJ9zwJgsN4D/zz2NPt/ThmJmCaylA4jH5LfBjy699MaTPY
 MZfpnRKv5lonwYzecDKVfYXA04MFukNntdaa2NKHqsQaVYyIEhFNAThaL
 IUZWjauD9EebX+4viQHy36Ont0UUsLybYIwIY49KFClQDsFrNfljcXdRo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="357138442"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="357138442"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 12:56:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="952850865"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="952850865"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 12:56:17 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 29 May 2023 12:56:07 -0700
Message-Id: <20230529195607.74755-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Replace PVC check by engine type check
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

__emit_job_gen12_render_compute() masks some PIPE_CONTROL bits that
do not exist in platforms without render engine.
So here replacing the PVC check by something more generic that will
support any future platforms without render engine.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index d2fa0b4c8bcc0..b79dafbe7c4f8 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -249,11 +249,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	u32 ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_gt *gt = job->engine->gt;
 	struct xe_device *xe = gt_to_xe(gt);
-	bool pvc = xe->info.platform == XE_PVC;
+	bool lacks_render = !(xe->gt[0].info.engine_mask & XE_HW_ENGINE_RCS_MASK);
 	u32 mask_flags = 0;
 
 	dw[i++] = preparser_disable(true);
-	if (pvc)
+	if (lacks_render)
 		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
 	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
 		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
@@ -275,7 +275,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 						job->user_fence.value,
 						dw, i);
 
-	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, pvc, dw, i);
+	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
-- 
2.40.1

