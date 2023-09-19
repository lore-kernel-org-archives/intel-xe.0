Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90237CE79AC
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10B010E28F;
	Tue, 19 Sep 2023 16:16:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4098610E294
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140181; x=1726676181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+k1a9hvdVuZwtnlRGWg950cTJwCccCnDrEA3+H9hT1o=;
 b=jUiM1hiq7BzxcFtoLFFL11cVZKOw4CYKV1tynr1OhDL1mRmLnnf15XN8
 4ri2cS9XCWJmKNtSK7J3qlonG9EtNzxwIga68Zh4u9T+821ZuwgABo+oW
 Nm93gvA2NLm+NeJ63UvJ1muwwT6RZW5oU9VQTvsewt55hGb9CS5u/t1KF
 rPMy9eprLR22yIYyrktIfICJK2ppOlyZ0yrICXoUIq2kJm8CxBWjuE+YG
 yHrU0Ky1DrfWiv2xDw5O3JOhOR72QjXgLWCEsbf88m/NrE+A7cfvKkosV
 DbF8+ILP7ozbxeBJmllxTg88//xDxxARjz3e9pLqAnGhxDt2ZD7CZrRHY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913578"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913578"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016554"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016554"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:46 -0700
Message-ID: <20230919161049.2307855-19-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 18/21] drm/xe/uapi: More OA uapi fixes/additions
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

- Add drm_xe_query_oa_info to query information about OA units
- Discontinue DRM_XE_OA_PROP_GLOBAL_SSEU since it is no longer needed
- Add DRM_XE_OA_PROP_OA_BUFFER_SIZE to configure OA buffer size
- Add output parameter 'config_syncobj' to signal userland when stream
  configuration is complete.
- Add extensions field to structs to make structs future extensible

The implementation of these uapi features will follow later. At present the
emphasis is to finalize the uapi header.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/uapi/drm/xe_drm.h | 72 +++++++++++++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 6 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 77949c5abcee1..3b106bed42ea6 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -395,6 +395,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_GTS		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
+#define DRM_XE_DEVICE_QUERY_OA_INFO	6
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1133,6 +1134,48 @@ enum drm_xe_oa_format_type {
 	XE_OA_FMT_TYPE_PEC,
 };
 
+/**
+ * struct drm_xe_query_oa_info - describe OA units
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_OA_INFO, then the reply uses struct
+ * drm_xe_query_oa_info in .data.
+ */
+struct drm_xe_query_oa_info {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @oa_unit_count: number of OA units returned in oau[] */
+	__u32 oa_unit_count;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @reserved: MBZ */
+	__u64 reserved[4];
+
+	/** @oau: OA units returned for this device */
+	struct drm_xe_query_oa_unit {
+		/** @oa_unit_id: OA unit ID */
+		__u16 oa_unit_id;
+
+		/** @gt_id: GT ID for this OA unit */
+		__u16 gt_id;
+
+		/** @pad: MBZ */
+		__u32 pad;
+
+		/** @oa_timestamp_freq: OA timestamp freq */
+		__u64 oa_timestamp_freq;
+
+		/** @reserved: MBZ */
+		__u64 reserved[4];
+
+		/** @eci: engines attached to this OA unit */
+		struct drm_xe_engine_class_instance eci[];
+	} oau[];
+};
+
 enum drm_xe_oa_property_id {
 	/**
 	 * Open the stream for a specific exec queue id (as used with
@@ -1185,13 +1228,11 @@ enum drm_xe_oa_property_id {
 	DRM_XE_OA_PROP_HOLD_PREEMPTION,
 
 	/**
-	 * Specifying this pins all contexts to the specified SSEU power
-	 * configuration for the duration of the recording.
-	 *
-	 * This parameter's value is a pointer to a struct
-	 * drm_xe_gem_context_param_sseu (TBD).
+	 * Specify a global OA buffer size to be allocated in bytes. The
+	 * size specified must be supported by HW (powers of 2 ranging from
+	 * 128 KB to 128Mb depending on the platform)
 	 */
-	DRM_XE_OA_PROP_GLOBAL_SSEU,
+	DRM_XE_OA_PROP_OA_BUFFER_SIZE,
 
 	/**
 	 * This optional parameter specifies the timer interval in nanoseconds
@@ -1223,6 +1264,22 @@ enum drm_xe_oa_property_id {
 };
 
 struct drm_xe_oa_open_param {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/**
+	 * @config_syncobj: (Output) handle to configuration syncobj
+	 *
+	 * Handle to a syncobj which the kernel will signal after stream
+	 * configuration or re-configuration is complete (after return from
+	 * the ioctl). This handle can be provided as a dependency to the
+	 * next XE exec ioctl.
+	 */
+	__u32 config_syncobj;
+
+	__u32 reserved;
+
+	/** @flags: Flags */
 	__u32 flags;
 #define XE_OA_FLAG_FD_CLOEXEC	(1 << 0)
 #define XE_OA_FLAG_FD_NONBLOCK	(1 << 1)
@@ -1283,6 +1340,9 @@ enum drm_xe_oa_record_type {
 };
 
 struct drm_xe_oa_config {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
 	/**
 	 * @uuid:
 	 *
-- 
2.41.0

