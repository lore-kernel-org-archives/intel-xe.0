Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E679C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB38310E8E9;
	Thu,  9 Nov 2023 15:46:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545C510E8E5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544769; x=1731080769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CB/P6isGNlNEdYYPdbhrLbzMFqW8zSb1nZR0tzeRoHU=;
 b=YoUCiT5aYtfW01TRZ71T7yriRAwZJuUilHV4uWu32PLNKkjfDRavUe0R
 yvWPEy4IeOqZixbe6y/hZ5POAxo4m7QzeASKN8xlZeAui0NqDqAFx1rOK
 SpRLGpSyCdoTHU0III+tPMGLoZT9ZDII4VqyZ6rwtkB54M3znL2jSe5R8
 fMiLzdE5D+Dpr0jsnI1BTZISutGAI2UbnZgNQuy395zfpW+8eeH1o8oKL
 eshxvjZtqPYpjwp2Dyrx8u3RXAYY6hqUsDN4+6m/R9ocVv+o/6Jt6Amnk
 R2PBk1hDAP0uxMauIY4OJ0EMqJsg+ZR1cNYfqzwwUEu0WeNGbqy3FBPQg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556763"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556763"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886038"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886038"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:43 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:38 +0000
Message-Id: <20231109154457.7-25-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 24/43] drm/xe/uapi: Order sections
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

This patch doesn't modify any text or uapi entries themselves.
It only move things up and down aiming a better organization of the uAPI.

While fixing the documentation I noticed that query_engine_cs_cycles
was in the middle of the memory_region info. Then I noticed more
mismatches on the order when compared to the order of the IOCTL
and QUERY entries declaration. So this patch aims to bring some
order to the uAPI so it gets easier to read and the documentation
generated in the end is able to tell a consistent story.

Overall order:

