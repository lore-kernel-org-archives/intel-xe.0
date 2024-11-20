Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0415D743F7
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE6B10E3F5;
	Wed, 20 Nov 2024 23:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Koiuf0U5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3868310E183
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 23:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732146249; x=1763682249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0c4/knMHBqMmsIE3qtcA7bWsAypP09JpehPx6evJMYA=;
 b=Koiuf0U5tNT3pXu/R+iyqYSXXvySU2j3BO40Oe3CiM8+epOWvv1Ob+Aj
 0MOewGeVNz4T0eYGn/P/N+kT5gteR6XU+st3o/COPzYRz4XJ3N7AXnxSE
 2KKGcxU54/dNytrEZLyvDHdLNlDOTflmx/3ePqRxg02x8CDpV1tIcC61p
 CgnU4mKuabEln7OE1fVNu5Q6WcFxNq5EGxdRPdCd6rzscFa5ppQWgiFJN
 mi230GEvht6FSPB9H+/TlnmKpzTOk2MozUZASFF0i9fZwvrqJqe9g9B8f
 XfMPEBi4wLDQYXt0Sl98+mzZ2jwykv2eWoGRgVkBCGYkUf4H7qXY8NoLO w==;
X-CSE-ConnectionGUID: 4St4EviISiqqJr+wUWX3TA==
X-CSE-MsgGUID: jZXnkIeWQwSZnsX8AnNWuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54733283"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="54733283"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:09 -0800
X-CSE-ConnectionGUID: zHqPutVHT3a77BpskisDVw==
X-CSE-MsgGUID: 8T6U9gk3Tj2XkLsKTGwq6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90453656"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:08 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 08/12] drm/xe/pxp: add a query for PXP status
Date: Wed, 20 Nov 2024 15:43:48 -0800
Message-ID: <20241120234353.1037180-9-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
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

PXP prerequisites (SW proxy and HuC auth via GSC) are completed
asynchronously from driver load, which means that userspace can start
submitting before we're ready to start a PXP session. Therefore, we need
a query that userspace can use to check not only if PXP is supported but
also to wait until the prerequisites are done.

v2: Improve doc, do not report TYPE_NONE as supported (José)
v3: Better comments, remove unneeded copy_from_user (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c   | 32 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp.h   |  1 +
 drivers/gpu/drm/xe/xe_query.c | 29 +++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index ce1d7ab448dc..fe56e3eec5a7 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -71,6 +71,38 @@ static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
 	return ready;
 }
 
+/**
+ * xe_pxp_get_readiness_status - check whether PXP is ready for userspace use
+ * @pxp: the xe_pxp pointer (can be NULL if PXP is disabled)
+ *
+ * Returns: 0 if PXP is not ready yet, 1 if it is ready, a negative errno value
+ * if PXP is not supported/enabled or if something went wrong in the
+ * initialization of the prerequisites. Note that the return values of this
+ * function follow the uapi (see drm_xe_query_pxp_status), so they can be used
+ * directly in the query ioctl.
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
index 2e0ab186072a..868813cc84b9 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -14,6 +14,7 @@ struct xe_pxp;
 
 bool xe_pxp_is_supported(const struct xe_device *xe);
 bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
+int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
 
 int xe_pxp_init(struct xe_device *xe);
 void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 3eda616f1502..28d3b98c0fd9 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -24,6 +24,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
+#include "xe_pxp.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
 
@@ -696,6 +697,33 @@ static int query_oa_units(struct xe_device *xe,
 	return ret ? -EFAULT : 0;
 }
 
+static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *query)
+{
+	struct drm_xe_query_pxp_status __user *query_ptr = u64_to_user_ptr(query->data);
+	size_t size = sizeof(struct drm_xe_query_pxp_status);
+	struct drm_xe_query_pxp_status resp = { 0 };
+	int ret;
+
+	if (query->size == 0) {
+		query->size = size;
+		return 0;
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
+		return -EINVAL;
+	}
+
+	ret = xe_pxp_get_readiness_status(xe->pxp);
+	if (ret < 0)
+		return ret;
+
+	resp.status = ret;
+	resp.supported_session_types = BIT(DRM_XE_PXP_TYPE_HWDRM);
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
@@ -707,6 +735,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_engine_cycles,
 	query_uc_fw_version,
 	query_oa_units,
+	query_pxp_status,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ae6313b8438a..8249870a171a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -629,6 +629,39 @@ struct drm_xe_query_uc_fw_version {
 	__u64 reserved;
 };
 
+/**
+ * struct drm_xe_query_pxp_status - query if PXP is ready
+ *
+ * If PXP is enabled and no fatal error has occurred, the status will be set to
+ * one of the following values:
+ * 0: PXP init still in progress
+ * 1: PXP init complete
+ *
+ * If PXP is not enabled or something has gone wrong, the query will be failed
+ * with one of the following error codes:
+ * -ENODEV: PXP not supported or disabled;
+ * -EIO: fatal error occurred during init, so PXP will never be enabled;
+ * -EINVAL: incorrect value provided as part of the query;
+ * -EFAULT: error copying the memory between kernel and userspace.
+ *
+ * The status can only be 0 in the first few seconds after driver load. If
+ * everything works as expected, the status will transition to init complete in
+ * less than 1 second, while in case of errors the driver might take longer to
+ * start returning an error code, but it should still take less than 10 seconds.
+ *
+ * The supported session type bitmask is based on the values in
+ * enum drm_xe_pxp_session_type. TYPE_NONE is always supported and therefore
+ * is not reported in the bitmask.
+ *
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
@@ -648,6 +681,7 @@ struct drm_xe_query_uc_fw_version {
  *    attributes.
  *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
  *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
+ *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
  *
  * If size is set to 0, the driver fills it with the required size for
  * the requested type of data to query. If size is equal to the required
@@ -700,6 +734,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
+#define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
 	/** @query: The type of data to query */
 	__u32 query;
 
-- 
2.43.0

