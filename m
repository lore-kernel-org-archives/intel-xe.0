Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3866D606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vfdz3qju
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC76112223;
	Thu, 19 Nov 2026 09:52:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFDB112223
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 09:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795081936; x=1826617936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ykKRbx2eECQjWecNodfkTO1bX4jbmbpF/qMleQRpXO8=;
 b=Vfdz3qjunKlt4/ZseLrvY2QmaDendv2Th+IxOtZ5w8cWhz+T6Rb3ZzPt
 xu5kLnsZMdY/IeomWkfM7ch4bsLw9UiOMIFBu5EDSW7ExDAFcpDdQuqP+
 xZvuGJWW4XMcEBciJTsIeStEEU2Heywvw5z6rp7Ki29MmS9ZqqDGDtyKK
 eO74a9sibPGsHQqTgL9kOUowe5ELDeq7KlLKRVJclcXAK7A8FUciT466F
 E9IeUppfUXPsjUfS0/g0me5XM6/boUyY4l6DpIVpQhLGmgMQnhbkNg4vw
 QiJIZf/vR+suQy35T77HcdL/aE2x3LBATVR4S8x5NHRzSpFhPxS1E4c7X A==;
X-CSE-ConnectionGUID: xgQBP5ADR866NCnnk2jvKQ==
X-CSE-MsgGUID: e2pxzgHaRby8MoSwH+daLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="4004856"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="4004856"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 01:52:15 -0800
X-CSE-ConnectionGUID: FUQIIAysQ4yCXcMKK+vneA==
X-CSE-MsgGUID: QGEncq+uRHujHa3GoKHaZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10749160"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2026 01:52:14 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, stuart.summers@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 1/2] drm/xe/drm_ras: Protect against unplugged or wedged
 device
Date: Thu, 19 Nov 2026 15:21:30 +0530
Message-ID: <20261119095151.2041411-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119095151.2041411-1-raag.jadav@intel.com>
References: <20261119095151.2041411-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Xe driver exposes drm_ras counters to userspace through netlink interface,
which the user can access during the device lifetime. But this should not
be done in case of unplugged or wedged device. Protect against such cases.

Fixes: b40db12b542f ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
v2: Allow counter access with XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET (Riana)
---
 drivers/gpu/drm/xe/xe_drm_ras.c | 93 ++++++++++++++++++++++++---------
 1 file changed, 69 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
index 7554803aae11..3ca6c82345dd 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras.c
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitmap.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/drm_ras.h>
@@ -12,10 +13,33 @@
 #include "xe_device_types.h"
 #include "xe_drm_ras.h"
 #include "xe_ras.h"
