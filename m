Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0CFC05020
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B46310EA15;
	Fri,  3 Nov 2023 14:36:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C458710EA0D
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022163; x=1730558163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1l1p0VCqKbnnaDF48L6/fdwwwYQksdCSBeB6gdd457c=;
 b=JkDTNIZ2qeu7UTUMz68IXkcWeBWLO7edo9Q5vxBshDaoA5qmNvqh7mE4
 VENiGcwWCFlAJ6tEuo8b8Cip1tcuWMVq7WbR5NRFGv83so0fmUtVay9h0
 4zxAwB/JIyufmY1QrB8uwTKhtr/EYd7T+vEJ8LfoJaMpG6P5ME621AePF
 I7QurYAC6lIea4vv9kbWQytHGqxDmYAW80uY8XXoyV0N9C73LRVo9HwMc
 7cX1AtX+SZwgY/jKFamEvTagHVaD0ybI7JWlNQYje54IxMS3tSxEGbID3
 4U6zcvLx9IFdIYVo2nidG+qLE0cZ0moyz8mcvLadGuRuVJa5qYARHaHQZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843536"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843536"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832548"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832548"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:59 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:48 +0000
Message-Id: <20231103143456.7-43-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 42/50] drm/xe/uapi: Add Tile ID information to
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 1 +
 include/uapi/drm/xe_drm.h     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 733ef2404b01..41e51c3f5aee 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -402,6 +402,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
 		else
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
+		gt_list->gt_list[id].tile_id = gt_to_tile(gt)->id;
 		gt_list->gt_list[id].gt_id = gt->info.id;
 		gt_list->gt_list[id].reference_clock = gt->info.reference_clock;
 	}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 61ac0679e63d..c541efc80e5d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -426,6 +426,8 @@ struct drm_xe_query_gt {
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

