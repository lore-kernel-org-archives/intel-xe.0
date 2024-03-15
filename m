Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94445C54E6E
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 09:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523EE1120CA;
	Fri, 15 Mar 2024 09:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cs0qSduv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA921120CB
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 09:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710496505; x=1742032505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xn4AggEFmRYJ49zDYnDZ1HzQfwV9lN/D2Xab74RSHus=;
 b=cs0qSduvxQy/vdMAnfHsUy1sTHbz4KKAcsYJpIAIiMh+jw9Um9cTAgDS
 O1umxYM9VUBMcxyJZQyzVkXseMG2PtoGnvjFJJjeASdsaHIYuLz0aCrAY
 xqI0eOll47gP0JhurMuCAugkofJh48crj/jFZdqNOI+UAnXVRVxQ1kexv
 1f6S507LyckBQdGpnrRga7YoPO1EKyKschQaKsUE5q+J7/iw/Mio9VMdH
 smndyhA6IfBqv49wdQ4/jC1aWasW6uOXLjiBMAT9rJT0CGT/umiMEBXxH
 MrbI+8mIO0439q4zHHmQ4fgp9qk+m49fU7LBaUSxFaR6Oenadz2Kjxghl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15906936"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="15906936"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 02:55:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="17225627"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 02:55:02 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 3/3] RFC drm/xe: add fault injection for lmem init check
Date: Fri, 15 Mar 2024 15:35:30 +0530
Message-Id: <20240315100530.3051944-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240315100530.3051944-1-riana.tauro@intel.com>
References: <20240315100530.3051944-1-riana.tauro@intel.com>
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

add a boot time fault injection for lmem init check.
This can be triggered by adding a modparam fail_lmem_init

xe.fail_lmem_init=<interval>,<probability>,<space>,<times>

Adding this causes the lmem init check to fail causing
the probe to defer.

v2: add fault injection (Lucas)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_module.c |  5 +++++
 drivers/gpu/drm/xe/xe_module.h |  3 +++
 3 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 50473329cce7..393610e95bd1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -51,6 +51,10 @@ struct lockdep_map xe_device_mem_access_lockdep_map = {
 };
 #endif
 
+#ifdef CONFIG_FAULT_INJECTION
+DECLARE_FAULT_ATTR(lmem_init_fail);
+#endif
+
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -431,6 +435,23 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 	if (IS_SRIOV_VF(xe))
 		return 0;
 
+#ifdef CONFIG_FAULT_INJECTION
+	/*
+	 * use fault injection to cause a lmem init failure to validate
+	 * deferred probe. Set the verbose to 0 to  avoid dump stack
+	 */
+	if (xe_modparam.fail_lmem_init) {
+		setup_fault_attr(&lmem_init_fail, xe_modparam.fail_lmem_init);
+		lmem_init_fail.verbose = 0;
+		if (should_fail(&lmem_init_fail, 1)) {
+			/* add delay to reduce the number of deferred probe attempts */
+			msleep(500);
+			drm_dbg(&xe->drm, "Fault Injection lmem init failure\n");
+			return -EPROBE_DEFER;
+		}
+	}
+#endif
+
 	if (verify_lmem_ready(gt))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 110b69864656..c4efbab430a7 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -48,6 +48,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
 
+#ifdef CONFIG_FAULT_INJECTION
+module_param_named_unsafe(fail_lmem_init, xe_modparam.fail_lmem_init, charp, 0400);
+MODULE_PARM_DESC(fail_lmem_init, "Fault injection. fail_lmem_init=<interval>,<probability>,<space>,<times>");
+#endif
+
 struct init_funcs {
 	int (*init)(void);
 	void (*exit)(void);
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 88ef0e8b2bfd..ccbeacbc3efb 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -18,6 +18,9 @@ struct xe_modparam {
 	char *huc_firmware_path;
 	char *gsc_firmware_path;
 	char *force_probe;
+#if IS_ENABLED(CONFIG_FAULT_INJECTION)
+	char *fail_lmem_init;
+#endif /* CONFIG_FAULT_INJECTION */
 };
 
 extern struct xe_modparam xe_modparam;
-- 
2.40.0

