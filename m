Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8C0C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AD110EB31;
	Tue, 25 Aug 2026 17:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJ3WuThI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89E210EB31
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787679774; x=1819215774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dp21pcBuRKev5dVkLAkhtRf0y61bvvMmofENAeh4gCM=;
 b=IJ3WuThIEFerOK227yX6TFTALtjRxSFf6bHWwWTDf08ALZ2njflCKThe
 OxY6qYhO8UGijyLPrsiPkCrGvM7JcVdh6KnT+y1EEw6aqxsr5s/RaV8la
 94szXH23TNawKV188xt6Lm2p3GbDmnPLqoIkOOB50QWcxGaKi90uus1p8
 8bNOh30+5rd8PvreHS4c72NRoiGvImW5XQsG8I1uWGiYoNFJpkVi4CAfB
 V45MU5eP/skCJbFN7ujEP+npVVHJTDOPYJOKEl8RPFDVrS0SqfSQzsH1C
 HHClpSBriTsMa3McmAmnT5HV3SNImHEjo2p6dmvuU5EZBAnnYt4QQGUWZ g==;
X-CSE-ConnectionGUID: rQaIOCpzTsmn2HfLktr/FQ==
X-CSE-MsgGUID: aQPYDdY8SJehAX8wtE/90w==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88210818"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88210818"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:53 -0700
X-CSE-ConnectionGUID: DRxyetzKR+6aQN36SsEWsw==
X-CSE-MsgGUID: DOJScHzxSh6WAfruPkDrNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272585116"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:51 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com
Subject: [PATCH v2 07/11] drm/xe/cper: Allow hardware error CPER reporting
 from xe_log
Date: Tue, 25 Aug 2026 23:29:24 +0530
Message-ID: <20260825175916.1103841-20-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260825175916.1103841-13-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
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

Add xe_emit_hardware_error_cper() as a public wrapper around the
internal hardware CPER emission helper, enabling xe_log.c to emit
hardware error CPER records.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_log.c | 17 +++++++++++------
 drivers/gpu/drm/xe/xe_ras.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h |  4 ++++
 3 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 5549ef6966fd..c78fc195c55b 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -10,15 +10,25 @@
 
 #include "xe_device.h"
 #include "xe_log.h"
+#include "xe_ras.h"
 #include "xe_printk.h"
 
+static bool is_hw_sigid(enum xe_sigid sigid)
+{
+	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
+}
+
 static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 			  u32 component, u32 location, const void *data, size_t len,
 			  struct va_format *vaf)
 {
 	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
 				   component, location, data, len, vaf);
-	/* TODO */
+	/* TODO software CPER */
+
+	if (is_hw_sigid(sigid))
+		xe_emit_hardware_error_cper(pdev, cper_sev, sigid,
+					    (struct xe_ras_error_class *)data);
 }
 
 static const char *log_unknown_component_prefix(u32 component)
@@ -100,11 +110,6 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
 	return buf;
 }
 
-static bool is_hw_sigid(enum xe_sigid sigid)
-{
-	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
-}
-
 static bool is_sev_error(int cper_sev)
 {
 	return cper_sev != CPER_SEV_INFORMATIONAL;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index ff9d917b8e29..b4cdb5ec6491 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -837,6 +837,29 @@ static void emit_hw_error_cper(struct xe_device *xe,
 	}
 }
 
+/**
+ * xe_emit_hardware_error_cper() - Emit a hardware error CPER record
+ * @pdev: PCI device associated with the Xe device
+ * @cper_sev: CPER severity
+ * @sigid: Error signature identifier
+ * @error_class: Hardware error classification details
+ *
+ * Emit a CPER record for a hardware error
+ */
+void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+				 struct xe_ras_error_class *counter)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	if (!xe)
+		return;
+
+	if (counter && !ras_counter_is_valid(xe, counter))
+		return;
+
+	emit_hw_error_cper(xe, counter, NULL, sigid, cper_sev);
+}
+
 /**
  * xe_ras_process_errors() - Process and contain hardware errors
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 618364734043..e5c4b2e2e1fd 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -7,6 +7,8 @@
 #define _XE_RAS_H_
 
 #include <linux/types.h>
+#include "abi/xe_sigid_abi.h"
+#include "xe_device.h"
 #include "xe_ras_types.h"
 
 struct xe_device;
@@ -18,5 +20,7 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
 int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
 void xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
+void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+				 struct xe_ras_error_class *error_class);
 
 #endif
-- 
2.54.0

