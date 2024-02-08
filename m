Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3350C48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 18:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE2110E9DF;
	Thu,  8 Feb 2024 18:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Swk8ir0M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D29210E9DF
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 18:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707417354; x=1738953354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jrdH9H0bcBrrfGazgzaKh/3qt174Lryb2jPa9zx3oak=;
 b=Swk8ir0M+PJKyVceWKfZcnleolJX7Mcz55JGmmSIJWt3koWFq3uVgzK3
 ktEU0Kq+HjTdOMV5GT7mKfzNre70OSpPoxA+c/qAgIFJfNriRWtITOlfK
 R+pKLw3J4moxdfBlfe96CNhmB0s4XoN9JjjI9rhEVErws/Y6R96C7GRda
 hRiHalwm+sDwzMjltT8MX4JoKDv70L66F5Yc1vRGtQ0SBYYziqKZPZfIz
 y4tAp8wzfvAicZNcNT+/CT8X5RAX1rIjHDwKx5qc4sWLIJRyTUvxhTxC4
 NUB4jfURFxtoC4cqDkvRUjBFx8l7/IZ2OB7g0Sk5cwG8bV3vYjlRbUKGQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="23764894"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="23764894"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:35:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="32798588"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:35:52 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Add uAPI to query GuC firmware submission
 version
Date: Thu,  8 Feb 2024 10:35:38 -0800
Message-ID: <20240208183539.185095-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Due to a bug in GuC firmware, Mesa can't enable by default the usage of
compute engines in DG2 and newer.

A new GuC firmware fixed the issue but until now there was no way
for Mesa to know if KMD was running with the fixed GuC version or not,
so this uAPI is required.

It may be expanded in future to query other firmware versions too.

This is querying XE_UC_FW_VER_COMPATIBILITY/submission version because
that is also supported by VFs, while XE_UC_FW_VER_RELEASE don't.

i915 uAPI: https://patchwork.freedesktop.org/series/129627/
Mesa usage: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233

v2:
- fixed drm_xe_query_uc_fw_version documentation
- moved branch_ver as the first version number

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 44 +++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 31 ++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 4f1ab91dbec58..92bb06c0586eb 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -516,6 +516,49 @@ static int query_gt_topology(struct xe_device *xe,
 	return 0;
 }
 
+static int
+query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
+{
+	struct drm_xe_query_uc_fw_version __user *query_ptr = u64_to_user_ptr(query->data);
+	size_t size = sizeof(struct drm_xe_query_uc_fw_version);
+	struct drm_xe_query_uc_fw_version resp;
+	struct xe_uc_fw_version *version = NULL;
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
+	case XE_QUERY_UC_TYPE_GUC_SUBMISSION: {
+		struct xe_guc *guc = &xe->tiles[0].primary_gt->uc.guc;
+
+		version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
+		break;
+	}
+	default:
+		return -EINVAL;
+	}
+
+	resp.branch_ver = 0;
+	resp.major_ver = version->major;
+	resp.minor_ver = version->minor;
+	resp.patch_ver = version->patch;
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
@@ -525,6 +568,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_hwconfig,
 	query_gt_topology,
 	query_engine_cycles,
+	query_uc_fw_version,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50bbea0992d9c..0819959a52227 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -574,6 +574,36 @@ struct drm_xe_query_engine_cycles {
 	__u64 cpu_delta;
 };
 
+/**
+ * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
+ *
+ * Given a uc_type this will return the branch, major, minor and patch version
+ * of the micro-controller firmware.
+ */
+struct drm_xe_query_uc_fw_version {
+	/** @uc_type: The micro-controller type to query firmware version */
+#define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
+	__u16 uc_type;
+
+	/** @pad: MBZ */
+	__u16 pad;
+
+	/** @branch_ver: branch uc fw version */
+	__u32 branch_ver;
+	/** @major_ver: major uc fw version */
+	__u32 major_ver;
+	/** @minor_ver: minor uc fw version */
+	__u32 minor_ver;
+	/** @patch_ver: patch uc fw version */
+	__u32 patch_ver;
+
+	/** @pad2: MBZ */
+	__u32 pad2;
+
+	/** @reserved: Reserved */
+	__u64 reserved;
+};
+
 /**
  * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
  * structure to query device information
@@ -643,6 +673,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
+#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 	/** @query: The type of data to query */
 	__u32 query;
 
-- 
2.43.0

