Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C38E92FFA
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 09:59:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0AF10E0CD;
	Fri,  6 Oct 2023 09:59:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5276110E0BB
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696586397; x=1728122397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oeTWdYbP0UAFv13YMDCR+C4R2wTD0TAzg1yYPxaxyjo=;
 b=bJ0dw7r9iBonPpZ142cQTTb/Zhm+5kwWI9ijiUGRsJq26ZKtmv/0w2cy
 KD3RvZTT3Ca2aJhP20U0gj1gqzuMeRtNyDyIxV+N6oSOW6bddkP8MLdLQ
 6Kg98nFR9HSXw2u2UOsIFJuIsKHKoaqYr0wixtsy7/7kvj/tKAKixPWMY
 gYrPHm0iIjCq8NgMDn449bE/1ephSh+E4kr+vWdcgkVfN8qXd9rgUPyHf
 korgmzlgluyD1OFDtspEkFSV7EOVNkHmzBPVv8f5swsDGSWPjGxb/iabJ
 EePErG9L6OLP5BZPPtb4pWJgMgEcYs0cX5u2P/vRBxJcCyhJUIt/onEIj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447907130"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447907130"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 02:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745815769"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745815769"
Received: from triebel-mobl.ger.corp.intel.com (HELO 8688cc0b8d51.intel.com)
 ([10.252.41.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 02:59:55 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:59:26 +0000
Message-Id: <20231006095943.7-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
References: <20231006095943.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 03/20] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Perf measurements rely on CPU and engine timestamps to correlate
events of interest across these time domains. Current mechanisms get
these timestamps separately and the calculated delta between these
timestamps lack enough accuracy.

To improve the accuracy of these time measurements to within a few us,
add a query that returns the engine and cpu timestamps captured as
close to each other as possible.

Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24591

v2:
- Fix kernel-doc warnings (CI)
- Document input params and group them together (Jose)
- s/cs/engine/ (Jose)
- Remove padding in the query (Ashutosh)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
[Rodrigo finished the s/cs/engine renaming]
---
 drivers/gpu/drm/xe/xe_query.c | 138 ++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 104 +++++++++++++++++++------
 2 files changed, 218 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index cbccd5c3dbc8..95a6aa5cba54 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -6,10 +6,12 @@
 #include "xe_query.h"
 
 #include <linux/nospec.h>
+#include <linux/sched/clock.h>
 
 #include <drm/ttm/ttm_placement.h>
 #include <drm/xe_drm.h>
 
+#include "regs/xe_engine_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -17,6 +19,7 @@
 #include "xe_gt.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_macros.h"
+#include "xe_mmio.h"
 #include "xe_ttm_vram_mgr.h"
 
 static const u16 xe_to_user_engine_class[] = {
@@ -27,6 +30,14 @@ static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
 };
 
+static const enum xe_engine_class user_to_xe_engine_class[] = {
+	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
+	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
+	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
+	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
+	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
+};
+
 static size_t calc_hw_engine_info_size(struct xe_device *xe)
 {
 	struct xe_hw_engine *hwe;
@@ -45,6 +56,132 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
 	return i * sizeof(struct drm_xe_engine_class_instance);
 }
 
+typedef u64 (*__ktime_func_t)(void);
+static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
+{
+	/*
+	 * Use logic same as the perf subsystem to allow user to select the
+	 * reference clock id to be used for timestamps.
+	 */
+	switch (clk_id) {
+	case CLOCK_MONOTONIC:
+		return &ktime_get_ns;
+	case CLOCK_MONOTONIC_RAW:
+		return &ktime_get_raw_ns;
+	case CLOCK_REALTIME:
+		return &ktime_get_real_ns;
+	case CLOCK_BOOTTIME:
+		return &ktime_get_boottime_ns;
+	case CLOCK_TAI:
+		return &ktime_get_clocktai_ns;
+	default:
+		return NULL;
+	}
+}
+
+static void
+__read_timestamps(struct xe_gt *gt,
+		  struct xe_reg lower_reg,
+		  struct xe_reg upper_reg,
+		  u64 *engine_ts,
+		  u64 *cpu_ts,
+		  u64 *cpu_delta,
+		  __ktime_func_t cpu_clock)
+{
+	u32 upper, lower, old_upper, loop = 0;
+
+	upper = xe_mmio_read32(gt, upper_reg);
+	do {
+		*cpu_delta = local_clock();
+		*cpu_ts = cpu_clock();
+		lower = xe_mmio_read32(gt, lower_reg);
+		*cpu_delta = local_clock() - *cpu_delta;
+		old_upper = upper;
+		upper = xe_mmio_read32(gt, upper_reg);
+	} while (upper != old_upper && loop++ < 2);
+
+	*engine_ts = (u64)upper << 32 | lower;
+}
+
+static int
+query_engine_cycles(struct xe_device *xe,
+		struct drm_xe_device_query *query)
+{
+	struct drm_xe_query_engine_cycles __user *query_ptr;
+	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_cycles resp;
+	size_t size = sizeof(resp);
+	__ktime_func_t cpu_clock;
+	struct xe_hw_engine *hwe;
+	struct xe_gt *gt;
+
+	if (query->size == 0) {
+		query->size = size;
+		return 0;
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
+		return -EINVAL;
+	}
+
+	query_ptr = u64_to_user_ptr(query->data);
+	if (copy_from_user(&resp, query_ptr, size))
+		return -EFAULT;
+
+	cpu_clock = __clock_id_to_func(resp.clockid);
+	if (!cpu_clock)
+		return -EINVAL;
+
+	eci = &resp.eci;
+	if (eci->gt_id > XE_MAX_GT_PER_TILE)
+		return -EINVAL;
+
+	gt = xe_device_get_gt(xe, eci->gt_id);
+	if (!gt)
+		return -EINVAL;
+
+	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
+		return -EINVAL;
+
+	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
+			      eci->engine_instance, true);
+	if (!hwe)
+		return -EINVAL;
+
+	resp.engine_frequency = gt->info.clock_freq;
+
+	xe_device_mem_access_get(xe);
+	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+
+	__read_timestamps(gt,
+			  RING_TIMESTAMP(hwe->mmio_base),
+			  RING_TIMESTAMP_UDW(hwe->mmio_base),
+			  &resp.engine_cycles,
+			  &resp.cpu_timestamp,
+			  &resp.cpu_delta,
+			  cpu_clock);
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_device_mem_access_put(xe);
+	resp.width = 36;
+
+	/* Only write to the output fields of user query */
+	if (put_user(resp.engine_frequency, &query_ptr->engine_frequency))
+		return -EFAULT;
+
+	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
+		return -EFAULT;
+
+	if (put_user(resp.cpu_delta, &query_ptr->cpu_delta))
+		return -EFAULT;
+
+	if (put_user(resp.engine_cycles, &query_ptr->engine_cycles))
+		return -EFAULT;
+
+	if (put_user(resp.width, &query_ptr->width))
+		return -EFAULT;
+
+	return 0;
+}
+
 static int query_engines(struct xe_device *xe,
 			 struct drm_xe_device_query *query)
 {
@@ -369,6 +506,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_gts,
 	query_hwconfig,
 	query_gt_topology,
+	query_engine_cycles,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d48d8e3c898c..079213a3df55 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -128,6 +128,25 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
+/** struct drm_xe_engine_class_instance - instance of an engine class */
+struct drm_xe_engine_class_instance {
+#define DRM_XE_ENGINE_CLASS_RENDER		0
+#define DRM_XE_ENGINE_CLASS_COPY		1
+#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
+#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
+#define DRM_XE_ENGINE_CLASS_COMPUTE		4
+	/*
+	 * Kernel only class (not actual hardware engine class). Used for
+	 * creating ordered queues of VM bind operations.
+	 */
+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
+	__u16 engine_class;
+
+	__u16 engine_instance;
+	__u16 gt_id;
+	__u16 rsvd;
+};
+
 /**
  * enum drm_xe_memory_class - Supported memory classes.
  */
@@ -219,6 +238,60 @@ struct drm_xe_query_mem_region {
 	__u64 reserved[6];
 };
 
+/**
+ * struct drm_xe_query_engine_cycles - correlate CPU and GPU timestamps
+ *
+ * If a query is made with a struct drm_xe_device_query where .query is equal to
+ * DRM_XE_DEVICE_QUERY_ENGINE_CYCLES, then the reply uses struct drm_xe_query_engine_cycles
+ * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
+ * .data points to this allocated structure.
+ *
+ * The query returns the engine cycles and the frequency that can
+ * be used to calculate the engine timestamp. In addition the
+ * query returns a set of cpu timestamps that indicate when the command
+ * streamer cycle count was captured.
+ */
+struct drm_xe_query_engine_cycles {
+	/**
+	 * @eci: This is input by the user and is the engine for which command
+	 * streamer cycles is queried.
+	 */
+	struct drm_xe_engine_class_instance eci;
+
+	/**
+	 * @clockid: This is input by the user and is the reference clock id for
+	 * CPU timestamp. For definition, see clock_gettime(2) and
+	 * perf_event_open(2). Supported clock ids are CLOCK_MONOTONIC,
+	 * CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME, CLOCK_TAI.
+	 */
+	__s32 clockid;
+
+	/** @width: Width of the engine cycle counter in bits. */
+	__u32 width;
+
+	/**
+	 * @engine_cycles: Engine cycles as read from its register
+	 * at 0x358 offset.
+	 */
+	__u64 engine_cycles;
+
+	/** @engine_frequency: Frequency of the engine cycles in Hz. */
+	__u64 engine_frequency;
+
+	/**
+	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
+	 * reading the engine_cycles register using the reference clockid set by the
+	 * user.
+	 */
+	__u64 cpu_timestamp;
+
+	/**
+	 * @cpu_delta: Time delta in ns captured around reading the lower dword
+	 * of the engine_cycles register.
+	 */
+	__u64 cpu_delta;
+};
+
 /**
  * struct drm_xe_query_mem_usage - describe memory regions and usage
  *
@@ -385,12 +458,13 @@ struct drm_xe_device_query {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_DEVICE_QUERY_ENGINES	0
-#define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
-#define DRM_XE_DEVICE_QUERY_CONFIG	2
-#define DRM_XE_DEVICE_QUERY_GTS		3
-#define DRM_XE_DEVICE_QUERY_HWCONFIG	4
-#define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
+#define DRM_XE_DEVICE_QUERY_ENGINES		0
+#define DRM_XE_DEVICE_QUERY_MEM_USAGE		1
+#define DRM_XE_DEVICE_QUERY_CONFIG		2
+#define DRM_XE_DEVICE_QUERY_GTS			3
+#define DRM_XE_DEVICE_QUERY_HWCONFIG		4
+#define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
+#define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -732,24 +806,6 @@ struct drm_xe_exec_queue_set_property {
 	__u64 reserved[2];
 };
 
-/** struct drm_xe_engine_class_instance - instance of an engine class */
-struct drm_xe_engine_class_instance {
-#define DRM_XE_ENGINE_CLASS_RENDER		0
-#define DRM_XE_ENGINE_CLASS_COPY		1
-#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
-#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
-#define DRM_XE_ENGINE_CLASS_COMPUTE		4
-	/*
-	 * Kernel only class (not actual hardware engine class). Used for
-	 * creating ordered queues of VM bind operations.
-	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
-	__u16 engine_class;
-
-	__u16 engine_instance;
-	__u16 gt_id;
-};
-
 struct drm_xe_exec_queue_create {
 #define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
 	/** @extensions: Pointer to the first extension struct, if any */
-- 
2.34.1

