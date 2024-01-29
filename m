Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74E0C47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 19:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAA610E1D5;
	Mon, 29 Jan 2024 19:46:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1843B10E1D5
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 19:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706557587; x=1738093587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1zbfl+6dn7MOFdLLWNwlBQL8f1w1MoGEHoOtCz/lP3U=;
 b=ZZrF9y3Bsv3Q49bhV23cH1filJA61TM9suM+DNXA5nkXLPYKk8PVvlgs
 yafxToy2ci92zzSeEHdw2WF0mpf7lk8PSjs+H9mKuwTy1NLW8lKg5fF8g
 +JE77VHs9mVq7UZBqC/M49tcBDGKgXbSWm/+F3y45Liy+qYs250j2FwFf
 5ETNjiu3a3dn7nQIX4rpmfRu7z9VJEzakUZN2DflO2+LsFbAGn85lk5f7
 aLzbwDv1MQQrbbsYTDSAfFFCw9+nLtKIoXMKROcTPgX7wlbi7kRFObGwX
 9hr6o3F8q0x8clCHXj45/wWwrUzQEiCHk2ZWkcOVcPk4vGhhwU2LDDnxe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16449208"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="16449208"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 11:46:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="29644042"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 11:46:21 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: Add SVG state table for Xe2
Date: Mon, 29 Jan 2024 11:46:14 -0800
Message-ID: <20240129194615.282624-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

3DSTATE_HS has a different lenght than gfx1255+ platforms.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 59 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f17e9785355e8..87ccff1f8e20a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1255,6 +1255,59 @@ static const struct instr_state xe_hpg_svg_state[] = {
 	{ .instr = CMD_3DSTATE_DRAWING_RECTANGLE, .num_dw = 4 },
 };
 
+static const struct instr_state xe2_svg_state[] = {
+	{ .instr = CMD_3DSTATE_CONSTANT_VS, .num_dw = 11 },
+	{ .instr = CMD_3DSTATE_CONSTANT_HS, .num_dw = 11 },
+	{ .instr = CMD_3DSTATE_CONSTANT_DS, .num_dw = 11 },
+	{ .instr = CMD_3DSTATE_CONSTANT_GS, .num_dw = 11 },
+	{ .instr = CMD_3DSTATE_VERTEX_ELEMENTS, .num_dw = 69 },
+	{ .instr = CMD_3DSTATE_VF_COMPONENT_PACKING, .num_dw = 5 },
+	{ .instr = CMD_3DSTATE_VF_SGVS, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_VF_SGVS_2, .num_dw = 3 },
+	{ .instr = CMD_3DSTATE_VS, .num_dw = 9 },
+	{ .instr = CMD_3DSTATE_BINDING_TABLE_POINTERS_VS, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_SAMPLER_STATE_POINTERS_VS, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_URB_ALLOC_VS, .num_dw = 3 },
+	{ .instr = CMD_3DSTATE_STREAMOUT, .num_dw = 5 },
+	{ .instr = CMD_3DSTATE_SO_BUFFER_INDEX_0, .num_dw = 8 },
+	{ .instr = CMD_3DSTATE_SO_BUFFER_INDEX_1, .num_dw = 8 },
+	{ .instr = CMD_3DSTATE_SO_BUFFER_INDEX_2, .num_dw = 8 },
+	{ .instr = CMD_3DSTATE_SO_BUFFER_INDEX_3, .num_dw = 8 },
+	{ .instr = CMD_3DSTATE_CLIP, .num_dw = 4 },
+	{ .instr = CMD_3DSTATE_PRIMITIVE_REPLICATION, .num_dw = 6 },
+	{ .instr = CMD_3DSTATE_CLIP_MESH, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_SF, .num_dw = 4 },
+	{ .instr = CMD_3DSTATE_SCISSOR_STATE_POINTERS, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_RASTER, .num_dw = 5 },
+	{ .instr = CMD_3DSTATE_TBIMR_TILE_PASS_INFO, .num_dw = 4 },
+	{ .instr = CMD_3DSTATE_WM_HZ_OP, .num_dw = 6 },
+	{ .instr = CMD_3DSTATE_MULTISAMPLE, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_HS, .num_dw = 8 },
+	{ .instr = CMD_3DSTATE_BINDING_TABLE_POINTERS_HS, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_SAMPLER_STATE_POINTERS_HS, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_URB_ALLOC_HS, .num_dw = 3 },
+	{ .instr = CMD_3DSTATE_TASK_CONTROL, .num_dw = 3 },
+	{ .instr = CMD_3DSTATE_TASK_SHADER, .num_dw = 7 },
+	{ .instr = CMD_3DSTATE_TASK_SHADER_DATA, .num_dw = 10 },
+	{ .instr = CMD_3DSTATE_URB_ALLOC_TASK, .num_dw = 3 },
+	{ .instr = CMD_3DSTATE_TE, .num_dw = 5 },
+	{ .instr = CMD_3DSTATE_TASK_REDISTRIB, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_DS, .num_dw = 11 },
+	{ .instr = CMD_3DSTATE_BINDING_TABLE_POINTERS_DS, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_SAMPLER_STATE_POINTERS_DS, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_URB_ALLOC_DS, .num_dw = 3 },
+	{ .instr = CMD_3DSTATE_GS, .num_dw = 10 },
+	{ .instr = CMD_3DSTATE_BINDING_TABLE_POINTERS_GS, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_SAMPLER_STATE_POINTERS_GS, .num_dw = 2 },
+	{ .instr = CMD_3DSTATE_URB_ALLOC_GS, .num_dw = 3 },
+	{ .instr = CMD_3DSTATE_MESH_CONTROL, .num_dw = 3 },
+	{ .instr = CMD_3DSTATE_MESH_SHADER_DATA, .num_dw = 10 },
+	{ .instr = CMD_3DSTATE_URB_ALLOC_MESH, .num_dw = 3 },
+	{ .instr = CMD_3DSTATE_MESH_SHADER, .num_dw = 8 },
+	{ .instr = CMD_3DSTATE_DRAWING_RECTANGLE, .num_dw = 4 },
+};
+
 void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb)
 {
 	struct xe_gt *gt = q->hwe->gt;
@@ -1271,10 +1324,14 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
 
 	switch (GRAPHICS_VERx100(xe)) {
 	case 1255:
-	case 1270 ... 2004:
+	case 1270:
 		state_table = xe_hpg_svg_state;
 		state_table_size = ARRAY_SIZE(xe_hpg_svg_state);
 		break;
+	case 2000 ... 2004:
+		state_table = xe2_svg_state;
+		state_table_size = ARRAY_SIZE(xe2_svg_state);
+		break;
 	default:
 		xe_gt_dbg(gt, "No non-register state to emit on graphics ver %d.%02d\n",
 			  GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
-- 
2.43.0

