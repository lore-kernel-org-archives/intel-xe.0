Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDE0CF2590
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 06:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D6D10E288;
	Mon, 14 Oct 2024 06:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsbofsw2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D24B10E26F
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 06:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728885644; x=1760421644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CGNbkxMCDJEI1wOgzXAl7lnqQu1aG5b8NkyNdk9Bf/g=;
 b=nsbofsw289FuC57Zq6iCGf97XdZXXoGBiTb1SxL+cDo+y55ENNJQ8dSC
 OAX4UY9t4ILucJ4k1tXFnJZrPSCAxD0rI9ouNC3ezL7cidkhGoMbxN6fv
 5+NLIDlaEKrE1MKu6/2DVqQ9l52Vtvu3VXtHIXO3zBzpO9EyVlweirRUu
 cYrSRwwEGf9ZBO8+5AkMo+lOsOR3HqHBMMeVLPeVJacbfBbmxeUMTy2s+
 uarOTatiXcJu2pUAW4Mjf9Wjdo67KvrUctsZqEKwHdn0tMIp7Nahx4kRE
 A7nw8OK7wzSDejafh5nEyScsTwaY+S/ThLVWgEqVd1qJModJuBbVKqurX g==;
X-CSE-ConnectionGUID: 0YRwqSnxTDaYCsM3WC1E0A==
X-CSE-MsgGUID: bbG+YMuZTUWFTZPcExpvGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39599333"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="39599333"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 23:00:43 -0700
X-CSE-ConnectionGUID: 5ew/OpcfQJavJsTbYH1bLA==
X-CSE-MsgGUID: q7SeUl9ZQu+L3w1k4ufGKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77575049"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 23:00:43 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, jose.souza@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 4/5] drm/xe/query: Add a device query to get EU stall data
 information
Date: Sun, 13 Oct 2024 23:00:35 -0700
Message-ID: <8a5f3cc1a7853b76ddde9442e4d11bf19b337509.1728884074.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1728884074.git.harish.chegondi@intel.com>
References: <cover.1728884074.git.harish.chegondi@intel.com>
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

User space can find the EU stall data record size and capabilities
with the DRM_IOCTL_XE_DEVICE_QUERY with .query set to
DRM_XE_DEVICE_QUERY_EU_STALL_SAMPLING. query data is returned in
a struct drm_xe_query_eu_stall_data.

Any capabilities in EU stall sampling as of this patch are considered
as base capabilities. Any new capabilities added later will need
a new capabilities flag.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 80 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eu_stall.h |  2 +
 drivers/gpu/drm/xe/xe_query.c    | 30 ++++++++++++
 include/uapi/drm/xe_drm.h        | 20 ++++++++
 4 files changed, 132 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 6a730ffa6d2f..1801b3c03f1f 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -45,6 +45,86 @@ struct eu_stall_open_properties {
 	struct xe_gt *gt;
 };
 
