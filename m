Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E215CDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 23:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBA310E34C;
	Tue, 17 Oct 2023 23:19:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7043D10E34C
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 23:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697584737; x=1729120737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rPDkpeW4jdp0/ocfvhzQNS7HWPgAYZYlNCAr05lazBw=;
 b=kjzeSN4WL2Pl+fyFhbi8u6WE+MZbEnOj96seIAax1koSHrqWC3RBF+B3
 IirrMk4LsZj9PLcV0sbv5IPb6hBVEhckqF0tZuIWXbGlxlGXYTNpqbMJD
 Nz0zQC9cBWBC+mIQPajx9ZhDhf6SQRRB8aoRLq1c1YHj5xW5XZvb1RkPy
 uT7pX2SY4rKxhf2Wz42Wlxgsu43hN9SOFff1NRDBFwyDtSYyghNQdn/Me
 jVaLk7IawBa7S2DDAJtsowyyPEO6xxGPPx6ozZvnk6Y6Cbt5DDqphwxtJ
 PvDrMJqUnB4NGYwApBEiVjFdLtjN9uCDM2zKG3cuK5AkIEcgYmSMtZNAg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="7452935"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="7452935"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:18:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="822191737"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; d="scan'208";a="822191737"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:18:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 17 Oct 2023 16:18:47 -0700
Message-ID: <20231017231843.1790243-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017231843.1790243-5-matthew.d.roper@intel.com>
References: <20231017231843.1790243-5-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe/xe2: Update SVG state handling
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
index 4bd6ef9e41fd..d2a2ac10c4ac 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1015,6 +1015,7 @@ static int dump_gfxpipe_command(struct drm_printer *p,
 
 	MATCH(PIPELINE_SELECT);
 
+	MATCH3D(3DSTATE_DRAWING_RECTANGLE_FAST);
 	MATCH3D(3DSTATE_CLEAR_PARAMS);
 	MATCH3D(3DSTATE_DEPTH_BUFFER);
 	MATCH3D(3DSTATE_STENCIL_BUFFER);
@@ -1235,8 +1236,7 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
 
 	switch(GRAPHICS_VERx100(xe)) {
 	case 1255:
-	case 1270:
-	case 1271:
+	case 1270 ... 2004:
 		state_table = xe_hpg_svg_state;
 		state_table_size = ARRAY_SIZE(xe_hpg_svg_state);
 		break;
@@ -1254,6 +1254,17 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
 		xe_gt_assert(gt, (instr & XE_INSTR_CMD_TYPE) == XE_INSTR_GFXPIPE);
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

