Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB3C54F54
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB62210E980;
	Tue, 28 Jul 2026 16:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8stx1yb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B2F10E980
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255081; x=1816791081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nUAm5SuIC8EIb4NoRVP1W80Y6wm5MJHcAacUEaTST8c=;
 b=Y8stx1ybkl5WyRoI9sM93+ArMJyCiuoSprla9M9tm1cjGqlFbUDghQ8o
 aHHT+Iz2EyF+Ez4Zon+WbDfbSTitIfUoZ9CP7OGG8gWyBl0D9uLU2eZBe
 bTAVpie4HwbgHuuPgW9SWHKL4bsO64DWCaqkjMp07TIDu+cWidMBLgWHq
 1jBEn4J6FHKeGJ4Q+SjigbwJVoD7ijoXmYjsOmF3KLOuKCgzaTB2aLDpr
 g+3w0+VOQS6zz8EGYQ0oD1L6tVNbXm7r3eiLrllgULfI24JxvbLNgdfwb
 aaezlbDMbiDKn4RtQr5G5zndDNxnTBTzCy/67qCe/uusAUgyxCUf64N/u w==;
X-CSE-ConnectionGUID: jodwbM8oR4u2SQ3/TaF8Hw==
X-CSE-MsgGUID: nbKOevgORKikOak6Vr7lqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386265"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386265"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:21 -0700
X-CSE-ConnectionGUID: vuu/U6iXTtaHxtN3WXKxjA==
X-CSE-MsgGUID: WM/9ZMlCS2+DrJBFCiJofw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819313"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 08/22] drm/xe/log: Add SIGID log helpers for components
Date: Tue, 28 Jul 2026 18:10:23 +0200
Message-ID: <20260728161039.579-9-michal.wajdeczko@intel.com>
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

Our component list already defines relation between the component
name, identified by the TAG, and its numerical identifier and the
assigned SIGID. We can also already prepare location identifier
based on the pointer type used to emit the log entry. Add helper
that will prepare SIGID, COMPONENT and LOCATION parameters for
xe_log_emit() using provided componentn TAG and the pointer.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: rebased/simplified (Michal)
---
 drivers/gpu/drm/xe/xe_log.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index 43deaf93ce3e..b0f50aa35a96 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -85,4 +85,22 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 	xe_log_from((any), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
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

