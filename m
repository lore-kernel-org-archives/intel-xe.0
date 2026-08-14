Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01B0C5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC7610F6AE;
	Fri, 14 Aug 2026 17:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqgHdkj8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3380510F6AE
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727908; x=1818263908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m7MFDQMVxWWjJUPVh0cuWP/PTHFP09eEo4PJDyupf/w=;
 b=MqgHdkj8Nf8Wti1Iq2ZNriH0hyMd0dThdeTUvk+7aUoNIz20WK4tvArR
 vXj+Vf5JK8qDBFRwCmGST5cm5VL9538aN4cT7iij4fFwOdqVhtZ4LRuED
 GedYZekEEI0QxJh/zF/eKjlkFPtjzN+bh7NidO2eTfmK6xWZDkVdJ2ln0
 PoL9nWkaC00rHZ6btgMJ1nkgAPANfKQGt5N+WdPZWRpzT42RIVyPKxFyR
 lFrGTBjfAdlgdvs2AjwNf93w7JAjlRa7R1d8NUSQDTcPIt80IeP2GpF33
 hIw8ymuA7fglT0B1uCI7LunZlmOXzrGZ5poYbqCMYMMX+BNS+WjqHgZ4C A==;
X-CSE-ConnectionGUID: /D+UFFwhS+uFAjd2pG06Tg==
X-CSE-MsgGUID: Y19CadCATLCRakJe9KBGZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464030"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464030"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:28 -0700
X-CSE-ConnectionGUID: /X/ivsjrTZKp+F7AlDb+8w==
X-CSE-MsgGUID: BxH2V/U7Qdqlc1YynxjT0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946099"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [PATCH v5 08/33] drm/xe/log: Add SIGID log helpers for components
Date: Fri, 14 Aug 2026 19:17:34 +0200
Message-ID: <20260814171801.13347-9-michal.wajdeczko@intel.com>
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

