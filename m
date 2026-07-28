Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6724FC531F9
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B5D10E967;
	Tue, 28 Jul 2026 16:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWybOgnn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE62510E967
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255083; x=1816791083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iP0K+DD0sDcHpZlq1DxwP5dV5JdmGcBwehwIBoOv06M=;
 b=KWybOgnnZJcJF+Qmma0C8pzkQ4cg1YOXkuCzTog7qdf1U3YYjlWjLW9h
 TGyr1OOzCagLVXv5oS99al1InYdQfQF4VsSl7BL8Jp6Jz10bW9bTGdu0R
 UpqtYEyURPmAC/EHfkIvpD/6pPzn8l3LorYgNmkt2kD+jO2TIYptlUFvq
 3jUROwP/cGsLn+nBNKoeE/WyFkB0EKpUUNa0dC5KPB0/gjjHPNT3pqUyK
 7GKMWeEUw5a90TxDyqTTvDY0kXY8eIaZwQBbB5ua7C+tnRNCismH5YXJB
 WrDTUvhT0oGC1UuLRjTcEHlZeIrkJQPG2NwJJvksFClq1xS0oSby6GnUG A==;
X-CSE-ConnectionGUID: siMK9C6fSMq9r++pPQ2H1A==
X-CSE-MsgGUID: g4rrJ+uwRZy8LsibcmqLkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386267"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386267"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:23 -0700
X-CSE-ConnectionGUID: kDAUMKZuTyK+MS8Gln/XTg==
X-CSE-MsgGUID: gen8V1QcRZuvH3+OkwZlfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819323"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:21 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 09/22] drm/xe/log: Add SIGID log helpers for errno-only
Date: Tue, 28 Jul 2026 18:10:24 +0200
Message-ID: <20260728161039.579-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
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
---
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: include linux/err.h (Sashiko)
    add xe_log_err_corrected (Michal)
---
 drivers/gpu/drm/xe/xe_log.h | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index b0f50aa35a96..2dccf0c97f3b 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -7,6 +7,7 @@
 #define _XE_LOG_H_
 
 #include <linux/cper.h>
+#include <linux/err.h>
 
 #include "abi/xe_log_abi.h"
 #include "abi/xe_sigid_abi.h"
@@ -103,4 +104,55 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 	xe_log_from((any), (cper_sev), (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
 		    XE_LOG_COMPONENT_##TAG, (data), (len), fmt, ##args)
 
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
+	xe_log_comp((any), CPER_SEV_RECOVERABLE, TAG, ERR_PTR(err), 0, fmt, ##args)
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
+	xe_log_comp((any), CPER_SEV_FATAL, TAG, ERR_PTR(err), 0, fmt, ##args)
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
+	xe_log_comp((any), CPER_SEV_CORRECTED, TAG, ERR_PTR(err), 0, fmt, ##args)
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
+	xe_log_comp((any), CPER_SEV_INFORMATIONAL, TAG, NULL, 0, fmt, ##args)
+
 #endif
-- 
2.47.1

