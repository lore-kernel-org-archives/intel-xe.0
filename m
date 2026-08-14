Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4D0C5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F39710F6AF;
	Fri, 14 Aug 2026 17:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LN2BMbWU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9AD10F6C8
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727903; x=1818263903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mdnWwV9TVBhUevNQiGZ0xqwQRCRDVfe4A6GXlUNaeso=;
 b=LN2BMbWUkd/wY0GBCIVpAb3+X7cVtTVPvTJVWmeij5JgR2MDcn6TDdKK
 RLJeHRHTRUAszs79EKHYwWq0u+jj7hnCgLB3ssr8V1+Z2+K93IciN+VCi
 7K4zS38n27Aa6XLSLTiZH5kgTemeyQyXWp2tUzyflKOBndD85xP6oqdpa
 xyrSmfyUFT3pZoKxlVCnp0z70GTP4VXAbXb+Ofpt40w2nO6g2BpdOKelU
 iZTOtRjFGO1IRYtI4HyyrOT9/jXzGaDIs42vjRpLgwp6qRI22aXCoWp8v
 jSmrxC0R83ZFr6vcO5AWQkDCT50ylAPN0obidkh3rQCXQwcGd2CLak2Rp Q==;
X-CSE-ConnectionGUID: tlZp+8TxTBCQonacYDltdg==
X-CSE-MsgGUID: L8esXSM7TayIkZMuMAHEFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464022"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464022"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:23 -0700
X-CSE-ConnectionGUID: MZiDlkRxRPGFkY4kwh2mWA==
X-CSE-MsgGUID: OPImNop9QteNWDySOz8RUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946069"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 05/33] drm/xe/log: Add SIGID log helpers for severity
Date: Fri, 14 Aug 2026 19:17:31 +0200
Message-ID: <20260814171801.13347-6-michal.wajdeczko@intel.com>
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

There are only few CPER severity levels defined, add simple helper
for each of them, to avoid forcing developers to write full severity
name in every function call.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: drop support for any_to_pdev (Michal)
---
 drivers/gpu/drm/xe/xe_log.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index d475e816ee0b..73daf37d6463 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -17,4 +17,20 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 		 u32 component, u32 location, const void *data, size_t len,
 		 const char *fmt, ...);
 
+#define xe_log_emit_fatal(pdev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit((pdev), CPER_SEV_FATAL, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_emit_recoverable(pdev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit((pdev), CPER_SEV_RECOVERABLE, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_emit_corrected(pdev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit((pdev), CPER_SEV_CORRECTED, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_emit_info(pdev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit((pdev), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
 #endif
-- 
2.47.1

