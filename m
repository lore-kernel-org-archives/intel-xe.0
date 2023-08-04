Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789DEC001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 21:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB5010E009;
	Fri,  4 Aug 2023 21:38:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB71310E009
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 21:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691185106; x=1722721106;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q730m7KituXVeMMGlmWKm8os5JbeQ17zVidrevFCADk=;
 b=kYNdXzfmPdVWkad2N8HZM1UDIKCNI/JgvWvqrq7wPOhYb4ZTpnnEIKt7
 Vc3QZI2mH0FbVP7JOFg5jlyU4kAaUfgpIjgUd+nu9ztAJN4GtjHOySn0w
 kagJtVAFfwsfIFnpw4vs9LQAWR6sFzBjcfVPj91wL0++jU1CPddcuJb2E
 cS+jtoaqy7zd6ZhkdA6AuHNkdl9AV+TGg5bv9tv84e3x78+1ffYqdbOXu
 WT+PmK0loY+1iUuLkDKb0xhV9vml3ywYjfYxPl3jVc3ggZWBnQU32VCLN
 /sVjuBq9NCvUVjeYVebvp+thlP3jnmsNb/t7uLcejxhLFxNQvBgMQRv9L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="372997760"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="372997760"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 14:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="759734163"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="759734163"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 14:38:13 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 14:38:13 -0700
Message-Id: <20230804213813.2381799-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t] tests/xe/xe_query: Add a test for querying
 cs cycles
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

The DRM_XE_QUERY_CS_CYCLES query provides a way for the user to obtain
CPU and GPU timestamps as close to each other as possible.

Add a test to query cs cycles and GPU/CPU time correlation as well as
validate the parameters.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 include/drm-uapi/xe_drm.h |  93 ++++++++++++++----
 tests/xe/xe_query.c       | 200 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 275 insertions(+), 18 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index d1d49cd71..9bd932eaf 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -128,6 +128,24 @@ struct xe_user_extension {
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
+};
+
 /**
  * enum drm_xe_memory_class - Supported memory classes.
  */
@@ -223,6 +241,62 @@ struct drm_xe_query_mem_region {
 	__u64 reserved[6];
 };
 
