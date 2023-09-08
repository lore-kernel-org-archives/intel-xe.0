Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE965EE57C0
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B970910E874;
	Fri,  8 Sep 2023 04:24:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E7010E861
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147035; x=1725683035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FGmws1i92CzknqCGjW6TMTspZyrT44RNDgQV6K31tdY=;
 b=btwjphK4DOjA2WcqSqd9oXxrETcXqjulNZDrsx9yzcyiZnEgBYN3W2t1
 2ckQUZHCxPwAb7I2jxiNGOrtfj5WAUi9TDy6vBBIOInIFdMFM1x5gbtBV
 woKG7fTzWpYBwiw/hKwD1cSipQ5k/hvJ0DSzXIOkz0wf5HIFdupklfzCA
 q4yHaHHPMEF1jYv5uXodd3xF6X1EZ82taCaCzLLgeER+HeeZKV3bwbKvu
 6F92xGIvVb+b4pncFeRF0o3kQKxo+hCh+CoCKPrWTzNCNOb4t6rwcL0sS
 ec893KsnTW+67MkBTja7N8hb1fsUloTcvztWmc7HA3maXgxtbpKfk88ay g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935383"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935383"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200704"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200704"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:53 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:32 -0700
Message-ID: <20230908042348.1592535-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/17] drm/xe/oa: Introduce OA (observability
 architecture) uapi
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

OA uapi allows userspace to:
* Read streams of performance counters written by hardware
* Configure (and reconfigure) which sets of perf counters are captured as
  part of OA streams
* Configure other properties (such as format and periodicity) of such
  captures.
* Query associated parameters such as OA unit timestamp freq, oa_unit_id's
  for hw engines and OA ioctl version

