Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAE2CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 23:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787DD10E2B8;
	Wed, 11 Oct 2023 23:10:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22A610E260
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 23:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697065817; x=1728601817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p1xfu7+0sy/vzjbgX8Hh1hrXU8tw3KR0Mx9lmCBAcZs=;
 b=TgKp4HFvS2tyzI7l7hk3pxY5i20vlGYNZ8jQ7BEThiLOKHTyEzCrUoDb
 wNBJZMmHM5OzkVsIVjmVtxqpQx/c6IIvhqpuyGgYZHs/ngOOuEjbXs+lY
 AXG7CHI9EpWwVgZ84dPQWvVTckbZl5jffrn6eRdf2uxdzpNSZe26FjZqz
 3SexjsPWzXzX+30bW9by1jMymWsH9nuLY1SPVTcW51Blat1KSTMAvqUB0
 xso5d+AczaTU8ehqZk8YodvsC5Keoi0Iv81z0LQ5LunNzYUfyLYjsf/9Z
 LoSelzSY3fhbw7y+7LEV+zzBiY6wDQzHuubpkpw8PtZPMpKcc5k+Twdyq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451282093"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="451282093"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="703919071"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="703919071"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:10:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:10:04 -0700
Message-ID: <20231011230957.463381-14-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011230957.463381-8-matthew.d.roper@intel.com>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/xe/debugfs: Include GFXPIPE commands in
 LRC dump
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

RCS and CCS engines include several non-register gfxpipe commands in
their LRC images.  Include these in the dump output so that we can see
exactly what's inside the context snapshot.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../drm/xe/instructions/xe_gfxpipe_commands.h | 107 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.c                   |  99 ++++++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h

