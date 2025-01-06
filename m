Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B162FE7719A
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 21:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AC510EA23;
	Mon,  6 Jan 2025 21:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ky23wHqU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764D210EA21
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 21:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736197957; x=1767733957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0iJFwfhvsNUquxEuXX/WrwWNEW5C0CkS1YlUp0o4zQs=;
 b=ky23wHqU1gPbLjaf8odvP3L27hdPo+SBrvyDdhRD3VfaOVLumUFlHez2
 qVS+XZ1+DVJI3Z2O/2kVlc8d2Elhif+oIOdmRg+gyRM8HDVuC3o8VNMHO
 bYiduxwELAy/VKL0d23ezcyGTI0qiUcZ7MehHPfzG2on71zDN5uO94vAJ
 GqRX3gM8H05C33SuLr+Eskpdc28e4Ap43M/nsbHYwZirSykHkc4nq07F0
 GALC/66MEzEoRcvddyiii3FFb+BJpNU+8H0pFSwUb34+vvlmTgJBtAWhs
 /djUJAhI1l/rxb3+heR3jDi+anGGyBK/TXAobBynoq5/AdjEvAanMjsc+ g==;
X-CSE-ConnectionGUID: dg/H5r7CRY+PGQy2s3swLQ==
X-CSE-MsgGUID: 3iIg7ZI6SVCkiaYPcD1MmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="61734938"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="61734938"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 13:12:37 -0800
X-CSE-ConnectionGUID: I+NdvQGSTeuT643R9XweOw==
X-CSE-MsgGUID: 6V3COzMVTomPYsD57NA+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="107417838"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 13:12:37 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 09/13] drm/xe/pxp: Add a query for PXP status
Date: Mon,  6 Jan 2025 13:12:06 -0800
Message-ID: <20250106211212.3418231-10-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
References: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
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
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c   | 32 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp.h   |  1 +
 drivers/gpu/drm/xe/xe_query.c | 29 +++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h     | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 05ed2e71be63..d46b2c0a06ae 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -80,6 +80,38 @@ static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
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
index c059639613f7..042f87a688e7 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -24,6 +24,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
+#include "xe_pxp.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
 
@@ -698,6 +699,33 @@ static int query_oa_units(struct xe_device *xe,
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
@@ -709,6 +737,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_engine_cycles,
 	query_uc_fw_version,
 	query_oa_units,
+	query_pxp_status,
 };
 
 int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 5c97a758266d..9d1ed07b3130 100644
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

