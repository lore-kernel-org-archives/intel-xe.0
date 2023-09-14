Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B329EEEAA71
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 20:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B4210E2B3;
	Thu, 14 Sep 2023 20:35:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F5310E2B3
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 20:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694723715; x=1726259715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kBe3oTdyR+XfCa/P9sXL8a7mz4yNFDPOrjuopEjPf+s=;
 b=BuuMq6N5TH3ueZN6hvX4TysCJ/gMrSRfJ7raLjalw58Dp//sGF0pB9th
 ok0l86B9LiE795SgqA9HqqPpvwI4w5D8AMxHbwB3oR6RPDnbY+jPQyfXR
 6ezhkWJm3jodvixEqrM0qk/OO4PIBXIG9JMlvDyL9VOSlZoxvU5doLPhE
 dSzl+ON2fvEsIyqiN8EoXZ7aDqJXPM9wXSQDj7JG39lO6xRo5Fz7w+9+g
 NbbHgCgPZtSQR0aq8vFr01W+00NVZT7zGEVgP6F64aOd9wpNss6ERq2jl
 lUHBh64kclNjDiua8to6lQt5PkyF9m803i8MvKvWJaJiLzkpGULhZSLZd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381785207"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="381785207"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 13:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744682013"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="744682013"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 13:34:28 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 13:34:19 -0700
Message-ID: <20230914203419.111424-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] xe: Add a uAPI to query micro-controler firmware
 version
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

Due to a bug in firmware Mesa can't enable by default usage of compute
engines in DG2.

A new GuC firmware fixed the issue but until know there was no way
for Mesa to know if user was running with the fixed version or not,
so this uAPI is required.

I may be expanded in future to query other firmware versions.

More information: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 35 ++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 36 +++++++++++++++++++++++++++++------
 2 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a951205100fea..360dda9ba1d1d 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -361,6 +361,40 @@ static int query_gt_topology(struct xe_device *xe,
 	return 0;
 }
 
+static int
+query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
+{
+	size_t size = sizeof(struct drm_xe_query_uc_fw_version);
+	struct drm_xe_query_uc_fw_version __user *query_ptr = u64_to_user_ptr(query->data);
+	struct drm_xe_query_uc_fw_version resp;
+
+	if (query->size == 0) {
+		query->size = size;
+		return 0;
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
+		return -EINVAL;
+	}
+
+	if (copy_from_user(&resp, query_ptr, size))
+		return -EFAULT;
+
+	switch (resp.uc_type) {
+	case XE_QUERY_UC_TYPE_GUC:
+		resp.major_ver = xe->tiles[0].primary_gt->uc.guc.fw.major_ver_found;
+		resp.minor_ver = xe->tiles[0].primary_gt->uc.guc.fw.minor_ver_found;
+		resp.patch_ver = xe->tiles[0].primary_gt->uc.guc.fw.patch_ver_found;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (copy_to_user(query_ptr, &resp, size)) {
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
 static int (* const xe_query_funcs[])(struct xe_device *xe,
 				      struct drm_xe_device_query *query) = {
 	query_engines,
@@ -369,6 +403,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_gts,
 	query_hwconfig,
 	query_gt_topology,
+	query_uc_fw_version,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 00d5cb4ef85e7..0f5bf5b1874ab 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -346,6 +346,29 @@ struct drm_xe_query_topology_mask {
 	__u8 mask[];
 };
 
+/**
+ * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
+ *
+ * Given a uc_type this will return the major, minor and patch version of the
+ * micro-controller firmware.
+ */
+struct drm_xe_query_uc_fw_version {
+	/** @uc: The micro-controller type to query firmware version */
+#define XE_QUERY_UC_TYPE_GUC 0
+	__u16 uc_type;
+	__u16 pad;
+
+	/* @major_ver: major uc fw version */
+	__u32 major_ver;
+	/* @minor_ver: minor uc fw version */
+	__u32 minor_ver;
+	/* @patch_ver: patch uc fw version */
+	__u32 patch_ver;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 /**
  * struct drm_xe_device_query - main structure to query device information
  *
@@ -385,12 +408,13 @@ struct drm_xe_device_query {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_DEVICE_QUERY_ENGINES	0
-#define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
-#define DRM_XE_DEVICE_QUERY_CONFIG	2
-#define DRM_XE_DEVICE_QUERY_GTS		3
-#define DRM_XE_DEVICE_QUERY_HWCONFIG	4
-#define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
+#define DRM_XE_DEVICE_QUERY_ENGINES		0
+#define DRM_XE_DEVICE_QUERY_MEM_USAGE		1
+#define DRM_XE_DEVICE_QUERY_CONFIG		2
+#define DRM_XE_DEVICE_QUERY_GTS			3
+#define DRM_XE_DEVICE_QUERY_HWCONFIG		4
+#define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
+#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	6
 	/** @query: The type of data to query */
 	__u32 query;
 
-- 
2.42.0

