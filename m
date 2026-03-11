Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5452A103E2EB
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 23:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E0710E53B;
	Wed, 11 Mar 2026 23:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wbnxz0Yh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DB210E92C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 23:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773270357; x=1804806357;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=uUCE8s08bU/RnxkDsW5J2/v52jdMkl7Uj4u70jrOfQU=;
 b=Wbnxz0YhoicQalWyZ0oVrHq6GFQgthrdKfNgNs35a7gy387h8YxHDf5d
 K3KFO9e30s5Plt9RJcoS92W6DmhR1SAtZCKSrzKbgkjvaTp11Bvwszx/z
 lA/PyKKIbActPrJP8zMihiUVAfO6k1vj8YweuotlHJLTMzGhmcoUgysFu
 Nh0IDv3RsyGlVI1ADZXX0NlUOpep/hL1bhhDQhrZkstjzWTm8BcNywxlq
 LivKB0EeKk2XiVh6TOtalcAT8wY11GhBDWq4yH7LjOX314DQ/9NfPl3SQ
 KKO9+22y9WYMYe1X283VJ9klWC0pCJxvRJxITWiN/R0wsQwREUIIi9U6H A==;
X-CSE-ConnectionGUID: WZApn4OPTGmMYmIw3WeATQ==
X-CSE-MsgGUID: K/SblI1vQ7SyoHZbkJqJcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74470887"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74470887"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 16:05:56 -0700
X-CSE-ConnectionGUID: TldjkniESsGt42WrHYnh/Q==
X-CSE-MsgGUID: 4HuRXxmKSgupUcNNd2lMbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="219749392"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 16:05:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 11 Mar 2026 16:04:58 -0700
Subject: [PATCH] drm/xe: Include running dword offset in default_lrc dumps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-default_lrc_offsets-v1-1-58d8ed3aa081@intel.com>
X-B4-Tracking: v=1; b=H4sIABr1sWkC/x3MMQqAMAxA0atIZguNRQevIiLVJhoQlUZFKN7d4
 viG/xMoRSGFtkgQ6RaVfcvAsoBp8dtMRkI2VLZqrEM0gdhf6zmscRp2ZqVTTR2c8zXyaBkhl0c
 klue/dv37flG73ahlAAAA
X-Change-ID: 20260311-default_lrc_offsets-5d33a51fb0f1
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7243;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=uUCE8s08bU/RnxkDsW5J2/v52jdMkl7Uj4u70jrOfQU=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpsfVTz1Ht8ZFp8Gf02KThBvfIw8gP2owPyTVeP
 NgDMRgI6/WJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCabH1UwAKCRBNeSQFyHKQ
 BEKRD/9q0FoKyb7aDMS2mT5YQXf+DIRCJt9jMt3DppYWwRqLwcBRWZRNdCpZ3KPcVIW31Sw0zO/
 vTr9PfEx1Lrd0bGqdhWouT23WIj/YShuyEDFjV2Ffov3FO0JaSuOLMzcfzC1XqHHQpbEqzv+Y10
 JUAVoDGpBT3Xh7pNO2bCqJnYDlK9WbLPJvDRypdtKh9vEkjkAaUv0U0liqf2knz2SmJOrcw18AQ
 R7PcoePVTkx/yeiXwitG5bPch6lQ2SURN00S6CoSP3YCM+mjAUMkmP9k0ycBbMHXd+8AIkMU18/
 oh8p0DgyAD/5evFW8OSlTWHRyiqlr51nj31MDvkrILX7jqN/yWRbknN+uK3kjcGdW159NThiIB9
 YiJ05bn4f4yHcUsilD1GNaO+3rbPG4cPl0/xTKNhZ7eQvWosjgmuMLrwHtgQ6ViZ+4X0MvYbScH
 ZOXNTNNXmSxCxErkwYscXg24Cxns5IsFbW8nT/Pdr2EJXpdsqHuZ7Ssl3kALEZiH2XXpGpixG8p
 JS3awc9laCMEbfhnW0GweTDDdVXgWsHNOlKwW/A6LrutmpMzabTcGvc/kCxl5u6XNUnRwX3eWVo
 KkonPGQ9bC+q6r7zsal5izwEPkxckY2TOHutXtjlz3Oq9a+kjm1x/zZw9Ev5mzTvJvN9FmR2Vxm
 1wBKshqviM99jsA==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Printing a running dword offset in the default_lrc_* debugfs entries
