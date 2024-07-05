Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EED8C30658
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 13:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D276010E1AD;
	Fri,  5 Jul 2024 13:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8uo4Omy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3784310E1AD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jul 2024 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720184540; x=1751720540;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0OTjNZ7FsLBLhgHmyPHjYh9D0ye6ivsDUVgfAOZiqHQ=;
 b=X8uo4OmyZ72m7hkeCR1dPlqbvS0ORBg/F2OyjyJobGfq5ynmGymEayHz
 2p06bKDamqc+9BXZ5HNsLf0t/FdhwMU6c7Ne1kQK5XxdaqODPy6mKcKtT
 TTmz88WEhKj7TK10RhzDmbPpm3WQuJxdr6TD6l1xsZY6T/HxPHUpYEc/5
 uuheS5M2p3J+eQAVEDLvXrLiWLUy2H96rCjozDbBFzHoU5s8O/uT3Fbe3
 qv+r4DS3YZzlwxYp65oGRaTAIxK5RJfRYJBFnO9w3xMCjU03+N71C62TY
 zs79VwxchKMpB+GQ6avo2iuWM18oRTYWiNXpdbFtq5+KE+Hq96e+oZYqS Q==;
X-CSE-ConnectionGUID: LxKd3WswSw+uTtOWulPY2g==
X-CSE-MsgGUID: mlTG732pST+8fw02hAfQOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28150869"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="28150869"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 06:02:19 -0700
X-CSE-ConnectionGUID: 4/i1C1CXQKqD55U2E01ZSw==
X-CSE-MsgGUID: dQQpox+wSUK2+1r0ua0Vyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="51825514"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa005.jf.intel.com with ESMTP; 05 Jul 2024 06:02:18 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V3] drm/xe/xe2: Add Wa_15015404425
Date: Fri,  5 Jul 2024 18:33:24 +0530
Message-Id: <20240705130324.2769481-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Wa_15015404425 asks us to perform four "dummy" writes to a
non-existent register offset before every real register read.
Although the specific offset of the writes doesn't directly
matter, the workaround suggests offset 0x130030 as a good target
so that these writes will be easy to recognize and filter out in
debugging traces.

V3(MattR):
  - Define dummy reg local to function
  - Avoid tracing dummy writes
  - Update commit message
V2:
  - Add WA to 8/16/32bit reads also - MattR
  - Corrected dummy reg address - MattR
  - Use for loop to avoid mental pause - JaniN

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f92faad4b96d..66bfa93a976d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -121,12 +121,33 @@ int xe_mmio_init(struct xe_device *xe)
 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
 }
 
+static void mmio_flush_pending_writes(struct xe_gt *gt)
+{
+#define DUMMY_REG	XE_REG(0x130030)
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_reg reg = DUMMY_REG;
+	u32 addr;
+	int i;
+
+	if (!(xe->info.platform == XE_LUNARLAKE))
+		return;
+
+	addr = xe_mmio_adjusted_addr(gt, reg.addr);
+	/* 4 dummy writes */
+	for (i = 0; i < 4; i++)
+		writel(0, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+}
+
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 	u8 val;
 
+	/* Wa_15015404425 */
+	mmio_flush_pending_writes(gt);
+
 	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
 
@@ -139,6 +160,9 @@ u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 	u16 val;
 
+	/* Wa_15015404425 */
+	mmio_flush_pending_writes(gt);
+
 	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
 
@@ -160,6 +184,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 	u32 val;
 
+	/* Wa_15015404425 */
+	mmio_flush_pending_writes(gt);
+
 	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
 		val = xe_gt_sriov_vf_read32(gt, reg);
 	else
-- 
2.25.1

