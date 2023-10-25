Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC71C07545
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 16:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D119410E5C1;
	Wed, 25 Oct 2023 16:04:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E90B10E5BE
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 16:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698249860; x=1729785860;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8gZ/yyEDgTYux0WtYNivz4DiX75lBCJDYrX5SRVu/Q4=;
 b=EKx8ZgqBP7SjNkWbDqSIZZOzyKmCZdRRxUWej+NqNLRF99XGfZV5mUqn
 LIS/FjZ6oSx5LtH3Jej7FpFUwJyGZPrDc3eNCjaOImP1qUFx5CVIOe2IA
 NfbFpQm7Pay04deRsUfGtMd51EGAppo7epYKmUJqrYYsly0b6M6Bk5mDv
 mT4v6Y5wre5QukfMe+g7LIfQM31e8nE4++i2zlkfQVrv7WYj8467i10ma
 IAbVYpckfdDK6PY8MMp5k70AP/4hoSo2sJ5xN36UZO0n0rXIIfuuZy/ud
 wpMcT8OTS4f5NQ68e/h2LcHLxcGRh32AWXMfD4/kchyeTbZlm5tSuy8vT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="384546550"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="384546550"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 09:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762502992"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="762502992"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 09:04:11 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 21:42:01 +0530
Message-Id: <20231025161201.1031963-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Extend rpX values extraction for future
 platforms
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

In existing code flow for future platforms i.e. >1270, the rpX
(rp0,rpn and rpe) fused values are read from gen 6 registers.
Which is not correct. Unless specified gen 1270 regs should be valid
for gen 1270+ platforms as well.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d9375d1d582f..74247e0d3674 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -340,7 +340,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (xe->info.platform == XE_METEORLAKE)
+	if (GRAPHICS_VERx100(xe) >= 1270)
 		mtl_update_rpe_value(pc);
 	else
 		tgl_update_rpe_value(pc);
@@ -365,7 +365,7 @@ static ssize_t freq_act_show(struct device *dev,
 	xe_device_mem_access_get(gt_to_xe(gt));
 
 	/* When in RC6, actual frequency reported will be 0. */
-	if (xe->info.platform == XE_METEORLAKE) {
+	if (GRAPHICS_VERx100(xe) >= 1270) {
 		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
 		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
 	} else {
@@ -680,7 +680,7 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (xe->info.platform == XE_METEORLAKE)
+	if (GRAPHICS_VERx100(xe) >= 1270)
 		mtl_init_fused_rp_values(pc);
 	else
 		tgl_init_fused_rp_values(pc);
-- 
2.25.1