makes it easier for developers to find the right offsets to use in
regs/xe_lrc_layout.h and/or compare the default LRC contents against the
bspec-documented LRC layout.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 65 +++++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index aa26c71ae34f57022175a6ff14d7f3205a6c6ddc..7529f81f355ea1bb3cdc6e0824acb896256c4183 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1902,6 +1902,7 @@ static int instr_dw(u32 cmd_header)
 
 static int dump_mi_command(struct drm_printer *p,
 			   struct xe_gt *gt,
+			   u32 *start,
 			   u32 *dw,
 			   int remaining_dw)
 {
@@ -1917,15 +1918,18 @@ static int dump_mi_command(struct drm_printer *p,
 		while (num_noop < remaining_dw &&
 		       (*(++dw) & REG_GENMASK(31, 23)) == MI_NOOP)
 			num_noop++;
-		drm_printf(p, "[%#010x] MI_NOOP (%d dwords)\n", inst_header, num_noop);
+		drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_NOOP (%d dwords)\n",
+			   dw - num_noop - start, inst_header, num_noop);
 		return num_noop;
 
 	case MI_TOPOLOGY_FILTER:
-		drm_printf(p, "[%#010x] MI_TOPOLOGY_FILTER\n", inst_header);
+		drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_TOPOLOGY_FILTER\n",
+			   dw - start, inst_header);
 		return 1;
 
 	case MI_BATCH_BUFFER_END:
-		drm_printf(p, "[%#010x] MI_BATCH_BUFFER_END\n", inst_header);
+		drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_BATCH_BUFFER_END\n",
+			   dw - start, inst_header);
 		/* Return 'remaining_dw' to consume the rest of the LRC */
 		return remaining_dw;
 	}
