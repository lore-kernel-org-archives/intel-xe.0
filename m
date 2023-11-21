Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A32EC61D88
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 10:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C12510E46B;
	Tue, 21 Nov 2023 10:01:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CB510E257
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 10:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700560906; x=1732096906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eicy9yOE4eKp1dAi0E4nGbBRyYEFHTPNWJYm8VxoV7I=;
 b=c0zPwab6mifYqdTDp3316tTP8cv3MP6TJ+0yKWYKyOhMZBD2ldBG9E1f
 SJ67UnL+y6xc380rH9wCSfyYOvPIl0YHzD1jyDFhTAzHrG3v0zUBv/z9Q
 xFgei340qoMXhkbExXckcUHuSXoZ1OdN+dOgdOnkAQhEnFySsv5oqRAOF
 LV+ZtWsUdCA9/hZVkmVKE8kyQQj3eob4spbApmBPpnWb/Ni4N8ewnwIYW
 8J902qHQSZQo+C/ckCD3fRdzw1J3zyqVJ5dHiZ2CxREuupE5WmLpqAuKS
 Awv9Ev40UDde6OA/O2bkbJQWU+hcv7IN0ddKdutBuIwjA3XFfi9zr7lPn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394646804"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="394646804"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 02:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="857283647"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="857283647"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2023 02:01:44 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 15:39:04 +0530
Message-Id: <20231121100906.3587649-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v2 4/6] drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
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

- The XY_CTRL_SURF_COPY_BLT instruction operationg on ccs data expects
size in pages of main memory for which CCS data should be copied.
- The bitfield representing copy size in XY_CTRL_SURF_COPY_BLT has
shifted one bit higher in the instruction.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
 drivers/gpu/drm/xe/xe_migrate.c           | 23 +++++++++++++++++------
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 7f74592f99ce..47459841aa69 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -13,6 +13,7 @@
 #define   DST_ACCESS_TYPE_SHIFT		20
 #define   CCS_SIZE_MASK			0x3FF
 #define   CCS_SIZE_SHIFT		8
+#define   XE2_CCS_SIZE_SHIFT		9
 #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
 #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
 #define   NUM_CCS_BYTES_PER_BLOCK	256
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ed2f3f5109f3..06706fad67aa 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -523,21 +523,31 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 *cs = bb->cs + bb->len;
 	u32 num_ccs_blks;
+	u32 num_ccs_pages;
+	u32 ccs_copy_size;
 	u32 mocs;
 
-	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
-				    NUM_CCS_BYTES_PER_BLOCK);
-	xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
+	if (GRAPHICS_VERx100(xe) >= 2000) {
+		num_ccs_pages = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
+					     XE_PAGE_SIZE);
+		xe_gt_assert(gt, num_ccs_pages <= 1024);
 
-	if (GRAPHICS_VERx100(xe) >= 2000)
+		ccs_copy_size = ((num_ccs_pages - 1) & CCS_SIZE_MASK) << XE2_CCS_SIZE_SHIFT;
 		mocs = FIELD_PREP(XE2_XY_CTRL_SURF_MOCS_INDEX_MASK, gt->mocs.uc_index);
-	else
+
+	} else {
+		num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
+					    NUM_CCS_BYTES_PER_BLOCK);
+		xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
+
+		ccs_copy_size = ((num_ccs_blks - 1) & CCS_SIZE_MASK) << CCS_SIZE_SHIFT;
 		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
+	}
 
 	*cs++ = XY_CTRL_SURF_COPY_BLT |
 		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
 		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
-		((num_ccs_blks - 1) & CCS_SIZE_MASK) << CCS_SIZE_SHIFT;
+		ccs_copy_size;
 	*cs++ = lower_32_bits(src_ofs);
 	*cs++ = upper_32_bits(src_ofs) | mocs;
 	*cs++ = lower_32_bits(dst_ofs);
@@ -992,6 +1002,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE,
 			   clear_vram);
+
 		if (xe_device_has_flat_ccs(xe) && clear_vram) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_vram_ofs, false, clear_L0);
-- 
2.25.1

