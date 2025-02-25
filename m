Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08FDC021B8
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 09:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9E710E5E0;
	Tue, 25 Feb 2025 09:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJearLYw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA0510E5DB
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740475233; x=1772011233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XYYf8wst6ZSgItvxjEm1A6qpQ4eb85rahnnhQDAY76Y=;
 b=SJearLYwHkQL4o5C1joJNmPIipuMjXvO5SBt84SXg0Wjn+gxrd2Dx4yE
 GmcVCeVqUNXoPzrCdq+xN9fwNJ0jXc08EQKqU2j6YJq8FjLkORVI5D1ZW
 elYiV6D81W7cdMHhWeYEKShfzRXJfr0Q8wLcsOCfDpDyCFUftQAEiiY2+
 hsNMSR+cWWNOfdPqvEsMUckFij2l3x5C83rgVp6cmATk6+pKXCMouaz4i
 HmR8lYI7xGtl3Xivlatr7QLbsO9mG/L01OA4S1xXbeJ9m1teKBpvJag3P
 wkhDhwiaFIam8hyGbtsioVBZhyiHC1On88IDdCdvoYJ6VEM0c1uwvrT6u A==;
X-CSE-ConnectionGUID: 63VeI3TfTcGGry71rZfVBg==
X-CSE-MsgGUID: lhTrRImjTqeH0bLY6n8oQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40507680"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="40507680"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:20:33 -0800
X-CSE-ConnectionGUID: qZFsLUVlSk2xc6E9bVQA9Q==
X-CSE-MsgGUID: hX/NzepeRfCuv+GvJ7uJAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117261787"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:20:32 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 shubham.kumar@intel.com, joshua.santosh.ranjan@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v11 7/8] drm/xe/uapi: Add a device query to get EU stall
 sampling information
Date: Tue, 25 Feb 2025 01:20:24 -0800
Message-ID: <b029a6dbdd157202be1c7b47e8fbbacd2a120551.1740474556.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740474556.git.harish.chegondi@intel.com>
References: <cover.1740474556.git.harish.chegondi@intel.com>
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

User space can get the EU stall data record size, EU stall capabilities,
EU stall sampling rates, and per XeCore buffer size with query IOCTL
DRM_IOCTL_XE_DEVICE_QUERY with .query set to DRM_XE_DEVICE_QUERY_EU_STALL.
A struct drm_xe_query_eu_stall will be returned to the user space along
with an array of supported sampling rates sorted in the fastest sampling
rate first order. sampling_rates in struct drm_xe_query_eu_stall will
point to the array of sampling rates.

Any capabilities in EU stall sampling as of this patch are considered
as base capabilities. New capability bits will be added for any new
functionality added later.

v11: Check if EU stall sampling is supported on the platform.
v10: Change comments and variable names as per feedback
v9: Move reserved fields above num_sampling_rates in
    struct drm_xe_query_eu_stall.
v7: Change sampling_rates from a pointer to flexible array.
v6: Include EU stall sampling rates information and
    per XeCore buffer size in the query information.

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 41 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eu_stall.h |  4 +++
 drivers/gpu/drm/xe/xe_query.c    | 43 ++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h        | 40 +++++++++++++++++++++++++++--
 4 files changed, 125 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 74ff4a848df6..306cb30ca088 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -120,7 +120,46 @@ struct xe_eu_stall_data_xe2 {
 	__u64 unused[6];
 } __packed;
 
