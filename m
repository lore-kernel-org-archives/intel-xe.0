Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF32C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 15:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0875D10E10B;
	Fri, 10 Nov 2023 15:42:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B16A10E103
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 15:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699630930; x=1731166930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BfSNXeeaz7ok8KEO1Dw7Io7tlEX8oUmuCnw+EyCyBHg=;
 b=RoJl4+a+FFlMI6pmON/EWLUQ+NsG75A9lyFZRz+Y1Nl8Ke+kULZoKoqz
 fhEfbo4DqAmzlZ25cXUn9XbfuXPsdl9w0qgnt2cD3ehnjtBftkBFgx4F1
 9myboJEfDRg16l53DpOASaiVZNrQC5sNL7JsLUOCXtHh0tR3i+2Gouzhh
 i4KsYPnBibKSxgy2VaEQQXijjYJJSsLiIXjCg7sgnDFZtSXmMZxhbALYB
 ytNvTWNnQFmALDb6PbQqEqcDwEzWSa7BIlEA+0Ms3TIy8iQnI78pLKK84
 8siWTZywBFdBmO5cWNlYQ+2V/LPlpHxSo7CXh9lcBIgcgATqw7noMnJ8I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394104129"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="394104129"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:42:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937193711"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="937193711"
Received: from jponna-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.249.43.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:42:08 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:41:51 +0000
Message-Id: <20231110154156.6-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110154156.6-1-francois.dugast@intel.com>
References: <20231110154156.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 2/7] drm/xe/uapi: Remove GT_TYPE_REMOTE
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
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 --
 include/uapi/drm/xe_drm.h     | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 6b1cd5c68a99..43bc6094855c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -373,8 +373,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 	for_each_gt(gt, xe, id) {
 		if (xe_gt_is_media_type(gt))
 			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MEDIA;
-		else if (gt_to_tile(gt)->id > 0)
-			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_REMOTE;
 		else
 			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MAIN;
 		gt_list->gt_list[id].gt_id = gt->info.id;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b9a68f8b69f3..8154cecf6f0d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -343,9 +343,8 @@ struct drm_xe_query_config {
  */
 struct drm_xe_query_gt {
 #define XE_QUERY_GT_TYPE_MAIN		0
-#define XE_QUERY_GT_TYPE_REMOTE		1
-#define XE_QUERY_GT_TYPE_MEDIA		2
-	/** @type: GT type: Main, Remote, or Media */
+#define XE_QUERY_GT_TYPE_MEDIA		1
+	/** @type: GT type: Main or Media */
 	__u16 type;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
-- 
2.34.1