v2: Explain OA is observability architecture (Francois)
    Change to reserved[7] in struct drm_xe_query_gts (Lionel)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/uapi/drm/xe_drm.h | 255 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 253 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 86f16d50e9ccc..186720872ca63 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -111,6 +111,9 @@ struct xe_user_extension {
 #define DRM_XE_WAIT_USER_FENCE		0x0b
 #define DRM_XE_VM_MADVISE		0x0c
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
+#define DRM_XE_OA_OPEN			0x16
+#define DRM_XE_OA_ADD_CONFIG		0x17
+#define DRM_XE_OA_REMOVE_CONFIG		0x18
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -127,6 +130,9 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
+#define DRM_IOCTL_XE_OA_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_OPEN, struct drm_xe_oa_open_param)
+#define DRM_IOCTL_XE_OA_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_ADD_CONFIG, struct drm_xe_oa_config)
+#define DRM_IOCTL_XE_OA_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_REMOVE_CONFIG, __u64)
 
 /**
  * enum drm_xe_memory_class - Supported memory classes.
@@ -261,7 +267,8 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
 #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
+#define XE_QUERY_OA_IOCTL_VERSION		7
+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_OA_IOCTL_VERSION + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
@@ -298,7 +305,8 @@ struct drm_xe_query_gts {
 		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
 		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
 		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
-		__u64 reserved[8];
+		__u64 oa_timestamp_freq;
+		__u64 reserved[7];
 	} gts[];
 };
 
@@ -753,6 +761,7 @@ struct drm_xe_engine_class_instance {
 
 	__u16 engine_instance;
 	__u16 gt_id;
+	__u16 oa_unit_id;
 };
 
 struct drm_xe_exec_queue_create {
@@ -1056,6 +1065,248 @@ struct drm_xe_vm_madvise {
 	__u64 reserved[2];
 };
 
+enum drm_xe_oa_format {
+	XE_OA_FORMAT_C4_B8 = 7,
+
+	/* Gen8+ */
+	XE_OA_FORMAT_A12,
+	XE_OA_FORMAT_A12_B8_C8,
+	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
+
+	/* DG2 */
+	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
+	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
+
+	/* MTL OAM */
+	XE_OAM_FORMAT_MPEC8u64_B8_C8,
+	XE_OAM_FORMAT_MPEC8u32_B8_C8,
+
+	XE_OA_FORMAT_MAX	    /* non-ABI */
+};
+
+enum drm_xe_oa_property_id {
+	/**
+	 * Open the stream for a specific exec queue id (as used with
+	 * drm_xe_exec). A stream opened for a specific exec queue id this
+	 * way won't typically require root privileges.
+	 */
+	DRM_XE_OA_PROP_EXEC_QUEUE_ID = 1,
+
+	/**
+	 * A value of 1 requests the inclusion of raw OA unit reports as
+	 * part of stream samples.
+	 */
+	DRM_XE_OA_PROP_SAMPLE_OA,
+
+	/**
+	 * The value specifies which set of OA unit metrics should be
+	 * configured, defining the contents of any OA unit reports.
+	 */
+	DRM_XE_OA_PROP_OA_METRICS_SET,
+
+	/**
+	 * The value specifies the size and layout of OA unit reports.
+	 */
+	DRM_XE_OA_PROP_OA_FORMAT,
+
+	/**
+	 * Specifying this property implicitly requests periodic OA unit
+	 * sampling and (at least on Haswell) the sampling frequency is derived
+	 * from this exponent as follows:
+	 *
+	 *   80ns * 2^(period_exponent + 1)
+	 */
+	DRM_XE_OA_PROP_OA_EXPONENT,
+
+	/**
+	 * Specifying this property is only valid when specify a context to
+	 * filter with DRM_XE_OA_PROP_ENGINE_ID. Specifying this property
+	 * will hold preemption of the particular engine we want to gather
+	 * performance data about.
+	 */
+	DRM_XE_OA_PROP_HOLD_PREEMPTION,
+
+	/**
+	 * Specifying this pins all contexts to the specified SSEU power
+	 * configuration for the duration of the recording.
+	 *
+	 * This parameter's value is a pointer to a struct
+	 * drm_xe_gem_context_param_sseu (TBD).
+	 */
+	DRM_XE_OA_PROP_GLOBAL_SSEU,
+
+	/**
+	 * This optional parameter specifies the timer interval in nanoseconds
+	 * at which the xe driver will check the OA buffer for available data.
+	 * Minimum allowed value is 100 microseconds. A default value is used by
+	 * the driver if this parameter is not specified. Note that larger timer
+	 * values will reduce cpu consumption during OA perf captures. However,
+	 * excessively large values would potentially result in OA buffer
+	 * overwrites as captures reach end of the OA buffer.
+	 */
+	DRM_XE_OA_PROP_POLL_OA_PERIOD,
+
+	/**
+	 * Multiple engines may be mapped to the same OA unit. The OA unit is
+	 * identified by class:instance of any engine mapped to it.
+	 *
+	 * This parameter specifies the engine class and must be passed along
+	 * with DRM_XE_OA_PROP_OA_ENGINE_INSTANCE.
+	 */
+	DRM_XE_OA_PROP_OA_ENGINE_CLASS,
+
+	/**
+	 * This parameter specifies the engine instance and must be passed along
+	 * with DRM_XE_OA_PROP_OA_ENGINE_CLASS.
+	 */
+	DRM_XE_OA_PROP_OA_ENGINE_INSTANCE,
+
+	DRM_XE_OA_PROP_MAX /* non-ABI */
+};
+
+struct drm_xe_oa_open_param {
+	__u32 flags;
+#define XE_OA_FLAG_FD_CLOEXEC	(1 << 0)
+#define XE_OA_FLAG_FD_NONBLOCK	(1 << 1)
+#define XE_OA_FLAG_DISABLED	(1 << 2)
+
+	/** The number of u64 (id, value) pairs */
+	__u32 num_properties;
+
+	/**
+	 * Pointer to array of u64 (id, value) pairs configuring the stream
+	 * to open.
+	 */
+	__u64 properties_ptr;
+};
+
+struct drm_xe_oa_record_header {
+	__u32 type;
+	__u16 pad;
+	__u16 size;
+};
+
+enum drm_xe_oa_record_type {
+	/**
+	 * Samples are the work horse record type whose contents are
+	 * extensible and defined when opening an xe oa stream based on the
+	 * given properties.
+	 *
+	 * Boolean properties following the naming convention
+	 * DRM_XE_OA_SAMPLE_xyz_PROP request the inclusion of 'xyz' data in
+	 * every sample.
+	 *
+	 * The order of these sample properties given by userspace has no
+	 * affect on the ordering of data within a sample. The order is
+	 * documented here.
+	 *
+	 * struct {
+	 *     struct drm_xe_oa_record_header header;
+	 *
+	 *     { u32 oa_report[]; } && DRM_XE_OA_PROP_SAMPLE_OA
+	 * };
+	 */
+	DRM_XE_OA_RECORD_SAMPLE = 1,
+
+	/**
+	 * Indicates that one or more OA reports were not written by the
+	 * hardware. This can happen for example if an MI_REPORT_PERF_COUNT
+	 * command collides with periodic sampling - which would be more likely
+	 * at higher sampling frequencies.
+	 */
+	DRM_XE_OA_RECORD_OA_REPORT_LOST = 2,
+
+	/**
+	 * An error occurred that resulted in all pending OA reports being lost.
+	 */
+	DRM_XE_OA_RECORD_OA_BUFFER_LOST = 3,
+
+	DRM_XE_OA_RECORD_MAX /* non-ABI */
+};
+
+struct drm_xe_oa_config {
+	/**
+	 * @uuid:
+	 *
+	 * String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x"
+	 */
+	char uuid[36];
+
+	/**
+	 * @n_mux_regs:
+	 *
+	 * Number of mux regs in &mux_regs_ptr.
+	 */
+	__u32 n_mux_regs;
+
+	/**
+	 * @n_boolean_regs:
+	 *
+	 * Number of boolean regs in &boolean_regs_ptr.
+	 */
+	__u32 n_boolean_regs;
+
+	/**
+	 * @n_flex_regs:
+	 *
+	 * Number of flex regs in &flex_regs_ptr.
+	 */
+	__u32 n_flex_regs;
+
+	/**
+	 * @mux_regs_ptr:
+	 *
+	 * Pointer to tuples of u32 values (register address, value) for mux
+	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
+	 * &n_mux_regs).
+	 */
+	__u64 mux_regs_ptr;
+
+	/**
+	 * @boolean_regs_ptr:
+	 *
+	 * Pointer to tuples of u32 values (register address, value) for mux
+	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
+	 * &n_boolean_regs).
+	 */
+	__u64 boolean_regs_ptr;
+
+	/**
+	 * @flex_regs_ptr:
+	 *
+	 * Pointer to tuples of u32 values (register address, value) for mux
+	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
+	 * &n_flex_regs).
+	 */
+	__u64 flex_regs_ptr;
+};
+
+/*
+ * Enable data capture for a stream that was either opened in a disabled state
+ * via I915_PERF_FLAG_DISABLED or was later disabled via
+ * I915_PERF_IOCTL_DISABLE.
+ *
+ * It is intended to be cheaper to disable and enable a stream than it may be
+ * to close and re-open a stream with the same configuration.
+ *
+ * It's undefined whether any pending data for the stream will be lost.
+ */
+#define XE_OA_IOCTL_ENABLE	_IO('i', 0x0)
+
+/*
+ * Disable data capture for a stream.
+ *
+ * It is an error to try and read a stream that is disabled.
+ */
+#define XE_OA_IOCTL_DISABLE	_IO('i', 0x1)
+
+/*
+ * Change metrics_set captured by a stream.
+ *
+ * Returns the previously bound metrics set id, or a negative error code.
+ */
+#define XE_OA_IOCTL_CONFIG	_IO('i', 0x2)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

