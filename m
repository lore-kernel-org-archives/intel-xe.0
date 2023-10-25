Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348E2C25B6F
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 15:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAF510E6A8;
	Wed, 25 Oct 2023 15:18:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D057010E5BB
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698247079; x=1729783079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lMG8T3cpcvIFMn96+YA8ODTWrC008vAYvg7ExbgFMnA=;
 b=Gr4S87jR9+NN5SW8fx3LUGiftdpO/owX7TSweQA/KAcIpvhaevvrDljj
 3hXkyarXSTWUpUDWDPYbJe+RxuYtPwrwn962JO5dFnlou5nzC0RbyOEIG
 me4mdtMEDsGz31EyKpaEcvVtgf60gSiHteglvm/Hex5xTBr6YBoP+J94F
 VRmXVhshLM5XK6lOhHoYPkJbI7XIEwxkmBVbOgy60ZF9X+dsAYjVMJ5HV
 4Fcoadz9Czw7c8fVYbpWhpusDMPsqMD7bhq0BqwMD6GHzmSMFs0Q+fhdM
 pwLcu4tSBusDdMf8Z2l8iPcrXecrll/9Vm6L8KvbwLB+g920g/BhhbA8W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="418451800"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="418451800"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="882471419"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="882471419"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:17:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 08:17:36 -0700
Message-ID: <20231025151732.3461842-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025151732.3461842-5-matthew.d.roper@intel.com>
References: <20231025151732.3461842-5-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/3] drm/xe/xe2: Update SVG state handling
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

As with DG2/MTL, Xe2 also fails to emit instruction headers for SVG
state instructions if no explicit state has been set.  The SVG part of
the LRC is nearly identical to DG2/MTL; the only change is that
3DSTATE_DRAWING_RECTANGLE has been replaced by
3DSTATE_DRAWING_RECTANGLE_FAST, so we can just re-use the same state
table and handle that single instruction when we encounter it.

Bspec: 65182
Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../gpu/drm/xe/instructions/xe_gfxpipe_commands.h |  1 +
 drivers/gpu/drm/xe/xe_lrc.c                       | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
index 7be961434719..8e6dd061f2ae 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
@@ -52,6 +52,7 @@
 
 #define PIPELINE_SELECT				GFXPIPE_SINGLE_DW_CMD(0x1, 0x4)
 
+#define CMD_3DSTATE_DRAWING_RECTANGLE_FAST	GFXPIPE_3D_CMD(0x0, 0x0)
 #define CMD_3DSTATE_CLEAR_PARAMS		GFXPIPE_3D_CMD(0x0, 0x4)
 #define CMD_3DSTATE_DEPTH_BUFFER		GFXPIPE_3D_CMD(0x0, 0x5)
 #define CMD_3DSTATE_STENCIL_BUFFER		GFXPIPE_3D_CMD(0x0, 0x6)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 944bb2f64660..f8754f061599 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1015,6 +1015,7 @@ static int dump_gfxpipe_command(struct drm_printer *p,
 
 	MATCH(PIPELINE_SELECT);
 
+	MATCH3D(3DSTATE_DRAWING_RECTANGLE_FAST);
 	MATCH3D(3DSTATE_CLEAR_PARAMS);
 	MATCH3D(3DSTATE_DEPTH_BUFFER);
 	MATCH3D(3DSTATE_STENCIL_BUFFER);
@@ -1235,8 +1236,7 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
 
 	switch (GRAPHICS_VERx100(xe)) {
 	case 1255:
-	case 1270:
-	case 1271:
+	case 1270 ... 2004:
 		state_table = xe_hpg_svg_state;
 		state_table_size = ARRAY_SIZE(xe_hpg_svg_state);
 		break;
@@ -1255,6 +1255,17 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
 		xe_gt_assert(gt, num_dw != 0);
 		xe_gt_assert(gt, is_single_dw ^ (num_dw > 1));
 
+		/*
+		 * Xe2's SVG context is the same as the one on DG2 / MTL
+		 * except that 3DSTATE_DRAWING_RECTANGLE (non-pipelined) has
+		 * been replaced by 3DSTATE_DRAWING_RECTANGLE_FAST (pipelined).
+		 * Just make the replacement here rather than defining a
+		 * whole separate table for the single trivial change.
+		 */
+		if (GRAPHICS_VER(xe) >= 20 &&
+		    instr == CMD_3DSTATE_DRAWING_RECTANGLE)
+			instr = CMD_3DSTATE_DRAWING_RECTANGLE_FAST;
+
 		bb->cs[bb->len] = instr;
 		if (!is_single_dw)
 			bb->cs[bb->len] |= (num_dw - 2);
-- 
2.41.0

