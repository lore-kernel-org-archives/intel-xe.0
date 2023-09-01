Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B7FCA0FE5
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 16:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD66710E7D6;
	Fri,  1 Sep 2023 16:05:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6BE10E7D6
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693584329; x=1725120329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AhuL2er+umj52jrQMhd6zDfiwfU2o+C2N0CnwtDzrj4=;
 b=nc89fqX3FnJrKLvEFqV51uu+fkxlW+k39N9GEm9bAy8jsZWTdEVPoDVm
 hZQrUTNlv/qnsF1018DdApIjtO8bflu81HYvrVPuKfe/s5/I/SmZe0rrx
 yqeRpGfbDgCO3OCHgzKhD8R/VtNO+u+dZgWtZrLMtE0baq0QKo+xzurC8
 elldCtA0z4GDpPxUAmX5fUI48AlP5a5wxnNk4qVmZJBuMQ5KUJWd6Kqyo
 4/MX2cHDPcw6OUcPatGIQZB6kTM6DTmDJt0W2GY8S0QUcX62Au4rBfRUe
 PdqIFoiKMth9wcR8GAzE5sLyChXVYFFIaOC7ddGvH+S2C8wr40FcmXUv5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440222525"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="440222525"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 09:03:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986725593"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="986725593"
Received: from baparham-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.42.61])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 09:03:08 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Sep 2023 16:03:00 +0000
Message-Id: <20230901160300.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/display: Use acpi_target_system_state
 only if ACPI_SLEEP is enabled
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This fixes the build when ACPI_SLEEP is disabled.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index b6b547c4877c..54f52b6d702d 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -331,7 +331,12 @@ static void intel_suspend_encoders(struct xe_device *xe)
 
 void xe_display_pm_suspend(struct xe_device *xe)
 {
-	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
+	bool s2idle;
+#if IS_ENABLED(CONFIG_ACPI_SLEEP)
+	s2idle = acpi_target_system_state() < ACPI_STATE_S3;
+#else
+	s2idle = true;
+#endif
 	if (!xe->info.enable_display)
 		return;
 
@@ -360,7 +365,12 @@ void xe_display_pm_suspend(struct xe_device *xe)
 
 void xe_display_pm_suspend_late(struct xe_device *xe)
 {
-	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
+	bool s2idle;
+#if IS_ENABLED(CONFIG_ACPI_SLEEP)
+	s2idle = acpi_target_system_state() < ACPI_STATE_S3;
+#else
+	s2idle = true;
+#endif
 	if (!xe->info.enable_display)
 		return;
 
-- 
2.34.1

