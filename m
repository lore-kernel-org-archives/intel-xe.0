Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CAFC79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 14:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4250010F4B8;
	Thu, 10 Sep 2026 14:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YP4rE20S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F012610F4B8
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789050388; x=1820586388;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NMQqVmyYPnvzsHmOTl0+I3sRni+N2GeQWZaNfHFWiF8=;
 b=YP4rE20Sj/iknRpO0t4TZ9Tda1Nz3Vpm1ShsxzurLQKudrWGnrnSxtqM
 d6vKHDKDOjKYJE2YCAnTnDHyMo8uMlRt2bApugRMCa+J4kwlovzyQocX6
 I4EKIL15qZOmPI0dThJS8Ma2EUdExic7AtVfTkzNHbI3GPWHPAGLx+CQM
 dW5lIY+fLcMBza6360y4+MrR1vJbNedcjx7BlxGs04ic6GiYQrR+Kpz7I
 1DLHQnlHN+lXOS00v4X1yycjilZYhEKH0EQRblqWG7B6sn9dUou858ocO
 idnO26iduRBZsmJRetrFQ1dZtqHf1Sd0gRdFtj3oKVV92tYfOK/kwl2zl Q==;
X-CSE-ConnectionGUID: wBib0Ho/QKqUXsn8EIzLOw==
X-CSE-MsgGUID: abZy8NXOQUq4x1IYL+j7vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89434587"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89434587"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 07:26:27 -0700
X-CSE-ConnectionGUID: KuCJJqQrQz+p7nr/zAvT+w==
X-CSE-MsgGUID: Jy7rhebbRaeiByMPwd8SOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="268367694"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 10 Sep 2026 07:26:26 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/ras: Fix sysctrl and drm-ras discrepancy
Date: Thu, 10 Sep 2026 19:55:50 +0530
Message-ID: <20260910142550.2373557-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

There are cases where a reported error is valid for sysctrl but it's
not exposed as a valid uapi through drm-ras. We allow such error to be
logged but it's redundant to try to send an error-event for it. Early
return such cases and prevent misleading drm-ras error-event failures.

Fixes: 6a9493e47075 ("drm/xe/xe_ras: Report correctable/uncorrectable error events to userspace")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Move sanity check to xe_drm_ras (Riana)
---
 drivers/gpu/drm/xe/xe_drm_ras.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
index 7f3695707611..5e6d4926d08e 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras.c
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -16,6 +16,17 @@
 static const char * const error_components[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
 static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
 
+static bool drm_ras_counter_is_valid(u32 severity, u32 component)
+{
+	if (!in_range(severity, DRM_XE_RAS_ERR_SEV_CORRECTABLE, DRM_XE_RAS_ERR_SEV_MAX))
+		return false;
+
+	if (!in_range(component, DRM_XE_RAS_ERR_COMP_CORE_COMPUTE, DRM_XE_RAS_ERR_COMP_MAX - 1))
+		return false;
+
+	return true;
+}
+
 static int query_error_counter(struct xe_device *xe,
 			       enum drm_xe_ras_error_severity severity,
 			       u32 error_id, const char **name, u32 *val)
@@ -239,6 +250,9 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
 	if (!xe->info.has_drm_ras)
 		return;
 
+	if (!drm_ras_counter_is_valid(severity, component))
+		return;
+
 	node = &ras->node[severity];
 
 	if (!info || !info[component].name)
-- 
2.43.0