+#include "xe_wedge.h"
 
 static const char * const error_components[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
 static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
 
+static int drm_ras_counter_get(struct xe_device *xe, struct xe_drm_ras_counter *info,
+			       u32 error_id, int *idx)
+{
+	if (xe_wedged(xe) && xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+		return -ECANCELED;
+
+	if (!info || !info[error_id].name)
+		return -ENOENT;
+
+	/* Must be last */
+	if (!drm_dev_enter(&xe->drm, idx))
+		return -ENODEV;
+
+	return 0;
+}
+
+static void drm_ras_counter_put(int idx)
+{
+	/* Pair with drm_ras_counter_get() */
+	drm_dev_exit(idx);
+}
+
 static bool drm_ras_counter_is_valid(u32 severity, u32 component)
 {
 	if (!in_range(severity, DRM_XE_RAS_ERR_SEV_CORRECTABLE, DRM_XE_RAS_ERR_SEV_MAX))
@@ -33,19 +57,23 @@ static int query_error_counter(struct xe_device *xe,
 {
 	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info = ras->info[severity];
+	int idx, ret;
 
-	if (!info || !info[error_id].name)
-		return -ENOENT;
-
-	*name = info[error_id].name;
+	ret = drm_ras_counter_get(xe, info, error_id, &idx);
+	if (ret)
+		return ret;
 
 	/* Fetch counter from system controller if supported */
 	if (xe->info.has_sysctrl)
-		return xe_ras_get_counter(xe, severity, error_id, val);
+		ret = xe_ras_get_counter(xe, severity, error_id, val);
+	else
+		*val = atomic_read(&info[error_id].counter);
 
-	*val = atomic_read(&info[error_id].counter);
+	if (!ret)
+		*name = info[error_id].name;
 
-	return 0;
+	drm_ras_counter_put(idx);
+	return ret;
 }
 
 static int clear_error_counter(struct xe_device *xe,
@@ -54,17 +82,20 @@ static int clear_error_counter(struct xe_device *xe,
 {
 	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info = ras->info[severity];
+	int idx, ret;
 
-	if (!info || !info[error_id].name)
-		return -ENOENT;
+	ret = drm_ras_counter_get(xe, info, error_id, &idx);
+	if (ret)
+		return ret;
 
 	/* Clear counter from system controller if supported */
 	if (xe->info.has_sysctrl)
-		return xe_ras_clear_counter(xe, severity, error_id);
+		ret = xe_ras_clear_counter(xe, severity, error_id);
+	else
+		atomic_set(&info[error_id].counter, 0);
 
-	atomic_set(&info[error_id].counter, 0);
-
-	return 0;
+	drm_ras_counter_put(idx);
+	return ret;
 }
 
 static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_id,
@@ -103,15 +134,21 @@ static int query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
 	struct xe_device *xe = ep->priv;
 	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
-
-	if (!info || !info[error_id].name)
-		return -ENOENT;
+	int idx, ret;
 
 	if (!xe->info.has_sysctrl)
 		return -EOPNOTSUPP;
 
-	*name = info[error_id].name;
-	return xe_ras_get_threshold(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
+	ret = drm_ras_counter_get(xe, info, error_id, &idx);
+	if (ret)
+		return ret;
+
+	ret = xe_ras_get_threshold(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
+	if (!ret)
+		*name = info[error_id].name;
+
+	drm_ras_counter_put(idx);
+	return ret;
 }
 
 static int set_correctable_error_threshold(struct drm_ras_node *ep, u32 error_id, u32 threshold)
@@ -119,14 +156,19 @@ static int set_correctable_error_threshold(struct drm_ras_node *ep, u32 error_id
 	struct xe_device *xe = ep->priv;
 	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
-
-	if (!info || !info[error_id].name)
-		return -ENOENT;
+	int idx, ret;
 
 	if (!xe->info.has_sysctrl)
 		return -EOPNOTSUPP;
 
-	return xe_ras_set_threshold(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
+	ret = drm_ras_counter_get(xe, info, error_id, &idx);
+	if (ret)
+		return ret;
+
+	ret = xe_ras_set_threshold(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
+
+	drm_ras_counter_put(idx);
+	return ret;
 }
 
 static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
@@ -244,7 +286,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
 	struct xe_drm_ras *ras = &xe->ras.nl_data;
 	struct xe_drm_ras_counter *info;
 	struct drm_ras_node *node;
-	int ret;
+	int idx, ret;
 
 	/* Event is supported only if drm-ras is enabled */
 	if (!xe->info.has_drm_ras)
@@ -256,13 +298,16 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
 	node = &ras->node[severity];
 	info = ras->info[severity];
 
-	if (!info || !info[component].name)
+	ret = drm_ras_counter_get(xe, info, component, &idx);
+	if (ret)
 		return;
 
 	ret = drm_ras_nl_error_event(node, component, info[component].name, value);
 	if (ret)
 		drm_err_ratelimited(&xe->drm, "drm-ras error-event failed: %d for %s %s\n", ret,
 				    info[component].name, error_severity[severity]);
+
+	drm_ras_counter_put(idx);
 }
 
 /**
-- 
2.43.0

