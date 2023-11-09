Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCCFC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DC310E8F3;
	Thu,  9 Nov 2023 15:46:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E425C10E8E4
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544768; x=1731080768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6r9PgwedhjOLJMfyztAgTK9zrduNHBAhz9jdatWILcM=;
 b=GiHcg8J1zVDj8vul1JxIzf1nohJ3yefvKdbw6iKzLRNjjJVWQ8Gv0XQM
 W6v+NGkQzHeFiz8iEJOUATxRcYKkdVaYLfawbE3lYhUOddiZtRpQ9KWbL
 hbikAyXPIgXDNmR9TduzLg+G/xSDe3r/h2qrqrWw3Z0bwemhuNmnmTXwP
 ENtHRrhWEk9ukuMukF3mnD3NOlnVdQtvPksP8pGC1wUkdgeDvjlOCwL68
 uSD13f7iaM8wDoVqpx74LjLZsufPRs2sQ1sdZ64kK6tnvCaWBsIPB0CCM
 dgTM0gUaXe5KdmeV6QhDC3wyO9Zps0yWAmIbfSRafkPtCWpd/boco4O/j A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556719"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556719"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886017"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886017"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:32 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:31 +0000
Message-Id: <20231109154457.7-18-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 17/43] drm/xe/uapi: Rename *_mem_regions masks
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
index 8c31c02ac2d7..573532f1bbb0 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -378,12 +378,12 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
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
index 9cb7dfd129eb..89be8e2f9852 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -379,17 +379,18 @@ struct drm_xe_query_gt {
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

