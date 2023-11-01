Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE603C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 16:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC6910E738;
	Wed,  1 Nov 2023 16:24:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9663610E738
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698855851; x=1730391851;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NDvwI4WQ3B0mkGgfuPQVD2UJEUvamzQ7KsFohBsOYJw=;
 b=hGMx2Iey1N4Ivm0z5xzoD9ygArEtm35RfnyTr64ZnCrynKPb1RHawUYS
 F4uVUO2t9ELXVsbw7a7AWTzFXahNgEV/MH0RJFC08QE2VRPFvYgUEMT5r
 /ZwXFM7aM8VSE7fldyjxh0thDH8srakHlv6c7nuP+snuVmT0RnlUVhNqa
 qY2Jj768LLFMuUKWJDEuubIFks7RMwpc1Ek+9DXPK5YuL/TCDerWoZX8E
 /NdMJUJbEByXl2dLvwlMmoT1nftoxD9AZWuyiNC6RwcZf/nCaMsKjXMy9
 iqcgDqiynNm8fjpQn6pA8IyzyX2aZIHWEx7Kl+Q2P94sUDSBNCigR2PnN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="455001045"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="455001045"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 09:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1092390595"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="1092390595"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 09:24:08 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Nov 2023 22:02:12 +0530
Message-Id: <20231101163212.1629685-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mtl: Use 16.67 Mhz freq scale factor to
 get rpX
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

For mtl and above 16.67 Mhz is the scale factor to calculate
rpX frequencies.

v2: Fix review comment (Ashutosh)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 74247e0d3674..020c6597cd78 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -313,7 +313,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
 	else
 		reg = xe_mmio_read32(gt, MTL_GT_RPE_FREQUENCY);
 
-	pc->rpe_freq = REG_FIELD_GET(MTL_RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
 }
 
 static void tgl_update_rpe_value(struct xe_guc_pc *pc)
@@ -653,10 +653,10 @@ static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
 		reg = xe_mmio_read32(gt, MTL_MEDIAP_STATE_CAP);
 	else
 		reg = xe_mmio_read32(gt, MTL_RP_STATE_CAP);
-	pc->rp0_freq = REG_FIELD_GET(MTL_RP0_CAP_MASK, reg) *
-		GT_FREQUENCY_MULTIPLIER;
-	pc->rpn_freq = REG_FIELD_GET(MTL_RPN_CAP_MASK, reg) *
-		GT_FREQUENCY_MULTIPLIER;
+
+	pc->rp0_freq = decode_freq(REG_FIELD_GET(MTL_RP0_CAP_MASK, reg));
+
+	pc->rpn_freq = decode_freq(REG_FIELD_GET(MTL_RPN_CAP_MASK, reg));
 }
 
 static void tgl_init_fused_rp_values(struct xe_guc_pc *pc)
-- 
2.25.1

