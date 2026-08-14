Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50CAC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E1910F6C7;
	Fri, 14 Aug 2026 17:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQoOKpMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92AB10F6C9
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727913; x=1818263913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WT6dCnUPsgpYf4PntjwppM6NVx6e58AJiS0O/Gb9zEE=;
 b=CQoOKpMlMCBs5qItLwLWk4boKaioyzvU4545nR0ET7bWr9fy18FDf/BF
 tZdDbvG8gOZKBqIYyYMFVATToffSxSby/+BnlkhhMllEXDBLLZdQVjhkL
 QHy/LeJZbDD2K0r2H/nITtcckaGlWlKlZqkY8A/oE5W/8Ct4lyXlGVJdI
 zLbrUNwzm4YhVM5EGSc46jl34Zbm1wPhl7PlJglGSgSbvMJu8kOsP2KaR
 B81MS7LmogDfRmYQdXBOiFtTM5/cQE8r9tojpaNQJnD1zxFiuW10kxwfs
 7wKovdWmq3adk9kOik+YhxR4A3ciUYcdnVMa6dXuiRl/g/dMI0Ri13x71 g==;
X-CSE-ConnectionGUID: aykzn2xkTAWE7Irpvcxr/g==
X-CSE-MsgGUID: c/S6iaD2TiSDh/1W0Pxltg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464037"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464037"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:33 -0700
X-CSE-ConnectionGUID: d/0qwO+CSMS330py4Cg6rA==
X-CSE-MsgGUID: EiD00n3RQTCW8SgciWBFbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946161"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [PATCH v5 10/33] drm/xe/log: Add SIGID log helpers for errno-only
Date: Fri, 14 Aug 2026 19:17:36 +0200
Message-ID: <20260814171801.13347-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

For the software based SIGID errors, we will usually want to pass
only the errno value as the data to be logged in the dmesg line or
the CPER record. Add simple wrappers for that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com> #v3
---
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
v2: include linux/err.h (Sashiko)
    add xe_log_err_corrected (Michal)
v3: use xe_log_comp_sev helpers (Mallesh)
v4: add xe_log_err_info (Rodrigo/Michal)
---
 drivers/gpu/drm/xe/xe_log.h | 65 +++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index c56306a183e7..8c74f809fb5b 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -7,6 +7,7 @@
 #define _XE_LOG_H_
 
 #include <linux/cper.h>
+#include <linux/err.h>
 
 #include "abi/xe_log_abi.h"
 #include "abi/xe_sigid_abi.h"
@@ -115,4 +116,68 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 #define xe_log_comp_info(any, TAG, data, len, fmt, args...) \
 	xe_log_comp((any), CPER_SEV_INFORMATIONAL, TAG, (data), (len), fmt, ##args)
 
+/**
+ * xe_log_err() - Emit a structured SIGID error log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @err: negative errno for the failing operation, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The log entry will be emitted with @CPER_SEV_RECOVERABLE severity.
+ */
+#define xe_log_err(any, TAG, err, fmt, args...) \
+	xe_log_comp_recoverable((any), TAG, ERR_PTR(err), 0, fmt, ##args)
+
+/**
+ * xe_log_err_fatal() - Emit a structured SIGID error log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @err: negative errno for the failing operation, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The log entry will be emitted with @CPER_SEV_FATAL severity.
+ */
+#define xe_log_err_fatal(any, TAG, err, fmt, args...) \
+	xe_log_comp_fatal((any), TAG, ERR_PTR(err), 0, fmt, ##args)
+
+/**
+ * xe_log_err_corrected() - Emit a structured SIGID error log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @err: negative errno for the failing operation, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The log entry will be emitted with @CPER_SEV_CORRECTED severity.
+ */
+#define xe_log_err_corrected(any, TAG, err, fmt, args...) \
+	xe_log_comp_corrected((any), TAG, ERR_PTR(err), 0, fmt, ##args)
+
+/**
+ * xe_log_err_info() - Emit a structured SIGID error log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @err: negative errno for the failing operation, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The log entry will be emitted with @CPER_SEV_INFORMATIONAL severity.
+ */
+#define xe_log_err_info(any, TAG, err, fmt, args...) \
+	xe_log_comp_info((any), TAG, ERR_PTR(err), 0, fmt, ##args)
+
+/**
+ * xe_log_info() - Emit a structured SIGID information log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The log entry will be emitted with @CPER_SEV_INFORMATIONAL severity.
+ */
+#define xe_log_info(any, TAG, fmt, args...) \
+	xe_log_err_info((any), TAG, 0, fmt, ##args)
+
 #endif
-- 
2.47.1