-static size_t xe_eu_stall_data_record_size(struct xe_device *xe)
+const u64 eu_stall_sampling_rates[] = {251, 251 * 2, 251 * 3, 251 * 4, 251 * 5, 251 * 6, 251 * 7};
+
+/**
+ * xe_eu_stall_get_sampling_rates - get EU stall sampling rates information.
+ *
+ * @num_rates: Pointer to a u32 to return the number of sampling rates.
+ * @rates: double u64 pointer to point to an array of sampling rates.
+ *
+ * Stores the number of sampling rates and pointer to the array of
+ * sampling rates in the input pointers.
+ *
+ * Returns: Size of the EU stall sampling rates array.
+ */
+size_t xe_eu_stall_get_sampling_rates(u32 *num_rates, const u64 **rates)
+{
+	*num_rates = ARRAY_SIZE(eu_stall_sampling_rates);
+	*rates = eu_stall_sampling_rates;
+
+	return sizeof(eu_stall_sampling_rates);
+}
+
+/**
+ * xe_eu_stall_get_per_xecore_buf_size - get per XeCore buffer size.
+ *
+ * Returns: The per XeCore buffer size used to allocate the per GT
+ *	    EU stall data buffer.
+ */
+size_t xe_eu_stall_get_per_xecore_buf_size(void)
+{
+	return per_xecore_buf_size;
+}
+
+/**
+ * xe_eu_stall_data_record_size - get EU stall data record size.
+ *
+ * @xe: Pointer to a Xe device.
+ *
+ * Returns: EU stall data record size.
+ */
+size_t xe_eu_stall_data_record_size(struct xe_device *xe)
 {
 	size_t record_size = 0;
 
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
index 24e215b840c0..4c74ae627505 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.h
+++ b/drivers/gpu/drm/xe/xe_eu_stall.h
@@ -8,6 +8,10 @@
 
 #include "xe_gt_types.h"
 
+size_t xe_eu_stall_get_per_xecore_buf_size(void);
+size_t xe_eu_stall_data_record_size(struct xe_device *xe);
+size_t xe_eu_stall_get_sampling_rates(u32 *num_rates, const u64 **rates);
+
 int xe_eu_stall_init(struct xe_gt *gt);
 int xe_eu_stall_stream_open(struct drm_device *dev,
 			    u64 data,
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index ebfae746f861..627151417f9c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -16,6 +16,7 @@
 #include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_eu_stall.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
@@ -729,6 +730,47 @@ static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *qu
 	return 0;
 }
 
+static int query_eu_stall(struct xe_device *xe,
+			  struct drm_xe_device_query *query)
+{
+	void __user *query_ptr = u64_to_user_ptr(query->data);
+	struct drm_xe_query_eu_stall *info;
+	size_t size, array_size;
+	const u64 *rates;
+	u32 num_rates;
+	int ret;
+
+	if (!(xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20)) {
+		drm_dbg(&xe->drm, "EU stall monitoring is not supported on this platform\n");
+		return -ENODEV;
+	}
+
+	array_size = xe_eu_stall_get_sampling_rates(&num_rates, &rates);
+	size = sizeof(struct drm_xe_query_eu_stall) + array_size;
+
+	if (query->size == 0) {
+		query->size = size;
+		return 0;
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
+		return -EINVAL;
+	}
+
+	info = kzalloc(size, GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->num_sampling_rates = num_rates;
+	info->capabilities = DRM_XE_EU_STALL_CAPS_BASE;
+	info->record_size = xe_eu_stall_data_record_size(xe);
+	info->per_xecore_buf_size = xe_eu_stall_get_per_xecore_buf_size();
+	memcpy(info->sampling_rates, rates, array_size);
+
+	ret = copy_to_user(query_ptr, info, size);
+	kfree(info);
+
+	return ret ? -EFAULT : 0;
+}
+
 static int (* const xe_query_funcs[])(struct xe_device *xe,
 				      struct drm_xe_device_query *query) = {
 	query_engines,
@@ -741,6 +783,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_uc_fw_version,
 	query_oa_units,
 	query_pxp_status,
+	query_eu_stall,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 95cb9e65540b..76a462fae05f 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -735,6 +735,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
 #define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
+#define DRM_XE_DEVICE_QUERY_EU_STALL		10
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1873,8 +1874,8 @@ enum drm_xe_eu_stall_property_id {
 	DRM_XE_EU_STALL_PROP_GT_ID = 1,
 
 	/**
-	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
-	 * in GPU cycles.
+	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate in
+	 * GPU cycles from @sampling_rates in struct @drm_xe_query_eu_stall
 	 */
 	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
 
@@ -1886,6 +1887,41 @@ enum drm_xe_eu_stall_property_id {
 	DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS,
 };
 
+/**
+ * struct drm_xe_query_eu_stall - Information about EU stall sampling.
+ *
+ * If a query is made with a struct @drm_xe_device_query where .query
+ * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
+ * struct @drm_xe_query_eu_stall in .data.
+ */
+struct drm_xe_query_eu_stall {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @capabilities: EU stall capabilities bit-mask */
+	__u64 capabilities;
+#define DRM_XE_EU_STALL_CAPS_BASE		(1 << 0)
+
+	/** @record_size: size of each EU stall data record */
+	__u64 record_size;
+
+	/** @per_xecore_buf_size: internal per XeCore buffer size */
+	__u64 per_xecore_buf_size;
+
+	/** @reserved: Reserved */
+	__u64 reserved[5];
+
+	/** @num_sampling_rates: Number of sampling rates in @sampling_rates array */
+	__u64 num_sampling_rates;
+
+	/**
+	 * @sampling_rates: Flexible array of sampling rates
+	 * sorted in the fastest to slowest order.
+	 * Sampling rates are specified in GPU clock cycles.
+	 */
+	__u64 sampling_rates[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.48.1

