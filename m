Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C75CD6E71
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E309310E853;
	Wed, 11 Oct 2023 14:00:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67EF10E84C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032801; x=1728568801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fDdgoCZVCVRyV867o8qXdNLoHJc7c0bXmsH5ebNnyS4=;
 b=JTwaDTq4WSkeMYf+a5lVjawTLEa/0Ok+jFd9+YYvMcPS0GNfgQyRzmvV
 fLNj9IMzGM0JkmBaPYE8UHu6rApmcD5xHQK82cdagQ8XAnsCHVSlSzGTj
 ZZ1T1wZGtUbQa5mID1GwkGbKAIb2t6NqJK3h3tAuA9QVp4+CcJA6jgzRk
 yTM+O/kNUQhW2A2Bm3o/jFiciYYc5cXw+gZTCtgmQN8oQanPMZ5/+Tv4y
 b1tStNGdUlurtcMMm1vGR0Qa1KXMXyrqKyLhgxVrKsegHd3yc1Vo1z2pn
 WgDTvVXLSZ6/qKU40u56LHvBjdnQRMY69xH8u9fwdZbDb2+Tr5nmKgVs0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156303"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156303"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753829217"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753829217"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:54 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:22 +0000
Message-Id: <20231011135926.7-14-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 13/17] drm/xe/uapi: Remove GT_TYPE_REMOTE
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
Cc: Carl Zhang <carl.zhang@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

With the split between tile and gt, this is currently unused.
Also it is bringing confusion because main vs remote would be
more a concept of the tile itself and not about GT.

So, the MAIN one is the traditional GT used for every operation
in older platforms, and for render/graphics and compute on platforms
that contains the stand-alone Media GT.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 --
 include/uapi/drm/xe_drm.h     | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 063a224492eb..c5196abbd15d 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -375,8 +375,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 	for_each_gt(gt, xe, id) {
 		if (xe_gt_is_media_type(gt))
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
-		else if (gt_to_tile(gt)->id > 0)
-			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_REMOTE;
 		else
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
 		gt_list->gt_list[id].gt_id = gt->info.id;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 2c5bf02c9b0b..2008a7e61178 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -376,9 +376,8 @@ struct drm_xe_query_config {
  */
 struct drm_xe_query_gt {
 #define DRM_XE_QUERY_GT_TYPE_MAIN		0
-#define DRM_XE_QUERY_GT_TYPE_REMOTE		1
-#define DRM_XE_QUERY_GT_TYPE_MEDIA		2
-	/** @type: GT type: Main, Remote, or Media */
+#define DRM_XE_QUERY_GT_TYPE_MEDIA		1
+	/** @type: GT type: Main or Media */
 	__u16 type;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
-- 
2.34.1

