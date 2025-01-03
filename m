Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072ADE77198
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 00:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0E510E7CA;
	Fri,  3 Jan 2025 00:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRjE8W+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4D610E7CA
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jan 2025 00:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735863093; x=1767399093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lICmlvq9uZDgtTOnFMoTqRqmEH75039d3w77qbsUkkg=;
 b=DRjE8W+zhXT6ZFVlY4HKtqHcvkSeho7E0ID+/L8LEGf0QiqMKBvVUiNk
 EvSLnfRuL7JaGnuaAU0Jym5ACqvKLNLE9MC+GjWz1Z4PT18NTaYPqu3IY
 iyw7vTzqa3UWDsaGOlPvOQdmgtml/H7VO88gy41GIPDaGBR2aKRvxESO1
 mzOMPrm/Nhmuf/0jAmIA/PXAKgxXIR+R/VBZh1IqRe7f4uVsHHZhjwBRA
 ybJI1GEqfzf4jFEdnUKzQQcv1b2kuWlNF1+VTtci0ko9x60rnUi3li1nz
 cqjWzQ26L2BHLJmN6v5JeEEkJsNH3OZdAHfGQ9jjFi+WXdg5UbTxCkZtU A==;
X-CSE-ConnectionGUID: xj3wQAPpSEiYS+DO9MpFNQ==
X-CSE-MsgGUID: a/8mqbsTRoKUaKIxLozI1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="53519371"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="53519371"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 16:11:31 -0800
X-CSE-ConnectionGUID: SdZh/00QSG2aI8sEcl34ew==
X-CSE-MsgGUID: olhaTC+9QKyBh+5hzCO5Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="101498544"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 16:11:31 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] drm/xe: Remove "graphics tile" from kernel doc
Date: Thu,  2 Jan 2025 16:11:11 -0800
Message-ID: <20250103001111.331684-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250103001111.331684-1-lucas.demarchi@intel.com>
References: <20250103001111.331684-1-lucas.demarchi@intel.com>
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

Avoid using "graphics tile" to refer to GT since it's ambiguous: it's
**part** of a tile and there's also "media gt". In several places it's
documented as "GT structure", so just follow it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |  2 +-
 drivers/gpu/drm/xe/xe_gt_stats.c            |  4 ++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++++++------
 drivers/gpu/drm/xe/xe_hw_engine_types.h     |  2 +-
 drivers/gpu/drm/xe/xe_hw_fence_types.h      |  2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index eec8f9935a58e..5af5419cec7a6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -41,7 +41,7 @@ struct xe_exec_queue {
 	/** @xef: Back pointer to xe file if this is user created exec queue */
 	struct xe_file *xef;
 
-	/** @gt: graphics tile this exec queue can submit to */
+	/** @gt: GT structure this exec queue can submit to */
 	struct xe_gt *gt;
 	/**
 	 * @hwe: A hardware of the same class. May (physical engine) or may not
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index c7364a5aef8fa..7a6c1d808e419 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -12,7 +12,7 @@
 
 /**
  * xe_gt_stats_incr - Increments the specified stats counter
- * @gt: graphics tile
+ * @gt: GT structure
  * @id: xe_gt_stats_id type id that needs to be incremented
  * @incr: value to be incremented with
  *
@@ -32,7 +32,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 
 /**
  * xe_gt_stats_print_info - Print the GT stats
- * @gt: graphics tile
+ * @gt: GT structure
  * @p: drm_printer where it will be printed out.
  *
  * This prints out all the available GT stats.
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 257b500e17037..0a93831c0a025 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -107,7 +107,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 
 /**
  * xe_gt_tlb_invalidation_init_early - Initialize GT TLB invalidation state
- * @gt: graphics tile
+ * @gt: GT structure
  *
  * Initialize GT TLB invalidation state, purely software initialization, should
  * be called once during driver load.
@@ -128,7 +128,7 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
 
 /**
  * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset
- * @gt: graphics tile
+ * @gt: GT structure
  *
  * Signal any pending invalidation fences, should be called during a GT reset
  */
@@ -244,7 +244,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 
 /**
  * xe_gt_tlb_invalidation_guc - Issue a TLB invalidation on this GT for the GuC
- * @gt: graphics tile
+ * @gt: GT structure
  * @fence: invalidation fence which will be signal on TLB invalidation
  * completion
  *
@@ -277,7 +277,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
 
 /**
  * xe_gt_tlb_invalidation_ggtt - Issue a TLB invalidation on this GT for the GGTT
- * @gt: graphics tile
+ * @gt: GT structure
  *
  * Issue a TLB invalidation for the GGTT. Completion of TLB invalidation is
  * synchronous.
@@ -326,7 +326,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
  * xe_gt_tlb_invalidation_range - Issue a TLB invalidation on this GT for an
  * address range
  *
- * @gt: graphics tile
+ * @gt: GT structure
  * @fence: invalidation fence which will be signal on TLB invalidation
  * completion
  * @start: start address
@@ -412,7 +412,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 
 /**
  * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
- * @gt: graphics tile
+ * @gt: GT structure
  * @fence: invalidation fence which will be signal on TLB invalidation
  * completion, can be NULL
  * @vma: VMA to invalidate
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index e14bee95e3643..e4191a7a2c318 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -106,7 +106,7 @@ struct xe_hw_engine_class_intf {
  * Contains all the hardware engine state for physical instances.
  */
 struct xe_hw_engine {
-	/** @gt: graphics tile this hw engine belongs to */
+	/** @gt: GT structure this hw engine belongs to */
 	struct xe_gt *gt;
 	/** @name: name of this hw engine */
 	const char *name;
diff --git a/drivers/gpu/drm/xe/xe_hw_fence_types.h b/drivers/gpu/drm/xe/xe_hw_fence_types.h
index 364a61f4bfda9..58a8d09afe5ca 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence_types.h
@@ -41,7 +41,7 @@ struct xe_hw_fence_irq {
  * to a xe_hw_fence_irq, maintains serial seqno.
  */
 struct xe_hw_fence_ctx {
-	/** @gt: graphics tile of hardware fence context */
+	/** @gt: GT structure of hardware fence context */
 	struct xe_gt *gt;
 	/** @irq: fence irq handler */
 	struct xe_hw_fence_irq *irq;
-- 
2.47.0