+/**
+ * struct drm_xe_query_cs_cycles - correlate CPU and GPU timestamps
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_QUERY_CS_CYCLES, then the reply uses
+ * struct drm_xe_query_cs_cycles in .data.
+ *
+ * struct drm_xe_query_cs_cycles is allocated by the user and .data points to
+ * this allocated structure. The user must pass .eci and .clockid as inputs to
+ * this query.
+ *
+ * The query returns the command streamer cycles and the frequency that can
+ * be used to calculate the command streamer timestamp. In addition the
+ * query returns a set of cpu timestamps that indicate when the command
+ * streamer cycle count was captured.
+ */
+struct drm_xe_query_cs_cycles {
+	/** Engine for which command streamer cycles is queried. */
+	struct drm_xe_engine_class_instance eci;
+
+	/** MBZ (pad eci to 64 bit) */
+	__u16 rsvd;
+
+	/**
+	 * Command streamer cycles as read from the command streamer
+	 * register at 0x358 offset.
+	 */
+	__u64 cs_cycles;
+
+	/** Frequency of the cs cycles in Hz. */
+	__u64 cs_frequency;
+
+	/**
+	 * CPU timestamp in ns. The timestamp is captured before reading the
+	 * cs_cycles register using the reference clockid set by the user.
+	 */
+	__u64 cpu_timestamp;
+
+	/**
+	 * Time delta in ns captured around reading the lower dword of the
+	 * cs_cycles register.
+	 */
+	__u64 cpu_delta;
+
+	/**
+	 * Reference clock id for CPU timestamp. For definition, see
+	 * clock_gettime(2) and perf_event_open(2). Supported clock ids are
+	 * CLOCK_MONOTONIC, CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME,
+	 * CLOCK_TAI.
+	 */
+	__s32 clockid;
+
+	/** Width of the cs cycle counter in bits. */
+	__u32 width;
+};
+
 /**
  * struct drm_xe_query_mem_usage - describe memory regions and usage
  *
@@ -395,6 +469,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_GTS		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
+#define DRM_XE_QUERY_CS_CYCLES		6
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -737,24 +812,6 @@ struct drm_xe_exec_queue_set_property {
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
diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index a4e40afdd..8f257125b 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -468,6 +468,200 @@ test_query_invalid_extension(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
 }
 
+static bool
+query_cs_cycles_supported(int fd)
+{
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_QUERY_CS_CYCLES,
+		.size = 0,
+		.data = 0,
+	};
+
+	return igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query) == 0;
+}
+
+static void
+query_cs_cycles(int fd, struct drm_xe_query_cs_cycles *resp)
+{
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_QUERY_CS_CYCLES,
+		.size = sizeof(*resp),
+		.data = to_user_pointer(resp),
+	};
+
+	do_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+	igt_assert(query.size);
+}
+
+static void
+__cs_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	struct drm_xe_query_cs_cycles ts1 = {};
+	struct drm_xe_query_cs_cycles ts2 = {};
+	uint64_t delta_cpu, delta_cs, delta_delta;
+	unsigned int exec_queue;
+	int i, usable = 0;
+	igt_spin_t *spin;
+	uint64_t ahnd;
+	uint32_t vm;
+	struct {
+		int32_t id;
+		const char *name;
+	} clock[] = {
+		{ CLOCK_MONOTONIC, "CLOCK_MONOTONIC" },
+		{ CLOCK_MONOTONIC_RAW, "CLOCK_MONOTONIC_RAW" },
+		{ CLOCK_REALTIME, "CLOCK_REALTIME" },
+		{ CLOCK_BOOTTIME, "CLOCK_BOOTTIME" },
+		{ CLOCK_TAI, "CLOCK_TAI" },
+	};
+
+	igt_debug("engine[%u:%u]\n",
+		  hwe->engine_class,
+		  hwe->engine_instance);
+
+	vm = xe_vm_create(fd, 0, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	spin = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queue, .vm = vm);
+
+	/* Try a new clock every 10 iterations. */
+#define NUM_SNAPSHOTS 10
+	for (i = 0; i < NUM_SNAPSHOTS * ARRAY_SIZE(clock); i++) {
+		int index = i / NUM_SNAPSHOTS;
+
+		ts1.eci = *hwe;
+		ts1.clockid = clock[index].id;
+
+		ts2.eci = *hwe;
+		ts2.clockid = clock[index].id;
+
+		query_cs_cycles(fd, &ts1);
+		query_cs_cycles(fd, &ts2);
+
+		igt_debug("[1] cpu_ts before %llu, reg read time %llu\n",
+			  ts1.cpu_timestamp,
+			  ts1.cpu_delta);
+		igt_debug("[1] cs_ts %llu, freq %llu Hz, width %u\n",
+			  ts1.cs_cycles, ts1.cs_frequency, ts1.width);
+
+		igt_debug("[2] cpu_ts before %llu, reg read time %llu\n",
+			  ts2.cpu_timestamp,
+			  ts2.cpu_delta);
+		igt_debug("[2] cs_ts %llu, freq %llu Hz, width %u\n",
+			  ts2.cs_cycles, ts2.cs_frequency, ts2.width);
+
+		delta_cpu = ts2.cpu_timestamp - ts1.cpu_timestamp;
+
+		if (ts2.cs_cycles >= ts1.cs_cycles)
+			delta_cs = (ts2.cs_cycles - ts1.cs_cycles) *
+				   NSEC_PER_SEC / ts1.cs_frequency;
+		else
+			delta_cs = (((1 << ts2.width) - ts2.cs_cycles) + ts1.cs_cycles) *
+				   NSEC_PER_SEC / ts1.cs_frequency;
+
+		igt_debug("delta_cpu[%lu], delta_cs[%lu]\n",
+			  delta_cpu, delta_cs);
+
+		delta_delta = delta_cpu > delta_cs ?
+			       delta_cpu - delta_cs :
+			       delta_cs - delta_cpu;
+		igt_debug("delta_delta %lu\n", delta_delta);
+
+		if (delta_delta < 5000)
+			usable++;
+
+		/*
+		 * User needs few good snapshots of the timestamps to
+		 * synchronize cpu time with cs time. Check if we have enough
+		 * usable values before moving to the next clockid.
+		 */
+		if (!((i + 1) % NUM_SNAPSHOTS)) {
+			igt_debug("clock %s\n", clock[index].name);
+			igt_debug("usable %d\n", usable);
+			igt_assert(usable > 2);
+			usable = 0;
+		}
+	}
+
+	igt_spin_free(fd, spin);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+}
+
+/**
+ * SUBTEST: query-cs-cycles
+ * Description: Query CPU-GPU timestamp correlation
+ */
+static void test_query_cs_cycles(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	igt_require(query_cs_cycles_supported(fd));
+
+	xe_for_each_hw_engine(fd, hwe) {
+		igt_assert(hwe);
+		__cs_cycles(fd, hwe);
+	}
+}
+
+/**
+ * SUBTEST: query-invalid-cs-cycles
+ * Description: Check query with invalid arguments returns expected error code.
+ */
+static void test_cs_cycles_invalid(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_query_cs_cycles ts = {};
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_QUERY_CS_CYCLES,
+		.size = sizeof(ts),
+		.data = to_user_pointer(&ts),
+	};
+
+	igt_require(query_cs_cycles_supported(fd));
+
+	/* get one engine */
+	xe_for_each_hw_engine(fd, hwe)
+		break;
+
+	/* sanity check engine selection is valid */
+	ts.eci = *hwe;
+	query_cs_cycles(fd, &ts);
+
+	/* bad instance */
+	ts.eci = *hwe;
+	ts.eci.engine_instance = 0xffff;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	ts.eci = *hwe;
+
+	/* bad class */
+	ts.eci.engine_class = 0xffff;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	ts.eci = *hwe;
+
+	/* bad gt */
+	ts.eci.gt_id = 0xffff;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	ts.eci = *hwe;
+
+	/* non zero rsvd field */
+	ts.rsvd = 1;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	ts.rsvd = 0;
+
+	/* bad clockid */
+	ts.clockid = -1;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	ts.clockid = 0;
+
+	/* sanity check */
+	query_cs_cycles(fd, &ts);
+}
+
 igt_main
 {
 	int xe;
@@ -493,6 +687,12 @@ igt_main
 	igt_subtest("query-topology")
 		test_query_gt_topology(xe);
 
+	igt_subtest("query-cs-cycles")
+		test_query_cs_cycles(xe);
+
+	igt_subtest("query-invalid-cs-cycles")
+		test_cs_cycles_invalid(xe);
+
 	igt_subtest("query-invalid-query")
 		test_query_invalid_query(xe);
 
-- 
2.38.1

