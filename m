Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A14C2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 18:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E4210E07E;
	Mon, 20 Nov 2023 18:57:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6D510E07E
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 18:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700506633; x=1732042633;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SmYBbHa3bq9DUzhRsLC2zuFBfJ6GM+EINUP9JIEPWuA=;
 b=lHm9mlf/J6yj9JGpF0dYIbMCWqBCCMTqkM3xTieyiSgxnX+xRS/NDJeo
 0ePHXp7K4IN4ZNEKYFsEH9BqJB7PGKzpiT02GlCDY/JxRarBYsgZ+jJlC
 oe+2G0iEzzAKCHRg0dJR2qBAwW2UVDDQzmj7Hyq3BDh4XSVcliEgi1Oi+
 XEiuvo+EVUE3hOJb3or0fw1g1fUy+I9YvuA+M/I1vqXbzkOabLJqpPeGw
 dqDX6Bd7qGNnYM4AzPD0VUMZRWOQS/DKHWLhvVzyuhrLvzZNwC0PT5YsW
 USNFllM5wY20LWte3ABRjy4YNTgyqkYrSE672VJO9Ht9hX6dbp+GcFi9X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="390543252"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="390543252"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:57:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="7806166"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:57:12 -0800
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com, matthew.brost@intel.com
Date: Mon, 20 Nov 2023 13:57:00 -0500
Message-Id: <20231120185700.3304104-4-david.kershner@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20231120185700.3304104-1-david.kershner@intel.com>
References: <20231120185700.3304104-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe/uapi: Augment query ioctl to allow
 for fabric
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

UMDs need to understand if two devices have connectivity, and what
that connectivity is.

Add to the query_ioctl the ability to determine if a fabric id and
current device have connectivity.

Signed-off-by: David Kershner <david.kershner@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 54 +++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 26 +++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 61a7d92b7e88..203899201e1b 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -6,10 +6,12 @@
 #include "xe_query.h"
 
 #include <linux/nospec.h>
+#include <linux/overflow.h>
 #include <linux/sched/clock.h>
 
 #include <drm/ttm/ttm_placement.h>
 #include <drm/xe_drm.h>
+#include <drm/xelink_platform.h>
 
 #include "regs/xe_engine_regs.h"
 #include "xe_bo.h"
@@ -103,6 +105,57 @@ __read_timestamps(struct xe_gt *gt,
 	*engine_ts = (u64)upper << 32 | lower;
 }
 
+static int
+query_fabric_connectivity(struct xe_device *xe,
+			  struct drm_xe_device_query *query)
+{
+	struct drm_xe_query_fabric_info __user *query_ptr;
+	struct drm_xe_query_fabric_info info;
+	struct query_info *qi;
+	u32 latency = 0;
+	int cnt;
+	int i;
+
+	query_ptr = u64_to_user_ptr(query->data);
+	if (copy_from_user(&info, query_ptr, sizeof(info)))
+		return -EFAULT;
+
+	info.bandwidth = 0;
+	info.latency = 0;
+
+	if (info.fabric_id == xe->xelink.xelink_id)
+		goto done;
+
+	qi = xe->xelink.ops->connectivity_query(xe->xelink.handle, info.fabric_id);
+	if (IS_ERR(qi))
+		goto done;
+	/*
+	 * Examine the query information for connectivity.
+	 * Minimum bandwidth value is the bandwidth, 0 == no connectivity
+	 * Latency is averaged.
+	 */
+	cnt = qi->src_cnt * qi->dst_cnt;
+	if (!cnt) {
+		kfree(qi);
+		return -ENXIO;
+	}
+
+	info.bandwidth = 0xffff;
+	for (i = 0; i < cnt; i++) {
+		info.bandwidth = min(qi->sd2sd[i].bandwidth, info.bandwidth);
+		XE_WARN_ON(check_add_overflow(latency, qi->sd2sd[i].latency,
+					      &latency));
+	}
+
+	info.latency = latency / cnt;
+
+	kfree(qi);
+done:
+	if (copy_to_user(query_ptr, &info, sizeof(info)))
+		return -EFAULT;
+	return 0;
+}
+
 static int
 query_engine_cycles(struct xe_device *xe,
 		    struct drm_xe_device_query *query)
@@ -505,6 +558,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_hwconfig,
 	query_gt_topology,
 	query_engine_cycles,
+	query_fabric_connectivity,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 88f3aca02b08..79d460f0c5c7 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -290,6 +290,31 @@ struct drm_xe_query_engine_cycles {
 	__u64 cpu_delta;
 };
 
+/**
+ * struct drm_xe_query_fabric_info
+ *
+ * With the given fabric id, query fabric info wrt the device.
+ * Higher bandwidth is better.  0 means no fabric.
+ * Latency is averaged latency (from all paths)
+ *
+ * fabric_id can be obtained from
+ *    /sys/class/drm/cardx/device/xelink.y/xelink_fabric_id
+ * Bandwidth is in Gigabits per second (max value of 8 * 4 * 90)
+ *    8 possible ports
+ *    4 lanes max per port
+ *   90 gigabits per lane
+ * Latency is in tenths of path length. 10 == 1 fabric link between src and dst
+ *   POR is max 1 link (zero hops).
+ */
+struct drm_xe_query_fabric_info {
+	/** @fabric_id: Fabric id associated with info */
+	__u32 fabric_id;
+	/** @bandwidh: minimum bandwidth of all connected ports, if 0 no fabric */
+	__u16 bandwidth;
+	/** @latency: latency averaged across all connected ports. */
+	__u16 latency;
+};
+
 /**
  * struct drm_xe_query_mem_regions - describe memory regions
  *
@@ -476,6 +501,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
+#define DRM_XE_DEVICE_QUERY_FABRIC_INFO		7
 	/** @query: The type of data to query */
 	__u32 query;
 
-- 
2.38.1

