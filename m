Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871AEC0018A
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5561510E9F9;
	Fri,  3 Nov 2023 14:35:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41F610E9F9
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022115; x=1730558115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zitX3tizeKU6AzELLJ2j1B6yH9JWgAnVyRVhk+tm5Uc=;
 b=LkXH5ZkG0K0T56DepLYSGeFHe5cZ6ZHGV2NTVugODaAWSMyOX15NLGYJ
 Ko2Bi9EIQ9/V//02e88pxH3BdVXLL+KH4b3n8pyE23KtGygJ85jHpCpXe
 DyC5bIaxTJEyw6js3ImIqrMI/R9d+may56FeCLFwvtjX4xdqdjJ+OvZJN
 llKveYwPRuR1a0vIBqCoPtenSzHTRkpqe5oASYdcswjXmVeGWO8kC3E7E
 EYI+WhtP4xIGIEjDoWAi8caII8z823wnpkZzRH+7J2yjSj7rJz7tdddtD
 a92wZalybQyah/xNDR1WTzcNn3p+uc12rS+DcwovQs50lh5ZObIvXH4xV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843338"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843338"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832407"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832407"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:14 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:10 +0000
Message-Id: <20231103143456.7-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/50] drm/xe: Add uAPI to query
 micro-controler firmware version
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: José Roberto de Souza <jose.souza@intel.com>

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

v3:
- add braces around case XE_QUERY_UC_TYPE_GUC to make CI happy

v4:
- squashed commits
- make it very clear and documented that it is about the submission
  version, and also what that actually means.

Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 41 +++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 43 +++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 10b9878ec95a..063f9bf071a3 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -498,6 +498,46 @@ static int query_gt_topology(struct xe_device *xe,
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
+	if (XE_IOCTL_DBG(xe, resp.reserved || resp.pad2 || resp.reserved2))
+		return -EINVAL;
+
+	switch (resp.uc_type) {
+	case DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION: {
+		struct xe_guc *guc = &xe->tiles[0].primary_gt->uc.guc;
+
+		resp.major_ver = guc->submission_state.version.major;
+		resp.minor_ver = guc->submission_state.version.minor;
+		resp.patch_ver = guc->submission_state.version.patch;
+		resp.branch_ver = 0;
+		break;
+	}
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
@@ -507,6 +547,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_hwconfig,
 	query_gt_topology,
 	query_engine_cycles,
+	query_uc_fw_version,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index edbc58a4769c..2246a686672b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -466,6 +466,48 @@ struct drm_xe_query_topology_mask {
 	__u8 mask[];
 };
 
+/**
+ * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
+ *
+ * Given a uc_type this will return the major, minor, patch and branch version
+ * of the micro-controller firmware.
+ *
+ * The @uc_type can be:
+ *  - %DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION - This is the GuC Submission Version,
+ * a.k.a 'VF version'. It is not the actual GuC blob version. A running GuC can
+ * support multiple VF APIs with different Submission Versions. This version is
+ * negotiated by the VF KMD with GuC during VF initialization. In most of the
+ * current available GuC blobs, this is a 1-1 relationship where the Submission
+ * version could be inferred from the running version and vice-versa. However,
+ * the submission version is the most useful information for the user space
+ * perspective and needs.
+ *  - %DRM_XE_QUERY_TYPE_HUC - The actual HuC blob that is currently running
+ * in the platform. It returns 0 when HuC is not currently loaded.
+ */
+struct drm_xe_query_uc_fw_version {
+	/** @uc_type: The micro-controller type to query firmware version */
+#define DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION	0
+	__u16 uc_type;
+
+	/** @reserved: Reserved */
+	__u16 reserved;
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
+	/** @reserved2: Reserved */
+	__u64 reserved2;
+};
+
 /**
  * struct drm_xe_device_query - main structure to query device information
  *
@@ -518,6 +560,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
+#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 	/** @query: The type of data to query */
 	__u32 query;
 
-- 
2.34.1

