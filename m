Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21677EE57DF
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 10:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D502F10E184;
	Mon, 11 Sep 2023 10:37:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2E410E00D
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694428623; x=1725964623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XTtCyz6iVe1U9+W9dAXQTjTnOuoUdMuFe9xf3dkgUJc=;
 b=Ce5s5Lm/x3dMUsIQvv8a6pnOn1Sm6eQn+2ZF+56cJYZxtloQTZTDfz5b
 uy2TKUugR6EbUSP5a3jeXhabwSaYl4v+PnvDCdasPCWtuFX++IOAySIXH
 SjjuAY0Gl3zDdiTNlVBAGLfOGWiyx9N35P97lX9LBXHWRNfTYE6K0JLOP
 68y+GF7DiTw9ufLMykAPMK1Y8wTdiomUzAP83wcs3m9NN6sXIt7QJPk5j
 4yDLx9iI16j04g3JIcA1cjGMF3DfTOng+ARGtpQ0R8xg4Rl0L0eGhktN6
 LZeO6pp01U9ePsVyKx74tx7zqbEasO6uMWJjW7ho/RNOJADAr62G1lgrH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="464421824"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="464421824"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="693042174"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="693042174"
Received: from bvivekan-desk.iind.intel.com ([10.190.239.116])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:36:56 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 11 Sep 2023 16:11:34 +0530
Message-Id: <20230911104134.431670-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe/display: Print display ip version
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Print display ip version and flags during module load

v3:
Use the existing intel_display_device_info_print() function to print the
display information. (Jani)

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 9 +++++++++
 drivers/gpu/drm/xe/xe_display.h | 4 ++++
 drivers/gpu/drm/xe/xe_pci.c     | 2 ++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index a453946ad108..45ffc418e636 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -417,6 +417,15 @@ void xe_display_pm_resume(struct xe_device *xe)
 	intel_power_domains_enable(xe);
 }
 
+void xe_display_info_print(struct xe_device *xe)
+{
+	struct drm_printer p = drm_info_printer(xe->drm.dev);
+
+	if (xe->info.enable_display)
+		intel_display_device_info_print(xe->info.display,
+						&xe->info.display_runtime, &p);
+}
+
 /* Display info initialization */
 __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index 9e29de012df7..b18bf5583229 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -19,6 +19,8 @@ int xe_display_create(struct xe_device *xe);
 
 void xe_display_info_init(struct xe_device *xe);
 
+void xe_display_info_print(struct xe_device *xe);
+
 int xe_display_init_nommio(struct xe_device *xe);
 void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
 
@@ -57,6 +59,8 @@ xe_display_create(struct xe_device *xe) { return 0; }
 
 static inline void xe_display_info_init(struct xe_device *xe) { }
 
+static inline void xe_display_info_print(struct xe_device *xe) { }
+
 static inline int
 xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 24b16863bf3d..a4886ea8794f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -724,6 +724,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		xe_step_name(xe->info.step.display),
 		xe_step_name(xe->info.step.basedie));
 
+	xe_display_info_print(xe);
+
 	err = xe_device_probe(xe);
 	if (err)
 		goto err_pci_disable;
-- 
2.25.1

