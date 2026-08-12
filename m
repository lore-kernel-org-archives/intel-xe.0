Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D43C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D10E10F0B9;
	Wed, 12 Aug 2026 19:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCUzcwEh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D64F10F0D8
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562117; x=1818098117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m7MFDQMVxWWjJUPVh0cuWP/PTHFP09eEo4PJDyupf/w=;
 b=RCUzcwEhf2Qve7PhCiewi8F4FYXdLwOu7S2QuTaKfrl+2IOlw9OuPFh3
 pxA3HCQ1JGG+ozCd7whLhaG5J7NHj5PN+AE89o23x4PRINXEe5qZWtnaQ
 I4w3kUMziqG8Zs8j2Rcx3RXyERBmfqRjG9OSbIg5nNUbcn6+cGGeUYh6x
 LxPpgM4mVQn3IWbUSOGXI+XZyyTufWZx+y0WReGqMM5OJ7Dnhk7az/UGF
 +dsyioVw/pMZMgfV+JiRAxWNAyCEAvZyF3hfHiZcI/h5cjPATtlS0SUWB
 NvKrsRYNUkVMt6el7yzICz2mxFVG1sWYqyM1eHTWeQdCbMYQ7sW5McLLb A==;
X-CSE-ConnectionGUID: vyxoAGiURwmCa7O9KXPVwg==
X-CSE-MsgGUID: 8WcnoSxlTTmfgoKnDZARBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987521"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987521"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:17 -0700
X-CSE-ConnectionGUID: 1PQGRMm7QMeee8tCcIJxbA==
X-CSE-MsgGUID: X+ERH/AWSqevv9D/sdG0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891934"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:16 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [PATCH v4 08/32] drm/xe/log: Add SIGID log helpers for components
Date: Wed, 12 Aug 2026 21:14:24 +0200
Message-ID: <20260812191450.11690-9-michal.wajdeczko@intel.com>
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

Our component list already defines relation between the component
name, identified by the TAG, and its numerical identifier and the
assigned SIGID. We can also already prepare location identifier
based on the pointer type used to emit the log entry. Add helper
that will prepare SIGID, COMPONENT and LOCATION parameters for
xe_log_emit() using provided components TAG and the pointer.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
v2: rebased/simplified (Michal)
---
 drivers/gpu/drm/xe/xe_log.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index 916218560297..c30db02950b0 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -85,4 +85,22 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 	xe_log_from((any), CPER_SEV_INFORMATIONAL, (sig), (comp), \
 		    (data), (len), fmt, ##args)
 
+/**
+ * xe_log_comp() - Emit a structured SIGID log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
+ * @TAG: the component tag to use
+ * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
+ * @len: length of the @data in bytes, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ *
+ * The SIGID will be determined from the component's @TAG.
+ * The component identifier will be determined from the component's @TAG.
+ * The location used to emit SIGID entry will be based on the @any pointer type.
+ */
+#define xe_log_comp(any, cper_sev, TAG, data, len, fmt, args...) \
+	xe_log_from((any), (cper_sev), (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
+		    XE_LOG_COMPONENT_##TAG, (data), (len), fmt, ##args)
+
 #endif
-- 
2.47.1