diff --git a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
new file mode 100644
index 000000000000..ba2d44f99367
--- /dev/null
+++ b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GFXPIPE_COMMANDS_H_
+#define _XE_GFXPIPE_COMMANDS_H_
+
+#include "instructions/xe_inst_defs.h"
+
+#define GFXPIPE_PIPELINE		REG_GENMASK(28, 27)
+#define   PIPELINE_COMMON		REG_FIELD_PREP(GFXPIPE_PIPELINE, 0x0)
+#define   PIPELINE_SINGLE_DW		REG_FIELD_PREP(GFXPIPE_PIPELINE, 0x1)
+#define   PIPELINE_COMPUTE		REG_FIELD_PREP(GFXPIPE_PIPELINE, 0x2)
+#define   PIPELINE_3D			REG_FIELD_PREP(GFXPIPE_PIPELINE, 0x3)
+
+#define GFXPIPE_OPCODE			REG_GENMASK(26, 24)
+#define GFXPIPE_SUBOPCODE		REG_GENMASK(23, 16)
+
+#define GFXPIPE_MATCH_MASK		(XE_INST_CMD_TYPE | \
+					 GFXPIPE_PIPELINE | \
+					 GFXPIPE_OPCODE | \
+					 GFXPIPE_SUBOPCODE)
+
+#define GFXPIPE_COMMON_CMD(opcode, subopcode) \
+	(XE_INST_GFXPIPE | PIPELINE_COMMON | \
+	 REG_FIELD_PREP(GFXPIPE_OPCODE, opcode) | \
+	 REG_FIELD_PREP(GFXPIPE_SUBOPCODE, subopcode))
+
+#define GFXPIPE_SINGLE_DW_CMD(opcode, subopcode) \
+	(XE_INST_GFXPIPE | PIPELINE_SINGLE_DW | \
+	 REG_FIELD_PREP(GFXPIPE_OPCODE, opcode) | \
+	 REG_FIELD_PREP(GFXPIPE_SUBOPCODE, subopcode))
+
+#define GFXPIPE_3D_CMD(opcode, subopcode) \
+	(XE_INST_GFXPIPE | PIPELINE_3D | \
+	 REG_FIELD_PREP(GFXPIPE_OPCODE, opcode) | \
+	 REG_FIELD_PREP(GFXPIPE_SUBOPCODE, subopcode))
+
+#define GFXPIPE_COMPUTE_CMD(opcode, subopcode) \
+	(XE_INST_GFXPIPE | PIPELINE_COMPUTE | \
+	 REG_FIELD_PREP(GFXPIPE_OPCODE, opcode) | \
+	 REG_FIELD_PREP(GFXPIPE_SUBOPCODE, subopcode))
+
+
+#define STATE_BASE_ADDRESS			GFXPIPE_COMMON_CMD(0x1, 0x1)
+#define STATE_SIP				GFXPIPE_COMMON_CMD(0x1, 0x2)
+#define GPGPU_CSR_BASE_ADDRESS			GFXPIPE_COMMON_CMD(0x1, 0x4)
+#define STATE_COMPUTE_MODE			GFXPIPE_COMMON_CMD(0x1, 0x5)
+#define CMD_3DSTATE_BTD				GFXPIPE_COMMON_CMD(0x1, 0x6)
+
+#define CMD_3DSTATE_VF_STATISTICS		GFXPIPE_SINGLE_DW_CMD(0x0, 0xB)
+
+#define PIPELINE_SELECT				GFXPIPE_SINGLE_DW_CMD(0x1, 0x4)
+
+#define CMD_3DSTATE_CLEAR_PARAMS		GFXPIPE_3D_CMD(0x0, 0x4)
+#define CMD_3DSTATE_DEPTH_BUFFER		GFXPIPE_3D_CMD(0x0, 0x5)
+#define CMD_3DSTATE_STENCIL_BUFFER		GFXPIPE_3D_CMD(0x0, 0x6)
+#define CMD_3DSTATE_HIER_DEPTH_BUFFER		GFXPIPE_3D_CMD(0x0, 0x7)
+#define CMD_3DSTATE_VERTEX_BUFFERS		GFXPIPE_3D_CMD(0x0, 0x8)
+#define CMD_3DSTATE_INDEX_BUFFER		GFXPIPE_3D_CMD(0x0, 0xA)
+#define CMD_3DSTATE_VF				GFXPIPE_3D_CMD(0x0, 0xC)
+#define CMD_3DSTATE_CC_STATE_POINTERS		GFXPIPE_3D_CMD(0x0, 0xE)
+#define CMD_3DSTATE_WM				GFXPIPE_3D_CMD(0x0, 0x14)
+#define CMD_3DSTATE_SAMPLE_MASK			GFXPIPE_3D_CMD(0x0, 0x18)
+#define CMD_3DSTATE_SBE				GFXPIPE_3D_CMD(0x0, 0x1F)
+#define CMD_3DSTATE_PS				GFXPIPE_3D_CMD(0x0, 0x20)
+#define CMD_3DSTATE_CPS_POINTERS		GFXPIPE_3D_CMD(0x0, 0x22)
+#define CMD_3DSTATE_VIEWPORT_STATE_POINTERS_CC	GFXPIPE_3D_CMD(0x0, 0x23)
+#define CMD_3DSTATE_BLEND_STATE_POINTERS	GFXPIPE_3D_CMD(0x0, 0x24)
+#define CMD_3DSTATE_BINDING_TABLE_POINTERS_PS	GFXPIPE_3D_CMD(0x0, 0x2A)
+#define CMD_3DSTATE_SAMPLER_STATE_POINTERS_PS	GFXPIPE_3D_CMD(0x0, 0x2F)
+#define CMD_3DSTATE_VF_INSTANCING		GFXPIPE_3D_CMD(0x0, 0x49)
+#define CMD_3DSTATE_VF_TOPOLOGY			GFXPIPE_3D_CMD(0x0, 0x4B)
+#define CMD_3DSTATE_WM_CHROMAKEY		GFXPIPE_3D_CMD(0x0, 0x4C)
+#define CMD_3DSTATE_PS_BLEND			GFXPIPE_3D_CMD(0x0, 0x4D)
+#define CMD_3DSTATE_WM_DEPTH_STENCIL		GFXPIPE_3D_CMD(0x0, 0x4E)
+#define CMD_3DSTATE_PS_EXTRA			GFXPIPE_3D_CMD(0x0, 0x4F)
+#define CMD_3DSTATE_SBE_SWIZ			GFXPIPE_3D_CMD(0x0, 0x51)
+#define CMD_3DSTATE_VFG				GFXPIPE_3D_CMD(0x0, 0x57)
+#define CMD_3DSTATE_AMFS			GFXPIPE_3D_CMD(0x0, 0x6F)
+#define CMD_3DSTATE_DEPTH_BOUNDS		GFXPIPE_3D_CMD(0x0, 0x71)
+#define CMD_3DSTATE_CONSTANT_TS_POINTER		GFXPIPE_3D_CMD(0x0, 0x73)
+#define CMD_3DSTATE_MESH_DISTRIB		GFXPIPE_3D_CMD(0x0, 0x78)
+#define CMD_3DSTATE_SBE_MESH			GFXPIPE_3D_CMD(0x0, 0x82)
+#define CMD_3DSTATE_CPSIZE_CONTROL_BUFFER	GFXPIPE_3D_CMD(0x0, 0x83)
+
+#define CMD_3DSTATE_CHROMA_KEY			GFXPIPE_3D_CMD(0x1, 0x4)
+#define CMD_3DSTATE_POLY_STIPPLE_OFFSET		GFXPIPE_3D_CMD(0x1, 0x6)
+#define CMD_3DSTATE_POLY_STIPPLE_PATTERN	GFXPIPE_3D_CMD(0x1, 0x7)
+#define CMD_3DSTATE_LINE_STIPPLE		GFXPIPE_3D_CMD(0x1, 0x8)
+#define CMD_3DSTATE_AA_LINE_PARAMETERS		GFXPIPE_3D_CMD(0x1, 0xA)
+#define CMD_3DSTATE_PUSH_CONSTANT_ALLOC_VS	GFXPIPE_3D_CMD(0x1, 0x12)
+#define CMD_3DSTATE_PUSH_CONSTANT_ALLOC_HS	GFXPIPE_3D_CMD(0x1, 0x13)
+#define CMD_3DSTATE_PUSH_CONSTANT_ALLOC_DS	GFXPIPE_3D_CMD(0x1, 0x14)
+#define CMD_3DSTATE_PUSH_CONSTANT_ALLOC_GS	GFXPIPE_3D_CMD(0x1, 0x15)
+#define CMD_3DSTATE_PUSH_CONSTANT_ALLOC_PS	GFXPIPE_3D_CMD(0x1, 0x16)
+#define CMD_3DSTATE_SO_DECL_LIST		GFXPIPE_3D_CMD(0x1, 0x17)
+#define   CMD_3DSTATE_SO_DECL_LIST_DW_LEN	REG_GENMASK(8, 0)
+#define CMD_3DSTATE_BINDING_TABLE_POOL_ALLOC	GFXPIPE_3D_CMD(0x1, 0x19)
+#define CMD_3DSTATE_SAMPLE_PATTERN		GFXPIPE_3D_CMD(0x1, 0x1C)
+#define CMD_3DSTATE_3D_MODE			GFXPIPE_3D_CMD(0x1, 0x1E)
+#define CMD_3DSTATE_SUBSLICE_HASH_TABLE		GFXPIPE_3D_CMD(0x1, 0x1F)
+#define CMD_3DSTATE_SLICE_TABLE_STATE_POINTERS	GFXPIPE_3D_CMD(0x1, 0x20)
+#define CMD_3DSTATE_PTBR_TILE_PASS_INFO		GFXPIPE_3D_CMD(0x1, 0x22)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 825b229212ae..c8fc95b0b2cb 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -907,6 +907,15 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
 
 static int instr_dw(u32 cmd_header)
 {
+	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
+	if ((cmd_header & (XE_INST_CMD_TYPE | GFXPIPE_PIPELINE)) ==
+	    GFXPIPE_SINGLE_DW_CMD(0, 0))
+		return 1;
+
+	/* 3DSTATE_SO_DECL_LIST has a 9-bit dword length rather than 8 */
+	if ((cmd_header & GFXPIPE_MATCH_MASK) == CMD_3DSTATE_SO_DECL_LIST)
+		return REG_FIELD_GET(CMD_3DSTATE_SO_DECL_LIST_DW_LEN, cmd_header) + 2;
+
 	/* Most instructions have the # of dwords (minus 2) in 7:0 */
 	return REG_FIELD_GET(XE_INST_LEN_MASK, cmd_header) + 2;
 }
