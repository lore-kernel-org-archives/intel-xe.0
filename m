Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7B8C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ADB10F0EC;
	Wed, 12 Aug 2026 19:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W95qenad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1647710F0E3
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562121; x=1818098121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rhcg1K2PCt8mOWcQ5cBDFPlo8MszWlQ/h5/TcApB15w=;
 b=W95qenadyJA9KuRrKX4zF1FYxv7qz5LKg9IDlybWTDhuzffPSurOYv5i
 RKFi026eH8RHrmyyHknAIGu+5yVEj/+ulgb/97VGBn/95aMJkZF9ZVqRQ
 XxSJcJjBkm9MJE/A7keRueqRC941R5MVWlBKQpFpexS9UmrMhJurLnPdR
 q7osWtpqw8zkFhrkqjSS2PpV/x+9F+j6wnVbAURTxtRDnVqodJpfl3jTg
 QkC8Hg/vlpJNCBBGXXo4pWH1H1pn+k+mRGd9VsEJBx7L3dseTUmOc9QS4
 o6JMbVmUmaWfR4nuqbc89K7QzuCvVrDiP+BU5+EBjjb7wBVzoTuOZ5ARi g==;
X-CSE-ConnectionGUID: cRgd75ivSaa7wWTCQGUpdQ==
X-CSE-MsgGUID: cLeZPsLlQYGNGDSkjAvIUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987531"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987531"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:21 -0700
X-CSE-ConnectionGUID: Un4S4WxlRbKpIwJNE+h2Mg==
X-CSE-MsgGUID: GY8wtJ/5SvucSseEhCAqaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891944"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:19 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [PATCH v4 10/32] drm/xe/log: Add SIGID log helpers for errno-only
Date: Wed, 12 Aug 2026 21:14:26 +0200
Message-ID: <20260812191450.11690-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
v2: include linux/err.h (Sashiko)
    add xe_log_err_corrected (Michal)
v3: use xe_log_comp_sev helpers (Mallesh)
---
 drivers/gpu/drm/xe/xe_log.h | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index c56306a183e7..0928b0866617 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -7,6 +7,7 @@
 #define _XE_LOG_H_
 
 #include <linux/cper.h>
+#include <linux/err.h>
 
 #include "abi/xe_log_abi.h"
 #include "abi/xe_sigid_abi.h"
@@ -115,4 +116,55 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
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
+ * xe_log_info() - Emit a structured SIGID information log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The log entry will be emitted with @CPER_SEV_INFORMATIONAL severity.
+ */
+#define xe_log_info(any, TAG, fmt, args...) \
+	xe_log_comp_info((any), TAG, NULL, 0, fmt, ##args)
+
 #endif
-- 
2.47.1

