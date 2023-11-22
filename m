Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5872EC61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 14:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2646610E655;
	Wed, 22 Nov 2023 14:39:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC4C10E00E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 14:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663945; x=1732199945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=slAflzFk4mIANeLb953N67L2OX5zJVRFMvBLaoOsVAI=;
 b=jw+fkAtj5uIyVt3iFzy2cMfcRtn1vLSj1PB+csDg6HBGO8Dpn7FM4F2p
 D7si+suk53HgTIFz0V7HhY/3UiZNpmsnzrajcswmEYXwSB2OVPwQOMJeF
 mvRS4QeBBud2QfE/SydbljXANYlup5f6/qFFwXrIYjaOExzInphT3f+da
 YfFF/U6aX0uTqYN+XYi5MH4HCp1lKUYrlVd68MR4GFg4GOnPHxDF5i97E
 IPrYHF888ElwB+/ElWotZNaHCEhJBZP+1mUvFJRp0vSbzn76ZkQxdMRlf
 sraHskg5jICaPQsqtiBqSxgH8KtdvMDuntmKSPBdd7LOW8VSGbA5yOw1l A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395985181"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="395985181"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1098430376"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="1098430376"
Received: from arechber-mobl.ger.corp.intel.com (HELO 039181c9d572.intel.com)
 ([10.249.44.143])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:58 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 14:38:31 +0000
Message-Id: <20231122143833.7-13-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122143833.7-1-francois.dugast@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 12/14] drm/xe/uapi: Add Tile ID information to
 the GT info query
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

As an information only. So Userspace can use this information
and be able to correlate different GTs.

Make API symmetric between Engine and GT info.

There's no need right now to include a tile_query entry
since there's no other information that we need from tile
that is not already exposed through different queries.

However, this could be added later if we have different Tile
information that could matter to userspace. But let's keep
the API ready for a direct reference to Tile ID based on
the GT entry.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 1 +
 include/uapi/drm/xe_drm.h     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 77cab66d337f..095f1b8c2290 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -376,6 +376,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
 		else
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
+		gt_list->gt_list[id].tile_id = gt_to_tile(gt)->id;
 		gt_list->gt_list[id].gt_id = gt->info.id;
 		gt_list->gt_list[id].reference_clock = gt->info.reference_clock;
 		if (!IS_DGFX(xe))
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4bad84e7793f..b0ef1f62fd99 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -377,6 +377,8 @@ struct drm_xe_gt {
 #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
 	/** @type: GT type: Main or Media */
 	__u16 type;
+	/** @tile_id: Tile ID where this GT lives (Information only) */
+	__u16 tile_id;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
 	/** @reference_clock: A clock frequency for timestamp */
-- 
2.34.1