@@ -953,6 +962,94 @@ static int dump_mi_command(struct drm_printer *p,
 	}
 }
 
+static int dump_gfxpipe_command(struct drm_printer *p,
+				struct xe_gt *gt,
+				u32 *dw,
+				int remaining_dw)
+{
+	u32 numdw = instr_dw(*dw);
+	u32 pipeline = REG_FIELD_GET(GFXPIPE_PIPELINE, *dw);
+	u32 opcode = REG_FIELD_GET(GFXPIPE_OPCODE, *dw);
+	u32 subopcode = REG_FIELD_GET(GFXPIPE_SUBOPCODE, *dw);
+
+	switch (*dw & GFXPIPE_MATCH_MASK) {
+
+#define MATCH(cmd) \
+	case cmd: \
+		  drm_printf(p, #cmd " (%d dwords)\n", numdw); \
+		return numdw
+#define MATCH3D(cmd) \
+	case CMD_##cmd: \
+		drm_printf(p, #cmd " (%d dwords)\n", numdw); \
+		return numdw
+
+	MATCH(STATE_BASE_ADDRESS);
+	MATCH(STATE_SIP);
+	MATCH(GPGPU_CSR_BASE_ADDRESS);
+	MATCH(STATE_COMPUTE_MODE);
+	MATCH3D(3DSTATE_BTD);
+
+	MATCH3D(3DSTATE_VF_STATISTICS);
+
+	MATCH(PIPELINE_SELECT);
+
+	MATCH3D(3DSTATE_CLEAR_PARAMS);
+	MATCH3D(3DSTATE_DEPTH_BUFFER);
+	MATCH3D(3DSTATE_STENCIL_BUFFER);
+	MATCH3D(3DSTATE_HIER_DEPTH_BUFFER);
+	MATCH3D(3DSTATE_VERTEX_BUFFERS);
+	MATCH3D(3DSTATE_INDEX_BUFFER);
+	MATCH3D(3DSTATE_VF);
+	MATCH3D(3DSTATE_CC_STATE_POINTERS);
+	MATCH3D(3DSTATE_WM);
+	MATCH3D(3DSTATE_SAMPLE_MASK);
+	MATCH3D(3DSTATE_SBE);
+	MATCH3D(3DSTATE_PS);
+	MATCH3D(3DSTATE_CPS_POINTERS);
+	MATCH3D(3DSTATE_VIEWPORT_STATE_POINTERS_CC);
+	MATCH3D(3DSTATE_BLEND_STATE_POINTERS);
+	MATCH3D(3DSTATE_BINDING_TABLE_POINTERS_PS);
+	MATCH3D(3DSTATE_SAMPLER_STATE_POINTERS_PS);
+	MATCH3D(3DSTATE_VF_INSTANCING);
+	MATCH3D(3DSTATE_VF_TOPOLOGY);
+	MATCH3D(3DSTATE_WM_CHROMAKEY);
+	MATCH3D(3DSTATE_PS_BLEND);
+	MATCH3D(3DSTATE_WM_DEPTH_STENCIL);
+	MATCH3D(3DSTATE_PS_EXTRA);
+	MATCH3D(3DSTATE_SBE_SWIZ);
+	MATCH3D(3DSTATE_VFG);
+	MATCH3D(3DSTATE_AMFS);
+	MATCH3D(3DSTATE_DEPTH_BOUNDS);
+	MATCH3D(3DSTATE_CONSTANT_TS_POINTER);
+	MATCH3D(3DSTATE_MESH_DISTRIB);
+	MATCH3D(3DSTATE_SBE_MESH);
+	MATCH3D(3DSTATE_CPSIZE_CONTROL_BUFFER);
+
+	MATCH3D(3DSTATE_CHROMA_KEY);
+	MATCH3D(3DSTATE_POLY_STIPPLE_OFFSET);
+	MATCH3D(3DSTATE_POLY_STIPPLE_PATTERN);
+	MATCH3D(3DSTATE_LINE_STIPPLE);
+	MATCH3D(3DSTATE_AA_LINE_PARAMETERS);
+	MATCH3D(3DSTATE_PUSH_CONSTANT_ALLOC_VS);
+	MATCH3D(3DSTATE_PUSH_CONSTANT_ALLOC_HS);
+	MATCH3D(3DSTATE_PUSH_CONSTANT_ALLOC_DS);
+	MATCH3D(3DSTATE_PUSH_CONSTANT_ALLOC_GS);
+	MATCH3D(3DSTATE_PUSH_CONSTANT_ALLOC_PS);
+	MATCH3D(3DSTATE_SO_DECL_LIST);
+	MATCH3D(3DSTATE_BINDING_TABLE_POOL_ALLOC);
+	MATCH3D(3DSTATE_SAMPLE_PATTERN);
+	MATCH3D(3DSTATE_3D_MODE);
+	MATCH3D(3DSTATE_SUBSLICE_HASH_TABLE);
+	MATCH3D(3DSTATE_SLICE_TABLE_STATE_POINTERS);
+	MATCH3D(3DSTATE_PTBR_TILE_PASS_INFO);
+
+	default:
+		drm_printf(p, "unknown GFXPIPE command <%#x> (pipeline=%#x, opcode=%#x, subopcode=%#x), likely %d dwords\n",
+			   *dw, pipeline, opcode, subopcode, numdw);
+		return numdw;
+	}
+}
+
 void xe_lrc_dump_default(struct drm_printer *p,
 			 struct xe_gt *gt,
 			 enum xe_engine_class hwe_class)
@@ -972,6 +1069,8 @@ void xe_lrc_dump_default(struct drm_printer *p,
 	while (remaining_dw) {
 		if ((*dw & XE_INST_CMD_TYPE) == XE_INST_MI) {
 			num_dw = dump_mi_command(p, gt, dw, remaining_dw);
+		} else if ((*dw & XE_INST_CMD_TYPE) == XE_INST_GFXPIPE) {
+			num_dw = dump_gfxpipe_command(p, gt, dw, remaining_dw);
 		} else {
 			num_dw = min(instr_dw(*dw), remaining_dw);
 			drm_printf(p, "Unknown instr <%#x> of type %#x, likely %d dwords\n",
-- 
2.41.0

