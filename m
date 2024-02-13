Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12381C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 21:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BF610E913;
	Tue, 13 Feb 2024 21:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdKrujok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C62910E911
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 21:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707860211; x=1739396211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bk4EehT2j0Qy2fg2GsEpiSoXkwQ2VEuM4DjJYGDpUTo=;
 b=VdKrujok1iWP7+kXNkH5l19yTG4n7PPSGT3B+lM5cW5yPkp+UwwGPRa9
 NrDObJo/GWZ5pfmzoVEkA9/W0c7GFjkCwu2sWS3JW/Rj5eNCc4S9DeTr2
 WYmZGE21w2K9eISqfsbt1bZwi73QSPnCyAdZSU72ymeD8LDNYPuJF32oA
 NySsedStX8mm9BkEP8odjQNXFDoBIYIs5YNqUQlVcYInBhxNvHlWhXOxK
 2KTsHPbGdIqvCbn5sMRkyAhQPtMairWmxbj8gEF419ptiNPpQN3auE1un
 bI1+HXBjXiUGUiSTph9CO1JxLKil7kdqCHDLrCFW8E40r09jUIW0ETejD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1759388"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="1759388"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:36:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7622510"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:36:49 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/guc: Promote GUC_GGTT_TOP definition to
 regs/xe_guc_regs.h
Date: Tue, 13 Feb 2024 22:36:34 +0100
Message-Id: <20240213213634.1437-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

This is a hardware based definition and instead of multiple local
definitions it would be better to have just one common definition.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_ggtt.c          | 4 +---
 drivers/gpu/drm/xe/xe_guc.c           | 2 --
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 92320bbc9d3d..087eaa3b4d63 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -140,4 +140,7 @@ struct guc_doorbell_info {
 	u32 reserved[14];
 } __packed;
 
+/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
+#define GUC_GGTT_TOP				0xFEE00000
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ab96edb058d6..df5c58c63b74 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -11,6 +11,7 @@
 #include <drm/i915_drm.h>
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
@@ -26,9 +27,6 @@
 #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
 #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
 
-/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
-#define GUC_GGTT_TOP	0xFEE00000
-
 static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 				   u16 pat_index)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 868208a39829..53a72769d3b4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -32,8 +32,6 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
-/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
-#define GUC_GGTT_TOP    0xFEE00000
 static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 			    struct xe_bo *bo)
 {
-- 
2.43.0

