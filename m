Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CB8CD6E73
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 13:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8758410E515;
	Wed, 11 Oct 2023 13:59:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2136410E50D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 13:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032782; x=1728568782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4emEo42z1vzyOTb9kcm7uHBU0MuvcOPXI63e34O0Xc=;
 b=mrs+NjchbXJ+z9Er+0I4OpNtF0p2pyQL79RB/jACKlSHIb9ncNdX1liy
 htZMnhPmLBA6JlmT5GXhGdQoVWt4b348iCn6AIRpwnXDtYRtnkbjuGFNd
 aijsu0hCRUH48y0S/RNtj1OaqAHqbyyYON4/EvKigYTGyLBVJUldM85gd
 JqeYtLDYsQBJDbjD7bcInCd7ftpwNkbNPnA8cAjw/zoNrTOzMnXweR+lU
 lumXnch6GWMa7N09Nnu7OFLHZdai+2/V6sZryAi9xnuXKySHGpsxXZewK
 dYB2I1jk3BWAQN1oz7HK08N3mhRPbfW+GSQ3E2XsTogFJ4hCA1Hd59i63 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156211"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156211"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753829008"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753829008"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:40 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:13 +0000
Message-Id: <20231011135926.7-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 04/17] drm/xe: Add uAPI to query micro-controler
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

Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 41 +++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 31 ++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 10b9878ec95a..efbcf2ef436e 100644
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
+	if (XE_IOCTL_DBG(xe, resp.pad || resp.pad2 || resp.reserved))
+		return -EINVAL;
+
+	switch (resp.uc_type) {
+	case XE_QUERY_UC_TYPE_GUC: {
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
index 47d2d0468339..f7ca52aba79b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -466,6 +466,36 @@ struct drm_xe_query_topology_mask {
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
@@ -518,6 +548,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
+#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 	/** @query: The type of data to query */
 	__u32 query;
 
-- 
2.34.1

