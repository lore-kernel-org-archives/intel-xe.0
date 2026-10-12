Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93577CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 10:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4207D10E419;
	Mon, 12 Oct 2026 10:17:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAEC10E54E
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791800250; x=1823336250;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SfR5XAcdiPt+uAWL4LaQImZeShTC0vZ0sYXHx8UZPjU=;
 b=eoyl7TrDcj2qfQa+sRgx2gKz8qTwLUd0/DKpMb2gkZ5SQtRbZBQiKClm
 Bj8ZvBcgDMgSzobMsnoRzKvf4lebjQKsCqe6JrClM7B4Gv21DWS5HPdjy
 cAM5JgjZ0oYBiHSUEDAkw8L+PswdGeVvcYrNh0DwqnHKoBrd54numjxBe
 swlsJyd0w3sEKSsxeS+poz8EhFUZ6sOFQlwvNdG0+wD1gYJ68fIxVyoPi
 EdAuNQdt3HTPaaA1c34bFCFaTwps9cVpjd3/nE8ZIbSWS3S3cy3RqnURH
 2XUb0wF0VLvyTZF4YsQHy1iYpq5L8ACuRhyQUe76FeLb2vmOyjjlH/ENJ Q==;
X-CSE-ConnectionGUID: 0sL15juXSkyxHu480QIsjA==
X-CSE-MsgGUID: XfasUfoPSoWXMffSPD/TyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="520329"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="520329"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 03:17:27 -0700
X-CSE-ConnectionGUID: u++po61gRP2ZH7zkNaIBNw==
X-CSE-MsgGUID: 1fXI0UCBR5uC7p3x9VMh3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="977921"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 12 Oct 2026 03:17:25 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3] drm/xe/ras: Fix sysctrl and drm-ras discrepancy
Date: Mon, 12 Oct 2026 15:47:12 +0530
Message-ID: <20261012101712.125146-1-raag.jadav@intel.com>
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
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
v2: Move sanity check to xe_drm_ras (Riana)
v3: Parse info after sanity check (Sashiko)
---
 drivers/gpu/drm/xe/xe_drm_ras.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
index 7f3695707611..30cf40ee5fe4 100644
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
@@ -231,7 +242,7 @@ static int register_nodes(struct xe_device *xe)
 void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 value)
 {
 	struct xe_drm_ras *ras = &xe->ras;
-	struct xe_drm_ras_counter *info = ras->info[severity];
+	struct xe_drm_ras_counter *info;
 	struct drm_ras_node *node;
 	int ret;
 
@@ -239,7 +250,11 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
 	if (!xe->info.has_drm_ras)
 		return;
 
+	if (!drm_ras_counter_is_valid(severity, component))
+		return;
+
 	node = &ras->node[severity];
+	info = ras->info[severity];
 
 	if (!info || !info[component].name)
 		return;
-- 
2.43.0

