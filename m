Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42CEFB5189
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 03:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636C610E343;
	Tue,  7 Apr 2026 03:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eghs8j/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6EC10E345
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 03:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775531084; x=1807067084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8jeQmIR5hg5D66baaWuDBbYNdEPD9tMWm1UEQpPnE1o=;
 b=eghs8j/wzHstTtct93Oz75unwKR2+dHtd+tMNAXBI4wIWWNQQtW1WFCR
 fK8sA4h0CHF4cqvhkQLbx4IxHPjc79hizWo+CGB6XX6R5BrkT/qsvN9Yo
 sf+m33an4RcNOqWWe+am83TS1SGWBvgk4xlu9qO2RYZOYsrkdHo8XCBmb
 FM8O4XOUqBEK2QshMeTy6IlZxNiEFtwM/EA6SkTVGtE9723uNBGy1evhu
 h5uxVpwS9Vzu4XeUmFz/Cv2KHJ3klImdlnxkZ0rCOf5owBX6yHY+G+3ZL
 n1kprwKOvNeSmcmLMQX78LEvAdVNvRzcKYvS50xliScZ8vBiav0eAD805 Q==;
X-CSE-ConnectionGUID: fuLi3Q31Qiy9QHR8jr19LA==
X-CSE-MsgGUID: Jg5vEXtRTz+MVBWg2idOZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76201138"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76201138"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:04:44 -0700
X-CSE-ConnectionGUID: cj0dODJeThOgb1p61aQdrw==
X-CSE-MsgGUID: sYuzFfuuQM6EA9W+82H1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="225295091"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:04:43 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH v3 4/6] drm/xe/uapi: Fix kernel-doc cross-reference syntax in
 xe_drm.h
Date: Tue,  7 Apr 2026 03:00:44 +0000
Message-ID: <20260407030046.3394004-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260407030046.3394004-1-shuicheng.lin@intel.com>
References: <20260407030046.3394004-1-shuicheng.lin@intel.com>
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

Fix incorrect kernel-doc cross-reference markup syntax
throughout xe_drm.h:
- @struct_name -> &struct name for cross-references to other
  structs (19 occurrences)
- struct @name -> &struct name where struct keyword was
  mixed with @ syntax (8 occurrences)
- enum @name -> &enum name for cross-references to other
  enums (5 occurrences)
- &CONSTANT / @CONSTANT -> %CONSTANT for defines and enum
  values (15 occurrences)
- @field references to members of other structs -> plain text,
  since @ only applies to the current struct's members
  (9 occurrences)

Per kernel-doc conventions (Documentation/doc-guide/kernel-doc.rst):
- '&struct name' creates hyperlinks to struct definitions
- '&enum name' creates hyperlinks to enum definitions
- '%NAME' references constants and defines
- '@name' is only for parameters/members of the current context

