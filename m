Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F046CD8CAE
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 05:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DACB10E0A2;
	Tue,  9 Jun 2026 05:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F22a8Tb3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A466810E0A2
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 05:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780984641; x=1812520641;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e33XHZt40DK+LETfjffUuyaHnJdVe3d2u69qNT7FblA=;
 b=F22a8Tb3G9DyBG8s0XCWeegstOf3MQ4cxkwJQmqoFgfxK8Z0z+Kf/dl6
 X2YWCXckMlS2PXCQA0P688mwTvKAtfTZZ4uo8BuzGMONY+twWY3127gtc
 gMrGZEzCUU536ugoejh8AINL1wAkp30kzV28b/R3aA0RTT82w41hNd+1+
 84qtjnU1m/aY1AUmCYRVzD6qokZOrhW+C8YPuOP7Q7ENPzzOma1snCqnd
 M9a5szB1/BZiaoNZKMpTC+s7Rj/MGcvgH+R/N6oQiqmKsTGCzMlUPOcKp
 JanwMHvHg4f+TPAEq3CzVsPFSXYjUk5nJGeLvII6UkHe2bNS/r8LKbak7 g==;
X-CSE-ConnectionGUID: UVZoh1bNRsqc+lp/Pc0arQ==
X-CSE-MsgGUID: y3yE6/g1RQW36lGnaiQZSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99153992"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="99153992"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 22:57:21 -0700
X-CSE-ConnectionGUID: 4ehlEUvXQ2uSKXW+x5GqNg==
X-CSE-MsgGUID: f3hP7JhrTd+NUmz/xkn6aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="242822695"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 22:57:18 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/guc: Fix buffer overflow in steered register list
 allocation
Date: Tue,  9 Jun 2026 11:26:58 +0530
Message-ID: <20260609055657.440911-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

The size calculation for the steered register extarray uses only the
geometry DSS mask (g_dss_mask) to determine the number of entries to
allocate:

  total = bitmap_weight(gt->fuse_topo.g_dss_mask, ...) * steer_reg_num;

However, the filling loop uses for_each_dss_steering(), which iterates
over for_each_dss(), defined as the union of g_dss_mask and c_dss_mask
(geometry + compute DSS). On platforms with compute-only DSS bits, the
loop writes past the allocated buffer, corrupting adjacent slab objects.

This manifests as list_del corruption and SLUB redzone overwrites during
drm_managed_release on device unbind, since the overflow corrupts the
drmres list_head of neighboring allocations.

Fix by computing the allocation size using the union of both DSS masks,
matching the iteration pattern of for_each_dss_steering().

Fixes: b170d696c1e2 ("drm/xe/guc: Add XE_LP steered register lists")
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8049
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Assisted-by: GitHub Copilot (Claude Opus 4.6)
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 21f7caf9ea08..181e8b60357d 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -461,8 +461,14 @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
 	if (!list || guc->capture->extlists)
 		return;
 
-	total = bitmap_weight(gt->fuse_topo.g_dss_mask, sizeof(gt->fuse_topo.g_dss_mask) * 8) *
-		guc_capture_get_steer_reg_num(guc_to_xe(guc));
+	{
+		xe_dss_mask_t all_dss;
+
+		bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
+			  gt->fuse_topo.c_dss_mask, XE_MAX_DSS_FUSE_BITS);
+		total = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS) *
+			guc_capture_get_steer_reg_num(guc_to_xe(guc));
+	}
 
 	if (!total)
 		return;
-- 
2.52.0

