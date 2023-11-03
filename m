Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DA5C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E2910E9FA;
	Fri,  3 Nov 2023 14:35:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7A710E9F4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022153; x=1730558153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cnuPXXpW3R009rTyVGVD6pfY7a6XXffh6j3m2daFX8w=;
 b=PxduHAi1rcfsnrMeUCfjz/6C21f2izrpOc5ipPRZ2olnb8Z074zvWLvS
 tiGfcpEag57HV6Gr9dNOoXXZuXahwxc3YJmT4RY5mzmXKo3txMYA0C/NT
 P/shaPKz4n/ioGzDAmZxHEl5XI5LMM/6UQx31lUkeIH5G53Jt+Ncd/G8k
 ec27bjjfTjmxOwm6t3Cfgn/QpbpZEW4jX93ROroRwiFZLjcNTt/TfddTg
 I9H8PiJUuIF4f9xqnTFtUOmDNTIQ2tzDxkFXlZSDB5gSREHnt06jS4VYP
 fNEl4mPJ6h99+eeI4vMrt2GKQ69EqkLLcDR9QxUePlyJfu+iiieAsN10v Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843387"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843387"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832469"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832469"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:31 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:25 +0000
Message-Id: <20231103143456.7-20-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 19/50] drm/xe/uapi: Rename *_mem_regions masks
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

- 'native' doesn't make much sense on integrated devices.
- 'slow' is not necessarily true and doesn't go well with opposition
  to 'native'.

Instead, let's use 'near' vs 'far'. It makes sense with all the current
Intel GPUs and it is future proof. Right now, there's absolutely no need
to define among the 'far' memory, which ones are slower, either in terms
of latency, nunmber of hops or bandwidth.

In case of this might become a requirement in the future, a new query
could be added to indicate the certain 'distance' between a given engine
and a memory_region. But for now, this fulfill all of the current
requirements in the most straightforward way for the userspace drivers.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  8 ++++----
 include/uapi/drm/xe_drm.h     | 17 +++++++++--------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index d292631fda59..c75f8f33a84e 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -377,12 +377,12 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		gt_list->gt_list[id].gt_id = gt->info.id;
 		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
 		if (!IS_DGFX(xe))
-			gt_list->gt_list[id].native_mem_regions = 0x1;
+			gt_list->gt_list[id].near_mem_regions = 0x1;
 		else
-			gt_list->gt_list[id].native_mem_regions =
+			gt_list->gt_list[id].near_mem_regions =
 				BIT(gt_to_tile(gt)->id) << 1;
-		gt_list->gt_list[id].slow_mem_regions = xe->info.mem_region_mask ^
-			gt_list->gt_list[id].native_mem_regions;
+		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
+			gt_list->gt_list[id].near_mem_regions;
 	}
 
 	if (copy_to_user(query_ptr, gt_list, size)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 3e130e9b44ff..3b164f8e54b3 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -376,17 +376,18 @@ struct drm_xe_query_gt {
 	/** @clock_freq: A clock frequency for timestamp */
 	__u32 clock_freq;
 	/**
-	 * @native_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
-	 * direct access.
+	 * @near_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_usage that is near the current engines of this GT.
 	 */
-	__u64 native_mem_regions;
+	__u64 near_mem_regions;
 	/**
-	 * @slow_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_usage that this GT can indirectly access, although
-	 * they live on a different GPU/Tile.
+	 * @far_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_usage that is far from the engines of this GT.
+	 * In general, it has extra indirections when compared to the
+	 * @near_mem_regions. For a discrete device this could mean system
+	 * memory and memory living in a different Tile.
 	 */
-	__u64 slow_mem_regions;
+	__u64 far_mem_regions;
 	/** @reserved: Reserved */
 	__u64 reserved[8];
 };
-- 
2.34.1

