Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CFBCCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 14:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3A010E822;
	Wed, 15 Oct 2025 14:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ane/oGgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3E810E812
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 14:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760538028; x=1792074028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=858ToFjvVr9g7DBPHplgAOJajSFQS1ToJEXowuetj4Y=;
 b=Ane/oGgrroG1J4a+XBN7FJpp23lus3r/Z3qd1ncu03n+7x+VLaq0Fy1o
 32kgKQkIGjRW3Y+YOu2hXkGgIQpebW+fCSW0vrVBd9Ev222KCBj2Hpr95
 QMk5WJlGIx99MDBV15crlUo+nEj9I0YFIg8K6HAwIjzxhvhv0+S7Y1gXq
 K9wW+y9xh4lr2+vsW6XrKJ0DsR4YN6vtmRZj0i3uTb+wXm5qpP+kKFqbB
 Ccvl4rtYeVJ9mAGKKA4LDvenm1jg9G7BmTnLIsTF7iRf2ETrx14i3AnAE
 ZpE18k8jB8cEdsAqNg2pOOVXjGsg/k2u9yzqS6fOR2J7FLAFcbbab9VcF A==;
X-CSE-ConnectionGUID: XWvvOSB9RqSSmFk6r9D7bA==
X-CSE-MsgGUID: tRoplmVpQO2fUIgCD/h+YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="72990299"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="72990299"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:20:28 -0700
X-CSE-ConnectionGUID: Ezo6/yiaRP6Dlvc73l90IQ==
X-CSE-MsgGUID: v640asr6SIiRZX6idHTt+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="181740980"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:20:27 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 5/6] drm/xe/migrate: support MEM_COPY instruction
Date: Wed, 15 Oct 2025 15:19:35 +0100
Message-ID: <20251015141929.123637-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015141929.123637-8-matthew.auld@intel.com>
References: <20251015141929.123637-8-matthew.auld@intel.com>
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

Make this the default on xe2+ when doing a copy. This has a few
advantages over the exiting copy instruction:

1) It has a special PAGE_COPY mode that claims to be optimised for
   page-in/page-out, which is the vast majority of current users.

2) It also has a simple BYTE_COPY mode that supports byte granularity
   copying without any restrictions.

With 2) we can now easily skip the bounce buffer flow when copying
buffers with strange sizing/alignment, like for memory_access. But that
is left for the next patch.

BSpec: 57561
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |  6 ++
 drivers/gpu/drm/xe/xe_migrate.c               | 64 ++++++++++++++++---
 2 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 8cfcd3360896..5d41ca297447 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -31,6 +31,12 @@
 #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
 #define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
 
+#define MEM_COPY_CMD (2 << 29 | 0x5a << 22 | 0x8)
+#define   MEM_COPY_PAGE_COPY_MODE REG_BIT(19)
+#define   MEM_COPY_MATRIX_COPY REG_BIT(17)
+#define   MEM_COPY_SRC_MOCS_INDEX_MASK	GENMASK(31, 28)
+#define   MEM_COPY_DST_MOCS_INDEX_MASK	GENMASK(6, 3)
+
 #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
 #define   PVC_MEM_SET_CMD_LEN_DW	7
 #define   PVC_MEM_SET_MATRIX		REG_BIT(17)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3801152b7f8f..da1fefb96070 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -699,37 +699,83 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 }
 
 #define EMIT_COPY_DW 10
-static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
-		      u64 src_ofs, u64 dst_ofs, unsigned int size,
-		      unsigned int pitch)
+static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
+			      u64 dst_ofs, unsigned int size,
+			      unsigned int pitch)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 mocs = 0;
 	u32 tile_y = 0;
 
+	xe_gt_assert(gt, GRAPHICS_VER(xe) < 20);
 	xe_gt_assert(gt, !(pitch & 3));
 	xe_gt_assert(gt, size / pitch <= S16_MAX);
 	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
 	xe_gt_assert(gt, pitch <= U16_MAX);
 
-	if (GRAPHICS_VER(xe) >= 20)
-		mocs = FIELD_PREP(XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK, gt->mocs.uc_index);
-
 	if (GRAPHICS_VERx100(xe) >= 1250)
 		tile_y = XY_FAST_COPY_BLT_D1_SRC_TILE4 | XY_FAST_COPY_BLT_D1_DST_TILE4;
 
 	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
-	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y | mocs;
+	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y;
 	bb->cs[bb->len++] = 0;
 	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
 	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
 	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
 	bb->cs[bb->len++] = 0;
-	bb->cs[bb->len++] = pitch | mocs;
+	bb->cs[bb->len++] = pitch;
 	bb->cs[bb->len++] = lower_32_bits(src_ofs);
 	bb->cs[bb->len++] = upper_32_bits(src_ofs);
 }
 
+static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
+			  u64 dst_ofs, unsigned int size, unsigned int pitch)
+{
+	u32 mode, copy_type, width;
+
+	xe_gt_assert(gt, IS_ALIGNED(size, pitch));
+	xe_gt_assert(gt, pitch <= U16_MAX);
+	xe_gt_assert(gt, size);
+
+	if (IS_ALIGNED(size, 256) &&
+	    IS_ALIGNED(lower_32_bits(src_ofs), 256) &&
+	    IS_ALIGNED(lower_32_bits(dst_ofs), 256)) {
+		mode = MEM_COPY_PAGE_COPY_MODE;
+		copy_type = 0; /* linear copy */
+		width = size / 256;
+	} else {
+		xe_gt_assert(gt, size / pitch <= U16_MAX);
+		mode = 0; /* BYTE_COPY */
+		copy_type = MEM_COPY_MATRIX_COPY;
+		width = pitch;
+	}
+
+	xe_gt_assert(gt, width <= U16_MAX);
+
+	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type;
+	bb->cs[bb->len++] = width - 1;
+	bb->cs[bb->len++] = size / pitch - 1; /* ignored by hw for page copy above */
+	bb->cs[bb->len++] = pitch - 1;
+	bb->cs[bb->len++] = pitch - 1;
+	bb->cs[bb->len++] = lower_32_bits(src_ofs);
+	bb->cs[bb->len++] = upper_32_bits(src_ofs);
+	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
+	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
+	bb->cs[bb->len++] = FIELD_PREP(MEM_COPY_SRC_MOCS_INDEX_MASK, gt->mocs.uc_index) |
+			    FIELD_PREP(MEM_COPY_DST_MOCS_INDEX_MASK, gt->mocs.uc_index);
+}
+
+static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
+		      u64 src_ofs, u64 dst_ofs, unsigned int size,
+		      unsigned int pitch)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (GRAPHICS_VER(xe) >= 20)
+		emit_mem_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
+	else
+		emit_xy_fast_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
+}
+
 static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
 {
 	return usm ? m->usm_batch_base_ofs : m->batch_base_ofs;
-- 
2.51.0

