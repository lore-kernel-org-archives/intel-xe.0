Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA5ED43FF9
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 09:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2443610E469;
	Mon, 18 Nov 2024 09:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idfeyxWs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9977710E45A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731920847; x=1763456847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Yeh48UabLApyo73Bgwli1mSKvzl8yuCrDkWTXf+7Do=;
 b=idfeyxWsOfNVjjqPC8if6EZXN96zfaJkwpd/N5w2dPQW31QKruF9X1m0
 haA5xJHFGZM7zlaLQR8/TkLNVPGZ1yON+6N2rkOCsKVkAmkou2K4y7rvb
 fJm0qYCVfZ96b9FZ4eNQ/n3DOpwJ/smmqtoRLyjvnfY0um3Z8YR63ugHf
 nDOyMZTYUitcl02vXMRuMM7CVxDvv5QvO3WT1yzPlQpCfWoBjEopSVpHN
 HcDqbfs760Lci3SmnPJKlklODEbtn7DXMGIZs24y2qtr4tWEmtlsC488q
 cW7X/uTkl97UVtbXQBIiCWCai33XffY+x7eZc7se6SaPX2cyki1QTSRQx g==;
X-CSE-ConnectionGUID: 7wspWvJeRSO/45a60xEYbQ==
X-CSE-MsgGUID: hubFdjRvS4Sfa+DmIVc7Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31242929"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31242929"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:07:25 -0800
X-CSE-ConnectionGUID: ZpSPooiAS6i/lPMgKnN/lg==
X-CSE-MsgGUID: QhdznBqaQXi62I1faLR+tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="126705161"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:07:25 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, jose.souza@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 6/7] drm/xe/query: Add a device query to get EU stall data
 information
Date: Mon, 18 Nov 2024 01:07:18 -0800
Message-ID: <15422210937f41e5a49f6f16c913f9d871ddbad7.1731919693.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1731919693.git.harish.chegondi@intel.com>
References: <cover.1731919693.git.harish.chegondi@intel.com>
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
DRM_XE_DEVICE_QUERY_EU_STALL. query data is returned in
a struct drm_xe_query_eu_stall.

Any capabilities in EU stall sampling as of this patch are considered
as base capabilities. Any new capabilities added later will need
a new capabilities flag.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c |  2 +-
 drivers/gpu/drm/xe/xe_eu_stall.h |  2 ++
 drivers/gpu/drm/xe/xe_query.c    | 30 ++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h        | 23 +++++++++++++++++++++++
 4 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 9169a31f620c..297b36910296 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -109,7 +109,7 @@ struct drm_xe_eu_stall_data_xe2 {
 	__u64 unused[6];
 } __packed;
 
-static unsigned long
+unsigned long
 xe_eu_stall_data_record_size(struct xe_device *xe)
 {
 	enum xe_platform platform = xe->info.platform;
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
index d9482e1b522b..48061778263b 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.h
+++ b/drivers/gpu/drm/xe/xe_eu_stall.h
@@ -53,4 +53,6 @@ void xe_eu_stall_fini(struct xe_gt *gt);
 int xe_eu_stall_stream_open(struct drm_device *dev,
 			    u64 data,
 			    struct drm_file *file);
+unsigned long
+xe_eu_stall_data_record_size(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 3eda616f1502..8c4f7f961dbe 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -26,6 +26,7 @@
 #include "xe_oa.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_eu_stall.h"
 
 static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
@@ -696,6 +697,34 @@ static int query_oa_units(struct xe_device *xe,
 	return ret ? -EFAULT : 0;
 }
 
+static int query_eu_stall_data(struct xe_device *xe,
+			       struct drm_xe_device_query *query)
+{
+	size_t size = sizeof(struct drm_xe_query_eu_stall);
+	void __user *query_ptr = u64_to_user_ptr(query->data);
+	struct drm_xe_query_eu_stall *info;
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
@@ -707,6 +736,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_engine_cycles,
 	query_uc_fw_version,
 	query_oa_units,
+	query_eu_stall_data,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 80aaa5b50c8a..8fffd05d2c7e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -700,6 +700,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
+#define DRM_XE_DEVICE_QUERY_EU_STALL		9
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1752,6 +1753,28 @@ enum drm_xe_eu_stall_property_id {
 	DRM_XE_EU_STALL_PROP_GT_ID,
 };
 
+/**
+ * struct drm_xe_query_eu_stall - Information about EU stall data
+ *
+ * If a query is made with a struct @drm_xe_device_query where .query
+ * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
+ * struct @drm_xe_query_eu_stall in .data.
+ */
+struct drm_xe_query_eu_stall {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @record_size: size of each EU stall data record */
+	__u64 record_size;
+
+	/** @capabilities: EU stall capabilities bit-mask */
+	__u64 capabilities;
+#define DRM_XE_EU_STALL_CAPS_BASE		(1 << 0)
+
+	/** @reserved: Reserved */
+	__u64 reserved[5];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.45.1

