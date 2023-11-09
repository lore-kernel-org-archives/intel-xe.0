Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A719EC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF2610E8E7;
	Thu,  9 Nov 2023 15:46:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DA810E8EC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544772; x=1731080772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1i092aWM3obyrTFBtlgqQeX6WvFYMhJ5EP3QYbwAgNg=;
 b=iqMJJl4ZcVFGCThNtZGX0I+D7MI9kWS+/qjldDtR/jtH/yiffXqxJ2/m
 kQIuZubay3G3Ze3GXlVxbDkoqcM+uCzvqDqgAQmawZRZmZmIGD7Vstu4L
 +cfqRPbbgfJWdxk1p5u3mkhxRICy+oSR1BeFeZ6Uay9pTZDzpUjdGvgZ5
 ZAw5QPa8I3cZmdBPCtNU5loqndNFlFHiwmJfCltZSWnxqaxmtohPU/a/b
 142IDUbVBTvaTVewNzYDx6v9GT8dbtb8HEP+Kcr/iLCwjlhpojy3boyUx
 zdlnqlaJcYqFljh0Z98pRorkwswCFwtc76RVtUiwuWAQz69hASVad/+uC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556831"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556831"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:46:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886088"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886088"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:46:00 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:51 +0000
Message-Id: <20231109154457.7-38-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 37/43] drm/xe/uapi: Add Tile ID information to
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
index 2fcb2a4846ef..eea89c0e7243 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -403,6 +403,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
 		else
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
+		gt_list->gt_list[id].tile_id = gt_to_tile(gt)->id;
 		gt_list->gt_list[id].gt_id = gt->info.id;
 		gt_list->gt_list[id].reference_clock = gt->info.reference_clock;
 	}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6018062df378..174e3b98b361 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -427,6 +427,8 @@ struct drm_xe_query_gt {
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