@@ -1939,39 +1943,43 @@ static int dump_mi_command(struct drm_printer *p,
 
 	switch (inst_header & MI_OPCODE) {
 	case MI_LOAD_REGISTER_IMM:
-		drm_printf(p, "[%#010x] MI_LOAD_REGISTER_IMM: %d regs\n",
-			   inst_header, (numdw - 1) / 2);
+		drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_LOAD_REGISTER_IMM: %d regs\n",
+			   dw - start, inst_header, (numdw - 1) / 2);
 		for (int i = 1; i < numdw; i += 2)
-			drm_printf(p, " - %#6x = %#010x\n", dw[i], dw[i + 1]);
+			drm_printf(p, "LRC[%#5lx]  =  - %#6x = %#010x\n",
+				   &dw[i] - start, dw[i], dw[i + 1]);
 		return numdw;
 
 	case MI_LOAD_REGISTER_MEM & MI_OPCODE:
-		drm_printf(p, "[%#010x] MI_LOAD_REGISTER_MEM: %s%s\n",
-			   inst_header,
+		drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_LOAD_REGISTER_MEM: %s%s\n",
+			   dw - start, inst_header,
 			   dw[0] & MI_LRI_LRM_CS_MMIO ? "CS_MMIO " : "",
 			   dw[0] & MI_LRM_USE_GGTT ? "USE_GGTT " : "");
 		if (numdw == 4)
-			drm_printf(p, " - %#6x = %#010llx\n",
+			drm_printf(p, "LRC[%#5lx]  =  - %#6x = %#010llx\n",
+				   dw - start,
 				   dw[1], ((u64)(dw[3]) << 32 | (u64)(dw[2])));
 		else
-			drm_printf(p, " - %*ph (%s)\n",
-				   (int)sizeof(u32) * (numdw - 1), dw + 1,
-				   numdw < 4 ? "truncated" : "malformed");
+			drm_printf(p, "LRC[%#5lx]  =  - %*ph (%s)\n",
+				   dw - start, (int)sizeof(u32) * (numdw - 1),
+				   dw + 1, numdw < 4 ? "truncated" : "malformed");
 		return numdw;
 
 	case MI_FORCE_WAKEUP:
-		drm_printf(p, "[%#010x] MI_FORCE_WAKEUP\n", inst_header);
+		drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_FORCE_WAKEUP\n",
+			   dw - start, inst_header);
 		return numdw;
 
 	default:
-		drm_printf(p, "[%#010x] unknown MI opcode %#x, likely %d dwords\n",
-			   inst_header, opcode, numdw);
+		drm_printf(p, "LRC[%#5lx]  =  [%#010x] unknown MI opcode %#x, likely %d dwords\n",
+			   dw - start, inst_header, opcode, numdw);
 		return numdw;
 	}
 }
 
 static int dump_gfxpipe_command(struct drm_printer *p,
 				struct xe_gt *gt,
+				u32 *start,
 				u32 *dw,
 				int remaining_dw)
 {
@@ -1990,11 +1998,13 @@ static int dump_gfxpipe_command(struct drm_printer *p,
 	switch (*dw & GFXPIPE_MATCH_MASK) {
 #define MATCH(cmd) \
 	case cmd: \
-		drm_printf(p, "[%#010x] " #cmd " (%d dwords)\n", *dw, numdw); \
+		drm_printf(p, "LRC[%#5lx]  =  [%#010x] " #cmd " (%d dwords)\n", \
+			   dw - start, *dw, numdw); \
 		return numdw
 #define MATCH3D(cmd) \
 	case CMD_##cmd: \
-		drm_printf(p, "[%#010x] " #cmd " (%d dwords)\n", *dw, numdw); \
+		drm_printf(p, "LRC[%#5lx]  =  [%#010x] " #cmd " (%d dwords)\n", \
+			   dw - start, *dw, numdw); \
 		return numdw
 
 	MATCH(STATE_BASE_ADDRESS);
@@ -2126,14 +2136,15 @@ static int dump_gfxpipe_command(struct drm_printer *p,
 	MATCH3D(3DSTATE_SLICE_TABLE_STATE_POINTER_2);
 
 	default:
-		drm_printf(p, "[%#010x] unknown GFXPIPE command (pipeline=%#x, opcode=%#x, subopcode=%#x), likely %d dwords\n",
-			   *dw, pipeline, opcode, subopcode, numdw);
+		drm_printf(p, "LRC[%#5lx]  =  [%#010x] unknown GFXPIPE command (pipeline=%#x, opcode=%#x, subopcode=%#x), likely %d dwords\n",
+			   dw - start, *dw, pipeline, opcode, subopcode, numdw);
 		return numdw;
 	}
 }
 
 static int dump_gfx_state_command(struct drm_printer *p,
 				  struct xe_gt *gt,
+				  u32 *start,
 				  u32 *dw,
 				  int remaining_dw)
 {
@@ -2151,8 +2162,8 @@ static int dump_gfx_state_command(struct drm_printer *p,
 	MATCH(STATE_WRITE_INLINE);
 
 	default:
-		drm_printf(p, "[%#010x] unknown GFX_STATE command (opcode=%#x), likely %d dwords\n",
-			   *dw, opcode, numdw);
+		drm_printf(p, "LRC[%#5lx]  =  [%#010x] unknown GFX_STATE command (opcode=%#x), likely %d dwords\n",
+			   dw - start, *dw, opcode, numdw);
 		return numdw;
 	}
 }
@@ -2161,7 +2172,7 @@ void xe_lrc_dump_default(struct drm_printer *p,
 			 struct xe_gt *gt,
 			 enum xe_engine_class hwe_class)
 {
-	u32 *dw;
+	u32 *dw, *start;
 	int remaining_dw, num_dw;
 
 	if (!gt->default_lrc[hwe_class]) {
@@ -2174,18 +2185,20 @@ void xe_lrc_dump_default(struct drm_printer *p,
 	 * hardware status page.
 	 */
 	dw = gt->default_lrc[hwe_class] + LRC_PPHWSP_SIZE;
+	start = dw;
 	remaining_dw = (xe_gt_lrc_size(gt, hwe_class) - LRC_PPHWSP_SIZE) / 4;
 
 	while (remaining_dw > 0) {
 		if ((*dw & XE_INSTR_CMD_TYPE) == XE_INSTR_MI) {
-			num_dw = dump_mi_command(p, gt, dw, remaining_dw);
+			num_dw = dump_mi_command(p, gt, start, dw, remaining_dw);
 		} else if ((*dw & XE_INSTR_CMD_TYPE) == XE_INSTR_GFXPIPE) {
-			num_dw = dump_gfxpipe_command(p, gt, dw, remaining_dw);
+			num_dw = dump_gfxpipe_command(p, gt, start, dw, remaining_dw);
 		} else if ((*dw & XE_INSTR_CMD_TYPE) == XE_INSTR_GFX_STATE) {
-			num_dw = dump_gfx_state_command(p, gt, dw, remaining_dw);
+			num_dw = dump_gfx_state_command(p, gt, start, dw, remaining_dw);
 		} else {
 			num_dw = min(instr_dw(*dw), remaining_dw);
-			drm_printf(p, "[%#10x] Unknown instruction of type %#x, likely %d dwords\n",
+			drm_printf(p, "LRC[%#5lx]  =  [%#10x] Unknown instruction of type %#x, likely %d dwords\n",
+				   dw - start,
 				   *dw, REG_FIELD_GET(XE_INSTR_CMD_TYPE, *dw),
 				   num_dw);
 		}

---
base-commit: 4f823cb4f9faf6611f35c6a8a71ab696e3a734d6
change-id: 20260311-default_lrc_offsets-5d33a51fb0f1

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

