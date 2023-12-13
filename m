Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991BAC19774
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 21:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D6210E86C;
	Wed, 13 Dec 2023 21:45:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36CA10E824
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 21:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702503936; x=1734039936;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hYNv29NkHv9YTG6a69gHKHdcMnsmtEl/utIvsMHtChA=;
 b=eCTl4pg8a4mIVpWEqHRyFPvnwuCKy3zAlK9cn+J1VH1wbl+9zllRWUUj
 gTzYe1oEC8fs+h2ZEVqP9xEKVyJOssSUrYa5YGnRbh0aJNjgw/WTgucmM
 Hs66PQ0JT/8OAEeqj9wTr83542vEf0XdGuz9gK+sPtopT4j6l0Qmc6Njp
 N3TvWeGgpn5Z8iOkrZcB8R4jDj+3lMnfkySJbBqL2HXhc+OI2EOfKnW6E
 2WNUNRec7oCuJt0JksB2puAoiq0CS35wFErqpdd4g4pWdv6dPwhrrM3K0
 QPrS0BbOUckaPcqIOtY6ooVqy/kSc562C5uFwI2eCLwVQ0CsolrpCCLY8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="16581505"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="16581505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 13:45:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="22137484"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 13:45:35 -0800
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v3 3/3] drm/xe/uapi: Augment query ioctl to allow for fabric
Date: Wed, 13 Dec 2023 16:45:25 -0500
Message-Id: <20231213214525.2584729-4-david.kershner@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20231213214525.2584729-1-david.kershner@intel.com>
References: <20231213214525.2584729-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 56d61bf596b2..a28d41753439 100644
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
@@ -104,6 +106,57 @@ __read_timestamps(struct xe_gt *gt,
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
@@ -510,6 +563,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_hwconfig,
 	query_gt_topology,
 	query_engine_cycles,
+	query_fabric_connectivity,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0895e4d2a981..c5595f7061e1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -321,6 +321,31 @@ struct drm_xe_query_engine_cycles {
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
+	/** @bandwidth: minimum bandwidth of all connected ports, if 0 no fabric */
+	__u16 bandwidth;
+	/** @latency: latency averaged across all connected ports. */
+	__u16 latency;
+};
+
 /**
  * struct drm_xe_query_mem_regions - describe memory regions
  *
@@ -515,6 +540,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
+#define DRM_XE_DEVICE_QUERY_FABRIC_INFO		7
 	/** @query: The type of data to query */
 	__u32 query;
 
-- 
2.38.1

