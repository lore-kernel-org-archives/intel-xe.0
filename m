Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5B7C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289DE10E8E3;
	Thu,  9 Nov 2023 15:46:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B386310E8E5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544762; x=1731080762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ACdM9Jf5BLfer/DZjpZ13owIabBwbfRTVD4qZ78lmqQ=;
 b=dkqbhvVaJWOcakc9TZD+H3e/jGN2okCeaYThT9Kb3m8WNrs5s2hKJgR5
 TQjFhfYkSff1fkxgeNinW6dCOuzWhwsklRICGQ8UT0MeHY6Olq7uWojaW
 YoSg7R/Dissftge4TQi5dDP9PZoyHdLsjf1U8YStM+YeCIWMJsDIBwXCn
 1jYMmSeGMt8RECgd2m4xbR13/ldez5DaqQhtNBn+TpLTl1c7pvPctlSgZ
 o2ZLF4o3fUaz+S0xXoGKtbxafhvLiTrmhd2gDJSHmBQV6bfSqat74GnM9
 UVbzdHy97+XcVG8S27O/UKdvSb1q2bMIA7lBvSmP6CL6JlN19LCizthfa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556688"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556688"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936885995"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936885995"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:24 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:25 +0000
Message-Id: <20231109154457.7-12-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 11/43] drm/xe/uapi: Remove GT_TYPE_REMOTE
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
index 808244e668a3..be5cfb29216b 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -376,8 +376,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 	for_each_gt(gt, xe, id) {
 		if (xe_gt_is_media_type(gt))
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
-		else if (gt_to_tile(gt)->id > 0)
-			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_REMOTE;
 		else
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
 		gt_list->gt_list[id].gt_id = gt->info.id;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 5d7836f8137d..2fa0d1f5b47a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -379,9 +379,8 @@ struct drm_xe_query_config {
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

