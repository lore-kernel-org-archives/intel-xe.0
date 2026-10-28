Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17A0606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jeGLy2nf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7243710FB04;
	Wed, 28 Oct 2026 09:57:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4670B10E5DF
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793181455; x=1824717455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KcutbKJq9+6SFuf24vhVr03SkmEZ0aBbu8laMa3L8zw=;
 b=jeGLy2nfT4mXJpIYEkk0ohj79lCE4flsopjQvVHHYwMV1rmjyJX9MOH3
 wXo4oRT/b/WXNuj6bwunJKZ9wcnm1y5/AQaOpcA3mQoUaVpJPUBylTMBy
 YDR7Li6mBx1JJ/Rsb4bD8bhX/hThm8/Az7auCmwVLTRL8Cfxhl4XHwh7j
 kIvyGYRhxY2iZ7SqQTbUd+EQVYlIGz+/zy5G+1Thp8OGgHlfmiS2rlfcz
 iGaHmRz+rv5eXJBsoaCVrckOOhLgOVmeYV5mGYGyIA3rYZKEOcVgH9iJN
 YIDeYKad3EcmkO2yJb69pussnHsa3nRPyl/piwMAfJInpmZ3NSRroo1eZ w==;
X-CSE-ConnectionGUID: BdSFpSuZQRu3owSles0WBg==
X-CSE-MsgGUID: OEFF8q/TQYulPIAO/Usbwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1913941"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1913941"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:57:34 -0700
X-CSE-ConnectionGUID: jHmRZqkZRku2U5tv7k9efA==
X-CSE-MsgGUID: 9N6rRMsHT1+wERLdTQe3DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4782730"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:57:31 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v6 01/10] drm/xe/cper: Add CPER reporting entry point for
 xe_log
Date: Wed, 28 Oct 2026 15:27:25 +0530
Message-ID: <20261028095723.734387-13-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028095723.734387-12-badal.nilawar@intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Introduce xe_cper_emit() as the single entry point for emitting
CPER records from xe_log. xe_log now forwards every SIGID log entry
with its full context (component, location, data/len and formatted
message), and xe_cper decides how to report it. Hardware SIGIDs are
routed to a hardware error helper, software SIGIDs are left as TODO.

Assisted-by: LLM
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v5:
  - Drop xe and len check (Raag)
  - s/*error_class/*counter
  - drop xe_ from static function to shorten function name
v4:
  - s/CONFIG_UEFI_CPER_X86/CONFIG_UEFI_CPER/ (Raag)
  - Use in_range() for hardware SIGID check in xe_cper (Raag)
  - Drop unused response param and constify error_class
  - Check data len against struct xe_ras_error_class before use (Michal)
---
 drivers/gpu/drm/xe/Makefile  |  2 ++
 drivers/gpu/drm/xe/xe_cper.c | 47 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h | 26 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.c  |  5 +++-
 4 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a8476e2e8d54..655487a6550f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -169,6 +169,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
 
+xe-$(CONFIG_UEFI_CPER) += xe_cper.o
+
 # graphics virtualization (SR-IOV) support
 xe-y += \
 	xe_gt_sriov_vf.o \
diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
new file mode 100644
index 000000000000..ee7ca3cbae9b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/err.h>
+#include <linux/minmax.h>
+
+#include "xe_cper.h"
+#include "xe_device.h"
+#include "xe_ras_types.h"
+
+static bool is_hw_sigid(enum xe_sigid sigid)
+{
+	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
+}
+
+static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+			     const struct xe_ras_error_class *counter)
+{
+	/* TODO */
+}
+
+/**
+ * xe_cper_emit() - Emit a CPER record for a SIGID log entry
+ * @xe: The &xe_device
+ * @cper_sev: CPER severity
+ * @sigid: Error signature identifier
+ * @component: Component identifier
+ * @location: Location details of the @component
+ * @data: Pointer to the additional details, or ERR_PTR, or NULL if not applicable
+ * @len: Length of the @data in bytes, or 0 if not applicable
+ * @vaf: Formatted log message
+ *
+ * Emit a CPER record for a SIGID log entry
+ */
+void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+		  u32 component, u32 location, const void *data, size_t len,
+		  struct va_format *vaf)
+{
+	if (is_hw_sigid(sigid) && !IS_ERR_OR_NULL(data)) {
+		cper_emit_hw_err(xe, cper_sev, sigid, data);
+		return;
+	}
+
+	/* TODO software CPER */
+}
diff --git a/drivers/gpu/drm/xe/xe_cper.h b/drivers/gpu/drm/xe/xe_cper.h
new file mode 100644
index 000000000000..84676c7645a5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_CPER_H_
+#define _XE_CPER_H_
+
+#include <linux/types.h>
+
+#include "abi/xe_sigid_abi.h"
+
+struct va_format;
+struct xe_device;
+
+#if IS_ENABLED(CONFIG_UEFI_CPER)
+void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+		  u32 component, u32 location, const void *data, size_t len,
+		  struct va_format *vaf);
+#else
+static inline void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+				u32 component, u32 location, const void *data, size_t len,
+				struct va_format *vaf) {}
+#endif
+
+#endif /* _XE_CPER_H_ */
diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 29eb16db3320..80e2b1724ceb 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -8,6 +8,7 @@
 
 #include "abi/xe_log_abi.h"
 
+#include "xe_cper.h"
 #include "xe_device.h"
 #include "xe_log.h"
 #include "xe_pci_types.h"
@@ -19,7 +20,9 @@ static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi
 {
 	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
 				   component, location, data, len, vaf);
-	/* TODO */
+
+	xe_cper_emit(xe_any_to_xe(pdev), cper_sev, sigid,
+		     component, location, data, len, vaf);
 }
 
 static const char *log_unknown_component_prefix(u32 component)
-- 
2.56.0

