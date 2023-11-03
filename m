Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED0DC4167D
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B088910EA07;
	Fri,  3 Nov 2023 14:35:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3080410EA03
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022126; x=1730558126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=puY5X2YMhTflifSTsx1k9xQZdNH3Lev++XHcDq1+4xk=;
 b=hN+VKJLtsAQ1yWAYEGddZNMa2tqNWRWAd9O/tiSJChtDRR8e6n6ibOkh
 petjyyYV5tSWXaIvMCIazVjVTrXSC/IC1bTTd/ket64tCqROsTe2d8/I9
 xUjPoRXa74gXJ9uS1nRyoPz64OaIN12ySoX1TBEe15lZn5P08ENSDvSCg
 dkT4ZCJixlBhOH/1KUeyfE4GCO7pDCkHD3TUz+GRUPSg48fAPSoeWT/DO
 qLMP3pouqz5hmoa9APinshnHecilJVHaLVC6kbkJZEVS3uZGoUpbpdevZ
 ODgSxYvhCY4moSWmJhCe8HrZ2DDjAgfqN4D96dtwAkWbUCIGxL2UFrIAH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843360"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843360"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832447"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832447"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:24 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:19 +0000
Message-Id: <20231103143456.7-14-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 13/50] drm/xe/uapi: Remove GT_TYPE_REMOTE
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
index 3eef4160074e..34b4082edec5 100644
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
index 05714068c637..1473dd29aa3f 100644
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

