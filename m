Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619ECC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 19:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC9B10E28D;
	Thu, 14 Dec 2023 19:01:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D760D10E95A
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 19:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702580449; x=1734116449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OcQfZ6j0LhPXv0DHALde7Fn3YPT5NJq1aY3ha15VFnE=;
 b=QwOHSTshadsYJXpW3lpKHNsUhuix9vf70jstGyBeOsE1yL/l12GY6pNK
 O9lJVksq3lWD/CVLVUVswEVbBog5+NdhHS+Fl1eHetNw2vBI7F5u683p5
 Kk8FOPbyiRzTwPWjKTIyd9GutFSv2Dv8an7LvlzjiBoSQh+NgzL4eTRBM
 GbAmvd+xEwEy6t4R2V7S35iDWyxKlg5Zurp0RZDUzQjRU1xvHMky2BhgO
 yMCUot1PvwUulJU+wrNvpHMZtTsNgR1FP6u9Q/W+IoyYwV1PqHTljZ2iI
 1kWnUzzOsd5p3IrYT/31D652QIjo9mwub+IlxPL/FJ1OunZGvAGYw0hBO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="399006400"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="399006400"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="15964792"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.198])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:24 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 06/10] drm/xe: Add XE_BO_NEEDS_UC flag to force UC mode
 instead WB
Date: Thu, 14 Dec 2023 19:59:51 +0100
Message-Id: <20231214185955.1791-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231214185955.1791-1-michal.wajdeczko@intel.com>
References: <20231214185955.1791-1-michal.wajdeczko@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When we map BO in GGTT, then by default we are using PAT index
that corresponds to XE_CACHE_WB but ppcoming feature will require
use of the PAT index of the XE_CACHE_UC.  Define new BO flag that
could be used during BO creation to force alternate caching.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h   | 1 +
 drivers/gpu/drm/xe/xe_ggtt.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9b1279aca127..97b32528c600 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -44,6 +44,7 @@
 #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
 #define XE_BO_PAGETABLE			BIT(12)
 #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
+#define XE_BO_NEEDS_UC			BIT(14)
 /* this one is trigger internally only */
 #define XE_BO_INTERNAL_TEST		BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 374ae4289fa0..c239782498a7 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -335,7 +335,8 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
+	u16 cache_mode = bo->flags & XE_BO_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
+	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
 	u64 start = bo->ggtt_node.start;
 	u64 offset, pte;
 
-- 
2.25.1

