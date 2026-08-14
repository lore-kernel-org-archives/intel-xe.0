Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE816C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBA610F6B7;
	Fri, 14 Aug 2026 17:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQvzdnS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C4110F6CC
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727909; x=1818263909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sSsvjmGOw6Kq/MG+u9A+/3tJQ0VEm4OAkn3E0Xyi6GY=;
 b=WQvzdnS5MCvzNVsKMQBIFnf53VXq9vYKt1WYEBW1/RG8TXFh/yfKL0Wn
 yhTePvqJ0z6RXEHyCuGT56cPvt8jCiAt9emzeCKpUcVgUPCfwJTNCMqTN
 NQLrnMUNdb6x64DGlu/Cyc+BX67CAkf+Y6bc50w/qZNmbpEcNYSOKiEiT
 EjlxkKVcMqfmwl2zyrLC3Y02GsbuJuG3baFt4Wrdew4pLAermsHGGtGlV
 9PEy3Cv1fk+6RtGuzXS6bJPo6+AeTBcg1cI3qKz3grlafsL6LbYvoM6HX
 /mzIExVIa83DQUB1HdUeuVgEdY5Xv8aZvE8L373hw44ZGSwYjBCApVGUL A==;
X-CSE-ConnectionGUID: 1OvPsaLuR+OjnnHE5uQtKA==
X-CSE-MsgGUID: YZ65wUy5SlG+brHxa+nmrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464032"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464032"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:29 -0700
X-CSE-ConnectionGUID: E6cagrdxTgOyDhFRKvRLVg==
X-CSE-MsgGUID: i1DNL1PUSg2tdN9TzUw65g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946144"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 09/33] drm/xe/log: Add SIGID log helpers for component &
 severity
Date: Fri, 14 Aug 2026 19:17:35 +0200
Message-ID: <20260814171801.13347-10-michal.wajdeczko@intel.com>
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

There are only few CPER severity levels defined, add some helpers
to avoid forcing developers to write full CPER severity enum name
in every macro call.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_log.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index c30db02950b0..c56306a183e7 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -103,4 +103,16 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 	xe_log_from((any), (cper_sev), (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
 		    XE_LOG_COMPONENT_##TAG, (data), (len), fmt, ##args)
 
+#define xe_log_comp_fatal(any, TAG, data, len, fmt, args...) \
+	xe_log_comp((any), CPER_SEV_FATAL, TAG, (data), (len), fmt, ##args)
+
+#define xe_log_comp_recoverable(any, TAG, data, len, fmt, args...) \
+	xe_log_comp((any), CPER_SEV_RECOVERABLE, TAG, (data), (len), fmt, ##args)
+
+#define xe_log_comp_corrected(any, TAG, data, len, fmt, args...) \
+	xe_log_comp((any), CPER_SEV_CORRECTED, TAG, (data), (len), fmt, ##args)
+
+#define xe_log_comp_info(any, TAG, data, len, fmt, args...) \
+	xe_log_comp((any), CPER_SEV_INFORMATIONAL, TAG, (data), (len), fmt, ##args)
+
 #endif
-- 
2.47.1

