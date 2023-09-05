Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAE1CA1006
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 19:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C5B10E4EC;
	Tue,  5 Sep 2023 19:50:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE2010E4EC
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 19:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693943404; x=1725479404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t54Yosn3MthDk7qbZBl+TMlvZr9hA7TZvl6Na53VmbQ=;
 b=M3+f8/rJGuU3jve+HRG1BeXXJ7enFz0BEq+nGKztrF1mA9/l7ub9xozx
 Y8hTg2bIeqXnSxn6CXp7NSBCB0vW4Zs28Ql6gL1WBJuKxdou8wWjQ10Oc
 bRtQp1gkpwiqpg/JfEnSyiTEBCIZMfD5K1ji4jNqLdov9M+KwUbQYiLMX
 41i6EbI27R3H9ZzuocRmjL3HCJ0fynGtD7gPHd9iv8JGVn/mD1UB2GXSS
 /urrzb3BX2QiyBsWrCPivgJ542AnGmXgf/86XlixT3wR1koZ+PED3IxEt
 UvG284IIjozsI/C7jYAuoQmoeb+84joYlDb3EQCbXf5RCoHEvjfLkZFHq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407882804"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="407882804"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 12:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="914990550"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="914990550"
Received: from mmehlitz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.158])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 12:50:03 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 19:49:42 +0000
Message-Id: <20230905194942.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230905194942.7-1-francois.dugast@intel.com>
References: <20230905194942.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/1] drm/xe/display: Use
 acpi_target_system_state only if ACPI_SLEEP is enabled
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

This fixes the build error below with CONFIG_ACPI_SLEEP=n:

	drivers/gpu/drm/xe/xe_display.c:334:23: error: implicit declaration of function ‘acpi_target_system_state’; did you mean ‘acpi_get_system_info’? [-Werror=implicit-function-declaration]
	  334 |         bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index b6b547c4877c..a453946ad108 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -329,9 +329,18 @@ static void intel_suspend_encoders(struct xe_device *xe)
 	drm_modeset_unlock_all(dev);
 }
 
+static bool suspend_to_idle(void)
+{
+#if IS_ENABLED(CONFIG_ACPI_SLEEP)
+	if (acpi_target_system_state() < ACPI_STATE_S3)
+		return true;
+#endif
+	return false;
+}
+
 void xe_display_pm_suspend(struct xe_device *xe)
 {
-	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
+	bool s2idle = suspend_to_idle();
 	if (!xe->info.enable_display)
 		return;
 
@@ -360,7 +369,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 
 void xe_display_pm_suspend_late(struct xe_device *xe)
 {
-	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
+	bool s2idle = suspend_to_idle();
 	if (!xe->info.enable_display)
 		return;
 
-- 
2.34.1

