Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E016BC3DA50
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9539F10EBE8;
	Fri, 12 Jul 2024 21:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BK/Blu3c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B5C10EB81
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720819769; x=1752355769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7w1I3mhdckz7YfRbzIqmpMEQ2ygKAl4zK9J19J40CNg=;
 b=BK/Blu3cHP+kqjvuLE6Cbb4B/4bnlwugyDmt/EzZvACPXUjoY5o/RE7h
 /3TND8vfD19m4Ja5NuE6rQYH84iRBgf60zZ6SoaFUr0SLGyBrbzUSIbjw
 WpcP97oLXlG62bFvTNJMlAtwjF1UxD/JkvTv/6+kxAKFZp9cX1s597dV7
 /DtpK0e9dQBSwx4TWmGIpzE9BiIXDVhH2yR0J1ZEOLJph8UcnZa/c9XQT
 CSFtGtit0WQ62j/qOf/SpCubPzg9hTN4xzCiDPEYuUktKUfXCswvAA98P
 7UpiZw5rioeCBY7WDxa3Iz3Hf0yei989LtC5L13IVwrwl33TWphBXEKVV g==;
X-CSE-ConnectionGUID: /okrn8wTTNCFuPlZoQWLhg==
X-CSE-MsgGUID: LypcKrDqRWS6JkeayaqXDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17990172"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="17990172"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:29 -0700
X-CSE-ConnectionGUID: LFQYx+WqQYGHNof0NmmxaQ==
X-CSE-MsgGUID: D5DYtShSRmixIK5Ajw/AYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="53864601"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:29 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [RFC 10/14] drm/xe/pxp: add a query for PXP status
Date: Fri, 12 Jul 2024 14:28:54 -0700
Message-ID: <20240712212901.2684239-11-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
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

PXP prerequisites (SW proxy and HuC auth via GSC) are completed
asynchronously from driver load, which means that userspace can start
submitting before we're ready to start a PXP session. Therefore, we need
a query that userspace can use to check not only if PXP is supported by
also to wait until the prerequisites are done.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c   | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp.h   |  1 +
 drivers/gpu/drm/xe/xe_query.c | 33 +++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 28 ++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index e979b47f155a..e39a47aeb050 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -60,6 +60,39 @@ static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
 	return ready;
 }
 
+/**
+ * xe_pxp_get_readiness_status - check whether PXP is ready for userspace use
+ * @pxp: the xe_pxp pointer (can be NULL if PXP is disabled)
+ *
+ * This function is used for status query from userspace, so the returned value
+ * follow the uapi (see drm_xe_query_pxp_status)
+ *
+ * Returns: 0 if PXP is not ready yet, 1 if it is ready, an errno value if PXP
+ * is not supported/enabled or if something went wrong in the initialization of
+ * the prerequisites.
+ */
+int xe_pxp_get_readiness_status(struct xe_pxp *pxp)
+{
+	int ret = 0;
+
+	if (!xe_pxp_is_enabled(pxp))
+		return -ENODEV;
+
+	/* if the GSC or HuC FW are in an error state, PXP will never work */
+	if (xe_uc_fw_status_to_error(pxp->gt->uc.huc.fw.status) ||
+	    xe_uc_fw_status_to_error(pxp->gt->uc.gsc.fw.status))
+		return -EIO;
+
+	xe_pm_runtime_get(pxp->xe);
+
+	/* PXP requires both HuC loaded and GSC proxy initialized */
+	if (pxp_prerequisites_done(pxp))
+		ret = 1;
+
+	xe_pm_runtime_put(pxp->xe);
+	return ret;
+}
+
 static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
 {
 	struct xe_gt *gt = pxp->gt;
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
index 8f0a3a514fb8..b2aae4abdd0e 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -14,6 +14,7 @@ struct xe_pxp;
 
 bool xe_pxp_is_supported(const struct xe_device *xe);
 bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
+int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
 
 int xe_pxp_init(struct xe_device *xe);
 void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 4e01df6b1b7a..5da9f403c2b9 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -22,6 +22,7 @@
 #include "xe_guc_hwconfig.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
+#include "xe_pxp.h"
 #include "xe_ttm_vram_mgr.h"
 
 static const u16 xe_to_user_engine_class[] = {
@@ -678,6 +679,37 @@ static int query_oa_units(struct xe_device *xe,
 	return ret ? -EFAULT : 0;
 }
 
+static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *query)
+{
+	struct drm_xe_query_pxp_status __user *query_ptr = u64_to_user_ptr(query->data);
+	size_t size = sizeof(struct drm_xe_query_pxp_status);
+	struct drm_xe_query_pxp_status resp;
+	int ret;
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
+	ret = xe_pxp_get_readiness_status(xe->pxp);
+	if (ret < 0)
+		return ret;
+
+	resp.status = ret;
+	resp.supported_session_types =
+		BIT(DRM_XE_PXP_TYPE_NONE) | BIT(DRM_XE_PXP_TYPE_HWDRM);
+
+	if (copy_to_user(query_ptr, &resp, size))
+		 return -EFAULT;
+
+	return 0;
+}
+
 static int (* const xe_query_funcs[])(struct xe_device *xe,
 				      struct drm_xe_device_query *query) = {
 	query_engines,
@@ -689,6 +721,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_engine_cycles,
 	query_uc_fw_version,
 	query_oa_units,
+	query_pxp_status,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 631fdc2ed493..746bc16bd220 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -619,6 +619,32 @@ struct drm_xe_query_uc_fw_version {
 	__u64 reserved;
 };
 
+/**
+ * struct drm_xe_query_pxp_status - query if PXP is ready
+ *
+ * If PXP is enabled and no fatal error as occurred, the status will be set to
+ * one of the following values:
+ * 0: PXP init still in progress
+ * 1: PXP init complete
+ *
+ * The supported session type bitmask is based on the values in
+ * enum drm_xe_pxp_session_type, including TYPE_NONE.
+ *
+ * If PXP is not enabled or something has gone wrong, the query will be failed
+ * with one of the following error codes:
+ * -ENODEV: PXP not supported or disabled;
+ * -EIO: fatal error occurred during init, so PXP will never be enabled;
+ * -EINVAL: incorrect value provided as part of the query;
+ * -EFAULT: error copying the memory between kernel and userspace.
+ */
+struct drm_xe_query_pxp_status {
+	/** @status: current PXP status */
+	__u32 status;
+
+	/** @supported_session_types: bitmask of supported PXP session types */
+	__u32 supported_session_types;
+};
+
 /**
  * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
  * structure to query device information
@@ -638,6 +664,7 @@ struct drm_xe_query_uc_fw_version {
  *    attributes.
  *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
  *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
+ *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
  *
  * If size is set to 0, the driver fills it with the required size for
  * the requested type of data to query. If size is equal to the required
@@ -690,6 +717,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
+#define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
 	/** @query: The type of data to query */
 	__u32 query;
 
-- 
2.43.0

