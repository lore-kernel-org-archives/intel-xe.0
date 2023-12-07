Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E68C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 09:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C009710E825;
	Thu,  7 Dec 2023 09:11:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879AF10E1B4
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701940313; x=1733476313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2NviboQkIQm1bxdbk2V6x35t6/H4v4huRiyTnkEEb8s=;
 b=NBCBbQvQQ2KvassF/LsbQnjm7/KSwS16XfqvFXs/GinsisTSL3iz3tjr
 XJ+65Zk1S21KUiQ4bJXA36D8Lz0evPk6O9P/saQpyl+enuuyTQp4YjTzt
 n8OfwUoJKYXqnJqU37X/h4IOfm+jNDbWnVCrZk40wUpIOkgNQi3fIPdWr
 Ced1cmU0wj/PQT/2eZjsM4StGt6WF6ZYVmv7WvHGpoXbkakxogcrquML+
 YNEzG/9TYhOIaQe5P+VyvpYATxY62fyUaV3SIS2YDRPbJsNE4wSEpMxjz
 yDI0Gm/uhCIMRh8KTBgHAzHvIxRv547/k1PdCA9+uFTqsIEYa41lsYKjo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391373978"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="391373978"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895067842"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895067842"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 07 Dec 2023 01:11:42 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 14:49:16 +0530
Message-Id: <20231207091922.1224800-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 3/9] drm/xe/xe2: Updates on
 XY_CTRL_SURF_COPY_BLT
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

v2:
 - Fix the num_pages for ccs size calculation.
 - Address nits (Thomas)

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
 drivers/gpu/drm/xe/xe_migrate.c           | 21 +++++++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 1f9c32e694c6..6ff6c7aaa648 100644
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
index e8b567708ac0..7ef068451b59 100644
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
+		xe_gt_assert(gt, num_pages <= 1024);
 
-	if (GRAPHICS_VERx100(xe) >= 2000)
+		ccs_copy_size = ((num_pages - 1) & CCS_SIZE_MASK) << XE2_CCS_SIZE_SHIFT;
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
-- 
2.25.1

