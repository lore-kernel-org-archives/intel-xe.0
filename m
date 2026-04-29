Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B35FF8864
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 05:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8A310E566;
	Wed, 29 Apr 2026 05:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXeBFqU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BAC10EE56
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 05:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777439936; x=1808975936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HF7QImwdrBL4TmM8uWgvYv+DYzoEHj/czYUnqYstkDw=;
 b=CXeBFqU4FNmd6wt5o4sLUr/Nn2PydSP2HN6J6rGJRXqDGIKugln1DhPa
 11wOXSE8x0PXdE9Y/hxHbFnckVucEjvQ6ZZUjDV9dsf8UQ+CtnPJARt/C
 hsysu9ImxfHNDel9G3oMpmlEvo1UMKNgj2dWDLLhn/Y511zM9sZkRemOC
 NVqm/g4Okr/qboQZTZkM+NLZmN+Qchz6YOHTyAg48OXPqYwqXCMu7tcOr
 trT1MUuInNwYpYvsi3FVV1UC4woA8lpzmbzuPejN3Mfw5St5+4k97aWWY
 81/mRSxXulUwfb6BAwqMemgPZIq2+KZfpreMiKgz+rctlx0TVZTwBVLoZ A==;
X-CSE-ConnectionGUID: 6w54DUH+Q2Ozm62ygRIWIA==
X-CSE-MsgGUID: Wds9bO8WRMWa6Hqk/fDlMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82217518"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="82217518"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:18:56 -0700
X-CSE-ConnectionGUID: FkZjHPzDQjW1qWixlZZP1Q==
X-CSE-MsgGUID: BHT8BWSOTtmMSEvvlO51TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="239153874"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:18:53 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 4/6] drm/xe/xe_drm_ras: Wire get-error-counter and
 clear-error-counter support for CRI
Date: Wed, 29 Apr 2026 11:21:48 +0530
Message-ID: <20260429055147.1579576-12-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260429055147.1579576-8-riana.tauro@intel.com>
References: <20260429055147.1579576-8-riana.tauro@intel.com>
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

Hook CRI get-error-counter and clear-error-counter support to
xe_drm_ras to allow userspace to query and clear counters if supported.
When userspace requests for a drm_ras error counter, query the system
controller to get/clear the value.

Integrate this with xe_drm_ras.

Usage :

Query all error counter value using ynl

$ sudo ynl --family drm_ras --dump get-error-counter --json \
'{"node-id":0}'
[{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
 {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0},
 {'error-id': 3, 'error-name': 'device-memory', 'error-value': 0},
 {'error-id': 4, 'error-name': 'pcie', 'error-value': 0},
 {'error-id': 5, 'error-name': 'fabric', 'error-value': 0}]

Query single error counter value using ynl

$ sudo ynl --family drm_ras  --do get-error-counter --json \
'{"node-id":1, "error-id":1}'
{'error-id': 1, 'error-name': 'core-compute', 'error-value': 2}

Clear counter using ynl

$ sudo ynl --family drm_ras  --do clear-error-counter --json '\
{"node-id":1, "error-id":1}'
None

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: split patches (Raag)

v3: fix early return 
    align spacing in commit message (Raag)
    integrate clear counter with drm_ras
---
 drivers/gpu/drm/xe/xe_drm_ras.c | 39 +++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
index c21c8b428de6..e7bd3f09a762 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras.c
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -11,27 +11,46 @@
 
 #include "xe_device_types.h"
 #include "xe_drm_ras.h"
+#include "xe_ras.h"
 
 static const char * const error_components[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
 static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
 
-static int hw_query_error_counter(struct xe_drm_ras_counter *info,
+static int hw_query_error_counter(struct xe_device *xe,
+				  enum drm_xe_ras_error_severity severity,
 				  u32 error_id, const char **name, u32 *val)
 {
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[severity];
+
 	if (!info || !info[error_id].name)
 		return -ENOENT;
 
 	*name = info[error_id].name;
+
+	/* Fetch counter from system controller if supported */
+	if (xe->info.has_sysctrl)
+		return xe_ras_get_counter(xe, severity, error_id, val);
+
 	*val = atomic_read(&info[error_id].counter);
 
 	return 0;
 }
 
-static int hw_clear_error_counter(struct xe_drm_ras_counter *info, u32 error_id)
+static int hw_clear_error_counter(struct xe_device *xe,
+				  enum drm_xe_ras_error_severity severity,
+				  u32 error_id)
 {
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[severity];
+
 	if (!info || !info[error_id].name)
 		return -ENOENT;
 
+	/* Clear counter from system controller if supported */
+	if (xe->info.has_sysctrl)
+		return xe_ras_clear_counter(xe, severity, error_id);
+
 	atomic_set(&info[error_id].counter, 0);
 
 	return 0;
@@ -41,38 +60,30 @@ static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_
 					     const char **name, u32 *val)
 {
 	struct xe_device *xe = ep->priv;
-	struct xe_drm_ras *ras = &xe->ras;
-	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
 
-	return hw_query_error_counter(info, error_id, name, val);
+	return hw_query_error_counter(xe, DRM_XE_RAS_ERR_SEV_UNCORRECTABLE, error_id, name, val);
 }
 
 static int clear_uncorrectable_error_counter(struct drm_ras_node *node, u32 error_id)
 {
 	struct xe_device *xe = node->priv;
-	struct xe_drm_ras *ras = &xe->ras;
-	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
 
-	return hw_clear_error_counter(info, error_id);
+	return hw_clear_error_counter(xe, DRM_XE_RAS_ERR_SEV_UNCORRECTABLE, error_id);
 }
 
 static int query_correctable_error_counter(struct drm_ras_node *ep, u32 error_id,
 					   const char **name, u32 *val)
 {
 	struct xe_device *xe = ep->priv;
-	struct xe_drm_ras *ras = &xe->ras;
-	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
 
-	return hw_query_error_counter(info, error_id, name, val);
+	return hw_query_error_counter(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, name, val);
 }
 
 static int clear_correctable_error_counter(struct drm_ras_node *node, u32 error_id)
 {
 	struct xe_device *xe = node->priv;
-	struct xe_drm_ras *ras = &xe->ras;
-	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
 
-	return hw_clear_error_counter(info, error_id);
+	return hw_clear_error_counter(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id);
 }
 
 static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
-- 
2.47.1

