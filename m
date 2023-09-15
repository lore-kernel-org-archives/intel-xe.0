Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE88CEE3F2F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 14:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9263810E640;
	Fri, 15 Sep 2023 14:40:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0A110E63D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694788841; x=1726324841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6rxQpS/jZOIjW8QP/Atgd9piKXb1B3lJMHzMlvmgo1w=;
 b=L3r1E9XWA739LYCUvhilU0mj09OAkUXSstnHLFdgseN07mKtGwau66Zg
 gYDJmvw+QSeI8S5y1BsN5C8/7uBsd0AquZ52NHFIjTCQAJ3WwmEZBFUt0
 jJlO7xNTnmieHtVbcyYHJ+5vwGHj2E2C5lmPkIRPQ/KdarAe5Se/Wsd8f
 YLUzBGfooiuaLJH3rCYeHvnV/coMJWlbNCdmfsTA2iQpECdVDZWOdyd0D
 ugka/gOvFWF3WSIF+Oc8EwhiTDwOF28bGmLg2QNWRv6bXbB/43q8AKeMg
 H0siDu7ymz9Pjxko9ATnOHV+nrF77TqGm0MOYA1OnTe8K3v/9EiOCcvUK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="369578373"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="369578373"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 07:40:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="721703580"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="721703580"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 07:40:06 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 07:39:58 -0700
Message-ID: <20230915143958.37222-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Add uAPI to query micro-controler
 firmware version
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

Due to a bug in GuC firmware, Mesa can't enable by default the usage of
compute engines in DG2 and newer.

A new GuC firmware fixed the issue but until now there was no way
for Mesa to know if KMD was running with the fixed GuC version or not,
so this uAPI is required.

It may be expanded in future to query other firmware versions too.

More information: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661
Mesa usage: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233

v2:
- changed to submission version
- added branch version to be future proof
- checking if pads and reserved are zero

Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 40 ++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 43 ++++++++++++++++++++++++++++++-----
 2 files changed, 77 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a951205100fea..e21227c1664d1 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -361,6 +361,45 @@ static int query_gt_topology(struct xe_device *xe,
 	return 0;
 }
 
+static int
+query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
+{
+	struct drm_xe_query_uc_fw_version __user *query_ptr = u64_to_user_ptr(query->data);
+	size_t size = sizeof(struct drm_xe_query_uc_fw_version);
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
+	if (XE_IOCTL_DBG(xe, resp.pad || resp.pad2 || resp.reserved))
+		return -EINVAL;
+
+	switch (resp.uc_type) {
+	case XE_QUERY_UC_TYPE_GUC:
+		struct xe_guc *guc = &xe->tiles[0].primary_gt->uc.guc;
+
+		resp.major_ver = guc->submission_state.version.major;
+		resp.minor_ver = guc->submission_state.version.minor;
+		resp.patch_ver = guc->submission_state.version.patch;
+		resp.branch_ver = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (copy_to_user(query_ptr, &resp, size))
+		return -EFAULT;
+
+	return 0;
+}
+
 static int (* const xe_query_funcs[])(struct xe_device *xe,
 				      struct drm_xe_device_query *query) = {
 	query_engines,
@@ -369,6 +408,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_gts,
 	query_hwconfig,
 	query_gt_topology,
+	query_uc_fw_version,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 00d5cb4ef85e7..ec23ce3548b0b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -346,6 +346,36 @@ struct drm_xe_query_topology_mask {
 	__u8 mask[];
 };
 
+/**
+ * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
+ *
+ * Given a uc_type this will return the major, minor, patch and branch version
+ * of the micro-controller firmware.
+ */
+struct drm_xe_query_uc_fw_version {
+	/** @uc: The micro-controller type to query firmware version */
+#define XE_QUERY_UC_TYPE_GUC 0
+	__u16 uc_type;
+
+	/** @pad: MBZ */
+	__u16 pad;
+
+	/* @major_ver: major uc fw version */
+	__u32 major_ver;
+	/* @minor_ver: minor uc fw version */
+	__u32 minor_ver;
+	/* @patch_ver: patch uc fw version */
+	__u32 patch_ver;
+	/* @branch_ver: branch uc fw version */
+	__u32 branch_ver;
+
+	/** @pad2: MBZ */
+	__u32 pad2;
+
+	/** @reserved: Reserved */
+	__u64 reserved;
+};
+
 /**
  * struct drm_xe_device_query - main structure to query device information
  *
@@ -385,12 +415,13 @@ struct drm_xe_device_query {
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

