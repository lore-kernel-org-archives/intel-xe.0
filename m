Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816CDC7EE45
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A63310E5F9;
	Thu,  1 Jun 2023 21:52:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE8010E600
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656370; x=1717192370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/9h+a5twwaVJc6gGjGJdnsD5NwaEJhDLaWKI8XHbSYI=;
 b=JC93CgjWAZm/COJNTeXJuct/HjYVIuih33cN5Ga2a3s2cP5u32qqdT3e
 DTj3uROK06gV4cY/gqIcvsdzz3uYhsFjN/1KD5wE69M/VEOLEOXMWc6VP
 ao5f78RxXSq3ADhRaDZ51QZkbaDWBf+uBp8AwTaveALhR114S3uOsHMI9
 iAKR7fgofqeogEEYrCWHv0XVB31iuhunZtDLuBAT/3fcTaPNwTnggQqXH
 gCE0Jb8by9sASa7eH00twK/087DX+rBr3RfLTBsL+kXhShoiLZI7eMue5
 98Ik1zPjqsta+WEtpZGTl03d7ieGMgfDDFoCBjhRBEaOWxtQbtO5B3tBN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313635"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313635"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563630"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563630"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:39 -0700
Message-Id: <20230601215244.678611-27-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 26/31] drm/xe: Invalidate TLB on all affected GTs
 during GGTT updates
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The GGTT is part of the tile and is shared by the primary and media GTs
on platforms with a standalone media architecture.  However each of
these GTs has its own TLBs caching the page table lookups, and each
needs to be invalidated separately.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index c4862c1cfd9b..9a3edead3948 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -190,13 +190,10 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 #define PVC_GUC_TLB_INV_DESC1			XE_REG(0xcf80)
 #define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
 
-void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
+static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 {
-	/*
-	 * TODO: Loop over each GT in tile once media GT support is
-	 * re-added
-	 */
-	struct xe_gt *gt = ggtt->tile->primary_gt;
+	if (!gt)
+		return;
 
 	/* TODO: vfunc for GuC vs. non-GuC */
 
@@ -221,6 +218,13 @@ void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 	}
 }
 
+void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
+{
+	/* Each GT in a tile has its own TLB to cache GGTT lookups */
+	ggtt_invalidate_gt_tlb(ggtt->tile->primary_gt);
+	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
+}
+
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
 {
 	u64 addr, scratch_pte;
-- 
2.40.1

