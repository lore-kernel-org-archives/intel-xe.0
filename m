Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483E8C02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 20:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FCB10E7DA;
	Wed, 15 Jan 2025 20:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwc9oyBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C078410E0AE
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 20:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736971342; x=1768507342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QNdXzsW6dshH+Eqzw4/C9M9VARyM3YOsJa55e2UZDTQ=;
 b=bwc9oyBDpoY2bt9SiE8+Lj5BYyApOo20mnhWSzmhhTTo2OehGf83KsPm
 9U1OCU2Ni0PdjISuIcFSNYkd1e/1emc0ZYr9kNGfHoQmPDWUw0DRKYFBk
 f6js23KyTZIOb8W4iDo7tIIGl1OvhYSi7h5yZMPFeQGeejPfHMXTv/5fF
 GljAI7JwBjsA/Ei1U0HIY/lDjcJivzQb8gmlAbmsprwsr/DgVZW+X89/i
 J+L3PoOuSEeegpJSqelV8C+opR3jQeKHyaGvPSFr7vNmb1+D4XCFqqgGK
 zDS3uTEaYB7m42MFeB0f7zDACar/Bpeuab4+fSOcQqQ+YtiDm0twy6WUq A==;
X-CSE-ConnectionGUID: 8sQr0XqiQ8u+X6dVcYq5pQ==
X-CSE-MsgGUID: bZPsFDJfR12V9f0+JcNcow==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37438284"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37438284"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 12:02:22 -0800
X-CSE-ConnectionGUID: NbcAevTpRzGgZA2yuk0zAg==
X-CSE-MsgGUID: uvKTZEKDRii6qICZLdMaHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="105785824"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 12:02:21 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v8 6/7] drm/xe/uapi: Add a device query to get EU stall
 sampling information
Date: Wed, 15 Jan 2025 12:02:12 -0800
Message-ID: <9452fc2774136a6a977655487db7616316483823.1736970203.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736970203.git.harish.chegondi@intel.com>
References: <cover.1736970203.git.harish.chegondi@intel.com>
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

v7: Change sampling_rates from a pointer to flexible array.
v6: Include EU stall sampling rates information and
    per XeCore buffer size in the query information.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 41 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eu_stall.h |  5 ++++
 drivers/gpu/drm/xe/xe_query.c    | 38 +++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h        | 40 +++++++++++++++++++++++++++++--
 4 files changed, 121 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index d72f80a9dfe4..6acfd369d808 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -111,7 +111,46 @@ struct xe_eu_stall_data_xe2 {
 
 static u64 per_xecore_buf_size = SZ_512K;
 
-static unsigned long
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
+u64 xe_eu_stall_get_per_xecore_buf_size(void)
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
+unsigned long
 xe_eu_stall_data_record_size(struct xe_device *xe)
 {
 	enum xe_platform platform = xe->info.platform;
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
index 8bc44e9e98af..c00d1af794a1 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.h
+++ b/drivers/gpu/drm/xe/xe_eu_stall.h
@@ -47,10 +47,15 @@ struct xe_eu_stall_gt {
 	struct xe_eu_stall_data_stream *stream;
 };
 
+u64 xe_eu_stall_get_per_xecore_buf_size(void);
+size_t xe_eu_stall_get_sampling_rates(u32 *num_rates_ptr,
+				      const u64 **rates_ptr);
 int xe_eu_stall_init(struct xe_gt *gt);
 void xe_eu_stall_fini(struct xe_gt *gt);
 
 int xe_eu_stall_stream_open(struct drm_device *dev,
 			    u64 data,
 			    struct drm_file *file);
+unsigned long
+xe_eu_stall_data_record_size(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c059639613f7..544a4a2ce07f 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -26,6 +26,7 @@
 #include "xe_oa.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_eu_stall.h"
 
 static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
@@ -698,6 +699,42 @@ static int query_oa_units(struct xe_device *xe,
 	return ret ? -EFAULT : 0;
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
@@ -709,6 +746,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_engine_cycles,
 	query_uc_fw_version,
 	query_oa_units,
+	query_eu_stall,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d9b20afc57c1..7d518f97ba34 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -700,6 +700,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
+#define DRM_XE_DEVICE_QUERY_EU_STALL		9
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1754,8 +1755,8 @@ enum drm_xe_eu_stall_property_id {
 	DRM_XE_EU_STALL_PROP_GT_ID = 1,
 
 	/**
-	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
-	 * in GPU cycles.
+	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate in
+	 * GPU cycles from @sampling_rates in struct @drm_xe_query_eu_stall
 	 */
 	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
 
@@ -1767,6 +1768,41 @@ enum drm_xe_eu_stall_property_id {
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
+	/** @num_sampling_rates: Number of sampling rates supported */
+	__u64 num_sampling_rates;
+
+	/** @reserved: Reserved */
+	__u64 reserved[5];
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
2.47.1

