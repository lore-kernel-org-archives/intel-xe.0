Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C3BC7EE3A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1D810E43C;
	Tue, 30 May 2023 21:16:20 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D7510E43B
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481372; x=1717017372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/9h+a5twwaVJc6gGjGJdnsD5NwaEJhDLaWKI8XHbSYI=;
 b=lZCM8SRSc38GQEx7slURoZNWTILz6PSnYbtqrqDFp/bfW2LSDaKhuPhE
 y6C+91LZAlgcwgdUwpXds9XcwNmbPC3E8UldUzF3CmkMY1Tp5nSXNbtjN
 UupStiNTk8uzYHxxRZsS0pmQShnvu+/W37EQSbyJcsq/j+bqUxPwnsfax
 Z8H8G+4SWuuyGvQZ/2V91KAm1l178SpFShl4JYUvUcBIzDVFsqspbTHci
 GkpSa84CWC9BYJRp/LfGgGVpiZdx6WOhUHuMbKmJD7MaV9TQDLHATaiVt
 bV6BBzmOuh/6YQFOXbCa0yGbB5C8pJnvDor99gAjxPphYgHqISqAM1ZYa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311965"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311965"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139483"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139483"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:44 -0700
Message-Id: <20230530211549.2632538-27-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 26/31] drm/xe: Invalidate TLB on all affected
 GTs during GGTT updates
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
Cc: matthew.d.roper@intel.com, Nirmoy Das <nirmoy.das@intel.com>
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

