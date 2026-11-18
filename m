Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC1460A2619
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 15:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KjRyokv7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DD710FDE2;
	Wed, 18 Nov 2026 15:32:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D083910E544
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795015967; x=1826551967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ykKRbx2eECQjWecNodfkTO1bX4jbmbpF/qMleQRpXO8=;
 b=KjRyokv7U1o9UQJbXw41DeNOEsSwaGJpyLM1rVojakELQX0yeN+zO5aJ
 ol5XJTOD5h+8/Rwjrg2zdOaoU0BylbBEwZ35zqnLWD2eqsYfeYbHaNS9y
 67MH4i2nEVrT5na0hhah6rULZ9hPsH/4zycpfaOqbUCKfT1Yy4Gd3Eubq
 eqT8EgCRlv6SDOBqxys3qBs1WyJLXHAeAeBLfxkfh37WQtr7BOA2BXo+X
 LqjhUDhIJ9guagUiyW7HitduWwBB5utjkR7OaojpmZWQ4mN6o8eLIxh7V
 +Gfks0AbCGqnH+DA8FzGJ0We1LQBl7CyZ0jiSugsJSV2XNo4HE3/pW8za A==;
X-CSE-ConnectionGUID: g33q1I+cSoOfgvcD4eBZCg==
X-CSE-MsgGUID: vIc7EJkWT/+p/T/FNogq4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3832245"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3832245"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:32:41 -0800
X-CSE-ConnectionGUID: VVKPu+fCS02PbkDm5l+q7g==
X-CSE-MsgGUID: SWYiDfihTBuwpLasTJCuaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10079080"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 18 Nov 2026 07:32:40 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, stuart.summers@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/2] drm/xe/drm_ras: Protect against unplugged or wedged
 device
Date: Wed, 18 Nov 2026 21:01:34 +0530
Message-ID: <20261118153154.2024753-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118153154.2024753-1-raag.jadav@intel.com>
References: <20261118153154.2024753-1-raag.jadav@intel.com>
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

