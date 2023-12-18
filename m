Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D90EC46CD3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C225A10E39F;
	Mon, 18 Dec 2023 19:00:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0361310E392
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926047; x=1734462047;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LbmQKewkzJmvyHZh1u2p+otB4WCF/K2DjzqxPMc8caY=;
 b=SfXvvd7cBHDuDA5cJu6fD5bhCbolGYE3us06xhot8RNR0tTV1BbAGq4i
 Tm6NdaF8Tcvo6AfMbSJTFT2kmpHQgtrZfITEyJCK6NdEVOtoO8QM6virH
 hxK8GfDPcEvXe1M/nntp7798JUYjBz4BbyjRfJbX3H4/LkuNn03UvHpSa
 u2sfgHB2VX5+x1U7vpAYmrU0SA1FIYRtDvZJH5LTfTDWNCjj7haTC+e5s
 eH12dGDuEM9PKYYlH0pGMollRXOkXWlH5frnF1vN6giBXiJh3SOhm5gN5
 hFS3CRGlGwGUFSeYN2me1D/QZrMChEy7+r0EbHBBrP+5v0qwOxTPX4g8W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="461984335"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="461984335"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779157437"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="779157437"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:56 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 06/10] drm/xe: Add XE_BO_NEEDS_UC flag to force UC mode
 instead WB
Date: Mon, 18 Dec 2023 17:53:40 +0100
Message-Id: <20231218165344.458-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231218165344.458-1-michal.wajdeczko@intel.com>
References: <20231218165344.458-1-michal.wajdeczko@intel.com>
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

When we map BO in GGTT, then by default we are using PAT index
that corresponds to XE_CACHE_WB but ppcoming feature will require
use of the PAT index of the XE_CACHE_UC.  Define new BO flag that
could be used during BO creation to force alternate caching.

Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://lore.kernel.org/r/20231214185955.1791-7-michal.wajdeczko@intel.com
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
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
index 3efd2d066bf7..c639dbf3bdd2 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -334,7 +334,8 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
+	u16 cache_mode = bo->flags & XE_BO_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
+	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
 	u64 start = bo->ggtt_node.start;
 	u64 offset, pte;
 
-- 
2.25.1

