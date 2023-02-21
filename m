Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D29DC64ED6
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 23:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F4710E39A;
	Tue, 21 Feb 2023 23:34:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8454510E38E
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 23:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677022446; x=1708558446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S/2joBsNN4+p1MFC2bjCHai+j+O6FioJe0ZdMtQSzic=;
 b=azAI2JDtdBQr8tGAbHLQN/R8kQoJCzEUsktgAsRdq7E/yRFTRgjPzqTW
 diTxyeaKMjwJ2QuWiAYefzfWLKTP73Q4M6mOPoVjItKAg951vuShkyTKY
 2BThiHNtdM+cs4iDstN1SD3b65SMApozTKRSFKJOixfG9/zMzGF91U/la
 Rdsj3UrFvwiRXXcQsWfACIbw625fBvH50X9+AunpnLeqGYoE/G36biS02
 nXe1GBYuAOWj9w28pO+9r+iNbmb8uktMmSis24fyBx+/t/nrKJtyHOeVi
 Q8FwwL86pvCmjfFHHblwsfbHavI9vKQP9D71RTsp3dNWZsnZJq9MczOEB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="313156251"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="313156251"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621691842"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="621691842"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 15:33:46 -0800
Message-Id: <20230221233348.883897-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221233348.883897-1-lucas.demarchi@intel.com>
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/xe: Remove unused functions
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe_gt_topology_dss_group_mask and xe_gt_topology_count_dss are probably
leftover from initial implementation - they are not called from
anywhere. Remove those functions.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 8e02e362ba27..3dd7cbbff071 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -94,31 +94,6 @@ xe_gt_topology_init(struct xe_gt *gt)
 	xe_gt_topology_dump(gt, &p);
 }
 
-unsigned int
-xe_gt_topology_count_dss(xe_dss_mask_t mask)
-{
-	return bitmap_weight(mask, XE_MAX_DSS_FUSE_BITS);
-}
-
-u64
-xe_gt_topology_dss_group_mask(xe_dss_mask_t mask, int grpsize)
-{
-	xe_dss_mask_t per_dss_mask = {};
-	u64 grpmask = 0;
-
-	WARN_ON(DIV_ROUND_UP(XE_MAX_DSS_FUSE_BITS, grpsize) > BITS_PER_TYPE(grpmask));
-
-	bitmap_fill(per_dss_mask, grpsize);
-	for (int i = 0; !bitmap_empty(mask, XE_MAX_DSS_FUSE_BITS); i++) {
-		if (bitmap_intersects(mask, per_dss_mask, grpsize))
-			grpmask |= BIT(i);
-
-		bitmap_shift_right(mask, mask, grpsize, XE_MAX_DSS_FUSE_BITS);
-	}
-
-	return grpmask;
-}
-
 void
 xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
 {
-- 
2.39.0

