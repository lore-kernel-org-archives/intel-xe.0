Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784CDC77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 19:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6FB10E1EE;
	Fri, 26 May 2023 19:06:28 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749CD10E1EB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 19:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685127982; x=1716663982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qx8On0/nZiB5yUD7ftS9VBeUEUvY6jSvPysjR3u1zgc=;
 b=FFK1FWetKquUEUyJ92cTR30QK+bkdQPNPsA1ag0bpVY4ARkQh/EomD5/
 FY/BeR2fDVS4p3KqAecMnVC0wl9YWJs9byj063HTf3Mmf9M2J99KCrxkV
 0SBMLtaLCYwy5gdAoi0qr5aULz6M9nSn5l5PGarQVmljEk0S3qjdFxKS6
 lWpOIZjbSKpZN4Pet2tNrxMG+CHNykznew5nXTCDbw042A9dcn4ySt73B
 hRHpVfL5vH9CjG9gFC6UdJWJe9k1Mu3aW9eQ/5okdJVD8MSCQd3gE4cU+
 B3fqAhZDhC8nIz+GJhJKruTqCdAMons1ZOIiBaTzh8B/DmB8daWfzvQr2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440636661"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="440636661"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682817067"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="682817067"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:06:21 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 12:06:09 -0700
Message-Id: <20230526190609.61529-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526190609.61529-1-jose.souza@intel.com>
References: <20230526190609.61529-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Replace PVC check by engine type
 check
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

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 4f3ef39109b9b..ecae5101cfad6 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -251,11 +251,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
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
@@ -277,7 +277,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 						job->user_fence.value,
 						dw, i);
 
-	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, pvc, dw, i);
+	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
-- 
2.40.1

