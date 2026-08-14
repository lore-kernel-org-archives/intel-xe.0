Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C966BC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E5610F6B5;
	Fri, 14 Aug 2026 17:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxLeT0lM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D938710F6AE
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727905; x=1818263905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qJYo+7Z/UmG2LmY+kGuTH+t7u9p6FQn5ua/PvpZ9p6A=;
 b=NxLeT0lMvpX8CR2YwD4R58dGIl2YBGUX5NK4CJtYEboVhix5YeQDljW0
 eHLEsoKYQ1LeX6vtdlxfUnRTqRfTkPl18aTe3dmxVt9QypgtLx1PPmuhs
 5WBfLJF8a9472eJXp5cZymmHuKI9HY3ODt40oujG7y9v8MML+pc3hLEUr
 /5bef8X4DrthPO0SHBwoiONq81gMiE5PUb3p8u4BSzH1IrM5aUL7kR2H/
 y6e86Hdcv5fr4kHGTiBQE23wFwMKyiDmVxU9g3jZ6vAT6e1l9S8qPBuiG
 VZiEPwmwJGzdeKIKzSpfKPeJAgZekrkVaOJ0SUjwXmmR2PwNjrrADG89U w==;
X-CSE-ConnectionGUID: Fpc6V38JRM+4a/USBMjoMg==
X-CSE-MsgGUID: ks62YxqWRhW9dWizTzpxdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464027"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464027"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:24 -0700
X-CSE-ConnectionGUID: ggtayx/AR6ab9KY31oI6Rw==
X-CSE-MsgGUID: UD/cSHcaTe6c8KYQkju7AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946075"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:23 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [PATCH v5 06/33] drm/xe/log: Add SIGID log helpers for location
Date: Fri, 14 Aug 2026 19:17:32 +0200
Message-ID: <20260814171801.13347-7-michal.wajdeczko@intel.com>
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

We can determine the location of the SIGID error source based on the
type of the xe pointer being currently available. Add helper macros
that will accept any of xe_device, xe_tile or xe_gt pointers instead
of plain pci_dev to generate valid XE_LOG_LOCATION identifier and then
call low-level xe_log_emit(pdev) function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_log.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index 73daf37d6463..510cedae6e14 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -8,7 +8,9 @@
 
 #include <linux/cper.h>
 
+#include "abi/xe_log_abi.h"
 #include "abi/xe_sigid_abi.h"
+#include "xe_any.h"
 
 struct pci_dev;
 
@@ -33,4 +35,38 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 	xe_log_emit((pdev), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
 		    (data), (len), fmt, ##args)
 
+#define xe_log_location_type(any)							\
+	_Generic((any),									\
+		 struct xe_gt * : XE_LOG_LOCATION_TYPE_GT,				\
+		 const struct xe_gt * : XE_LOG_LOCATION_TYPE_GT,			\
+		 struct xe_tile * : XE_LOG_LOCATION_TYPE_TILE,				\
+		 const struct xe_tile * : XE_LOG_LOCATION_TYPE_TILE,			\
+		 struct xe_device * : XE_LOG_LOCATION_TYPE_DEVICE,			\
+		 const struct xe_device * : XE_LOG_LOCATION_TYPE_DEVICE,		\
+		 struct pci_dev * : XE_LOG_LOCATION_TYPE_DEVICE,			\
+		 struct device * : XE_LOG_LOCATION_TYPE_DEVICE)
+
+#define xe_log_location(any) \
+	PREP_XE_LOG_LOCATION(xe_log_location_type(any), xe_any_id(any))
+
+/**
+ * xe_log_from() - Emit a structured SIGID log entry using @any pointer as location.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
+ * @sigid: signature identifier, see &enum xe_sigid
+ * @component: component identifer
+ * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
+ * @len: length of the @data in bytes, or 0 if not applicable
+ * @fmt: printf-style format string
+ * @args: arguments for the @fmt format string
+ *
+ * The location used to emit SIGID entry will be based on the @any pointer type.
+ * See xe_log_emit() for more details.
+ */
+#define xe_log_from(any, cper_sev, sigid, component, data, len, fmt, args...) do {	\
+	typeof(any) ___any = (any);							\
+	xe_log_emit(xe_any_to_pdev(___any), (cper_sev), (sigid), (component),		\
+		    xe_log_location(___any), (data), (len), fmt, ##args);		\
+} while (0)
+
 #endif
-- 
2.47.1

