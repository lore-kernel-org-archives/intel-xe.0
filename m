Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3F7CA0EC3
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 20:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C804D10E781;
	Thu, 29 Aug 2024 20:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIF7X5NC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2141910E781
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 20:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724964609; x=1756500609;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CiEzIO72+R7HK7DcFNj71raKenqr+oIcHV4bceZjTVU=;
 b=CIF7X5NCcPvlzazRaCeuH+p1dPJxUUzZBms9HgiTpdQBXK/iC1BbmEIE
 X5wz0W4qTIb0M2+IeN4GXubOHqtQPoUrOJX09w+vsooZR+l4u8a6rSYZr
 iw13ikL3e8DWWLxoAKV5IAGbDKdsII7NU7KNivUN44Go04yxOsd8jika/
 2Sqs8JlK940h6J+pDhYHMcv23eiIUhgP+MzaMuxXstQc4D0QUDuMYsDHn
 idBLmPHvZEkVjgdTeePaFWUJVC7XqaS0OzKzHNAEdVu1D6/QjMasMCxVN
 Dgh9WQH0CEZN/1E6oBLryrOrNcgU5szvekf2C+lXOx8wJPlQMSqXtNHqd Q==;
X-CSE-ConnectionGUID: 1AIIBkqtR+e+E4I7WpqfOA==
X-CSE-MsgGUID: 9YW+YRi9QXWJXlyfI5/hPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34201524"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="34201524"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 13:50:08 -0700
X-CSE-ConnectionGUID: 6Oj6f0P1RTa0heS+e3yV0g==
X-CSE-MsgGUID: mP+9k2GeSeyo31ztm1qKJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="63384813"
Received: from jcavitt.jf.intel.com ([10.165.125.150])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 13:50:09 -0700
From: Jonathan-Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: Apply workaround 14016747170
Date: Thu, 29 Aug 2024 13:31:43 -0700
Message-Id: <20240829203143.2021381-1-jonathan.cavitt@intel.com>
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

Some revisions of MTL do not properly report the correct value from the
FUSE3_MBC_MEDIA register.  This results in the wrong value being
reported for the l3 mask.

Use the recommended replacement register in this case.

Signed-off-by: Jonathan-Cavitt <jonathan.cavitt@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_gt_mcr.c       | 8 ++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c  | 9 +++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules   | 1 +
 4 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0d1a4a9f4e119..e0d735a5a7fa1 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -522,6 +522,9 @@
 #define   FORCEWAKE_MT(bit)			BIT(bit)
 #define   FORCEWAKE_MT_MASK(bit)		BIT((bit) + 16)
 
+#define MTL_GT_ACTIVITY_FACTOR			XE_REG(0x138010)
+#define   MTL_GT_L3_EXC_MASK			REG_GENMASK(5, 3)
+
 #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
 #define MTL_MEDIA_MC6				XE_REG(0x138048)
 
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 7d7bd0be6233e..211be9dee2e4a 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -15,6 +15,9 @@
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 
+#include <generated/xe_wa_oob.h>
+#include "xe_wa.h"
+
 /**
  * DOC: GT Multicast/Replicated (MCR) Register Support
  *
@@ -245,6 +248,11 @@ static void init_steering_l3bank(struct xe_gt *gt)
 		u32 bank_mask = REG_FIELD_GET(GT_L3_EXC_MASK,
 					      xe_mmio_read32(gt, XEHP_FUSE4));
 
+		/* Wa_14016747170 */
+		if (XE_WA(gt, 14016747170))
+			bank_mask = REG_FIELD_GET(MTL_GT_L3_EXC_MASK,
+						  xe_mmio_read32(gt, MTL_GT_ACTIVITY_FACTOR));
+
 		/*
 		 * Group selects mslice, instance selects bank within mslice.
 		 * Bank 0 is always valid _except_ when the bank mask is 010b.
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 0662f71c6ede7..3a8792845bd76 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -13,6 +13,9 @@
 #include "xe_gt.h"
 #include "xe_mmio.h"
 
+#include <generated/xe_wa_oob.h>
+#include "xe_wa.h"
+
 static void
 load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 {
@@ -144,6 +147,12 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 		u32 fuse4 = xe_mmio_read32(gt, XEHP_FUSE4);
 		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
 
+		/* Wa_14016747170 */
+		if (XE_WA(gt, 14016747170)) {
+			fuse4 = xe_mmio_read32(gt, MTL_GT_ACTIVITY_FACTOR);
+			bank_val = REG_FIELD_GET(MTL_GT_L3_EXC_MASK, fuse4);
+		}
+
 		bitmap_set_value8(per_mask_bit, 0x3, 0);
 		gen_l3_mask_from_pattern(xe, per_node, per_mask_bit, 2, bank_val);
 		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 4,
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 920ca50601466..5bac4123b5db1 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -37,3 +37,4 @@
 16023588340	GRAPHICS_VERSION(2001)
 14019789679	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 2004)
+14016747170	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
-- 
2.25.1

