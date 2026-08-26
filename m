Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D92C61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 10:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A8410E6B2;
	Wed, 26 Aug 2026 10:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmmieYlS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FA410E6B2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 10:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787740405; x=1819276405;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=AqnVwAuI/f4gXjNwcew7w8Xgy2H+dz/4EruBImccgiY=;
 b=LmmieYlSi4+41CzySN0HvEhnjX57tgFq1TOD87yyQoZS6NTrhDFZhriT
 ljVpLIb4zEgHXwDb7GzOsLd16QbEJk7Uidy0CNC4c/eJG5ods//pj7xzO
 ACDCCKEGwkCtGMGl0GmtAwqhNV+IyJIBXuOabrnPJuWS7ASjlxaTlSk2o
 mJ6x9BbTiuRHhlhXpcLIqyPCbZIHCebHOv9o/bW/88ZQ3Y4fOm3xy28KZ
 yjqkAg5aV6s4cgD2Gtrbf19c0jCHW4K5TXSB3t7v4tSDCSSDM8pH0HikX
 t7ZzG3YnGBtsUSP84wBsD/xihbjRMggsc8hKyuY+68QwpGEng6TsjGR7M g==;
X-CSE-ConnectionGUID: zmuwGlR2TKiEsNZydA7GnQ==
X-CSE-MsgGUID: asbKVI9LTxSPgkKQDJPcaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98813197"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="98813197"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 03:33:25 -0700
X-CSE-ConnectionGUID: JisxcrlpQnKpkNOhbRoK5w==
X-CSE-MsgGUID: N6XZWrbNS26EQAymQf4yJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="261411446"
Received: from unknown (HELO tilak-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.239.38])
 by fmviesa009.fm.intel.com with ESMTP; 26 Aug 2026 03:33:22 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe/ggtt: fault on unmapped GGTT for multi-queue
 platforms
Date: Wed, 26 Aug 2026 16:01:54 +0530
Message-ID: <20260826103156.3233208-2-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260826103156.3233208-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260826103156.3233208-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

On multi-queue platforms an engine can retain a stale GGTT TLB entry
for a range that has since been unmapped and recycled. When unmapped
GGTT entries resolve to the scratch page, such a stale access lands on
scratch silently instead of faulting, masking the error.

On multi-queue platforms, skip allocating the GGTT scratch page so
cleared and unmapped ranges hold PTE=0. The whole GGTT then
consistently faults on unmapped access for the entire boot; other
platforms keep the scratch page and are unaffected.

v2:
- Add xe_gt_has_multi_queue() helper and address nits (Niranjana)
v3:
- Drop scratch entirely instead of toggling per-unmap (Matt Brost)

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 39 ++++++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_gt.h   | 13 ++++++++++++
 2 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477f..bd65100283e3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,6 +20,7 @@
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_map.h"
@@ -533,27 +534,35 @@ void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
 int xe_ggtt_init(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	unsigned int flags;
 	int err;
 
 	/*
-	 * So we don't need to worry about 64K GGTT layout when dealing with
-	 * scratch entries, rather keep the scratch page in system memory on
-	 * platforms where 64K pages are needed for VRAM.
+	 * Multi-queue platforms leave unmapped GGTT faulting (no scratch) so a
+	 * stale engine TLB entry can't silently resolve to the scratch page.
 	 */
-	flags = 0;
-	if (ggtt->flags & XE_GGTT_FLAGS_64K)
-		flags |= XE_BO_FLAG_SYSTEM;
-	else
-		flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
+	if (!xe_gt_has_multi_queue(ggtt->tile->primary_gt)) {
+		unsigned int flags = 0;
+
+		/*
+		 * So we don't need to worry about 64K GGTT layout when dealing
+		 * with scratch entries, rather keep the scratch page in system
+		 * memory on platforms where 64K pages are needed for VRAM.
+		 */
+		if (ggtt->flags & XE_GGTT_FLAGS_64K)
+			flags |= XE_BO_FLAG_SYSTEM;
+		else
+			flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
 
-	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
-	if (IS_ERR(ggtt->scratch)) {
-		err = PTR_ERR(ggtt->scratch);
-		goto err;
-	}
+		ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile,
+							     XE_PAGE_SIZE, flags);
+		if (IS_ERR(ggtt->scratch)) {
+			err = PTR_ERR(ggtt->scratch);
+			goto err;
+		}
 
-	xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0, xe_bo_size(ggtt->scratch));
+		xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0,
+			      xe_bo_size(ggtt->scratch));
+	}
 
 	xe_ggtt_initial_clear(ggtt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 65a4655b0994..92d934d50244 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -160,4 +160,17 @@ static inline bool xe_gt_supports_multi_queue(const struct xe_gt *gt,
 	return gt->info.multi_queue_engine_class_mask & BIT(class);
 }
 
+/**
+ * xe_gt_has_multi_queue() - Check if gt supports multi-queue on
+ * any engine class.
+ *
+ * @gt: the GT object (may be NULL)
+ *
+ * Return: true if any engine class on @gt supports multi queue, else false
+ */
+static inline bool xe_gt_has_multi_queue(const struct xe_gt *gt)
+{
+	return gt && gt->info.multi_queue_engine_class_mask;
+}
+
 #endif
-- 
2.46.0