+/**
+ * struct drm_xe_eu_stall_data_pvc - EU stall data format for PVC
+ *
+ * Bits		Field
+ * 0  to 28	IP (addr)
+ * 29 to 36	active count
+ * 37 to 44	other count
+ * 45 to 52	control count
+ * 53 to 60	pipestall count
+ * 61 to 68	send count
+ * 69 to 76	dist_acc count
+ * 77 to 84	sbid count
+ * 85 to 92	sync count
+ * 93 to 100	inst_fetch count
+ */
+struct drm_xe_eu_stall_data_pvc {
+	__u64 ip_addr:29;
+	__u64 active_count:8;
+	__u64 other_count:8;
+	__u64 control_count:8;
+	__u64 pipestall_count:8;
+	__u64 send_count:8;
+	__u64 dist_acc_count:8;
+	__u64 sbid_count:8;
+	__u64 sync_count:8;
+	__u64 inst_fetch_count:8;
+	__u64 unused_bits:27;
+	__u64 unused[6];
+} __packed;
+
+/**
+ * struct drm_xe_eu_stall_data_xe2 - EU stall data format for LNL, BMG
+ *
+ * Bits		Field
+ * 0  to 28	IP (addr)
+ * 29 to 36	Tdr count
+ * 37 to 44	other count
+ * 45 to 52	control count
+ * 53 to 60	pipestall count
+ * 61 to 68	send count
+ * 69 to 76	dist_acc count
+ * 77 to 84	sbid count
+ * 85 to 92	sync count
+ * 93 to 100	inst_fetch count
+ * 101 to 108	Active count
+ * 109 to 111	Exid
+ * 112		EndFlag (is always 1)
+ */
+struct drm_xe_eu_stall_data_xe2 {
+	__u64 ip_addr:29;
+	__u64 tdr_count:8;
+	__u64 other_count:8;
+	__u64 control_count:8;
+	__u64 pipestall_count:8;
+	__u64 send_count:8;
+	__u64 dist_acc_count:8;
+	__u64 sbid_count:8;
+	__u64 sync_count:8;
+	__u64 inst_fetch_count:8;
+	__u64 active_count:8;
+	__u64 ex_id:3;
+	__u64 end_flag:1;
+	__u64 unused_bits:15;
+	__u64 unused[6];
+} __packed;
+
+unsigned long
+xe_eu_stall_data_record_size(struct xe_device *xe)
+{
+	enum xe_platform platform = xe->info.platform;
+	unsigned long record_size = 0;
+
+	if (platform == XE_PVC)
+		record_size = sizeof(struct drm_xe_eu_stall_data_pvc);
+	else if ((platform == XE_LUNARLAKE) || (platform == XE_BATTLEMAGE))
+		record_size = sizeof(struct drm_xe_eu_stall_data_xe2);
+
+	return record_size;
+}
+
 /**
  * num_data_rows - Return the number of EU stall data rows of 64B each
  *		   for a given data size.
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
index ca83fe487278..834783775d11 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.h
+++ b/drivers/gpu/drm/xe/xe_eu_stall.h
@@ -55,4 +55,6 @@ void xe_eu_stall_fini(struct xe_gt *gt);
 int xe_eu_stall_stream_open(struct drm_device *dev,
 			    u64 data,
 			    struct drm_file *file);
+unsigned long
+xe_eu_stall_data_record_size(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 5093a243e9fe..c1816574c13c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -25,6 +25,7 @@
 #include "xe_mmio.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_eu_stall.h"
 
 static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
@@ -691,6 +692,34 @@ static int query_oa_units(struct xe_device *xe,
 	return ret ? -EFAULT : 0;
 }
 
+static int query_eu_stall_data(struct xe_device *xe,
+			       struct drm_xe_device_query *query)
+{
+	size_t size = sizeof(struct drm_xe_query_eu_stall_data);
+	void __user *query_ptr = u64_to_user_ptr(query->data);
+	struct drm_xe_query_eu_stall_data *info;
+	int ret;
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
+	info->capabilities = DRM_XE_EU_STALL_CAPS_BASE;
+	info->record_size = xe_eu_stall_data_record_size(xe);
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
@@ -702,6 +731,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_engine_cycles,
 	query_uc_fw_version,
 	query_oa_units,
+	query_eu_stall_data,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50ad6b2e1450..f1a0f06b61f4 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -700,6 +700,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
+#define DRM_XE_DEVICE_QUERY_EU_STALL_SAMPLING	9
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1738,6 +1739,25 @@ enum drm_xe_eu_stall_property_id {
 	DRM_XE_EU_STALL_PROP_GT_ID,
 };
 
+/**
+ * struct drm_xe_query_eu_stall_data - Information about EU stall data
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_EU_STALL_SAMPLING, then the reply uses
+ * struct drm_xe_query_eu_stall_data in .data.
+ */
+struct drm_xe_query_eu_stall_data {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @record_size: size of each EU stall data record */
+	__u64 record_size;
+
+	/** @capabilities: EU stall capabilities bit-mask */
+	__u64 capabilities;
+#define DRM_XE_EU_STALL_CAPS_BASE		(1 << 0)
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.45.1

