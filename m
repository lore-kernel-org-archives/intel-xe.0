Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F393FC54F4D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE44510E97E;
	Tue, 28 Jul 2026 16:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTeE8kot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DB410E88A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255076; x=1816791076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g4Y+/RtpX3nR4i7C7f7mXr93LzauDc3oLHnaZ+eaxhQ=;
 b=ZTeE8kotITYBkFbD4wVyrpG0//7/0yds+YmhYBgNFROo2QvaGZ0G9OLr
 +yDAbCVf9+wlMCRW6jIe/J6tAjX/yy3gTWNfvqLT3FhSmX5TYUCivXSoO
 LtEJBMHB0ogRhkszn24iqImoZqRqiIXREowxAr2hlHXakcwK3sIpCisPZ
 qLoZL53dMm/pjork6giziUBYaOWMXykoNNWILT4jmHDIg7EUGYwi+1n/U
 wnICD6kafN38eE75lm6NhhNVdvUG/jrP/kWL2swX/3FeePMbdJHhbNAXd
 OtI2hH3gO2sw2njBASlyoOU/5EwybC0Lh6gMi7aTH9GPrtUh9s+ZICbua w==;
X-CSE-ConnectionGUID: wKlCsMICRHS/uVJwSDsSKg==
X-CSE-MsgGUID: tle4YIpCSt6gfdvA8gerMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386255"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386255"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:16 -0700
X-CSE-ConnectionGUID: v4Y+utyGT7Clm96FdrLmlg==
X-CSE-MsgGUID: dApYBtakQZOKstyo/pdymg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819292"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 05/22] drm/xe/log: Add SIGID log helpers for severity
Date: Tue, 28 Jul 2026 18:10:20 +0200
Message-ID: <20260728161039.579-6-michal.wajdeczko@intel.com>
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

There are only few CPER severity levels defined, add simple helper
for each of them, to avoid forcing developers to write full severity
name in every function call.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

