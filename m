Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE08EC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 18:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F5E10E65B;
	Tue, 12 Dec 2023 18:17:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBE810E660
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 18:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702405070; x=1733941070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3J8zWM7dTLx/vlcn7YrPCA9RmdOUG/fgXuas6C9mdWA=;
 b=khOe7THdyGJy7ynvvDwRSSuLdZzQG5yz2d9QyrO6vxPZl6U7gqmvR6W7
 GRpg2ZDN6Iif4JaQkpobw3+lyf849ENHaG+uy2p8dJ72nts4/1ulkJtf2
 gnCkh5TcGD48bVc62ArC/mqUfFQ0yXK2pHcTfItY+utW1fBhHzZpyKxzu
 /Fn6Cg7W4Kt8AN5tbxgG9IekW6uM3dMuzTwLU4ukyvGL0v5tJdZx0jdGl
 Ra8I+k3BRBpTm1xpE2m9TK0ycNLej74ql5vKnIg+RQ+JGa/WeTUL+5ELA
 9/aqXgdSSCFvi867VhcRybtGJ/uPSTFPltaOSUkIosA1ADH2iuBtpzgG2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="425968010"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="425968010"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 10:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749806394"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="749806394"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga006.jf.intel.com with ESMTP; 12 Dec 2023 10:17:48 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 04/10] drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
Date: Tue, 12 Dec 2023 23:55:27 +0530
Message-Id: <20231212182533.1722705-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212182533.1722705-1-himal.prasad.ghimiray@intel.com>
References: <20231212182533.1722705-1-himal.prasad.ghimiray@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

- The XY_CTRL_SURF_COPY_BLT instruction operating on ccs data expects
size in pages of main memory for which CCS data should be copied.
- The bitfield representing copy size in XY_CTRL_SURF_COPY_BLT has
shifted one bit higher in the instruction.

v2:
 - Fix the num_pages for ccs size calculation.
 - Address nits (Thomas)

v3:
- Use FIELD_PREP and FIELD_FIT instead of shifts and numbers.(Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  5 ++---
 drivers/gpu/drm/xe/xe_migrate.c           | 21 +++++++++++++++------
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 1f9c32e694c6..a255946b6f77 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -11,13 +11,12 @@
 #define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
 #define   SRC_ACCESS_TYPE_SHIFT		21
 #define   DST_ACCESS_TYPE_SHIFT		20
-#define   CCS_SIZE_MASK			0x3FF
-#define   CCS_SIZE_SHIFT		8
+#define   CCS_SIZE_MASK			GENMASK(17, 8)
+#define   XE2_CCS_SIZE_MASK		GENMASK(18, 9)
 #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
 #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
 #define   NUM_CCS_BYTES_PER_BLOCK	256
 #define   NUM_BYTES_PER_CCS_BYTE(_xe)	(GRAPHICS_VER(_xe) >= 20 ? 512 : 256)
-#define   NUM_CCS_BLKS_PER_XFER		1024
 
 #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
 #define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 2ca927f3fb2a..5a390e19e171 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -526,21 +526,30 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 *cs = bb->cs + bb->len;
 	u32 num_ccs_blks;
+	u32 num_pages;
+	u32 ccs_copy_size;
 	u32 mocs;
 
-	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
-				    NUM_CCS_BYTES_PER_BLOCK);
-	xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
+	if (GRAPHICS_VERx100(xe) >= 2000) {
+		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
+		xe_gt_assert(gt, FIELD_FIT(XE2_CCS_SIZE_MASK, num_pages - 1));
 
-	if (GRAPHICS_VERx100(xe) >= 2000)
+		ccs_copy_size = REG_FIELD_PREP(XE2_CCS_SIZE_MASK, num_pages - 1);
 		mocs = FIELD_PREP(XE2_XY_CTRL_SURF_MOCS_INDEX_MASK, gt->mocs.uc_index);
-	else
+
+	} else {
+		num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
+					    NUM_CCS_BYTES_PER_BLOCK);
+		xe_gt_assert(gt, FIELD_FIT(CCS_SIZE_MASK, num_ccs_blks - 1));
+
+		ccs_copy_size = REG_FIELD_PREP(CCS_SIZE_MASK, num_ccs_blks - 1);
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
-- 
2.25.1

