Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972FDC25B47
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 15:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ECE10E0E2;
	Wed, 25 Oct 2023 15:18:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B44D10E0E2
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 15:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698247080; x=1729783080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=en/hO4HwyU33XNkwmEGSKS0mjufIwuAevXGIw+kn2oo=;
 b=Prnz6E26ha65AasgDRD0VI76EHQrrjeJVHcIuFQL/Ubvcj8iBHdF9Lej
 NZRvAWlE/zo50TZtkjNznn7GKzeRkSahCOH85M7VyH9tWomaG46sr+erK
 OYvJ3IfHesf14lKaTDIxRMN0ls4TNQPEcbS0BD+4Tk/hcXlblB1ANSFa+
 GzxPMcvZi8POt/sKtJ5OBhaq33EorVM4oBvcgwVdZLD1CqEFKo/ZwI/t9
 +OmFD4vop2SCdPsgh+gsg/67TtJndIgU9S23VGOSPumrrj+iNyIle5sKb
 2FpmhWoj5UGd1A1FIRW8MMNspIgAz5LC9MMD7+05ZAK7Oc1VTXBE9+lMt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="418451797"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="418451797"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="882471413"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="882471413"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:17:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 08:17:34 -0700
Message-ID: <20231025151732.3461842-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025151732.3461842-5-matthew.d.roper@intel.com>
References: <20231025151732.3461842-5-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/3] drm/xe: Prepare to emit non-register
 state while recording default LRC
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On some platforms we need to emit some non-register state while
recording an engine class' default LRC.  Add the infrastructure to
support this; actual per-platform tables will be added in future
patches.

v2:
 - Checkpatch whitespace fix
 - Add extra assertion to ensure num_dw != 0.  (Bala)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c  | 10 ++++++++-
 drivers/gpu/drm/xe/xe_lrc.c | 45 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h |  3 +++
 3 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 74e1f47bd401..8618275b1877 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -136,7 +136,13 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	long timeout;
 	int count = 0;
 
-	bb = xe_bb_new(gt, SZ_4K, false);	/* Just pick a large BB size */
+	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
+		/* Big enough to emit all of the context's 3DSTATE */
+		bb = xe_bb_new(gt, xe_lrc_size(gt_to_xe(gt), q->hwe->class), false);
+	else
+		/* Just pick a large BB size */
+		bb = xe_bb_new(gt, SZ_4K, false);
+
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
@@ -173,6 +179,8 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 		}
 	}
 
+	xe_lrc_emit_hwe_state_instructions(q, bb);
+
 	job = xe_bb_create_job(q, bb);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 332fc0602074..184707223098 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -12,6 +12,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
 #include "regs/xe_regs.h"
+#include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
@@ -1108,3 +1109,47 @@ void xe_lrc_dump_default(struct drm_printer *p,
 		remaining_dw -= num_dw;
 	}
 }
+
+struct instr_state {
+	u32 instr;
+	u16 num_dw;
+};
+
+void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb)
+{
+	struct xe_gt *gt = q->hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	const struct instr_state *state_table = NULL;
+	int state_table_size = 0;
+
+	/*
+	 * At the moment we only need to emit non-register state for the RCS
+	 * engine.
+	 */
+	if (q->hwe->class != XE_ENGINE_CLASS_RENDER)
+		return;
+
+	switch (GRAPHICS_VERx100(xe)) {
+	default:
+		xe_gt_dbg(gt, "No non-register state to emit on graphics ver %d.%02d\n",
+			  GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
+		return;
+	}
+
+	for (int i = 0; i < state_table_size; i++) {
+		u32 instr = state_table[i].instr;
+		u16 num_dw = state_table[i].num_dw;
+		bool is_single_dw = ((instr & GFXPIPE_PIPELINE) == PIPELINE_SINGLE_DW);
+
+		xe_gt_assert(gt, (instr & XE_INSTR_CMD_TYPE) == XE_INSTR_GFXPIPE);
+		xe_gt_assert(gt, num_dw != 0);
+		xe_gt_assert(gt, is_single_dw ^ (num_dw > 1));
+
+		bb->cs[bb->len] = instr;
+		if (!is_single_dw)
+			bb->cs[bb->len] |= (num_dw - 2);
+
+		bb->len += num_dw;
+	}
+}
+
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index a7056eda5e0c..28b1d3f404d4 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -8,6 +8,7 @@
 #include "xe_lrc_types.h"
 
 struct drm_printer;
+struct xe_bb;
 struct xe_device;
 struct xe_exec_queue;
 enum xe_engine_class;
@@ -52,4 +53,6 @@ void xe_lrc_dump_default(struct drm_printer *p,
 			 struct xe_gt *gt,
 			 enum xe_engine_class);
 
+void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb);
+
 #endif
-- 
2.41.0

