Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65170C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 11:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CAF10E504;
	Tue,  9 Jul 2024 11:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPFk3Mbg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DAC10E0BD
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 11:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720525352; x=1752061352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6cTs8mkO5sVZpJ017NH1hy+kGACyO2QhBJlAp1RvSGM=;
 b=bPFk3Mbg3Z9+nPahsLRj6u5DBg37gRsaqQ1KIThbH36gF6Z/TJT0Fun+
 pubSDYyQcBF9le6myDZdZvrnibX/tKhUwzCyxlc7no3+mRduEmYbDKy2L
 d07msUmrliuiaFESd+phsxW9mrO0zM1TcgJ12Niig9aismWOh97eUVX9M
 yzpZuXffTiw+ZIeaz3xL4Uc0A0AZAIVPSltu/pTU6IRTBRlVoDR2PxX/8
 9JW9Ri2gqNMtDv1PHcpj+2ZDvmdO7wWf5IMhpXDlyoJ4YlKese+6JfD7k
 DAt3h5fLUWF7/b67psYiLg4UIWI+IUxHPqwtb7yAZH6YTtaWDEd1vTCcQ w==;
X-CSE-ConnectionGUID: xsWftEkGTxCCFs3vU+KMmQ==
X-CSE-MsgGUID: Yq9+cYI+SKC4jTjPVfn5vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="35209054"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="35209054"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 04:42:31 -0700
X-CSE-ConnectionGUID: Ef7NKT6jSpmM7SwK61KoSw==
X-CSE-MsgGUID: tZ2GtrEvStGv0CJ/8qM5ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="47805285"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa008.fm.intel.com with ESMTP; 09 Jul 2024 04:42:30 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V4] drm/xe/xe2: Add Wa_15015404425
Date: Tue,  9 Jul 2024 17:13:40 +0530
Message-Id: <20240709114340.2987173-1-tejas.upadhyay@intel.com>
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

V4(MattR):
  - Use writel and remove xe_reg usage
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
 drivers/gpu/drm/xe/xe_mmio.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f92faad4b96d..2b3ae4253521 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -121,12 +121,29 @@ int xe_mmio_init(struct xe_device *xe)
 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
 }
 
+static void mmio_flush_pending_writes(struct xe_gt *gt)
+{
+#define DUMMY_REG_OFFSET	0x130030
+	struct xe_tile *tile = gt_to_tile(gt);
+	int i;
+
+	if (!(tile->xe->info.platform == XE_LUNARLAKE))
+		return;
+
+	/* 4 dummy writes */
+	for (i = 0; i < 4; i++)
+		writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
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
 
@@ -139,6 +156,9 @@ u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 	u16 val;
 
+	/* Wa_15015404425 */
+	mmio_flush_pending_writes(gt);
+
 	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
 
@@ -160,6 +180,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
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

