Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9049C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8D610E8D8;
	Thu,  9 Nov 2023 15:46:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586F310E8DA
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544717; x=1731080717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jqUg0Km9m0szQYPPIB1BDbOmYIV+tOVGeuSPwKY61bg=;
 b=JBtOPBqyVmC5BHyGXiaisCfC6emFezx6+1p0zFdec2A8his1nXS0ojfq
 iKZD0hlUYL3LW4iE2a82vPCTKieeoxPt2H/QZxT0bKOlTTZWxYBXd2A1e
 war8Fvdzs+YBOY1p9h3GMzK6yRBeVeEwwuX7uHMaNykRrsgSsWXni7OyO
 KAqogZperzQIEUUjBNvQJg7U6yc9jo51p6kGv6Mpw5zVFtqV3biu52B/J
 t6QNsiiAvLMqjZ4OMZ8tXXxhUWVrjLYQGbTInUYnZvkhdKWgud/VFhCdf
 RXJ3OGupqlsgEuV5+UzVIIwEkchfQZ9P6erVilvH0Tfff1mZmk2vA+f0P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556617"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556617"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936885969"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936885969"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:14 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:17 +0000
Message-Id: <20231109154457.7-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 03/43] drm/xe: Add uAPI to query
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

More information:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661
Mesa usage:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233

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
index edbc58a4769c..169ae928802b 100644
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
+	/** @major_ver: major uc fw version */
+	__u32 major_ver;
+	/** @minor_ver: minor uc fw version */
+	__u32 minor_ver;
+	/** @patch_ver: patch uc fw version */
+	__u32 patch_ver;
+	/** @branch_ver: branch uc fw version */
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

