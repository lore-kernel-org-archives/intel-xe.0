Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E0FC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449A410E8E4;
	Thu,  9 Nov 2023 15:47:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A816110E8EE
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544772; x=1731080772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=URvJ1it40e5WT3YPpJdTOz9c/Sy50yYGzjEpnNbM0mg=;
 b=UCkvVjZm5hoRd7EMaWuAlrIe6l5NTb+9HoIThw6eivaI9a9IFtd9Nvua
 IeK+Re3gaujMIi6Gh3sodpnc6PZscGWe/1c3eGfdGBtO6SRJbCQ+nF9Rc
 O68/ezX2h0SS2x5maK/UF0rGC04/TqRULt7TuCFoYFwjTWjFrsHfM2go+
 WgWqLzBIYcNuRp3DHacofX8XL1pXVO47tnTcufEEnOaPRRPAsvzUUMW18
 BVvD2s3ANaggPJBED+eBy3HhIvTyuJApFc13mmzS4R74JlbYibtKxmlra
 iQlk7EyOf+2C7lRMKw1nZgb1TZNo3mA0atzXSHMW4iq2qGXYXV+/PZoQo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556828"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556828"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886084"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886084"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:59 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:50 +0000
Message-Id: <20231109154457.7-37-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 36/43] drm/xe/uapi: Crystal Reference Clock
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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

Cc: Matt Roper <matthew.d.roper@intel.com>
Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Jose Souza <jose.souza@intel.com>

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c |  4 ++--
 drivers/gpu/drm/xe/xe_gt_types.h |  4 ++--
 drivers/gpu/drm/xe/xe_query.c    |  8 +-------
 include/uapi/drm/xe_drm.h        | 11 ++++-------
 4 files changed, 9 insertions(+), 18 deletions(-)

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
index 99e1bfa9b446..2fcb2a4846ef 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -146,8 +146,6 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	resp.engine_frequency = gt->info.clock_freq;
-
 	xe_device_mem_access_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
@@ -163,10 +161,6 @@ query_engine_cycles(struct xe_device *xe,
 	xe_device_mem_access_put(xe);
 	resp.width = 36;
 
-	/* Only write to the output fields of user query */
-	if (put_user(resp.engine_frequency, &query_ptr->engine_frequency))
-		return -EFAULT;
-
 	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
 		return -EFAULT;
 
@@ -410,7 +404,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		else
 			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
 		gt_list->gt_list[id].gt_id = gt->info.id;
-		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
+		gt_list->gt_list[id].reference_clock = gt->info.reference_clock;
 	}
 
 	if (copy_to_user(query_ptr, gt_list, size)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 342f22c2d9f0..6018062df378 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -429,8 +429,8 @@ struct drm_xe_query_gt {
 	__u16 type;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
-	/** @clock_freq: A clock frequency for timestamp */
-	__u32 clock_freq;
+	/** @reference_clock: A clock frequency for timestamp */
+	__u32 reference_clock;
 	/** @reserved: Reserved */
 	__u64 reserved[8];
 };
@@ -504,8 +504,8 @@ struct drm_xe_query_topology_mask {
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
@@ -533,9 +533,6 @@ struct drm_xe_query_engine_cycles {
 	 */
 	__u64 engine_cycles;
 
-	/** @engine_frequency: Frequency of the engine cycles in Hz. */
-	__u64 engine_frequency;
-
 	/**
 	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
 	 * reading the engine_cycles register using the reference clockid set by the
-- 
2.34.1

