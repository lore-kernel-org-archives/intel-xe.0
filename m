Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C83CC021A1
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 13:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EBE10E54C;
	Mon, 10 Feb 2025 13:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzrx/A1J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0C610E1C3
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739195219; x=1770731219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2XTvVto8/7xiqiWPnY8iK2HqhGhBy3OOgD7uUVk0aag=;
 b=bzrx/A1JeHTdfwFp2c8nymbfhcMefgL41+Cy3PSXn029YCy44VpexR8m
 Kpaie535Ydh0FuxM5OHaa+tjHM73BQKHShbMMnOpfp13zgYg+qoWoYTs+
 lid8stbXJp9BV75a4HJgTiqubD0gtS5Cei46vLy4/FKoNNpxxdHiL0OMF
 6d2U92xpgXT7rnOrZcsNc++MNTcJqVKmzf0ctD6Y3G90gUJMtLxDdoQW6
 SjXKhmzDwVyFsgbqF2dpPKLh3JPf4Scq8vO2gdRZ1NC9fKf+0cp4EzlPu
 ZphcVEAFtmB/CzHGyXD0HGHNq1vuyr/LU7s2n9iwzWG1D1jRkHO8K6XQ5 A==;
X-CSE-ConnectionGUID: HFDnV/oeShaSmOfcoGsuQQ==
X-CSE-MsgGUID: BhDAXdl0RwSfQ6T93LMIjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="27378427"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="27378427"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:46:58 -0800
X-CSE-ConnectionGUID: IMn6gN6qQEK8g9LIJjcF6g==
X-CSE-MsgGUID: rTdJp9q0STCkFccMJvD2ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149386850"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:46:58 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v9 7/8] drm/xe/uapi: Add a device query to get EU stall
 sampling information
Date: Mon, 10 Feb 2025 05:46:48 -0800
Message-ID: <0e30ecafd1c3d74156ae139d38af7c37fb4e2c39.1739193510.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739193510.git.harish.chegondi@intel.com>
References: <cover.1739193510.git.harish.chegondi@intel.com>
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

v9: Move reserved fields above num_sampling_rates in
    struct drm_xe_query_eu_stall.
v7: Change sampling_rates from a pointer to flexible array.
v6: Include EU stall sampling rates information and
    per XeCore buffer size in the query information.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 43 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_eu_stall.h |  4 +++
 drivers/gpu/drm/xe/xe_query.c    | 38 ++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h        | 40 +++++++++++++++++++++++++++--
 4 files changed, 121 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 52f8f40ba9a6..4dce58f60405 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -150,9 +150,48 @@ struct xe_eu_stall_data_xe2 {
 	__u64 unused[6];
 } __packed;
 
-static size_t xe_eu_stall_data_record_size(struct xe_device *xe)
+const u64 eu_stall_sampling_rates[] = {251, 251 * 2, 251 * 3, 251 * 4, 251 * 5, 251 * 6, 251 * 7};
+
+/**
+ * xe_eu_stall_get_sampling_rates - get EU stall sampling rates information.
+ *
+ * @num_rates_ptr: Pointer to a u32 to return the number of sampling rates.
+ * @rates_ptr: double u64 pointer to point to an array of sampling rates.
+ *
+ * Stores the number of sampling rates and pointer to the array of
+ * sampling rates in the input pointers.
+ *
+ * Returns: Size of the EU stall sampling rates array.
+ */
+size_t xe_eu_stall_get_sampling_rates(u32 *num_rates_ptr, const u64 **rates_ptr)
+{
+	*num_rates_ptr = ARRAY_SIZE(eu_stall_sampling_rates);
+	*rates_ptr = eu_stall_sampling_rates;
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
-	unsigned long record_size = 0;
+	size_t record_size = 0;
 
 	if (xe->info.platform == XE_PVC)
 		record_size = sizeof(struct xe_eu_stall_data_pvc);
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
index e42250c1d294..c612fbaf2901 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.h
+++ b/drivers/gpu/drm/xe/xe_eu_stall.h
@@ -8,6 +8,10 @@
 
 #include "xe_gt_types.h"
 
+size_t xe_eu_stall_get_per_xecore_buf_size(void);
+size_t xe_eu_stall_data_record_size(struct xe_device *xe);
+size_t xe_eu_stall_get_sampling_rates(u32 *num_rates_ptr,
+				      const u64 **rates_ptr);
 int xe_eu_stall_init(struct xe_gt *gt);
 void xe_eu_stall_fini(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 042f87a688e7..2402bb6b221c 100644
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
@@ -726,6 +727,42 @@ static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *qu
 	return 0;
 }
 
+static int query_eu_stall(struct xe_device *xe,
+			  struct drm_xe_device_query *query)
+{
+	void __user *query_ptr = u64_to_user_ptr(query->data);
+	struct drm_xe_query_eu_stall *info;
+	size_t size, array_size;
+	const u64 *rates_ptr;
+	u32 num_rates;
+	int ret;
+
+	array_size = xe_eu_stall_get_sampling_rates(&num_rates, &rates_ptr);
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
+	memcpy(info->sampling_rates, rates_ptr, array_size);
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
@@ -738,6 +775,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_uc_fw_version,
 	query_oa_units,
 	query_pxp_status,
+	query_eu_stall,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 1d79621f267b..c2c0983a9f2a 100644
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
+	/** @per_xecore_buf_size: Per XeCore buffer size */
+	__u64 per_xecore_buf_size;
+
+	/** @reserved: Reserved */
+	__u64 reserved[5];
+
+	/** @num_sampling_rates: Number of sampling rates supported */
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

