Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2110C10DC2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE8310E76E;
	Thu, 30 Nov 2023 18:40:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8321B10E764
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369626; x=1732905626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r6oerq2hZbL0T3QykXZIARDPOuEWBe2l/8v8fFBw07Y=;
 b=IzLhpxRN0mQ9Rf0+bPH+MJHZdTkuV08pR8G2BgUuaD/pVwc0KycHVwp9
 yzCh6u+GqESythBmAodAWmeh+D6PKrFWtOLw/Sy4zfI2FHgE6pdpLGgDq
 xzPqUuB+ndgeh/qV0+Jo64N6rkVlnteRpMZeFBHrzTNUzp8UpEnYG/dN8
 CJecnAi2nkRMebORlmtNmEEio9VFp7Bqev8kav/MXgqhgGVcmZYs00B56
 ubIUECxMMMyCymhTuvfMB3Yq4lxZOhmacKzyLL4dWpbA8JdvTlCx+UsJr
 x0sVh8kGygOrIgcKMyRrIlgswvMEv8PMoLD1HK1h30xTo2YMFetBU8xWI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111743"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111743"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294956"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294956"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:25 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:50 +0000
Message-Id: <20231130183955.7-12-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 11/16] drm/xe/uapi: Add Tile ID information to
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
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 1 +
 include/uapi/drm/xe_drm.h     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 3316eab118b1..4461dd1c9e40 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -377,6 +377,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
 		else
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
+		gt_list->gt_list[id].tile_id = gt_to_tile(gt)->id;
 		gt_list->gt_list[id].gt_id = gt->info.id;
 		gt_list->gt_list[id].reference_clock = gt->info.reference_clock;
 		if (!IS_DGFX(xe))
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 92ad12eafe39..d6b0f3f41bb4 100644
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

