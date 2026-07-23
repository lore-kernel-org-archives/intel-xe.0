Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF3FC531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C147D10F201;
	Thu, 23 Jul 2026 20:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+IkQzwj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308B210F1FE
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839095; x=1816375095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qnvaf6kK7Cr5MiAJWR9WWebPHc8a5Fx3/WuSGzu/04I=;
 b=j+IkQzwjgETI4GcMH4LY9pCTriiOAEBUv1U/EkoKF1Hue0SVqKUMpBxV
 SOGJHh2XUdnh8hdG0IAaTFt/OB8XUj8gsQq8PI3peebjzuWU/9AsqsQCR
 8tTM88sxc1r4B9viplumYixGVkafTi6y7kdkrPr38v+NclEVeq5tJtO9E
 9rZTYfVcutQs0j9zuCbWeD8LEUTYLO0mHClecqT9LLELW+J9MMmO/t10I
 yzp0Ormeriu+NFYkPpa1fZEnXN4GSBO7WR6Xr9o/Np9URbGe+kupGGKzp
 Q8sGSnpLJqma6iU+r7RWhSJa1KWl7g1ZTDrokhMTQyjZ2VpbD93U7DhCA g==;
X-CSE-ConnectionGUID: ur4XqjgnTimD1R5VWh6VPA==
X-CSE-MsgGUID: I14UbuCJR4myFNroB0x/1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484291"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484291"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:15 -0700
X-CSE-ConnectionGUID: dZR+6EyvQHiKplrVGLuAiQ==
X-CSE-MsgGUID: qJ2gqeN7T3KTMv8DCWZBxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578584"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:14 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 03/19] drm/xe/log: Add simple helpers for xe_log_emit
Date: Thu, 23 Jul 2026 22:37:36 +0200
Message-ID: <20260723203754.3782-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723203754.3782-1-michal.wajdeczko@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
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

There are only few CPER severity levels defined, add simple helper
for each of them, to avoid forcing developers to write full severity
name in every function call. Also, use xe_any helpers to provide
implicit conversion from compatible pointers to the pci_dev.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_log.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index d475e816ee0b..1d30d05eb311 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -9,6 +9,7 @@
 #include <linux/cper.h>
 
 #include "abi/xe_sigid_abi.h"
+#include "xe_any.h"
 
 struct pci_dev;
 
@@ -17,4 +18,24 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 		 u32 component, u32 location, const void *data, size_t len,
 		 const char *fmt, ...);
 
+#define xe_log_emit_from(any, sev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit(xe_any_to_pdev(any), (sev), (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_emit_fatal(any, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit_from((any), CPER_SEV_FATAL, (sig), (comp), (loc), \
+			 (data), (len), fmt, ##args)
+
+#define xe_log_emit_recoverable(any, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit_from((any), CPER_SEV_RECOVERABLE, (sig), (comp), (loc), \
+			 (data), (len), fmt, ##args)
+
+#define xe_log_emit_corrected(any, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit_from((any), CPER_SEV_CORRECTED, (sig), (comp), (loc), \
+			 (data), (len), fmt, ##args)
+
+#define xe_log_emit_info(any, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit_from((any), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
+			 (data), (len), fmt, ##args)
+
 #endif
-- 
2.47.1

