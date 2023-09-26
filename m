Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0999AE7E632
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C2B10E3E1;
	Tue, 26 Sep 2023 13:04:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A73210E3DA
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733441; x=1727269441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hh3yqQaj3DS7heiCXXpFdZ9HdZxaTjWJmxKM8cWqDsk=;
 b=GIl4VUfOOXvCyaIFZ7Oln3GlbTYNYkDytNZQkRZHVTCh21NNK65hp9Ha
 0qBTv1u/EwNzbaAD6gf653OHPPUnb7Y88HglFELU0Hraxi11QjBoI+hGj
 05Qb/i/YKfXyYFKuzjbsEJY4+MBpvlM1sxxizMF9pIzIHe9RQd2kJaxyz
 Gdtgz0JGgWKgvDXeCPw4etUmUJq5tVBFM0k+hvtvIggP5AySTkPK96fgf
 WEwX8Rtx8cmgzt7ZPBo/PgZ/cPO0qUdvpsihONAK3mqM+QMTbhaMLs/8W
 lwVZwMKnfPL3nBrIqdcEPnVAOKmdN9O3HkA5x8ORLykVJeVeuXCEciWoa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366617277"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="366617277"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="139682"
Received: from hblancoa-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:26 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 12:55:32 +0000
Message-Id: <20230926125540.7-23-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 22/30] drm/xe/uapi: Crystal Reference Clock
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

Cc: Matt Roper <matthew.d.roper@intel.com>
Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  5 ++---
 include/uapi/drm/xe_drm.h     | 10 ++++------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a27b10583f5a..8184df4abde1 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -149,7 +149,7 @@ query_cs_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	resp.cs_frequency = gt->info.clock_freq;
+	resp.cs_reference_clock = gt->info.clock_freq;
 
 	xe_device_mem_access_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
@@ -167,7 +167,7 @@ query_cs_cycles(struct xe_device *xe,
 	resp.width = 36;
 
 	/* Only write to the output fields of user query */
-	if (put_user(resp.cs_frequency, &query_ptr->cs_frequency))
+	if (put_user(resp.cs_reference_clock, &query_ptr->cs_reference_clock))
 		return -EFAULT;
 
 	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
@@ -380,7 +380,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		else
 			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MAIN;
 		gt_list->gt_list[id].gt_id = gt->info.id;
-		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
 		if (!IS_DGFX(xe))
 			gt_list->gt_list[id].native_mem_regions = 0x1;
 		else
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f306cae6d467..026536a20253 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -249,8 +249,8 @@ struct drm_xe_query_mem_region {
  * relevant GPU timestamp. clockid is used to return the specific CPU
  * timestamp.
  *
- * The query returns the command streamer cycles and the frequency that can
- * be used to calculate the command streamer timestamp. In addition the
+ * The query returns the command streamer cycles and the reference clock that
+ * can be used to calculate the command streamer timestamp. In addition the
  * query returns a set of cpu timestamps that indicate when the command
  * streamer cycle count was captured.
  */
@@ -267,8 +267,8 @@ struct drm_xe_query_cs_cycles {
 	 */
 	__u64 cs_cycles;
 
-	/** Frequency of the cs cycles in Hz. */
-	__u64 cs_frequency;
+	/** Reference Clock of the cs cycles in Hz. */
+	__u64 cs_reference_clock;
 
 	/**
 	 * CPU timestamp in ns. The timestamp is captured before reading the
@@ -382,8 +382,6 @@ struct drm_xe_query_gt {
 	__u16 type;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
-	/** @clock_freq: A clock frequency for timestamp */
-	__u32 clock_freq;
 	/**
 	 * @native_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
-- 
2.34.1