1. IOCTL definition
2. Extension definition and helper structs
3. IOCTL's Query structs in the order of the Query's entries.
4. The rest of IOCTL structs in the order of IOCTL declaration.
5. uEvents
6. PMU

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 398 +++++++++++++++++++-------------------
 1 file changed, 204 insertions(+), 194 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 96db432d91bc..50dd9e0aad76 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -12,19 +12,53 @@
 extern "C" {
 #endif
 
-/* Please note that modifications to all structs defined here are
+/*
+ * Please note that modifications to all structs defined here are
  * subject to backwards-compatibility constraints.
+ *
+ * Sections in this file are organized as follows:
+ *   1. IOCTL definition
+ *   2. Extension definition and helper structs
+ *   3. IOCTL's Query structs in the order of the Query's entries.
+ *   4. The rest of IOCTL structs in the order of IOCTL declaration.
+ *   5. uEvents
+ *   6. PMU
+ *
  */
 
-/**
- * DOC: uevent generated by xe on it's pci node.
+/*
+ * xe specific ioctls.
  *
- * DRM_XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
- * fails. The value supplied with the event is always "NEEDS_RESET".
- * Additional information supplied is tile id and gt id of the gt unit for
- * which reset has failed.
+ * The device specific ioctl range is [DRM_COMMAND_BASE, DRM_COMMAND_END) ie
+ * [0x40, 0xa0) (a0 is excluded). The numbers below are defined as offset
+ * against DRM_COMMAND_BASE and should be between [0x0, 0x60).
  */
-#define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
+#define DRM_XE_DEVICE_QUERY		0x00
+#define DRM_XE_GEM_CREATE		0x01
+#define DRM_XE_GEM_MMAP_OFFSET		0x02
+#define DRM_XE_VM_CREATE		0x03
+#define DRM_XE_VM_DESTROY		0x04
+#define DRM_XE_VM_BIND			0x05
+#define DRM_XE_EXEC			0x06
+#define DRM_XE_EXEC_QUEUE_CREATE	0x07
+#define DRM_XE_EXEC_QUEUE_DESTROY	0x08
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0a
+#define DRM_XE_WAIT_USER_FENCE		0x0b
+/* Must be kept compact -- no holes */
+
+#define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
+#define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
+#define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
+#define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
+#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
+#define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
+#define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
+#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
+#define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
+#define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 
 /**
  * struct xe_user_extension - Base class for defining a chain of extensions
@@ -90,39 +124,23 @@ struct xe_user_extension {
 	__u32 pad;
 };
 
-/*
- * xe specific ioctls.
- *
- * The device specific ioctl range is [DRM_COMMAND_BASE, DRM_COMMAND_END) ie
- * [0x40, 0xa0) (a0 is excluded). The numbers below are defined as offset
- * against DRM_COMMAND_BASE and should be between [0x0, 0x60).
- */
-#define DRM_XE_DEVICE_QUERY		0x00
-#define DRM_XE_GEM_CREATE		0x01
-#define DRM_XE_GEM_MMAP_OFFSET		0x02
-#define DRM_XE_VM_CREATE		0x03
-#define DRM_XE_VM_DESTROY		0x04
-#define DRM_XE_VM_BIND			0x05
-#define DRM_XE_EXEC			0x06
-#define DRM_XE_EXEC_QUEUE_CREATE	0x07
-#define DRM_XE_EXEC_QUEUE_DESTROY	0x08
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0a
-#define DRM_XE_WAIT_USER_FENCE		0x0b
-/* Must be kept compact -- no holes */
+/** struct drm_xe_ext_set_property - XE set property extension */
+struct drm_xe_ext_set_property {
+	/** @base: base user extension */
+	struct xe_user_extension base;
 
-#define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
-#define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
-#define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
-#define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
-#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
-#define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
-#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
-#define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
-#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
-#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
-#define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
-#define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
+	/** @property: property to set */
+	__u32 property;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @value: property value */
+	__u64 value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
 
 /**
  * struct drm_xe_engine_class_instance - instance of an engine class
@@ -273,60 +291,6 @@ struct drm_xe_query_mem_region {
 	__u64 reserved[6];
 };
 
-/**
- * struct drm_xe_query_engine_cycles - correlate CPU and GPU timestamps
- *
- * If a query is made with a struct drm_xe_device_query where .query is equal to
- * DRM_XE_DEVICE_QUERY_ENGINE_CYCLES, then the reply uses struct drm_xe_query_engine_cycles
- * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
- * .data points to this allocated structure.
- *
- * The query returns the engine cycles and the frequency that can
- * be used to calculate the engine timestamp. In addition the
- * query returns a set of cpu timestamps that indicate when the command
- * streamer cycle count was captured.
- */
-struct drm_xe_query_engine_cycles {
-	/**
-	 * @eci: This is input by the user and is the engine for which command
-	 * streamer cycles is queried.
-	 */
-	struct drm_xe_engine_class_instance eci;
-
-	/**
-	 * @clockid: This is input by the user and is the reference clock id for
-	 * CPU timestamp. For definition, see clock_gettime(2) and
-	 * perf_event_open(2). Supported clock ids are CLOCK_MONOTONIC,
-	 * CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME, CLOCK_TAI.
-	 */
-	__s32 clockid;
-
-	/** @width: Width of the engine cycle counter in bits. */
-	__u32 width;
-
-	/**
-	 * @engine_cycles: Engine cycles as read from its register
-	 * at 0x358 offset.
-	 */
-	__u64 engine_cycles;
-
-	/** @engine_frequency: Frequency of the engine cycles in Hz. */
-	__u64 engine_frequency;
-
-	/**
-	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
-	 * reading the engine_cycles register using the reference clockid set by the
-	 * user.
-	 */
-	__u64 cpu_timestamp;
-
-	/**
-	 * @cpu_delta: Time delta in ns captured around reading the lower dword
-	 * of the engine_cycles register.
-	 */
-	__u64 cpu_delta;
-};
-
 /**
  * struct drm_xe_query_mem_regions - describe memory regions
  *
@@ -485,6 +449,60 @@ struct drm_xe_query_topology_mask {
 	__u8 mask[];
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
  * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
  *
@@ -691,24 +709,6 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
-/** struct drm_xe_ext_set_property - XE set property extension */
-struct drm_xe_ext_set_property {
-	/** @base: base user extension */
-	struct xe_user_extension base;
-
-	/** @property: property to set */
-	__u32 property;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 struct drm_xe_vm_create {
 #define DRM_XE_VM_EXTENSION_SET_PROPERTY	0
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -880,31 +880,67 @@ struct drm_xe_vm_bind {
 /* Monitor 64MB contiguous region with 2M sub-granularity */
 #define XE_ACC_GRANULARITY_64M 3
 
-/**
- * struct drm_xe_exec_queue_set_property - exec queue set property
- *
- * Same namespace for extensions as drm_xe_exec_queue_create
- */
-struct drm_xe_exec_queue_set_property {
+struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @exec_queue_id: Exec queue ID */
+#define DRM_XE_SYNC_FLAG_SYNCOBJ		0x0
+#define DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ	0x1
+#define DRM_XE_SYNC_FLAG_DMA_BUF		0x2
+#define DRM_XE_SYNC_FLAG_USER_FENCE		0x3
+#define DRM_XE_SYNC_FLAG_SIGNAL		0x10
+	__u32 flags;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	union {
+		__u32 handle;
+
+		/**
+		 * @addr: Address of user fence. When sync passed in via exec
+		 * IOCTL this a GPU address in the VM. When sync passed in via
+		 * VM bind IOCTL this is a user pointer. In either case, it is
+		 * the users responsibility that this address is present and
+		 * mapped when the user fence is signalled. Must be qword
+		 * aligned.
+		 */
+		__u64 addr;
+	};
+
+	__u64 timeline_value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_exec {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @exec_queue_id: Exec queue ID for the batch buffer */
 	__u32 exec_queue_id;
 
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		7
-	/** @property: property to set */
-	__u32 property;
+	/** @num_syncs: Amount of struct drm_xe_sync in array. */
+	__u32 num_syncs;
 
-	/** @value: property value */
-	__u64 value;
+	/** @syncs: Pointer to struct drm_xe_sync array. */
+	__u64 syncs;
+
+	/**
+	 * @address: address of batch buffer if num_batch_buffer == 1 or an
+	 * array of batch buffer addresses
+	 */
+	__u64 address;
+
+	/**
+	 * @num_batch_buffer: number of batch buffer in this exec, must match
+	 * the width of the engine
+	 */
+	__u16 num_batch_buffer;
+
+	/** @pad: MBZ */
+	__u16 pad[3];
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -943,24 +979,6 @@ struct drm_xe_exec_queue_create {
 	__u64 reserved[2];
 };
 
-struct drm_xe_exec_queue_get_property {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	/** @exec_queue_id: Exec queue ID */
-	__u32 exec_queue_id;
-
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN	0
-	/** @property: property to get */
-	__u32 property;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 struct drm_xe_exec_queue_destroy {
 	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
@@ -972,67 +990,49 @@ struct drm_xe_exec_queue_destroy {
 	__u64 reserved[2];
 };
 
-struct drm_xe_sync {
+/**
+ * struct drm_xe_exec_queue_set_property - exec queue set property
+ *
+ * Same namespace for extensions as drm_xe_exec_queue_create
+ */
+struct drm_xe_exec_queue_set_property {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_SYNC_FLAG_SYNCOBJ		0x0
-#define DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ	0x1
-#define DRM_XE_SYNC_FLAG_DMA_BUF		0x2
-#define DRM_XE_SYNC_FLAG_USER_FENCE		0x3
-#define DRM_XE_SYNC_FLAG_SIGNAL		0x10
-	__u32 flags;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	union {
-		__u32 handle;
+	/** @exec_queue_id: Exec queue ID */
+	__u32 exec_queue_id;
 
-		/**
-		 * @addr: Address of user fence. When sync passed in via exec
-		 * IOCTL this a GPU address in the VM. When sync passed in via
-		 * VM bind IOCTL this is a user pointer. In either case, it is
-		 * the users responsibility that this address is present and
-		 * mapped when the user fence is signalled. Must be qword
-		 * aligned.
-		 */
-		__u64 addr;
-	};
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		7
+	/** @property: property to set */
+	__u32 property;
 
-	__u64 timeline_value;
+	/** @value: property value */
+	__u64 value;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
 
-struct drm_xe_exec {
+struct drm_xe_exec_queue_get_property {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @exec_queue_id: Exec queue ID for the batch buffer */
+	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
 
-	/** @num_syncs: Amount of struct drm_xe_sync in array. */
-	__u32 num_syncs;
-
-	/** @syncs: Pointer to struct drm_xe_sync array. */
-	__u64 syncs;
-
-	/**
-	 * @address: address of batch buffer if num_batch_buffer == 1 or an
-	 * array of batch buffer addresses
-	 */
-	__u64 address;
-
-	/**
-	 * @num_batch_buffer: number of batch buffer in this exec, must match
-	 * the width of the engine
-	 */
-	__u16 num_batch_buffer;
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN	0
+	/** @property: property to get */
+	__u32 property;
 
-	/** @pad: MBZ */
-	__u16 pad[3];
+	/** @value: property value */
+	__u64 value;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -1115,6 +1115,16 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
+/**
+ * DOC: uevent generated by xe on it's pci node.
+ *
+ * DRM_XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
+ * fails. The value supplied with the event is always "NEEDS_RESET".
+ * Additional information supplied is tile id and gt id of the gt unit for
+ * which reset has failed.
+ */
+#define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
+
 /**
  * DOC: XE PMU event config IDs
  *
-- 
2.34.1

