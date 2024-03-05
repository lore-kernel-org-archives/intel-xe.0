Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211F9C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 05:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33921124BD;
	Tue,  5 Mar 2024 05:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1Dq/bdP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038F11124ED
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 05:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709616103; x=1741152103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QBPO8zSsLAo5ZhcyrHRdQrPZRq9tWxankcGSV/Lqj+w=;
 b=A1Dq/bdPL7OdUkELdEpwR2h+rgoHZINHmw8GlGXFpZ70C+KGQVVQ4dV+
 6Obkrfw9GrWsX/166qsxwoLTuVHcQKyEO7IwnN6rYXr5iFcH7Gdor/pkx
 xtXSe+gdl3LAU4ggX6HYFYTaXikoW4zI93n0YDb9KCXwEIgVYW7PXXHfb
 MSH8QVFtlXbBB1dt3/PX3xlfITa1k4pvxyMUaVihlwkajkKG1XwJdZB4P
 VtfW0c4+D5LZl+5nDZV99kO+8LUqriyDU/lsaILH39TdftjDhImd/zXLD
 UJFwKkcpVwsG14o5/t03t0nsnq9V+7rE75XueRWaXvB+j8pgu98ltZ7fx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4067610"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4067610"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:21:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9426508"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:21:41 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/1] drm/xe/oa: Combined diff of changes between v10 and v11
Date: Mon,  4 Mar 2024 21:21:36 -0800
Message-ID: <20240305052136.2405509-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240305052136.2405509-1-ashutosh.dixit@intel.com>
References: <20240305052136.2405509-1-ashutosh.dixit@intel.com>
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, provide a combined diff of all changes in a single patch
to help with the code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

This patch will not compile, it's purpose is to just provide the diff.

The diff between v10 and v11 consists of the following uapi changes:
* Use a chain of drm_xe_ext_set_property struct's also for stream
  reconfiguration (using DRM_XE_PERF_IOCTL_CONFIG perf fd ioctl). This
  will enable additional properties such as syncobj's during stream
  reconfiguration.
* Add extensions also to output structs from the kernel so they can also be
  extended if needed in the future
* Change DRM_XE_PERF ioctl number to 0x0b

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 21 +++++++++++++++------
 drivers/gpu/drm/xe/xe_oa_types.h |  2 +-
 include/uapi/drm/xe_drm.h        | 19 +++++++++++++++++--
 3 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index c26bbed1940e..0f961ce4fb98 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1004,19 +1004,28 @@ static void xe_oa_disable_locked(struct xe_oa_stream *stream)
 	xe_oa_stream_disable(stream);
 }
 
-static long xe_oa_config_locked(struct xe_oa_stream *stream,
-				unsigned long metrics_set)
+static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
 {
-	struct xe_oa_config *config;
+	struct drm_xe_ext_set_property ext;
 	long ret = stream->oa_config->id;
+	struct xe_oa_config *config;
+	int err;
 
-	config = xe_oa_get_oa_config(stream->oa, metrics_set);
+	err = __copy_from_user(&ext, u64_to_user_ptr(arg), sizeof(ext));
+	if (XE_IOCTL_DBG(stream->oa->xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(stream->oa->xe, ext.pad) ||
+	    XE_IOCTL_DBG(stream->oa->xe, ext.base.name != DRM_XE_OA_EXTENSION_SET_PROPERTY) ||
+	    XE_IOCTL_DBG(stream->oa->xe, ext.base.next_extension) ||
+	    XE_IOCTL_DBG(stream->oa->xe, ext.property != DRM_XE_OA_PROPERTY_OA_METRIC_SET))
+		return -EINVAL;
+
+	config = xe_oa_get_oa_config(stream->oa, ext.value);
 	if (!config)
 		return -ENODEV;
 
 	if (config != stream->oa_config) {
-		int err;
-
 		err = xe_oa_emit_oa_config(stream);
 		if (!err)
 			config = xchg(&stream->oa_config, config);
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index ce20c03bbc28..fd8e42c9bee1 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -4,7 +4,7 @@
  */
 
 #ifndef _XE_OA_TYPES_H_
-#define _XE_OA_TYPES_H__
+#define _XE_OA_TYPES_H_
 
 #include <linux/idr.h>
 #include <linux/math.h>
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index bdd7b78f47ba..96a7b0bbbe57 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -100,7 +100,7 @@ extern "C" {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
-#define DRM_XE_PERF			0x0e
+#define DRM_XE_PERF			0x0b
 
 /* Must be kept compact -- no holes */
 
@@ -1377,7 +1377,7 @@ enum drm_xe_perf_op {
 };
 
 /**
- * struct drm_xe_perf_param - Perf layer param
+ * struct drm_xe_perf_param - Input of &DRM_XE_PERF
  *
  * The perf layer enables multiplexing perf counter streams of multiple
  * types. The actual params for a particular stream operation are supplied
@@ -1433,6 +1433,9 @@ enum drm_xe_oa_unit_type {
  * struct drm_xe_oa_unit - describe OA unit
  */
 struct drm_xe_oa_unit {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
 	/** @oa_unit_id: OA unit ID */
 	__u32 oa_unit_id;
 
@@ -1481,6 +1484,8 @@ struct drm_xe_oa_unit {
  *	}
  */
 struct drm_xe_query_oa_units {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
 	/** @num_oa_units: number of OA units returned in oau[] */
 	__u32 num_oa_units;
 	/** @pad: MBZ */
@@ -1507,6 +1512,10 @@ enum drm_xe_oa_format_type {
  * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
  * @param field in struct @drm_xe_perf_param points to the first
  * @drm_xe_ext_set_property struct.
+ *
+ * Exactly the same mechanism is also used for stream reconfiguration using
+ * the @DRM_XE_PERF_IOCTL_CONFIG perf fd ioctl, though only a subset of
+ * properties below can be specified for stream reconfiguration.
  */
 enum drm_xe_oa_property_id {
 #define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
@@ -1600,6 +1609,9 @@ struct drm_xe_oa_config {
  * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
  */
 struct drm_xe_oa_stream_status {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
 	/** @oa_status: OA status register as specified in PRM/Bspec 46717/61226 */
 	__u64 oa_status;
 #define DRM_XE_OASTATUS_MMIO_TRG_Q_FULL		(1 << 6)
@@ -1616,6 +1628,9 @@ struct drm_xe_oa_stream_status {
  * @DRM_XE_PERF_IOCTL_INFO perf fd ioctl
  */
 struct drm_xe_oa_stream_info {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
 	/** @oa_buf_size: OA buffer size */
 	__u64 oa_buf_size;
 
-- 
2.41.0