Assisted-by: GitHub Copilot:claude-opus-4.6
Suggested-by: Xin Wang <x.wang@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 include/uapi/drm/xe_drm.h | 106 +++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ad8e3b69a3d7..8751ad7b845f 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -229,9 +229,9 @@ struct drm_xe_ext_set_property {
 /**
  * struct drm_xe_engine_class_instance - instance of an engine class
  *
- * It is returned as part of the @drm_xe_engine, but it also is used as
- * the input of engine selection for both @drm_xe_exec_queue_create and
- * @drm_xe_query_engine_cycles
+ * It is returned as part of the &struct drm_xe_engine, but it also is used as
+ * the input of engine selection for both &struct drm_xe_exec_queue_create and
+ * &struct drm_xe_query_engine_cycles
  *
  * The @engine_class can be:
  *  - %DRM_XE_ENGINE_CLASS_RENDER
@@ -264,7 +264,7 @@ struct drm_xe_engine_class_instance {
  * struct drm_xe_engine - describe hardware engine
  */
 struct drm_xe_engine {
-	/** @instance: The @drm_xe_engine_class_instance */
+	/** @instance: The &struct drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
 
 	/** @reserved: Reserved */
@@ -274,9 +274,9 @@ struct drm_xe_engine {
 /**
  * struct drm_xe_query_engines - describe engines
  *
- * If a query is made with a struct @drm_xe_device_query where .query
+ * If a query is made with a &struct drm_xe_device_query where .query
  * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
- * struct @drm_xe_query_engines in .data.
+ * &struct drm_xe_query_engines in .data.
  */
 struct drm_xe_query_engines {
 	/** @num_engines: number of engines returned in @engines */
@@ -825,7 +825,7 @@ struct drm_xe_device_query {
  *
  * This ioctl supports setting the following properties via the
  * %DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY extension, which uses the
- * generic @drm_xe_ext_set_property struct:
+ * generic &struct drm_xe_ext_set_property:
  *
  *  - %DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
  *    this object will be used with. Valid values are listed in enum
@@ -1198,10 +1198,10 @@ struct drm_xe_vm_bind_op {
 /**
  * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
  *
- * Below is an example of a minimal use of @drm_xe_vm_bind to
+ * Below is an example of a minimal use of &struct drm_xe_vm_bind to
  * asynchronously bind the buffer `data` at address `BIND_ADDRESS` to
  * illustrate `userptr`. It can be synchronized by using the example
- * provided for @drm_xe_sync.
+ * provided for &struct drm_xe_sync.
  *
  * .. code-block:: C
  *
@@ -1354,7 +1354,7 @@ struct drm_xe_vm_get_property {
  *
  * This ioctl supports setting the following properties via the
  * %DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY extension, which uses the
- * generic @drm_xe_ext_set_property struct:
+ * generic &struct drm_xe_ext_set_property:
  *
  *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY - set the queue priority.
  *    CAP_SYS_NICE is required to set a value above normal.
@@ -1389,9 +1389,9 @@ struct drm_xe_vm_get_property {
  *    enable render color cache keying on BTP+BTI instead of just BTI
  *    (only valid for render queues).
  *
- * The example below shows how to use @drm_xe_exec_queue_create to create
+ * The example below shows how to use &struct drm_xe_exec_queue_create to create
  * a simple exec_queue (no parallel submission) of class
- * &DRM_XE_ENGINE_CLASS_RENDER.
+ * %DRM_XE_ENGINE_CLASS_RENDER.
  *
  * .. code-block:: C
  *
@@ -1514,7 +1514,7 @@ struct drm_xe_exec_queue_get_property {
  * and the @flags can be:
  *  - %DRM_XE_SYNC_FLAG_SIGNAL
  *
- * A minimal use of @drm_xe_sync looks like this:
+ * A minimal use of &struct drm_xe_sync looks like this:
  *
  * .. code-block:: C
  *
@@ -1580,10 +1580,10 @@ struct drm_xe_sync {
 /**
  * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
  *
- * This is an example to use @drm_xe_exec for execution of the object
- * at BIND_ADDRESS (see example in @drm_xe_vm_bind) by an exec_queue
- * (see example in @drm_xe_exec_queue_create). It can be synchronized
- * by using the example provided for @drm_xe_sync.
+ * This is an example to use &struct drm_xe_exec for execution of the object
+ * at BIND_ADDRESS (see example in &struct drm_xe_vm_bind) by an exec_queue
+ * (see example in &struct drm_xe_exec_queue_create). It can be synchronized
+ * by using the example provided for &struct drm_xe_sync.
  *
  * .. code-block:: C
  *
@@ -1749,9 +1749,9 @@ enum drm_xe_observation_op {
 struct drm_xe_observation_param {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-	/** @observation_type: observation stream type, of enum @drm_xe_observation_type */
+	/** @observation_type: observation stream type, of &enum drm_xe_observation_type */
 	__u64 observation_type;
-	/** @observation_op: observation stream op, of enum @drm_xe_observation_op */
+	/** @observation_op: observation stream op, of &enum drm_xe_observation_op */
 	__u64 observation_op;
 	/** @param: Pointer to actual stream params */
 	__u64 param;
@@ -1810,7 +1810,7 @@ struct drm_xe_oa_unit {
 	/** @oa_unit_id: OA unit ID */
 	__u32 oa_unit_id;
 
-	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
+	/** @oa_unit_type: OA unit type of &enum drm_xe_oa_unit_type */
 	__u32 oa_unit_type;
 
 	/** @capabilities: OA capabilities bit-mask */
@@ -1873,7 +1873,7 @@ struct drm_xe_query_oa_units {
 	/** @pad: MBZ */
 	__u32 pad;
 	/**
-	 * @oa_units: struct @drm_xe_oa_unit array returned for this device.
+	 * @oa_units: &struct drm_xe_oa_unit array returned for this device.
 	 * Written below as a u64 array to avoid problems with nested flexible
 	 * arrays with some compilers
 	 */
@@ -1902,22 +1902,22 @@ enum drm_xe_oa_format_type {
 /**
  * enum drm_xe_oa_property_id - OA stream property IDs
  *
- * Stream params are specified as a chain of @drm_xe_ext_set_property
- * structs, with @property values from enum @drm_xe_oa_property_id and
- * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
- * @param field in struct @drm_xe_observation_param points to the first
- * @drm_xe_ext_set_property struct.
+ * Stream params are specified as a chain of &struct drm_xe_ext_set_property
+ * structs, with property values from &enum drm_xe_oa_property_id and
+ * &struct drm_xe_user_extension base.name set to %DRM_XE_OA_EXTENSION_SET_PROPERTY.
+ * The param field in &struct drm_xe_observation_param points to the first
+ * &struct drm_xe_ext_set_property struct.
  *
  * Exactly the same mechanism is also used for stream reconfiguration using the
- * @DRM_XE_OBSERVATION_IOCTL_CONFIG observation stream fd ioctl, though only a
+ * %DRM_XE_OBSERVATION_IOCTL_CONFIG observation stream fd ioctl, though only a
  * subset of properties below can be specified for stream reconfiguration.
  */
 enum drm_xe_oa_property_id {
 #define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
 	/**
 	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
-	 * the OA stream, see @oa_unit_id in 'struct
-	 * drm_xe_oa_unit'. Defaults to 0 if not provided.
+	 * the OA stream, see oa_unit_id in &struct drm_xe_oa_unit.
+	 * Defaults to 0 if not provided.
 	 */
 	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
 
@@ -1930,7 +1930,7 @@ enum drm_xe_oa_property_id {
 
 	/**
 	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
-	 * reports, previously added via @DRM_XE_OBSERVATION_OP_ADD_CONFIG.
+	 * reports, previously added via %DRM_XE_OBSERVATION_OP_ADD_CONFIG.
 	 */
 	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
 
@@ -1938,7 +1938,7 @@ enum drm_xe_oa_property_id {
 	DRM_XE_OA_PROPERTY_OA_FORMAT,
 	/*
 	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
-	 * in terms of the following quantities: a. enum @drm_xe_oa_format_type
+	 * in terms of the following quantities: a. &enum drm_xe_oa_format_type
 	 * b. Counter select c. Counter size and d. BC report. Also refer to the
 	 * oa_formats array in drivers/gpu/drm/xe/xe_oa.c.
 	 */
@@ -1955,19 +1955,19 @@ enum drm_xe_oa_property_id {
 
 	/**
 	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
-	 * stream in a DISABLED state (see @DRM_XE_OBSERVATION_IOCTL_ENABLE).
+	 * stream in a DISABLED state (see %DRM_XE_OBSERVATION_IOCTL_ENABLE).
 	 */
 	DRM_XE_OA_PROPERTY_OA_DISABLED,
 
 	/**
 	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
-	 * @exec_queue_id. OA queries can be executed on this exec queue.
+	 * exec_queue_id. OA queries can be executed on this exec queue.
 	 */
 	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
 
 	/**
 	 * @DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE: Optional engine instance to
-	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
+	 * pass along with %DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
 	 */
 	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
 
@@ -1979,16 +1979,16 @@ enum drm_xe_oa_property_id {
 
 	/**
 	 * @DRM_XE_OA_PROPERTY_NUM_SYNCS: Number of syncs in the sync array
-	 * specified in @DRM_XE_OA_PROPERTY_SYNCS
+	 * specified in %DRM_XE_OA_PROPERTY_SYNCS
 	 */
 	DRM_XE_OA_PROPERTY_NUM_SYNCS,
 
 	/**
-	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to struct @drm_xe_sync array
-	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
+	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to &struct drm_xe_sync array
+	 * with array size specified via %DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
 	 * configuration will wait till input fences signal. Output fences
 	 * will signal after the new OA configuration takes effect. For
-	 * @DRM_XE_SYNC_TYPE_USER_FENCE, @addr is a user pointer, similar
+	 * %DRM_XE_SYNC_TYPE_USER_FENCE, addr is a user pointer, similar
 	 * to the VM bind case.
 	 */
 	DRM_XE_OA_PROPERTY_SYNCS,
@@ -2011,9 +2011,9 @@ enum drm_xe_oa_property_id {
 /**
  * struct drm_xe_oa_config - OA metric configuration
  *
- * Multiple OA configs can be added using @DRM_XE_OBSERVATION_OP_ADD_CONFIG. A
+ * Multiple OA configs can be added using %DRM_XE_OBSERVATION_OP_ADD_CONFIG. A
  * particular config can be specified when opening an OA stream using
- * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
+ * %DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
  */
 struct drm_xe_oa_config {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -2034,7 +2034,7 @@ struct drm_xe_oa_config {
 
 /**
  * struct drm_xe_oa_stream_status - OA stream status returned from
- * @DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl. Userspace can
+ * %DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl. Userspace can
  * call the ioctl to query stream status in response to EIO errno from
  * observation fd read().
  */
@@ -2055,7 +2055,7 @@ struct drm_xe_oa_stream_status {
 
 /**
  * struct drm_xe_oa_stream_info - OA stream info returned from
- * @DRM_XE_OBSERVATION_IOCTL_INFO observation stream fd ioctl
+ * %DRM_XE_OBSERVATION_IOCTL_INFO observation stream fd ioctl
  */
 struct drm_xe_oa_stream_info {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -2092,27 +2092,27 @@ enum drm_xe_pxp_session_type {
  * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
  *
  * These properties are passed to the driver at open as a chain of
- * @drm_xe_ext_set_property structures with @property set to these
- * properties' enums and @value set to the corresponding values of these
- * properties. @drm_xe_user_extension base.name should be set to
- * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
+ * &struct drm_xe_ext_set_property structures with property set to these
+ * properties' enums and value set to the corresponding values of these
+ * properties. &struct drm_xe_user_extension base.name should be set to
+ * %DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
  *
  * With the file descriptor obtained from open, user space must enable
- * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
+ * the EU stall stream fd with %DRM_XE_OBSERVATION_IOCTL_ENABLE before
  * calling read(). EIO errno from read() indicates HW dropped data
  * due to full buffer.
  */
 enum drm_xe_eu_stall_property_id {
 #define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
 	/**
-	 * @DRM_XE_EU_STALL_PROP_GT_ID: @gt_id of the GT on which
+	 * @DRM_XE_EU_STALL_PROP_GT_ID: gt_id of the GT on which
 	 * EU stall data will be captured.
 	 */
 	DRM_XE_EU_STALL_PROP_GT_ID = 1,
 
 	/**
 	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate in
-	 * GPU cycles from @sampling_rates in struct @drm_xe_query_eu_stall
+	 * GPU cycles from sampling_rates in &struct drm_xe_query_eu_stall
 	 */
 	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
 
@@ -2127,9 +2127,9 @@ enum drm_xe_eu_stall_property_id {
 /**
  * struct drm_xe_query_eu_stall - Information about EU stall sampling.
  *
- * If a query is made with a struct @drm_xe_device_query where .query
- * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
- * struct @drm_xe_query_eu_stall in .data.
+ * If a query is made with a &struct drm_xe_device_query where .query
+ * is equal to %DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
+ * &struct drm_xe_query_eu_stall in .data.
  */
 struct drm_xe_query_eu_stall {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -2240,7 +2240,7 @@ struct drm_xe_madvise {
 
 			/**
 			 * @preferred_mem_loc.region_instance : Region instance.
-			 * MBZ if @devmem_fd <= &DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE.
+			 * MBZ if @devmem_fd <= %DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE.
 			 * Otherwise should point to the desired device
 			 * VRAM instance of the device indicated by
 			 * @preferred_mem_loc.devmem_fd.
-- 
2.43.0

