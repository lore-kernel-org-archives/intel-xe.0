Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701C9C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4795410E764;
	Thu, 30 Nov 2023 18:40:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563AC10E76A
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369625; x=1732905625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FMrzfnhc0vOTpXSi/ZX2fbcAItjqZXqzebjrCvJXULs=;
 b=gWAGUYS7TKQs9C5AaDHHASGXlDgisllGldDjETU9R79IV04u8zGsymPs
 EG2+e5YmAdp9hZn7hz7bQtlUqKyYkqoYN+/DySzpvNFROlFRNf24paoCt
 MjF9zHevrruiulFfBeJYOM2wQ0Y/7k5QQeXvhODguh6AUSEoD+CwYET+x
 v7tF8dIspa0R/nc0ywHldPwe1H66YVg+2KUwDZYQMYyBkhTLfr4Zn1KTf
 4asP30yu9GsMjUJqiSR1UAoqS3WhUZqAWJZYxycnQMjQmHIGOgMU/uElK
 pNuhxJuIm9XeaIFpIveGp24uP0jjibt6fbtcvgWw6fYu6/EQ38FpwAoCI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111739"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111739"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294953"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294953"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:23 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:49 +0000
Message-Id: <20231130183955.7-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 10/16] drm/xe/uapi: Crystal Reference Clock
 updates
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
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

First of all, let's remove the duplication.
But also, let's rename it to remove the word 'frequency'
out of it. In general, the first thing people think of frequency
is the frequency in which the GTs are operating to execute the
GPU instructions.

While this frequency here is a crystal reference clock frequency
which is the base of everything else, and in this case of this
uAPI it is used to calculate a better and precise timestamp.

v2: (Suggested by Jose) Remove the engine_cs and keep the GT info one
since it might be useful for other SRIOV cases where the engine_cs
will be zeroed. So, grabbing from the GT_LIST should be cleaner.

v3: Keep comment on put_user() call (José Roberto de Souza)

Cc: Matt Roper <matthew.d.roper@intel.com>
Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Jose Souza <jose.souza@intel.com>

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c |  4 ++--
 drivers/gpu/drm/xe/xe_gt_types.h |  4 ++--
 drivers/gpu/drm/xe/xe_query.c    |  7 +------
 include/uapi/drm/xe_drm.h        | 11 ++++-------
 4 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 25a18eaad9c4..937054e31d72 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -75,11 +75,11 @@ int xe_gt_clock_init(struct xe_gt *gt)
 		freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
 	}
 
-	gt->info.clock_freq = freq;
+	gt->info.reference_clock = freq;
 	return 0;
 }
 
 u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count)
 {
-	return DIV_ROUND_CLOSEST_ULL(count * NSEC_PER_SEC, gt->info.clock_freq);
+	return DIV_ROUND_CLOSEST_ULL(count * NSEC_PER_SEC, gt->info.reference_clock);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d3f2793684e2..56b0f22ee78d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -107,8 +107,8 @@ struct xe_gt {
 		enum xe_gt_type type;
 		/** @id: Unique ID of this GT within the PCI Device */
 		u8 id;
-		/** @clock_freq: clock frequency */
-		u32 clock_freq;
+		/** @reference_clock: clock frequency */
+		u32 reference_clock;
 		/** @engine_mask: mask of engines present on GT */
 		u64 engine_mask;
 		/**
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index ad9f23e43920..3316eab118b1 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -147,8 +147,6 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	resp.engine_frequency = gt->info.clock_freq;
-
 	xe_device_mem_access_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
@@ -165,9 +163,6 @@ query_engine_cycles(struct xe_device *xe,
 	resp.width = 36;
 
 	/* Only write to the output fields of user query */
-	if (put_user(resp.engine_frequency, &query_ptr->engine_frequency))
-		return -EFAULT;
-
 	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
 		return -EFAULT;
 
@@ -383,7 +378,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		else
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
 		gt_list->gt_list[id].gt_id = gt->info.id;
-		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
+		gt_list->gt_list[id].reference_clock = gt->info.reference_clock;
 		if (!IS_DGFX(xe))
 			gt_list->gt_list[id].near_mem_regions = 0x1;
 		else
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index a239789f7825..92ad12eafe39 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -280,8 +280,8 @@ struct drm_xe_mem_region {
  * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
  * .data points to this allocated structure.
  *
- * The query returns the engine cycles and the frequency that can
- * be used to calculate the engine timestamp. In addition the
+ * The query returns the engine cycles, which along with GT's @reference_clock,
+ * can be used to calculate the engine timestamp. In addition the
  * query returns a set of cpu timestamps that indicate when the command
  * streamer cycle count was captured.
  */
@@ -309,9 +309,6 @@ struct drm_xe_query_engine_cycles {
 	 */
 	__u64 engine_cycles;
 
-	/** @engine_frequency: Frequency of the engine cycles in Hz. */
-	__u64 engine_frequency;
-
 	/**
 	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
 	 * reading the engine_cycles register using the reference clockid set by the
@@ -382,8 +379,8 @@ struct drm_xe_gt {
 	__u16 type;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
-	/** @clock_freq: A clock frequency for timestamp */
-	__u32 clock_freq;
+	/** @reference_clock: A clock frequency for timestamp */
+	__u32 reference_clock;
 	/**
 	 * @near_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_regions that are nearest to the current engines
-- 
2.34.1

