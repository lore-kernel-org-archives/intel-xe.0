Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9712DC54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 12:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCF910E345;
	Mon, 26 May 2025 12:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QnBXDQBV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A73F10E327
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748261138; x=1779797138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0eJ5s4f3vaycL5FphWjwXIa3y8oHBRPenuVbx+3dc38=;
 b=QnBXDQBVxxHnBjt6I+oFD/OPhnivA0Kh0Yi+dPL9U1JjSGW9zmJrGu/f
 QusItGBUm+4fY4PhNxe/omYTLepocr/p0pRrsPUnUC2B4jyAqDzf5JFEE
 I5cTWrhfO7JZyhFzKx1KH58VaaOtxr8QZdMkD6c6sf04rttY25X7POWnJ
 JdtFvUvxQFAUbLbLPheCo2T8jWrsu0JkWoSEp7uBpmnw1udzbQ2VPJ2zh
 rcUzI1pfISEWhjHhE1Y8fGVOOmEzQyGF4Z7cZUqHQzEvfX6jBWjHgx/X+
 kaCclel9fZj0bmpMLFwBZMTMSiRzwwVqgcMj0Zn/G2scq1fgPhfDbym/U g==;
X-CSE-ConnectionGUID: 0a+V56QxQ2uM9icsmcm7Tg==
X-CSE-MsgGUID: n/T0ISIPSD2VJ6g4QGhL9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60492288"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="60492288"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:37 -0700
X-CSE-ConnectionGUID: fmD3kpIMR5CyCcLMYG26cA==
X-CSE-MsgGUID: 2vFS55EiT/eCDVfUy3GuLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147576031"
Received: from johunt-mobl9.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:36 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 04/12] drm/i915/alpm: Add PR_ALPM_CTL register definitions
Date: Mon, 26 May 2025 15:05:04 +0300
Message-ID: <20250526120512.1702815-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add PR_ALPM_CTL register definition and bits for it.

Bspec: 71014
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr_regs.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
index 795e6b9cc575..aad3ac5f502e 100644
--- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
@@ -266,6 +266,16 @@
 #define _PIPE_SRCSZ_ERLY_TPT_B	0x71074
 #define PIPE_SRCSZ_ERLY_TPT(pipe)	_MMIO_PIPE((pipe), _PIPE_SRCSZ_ERLY_TPT_A, _PIPE_SRCSZ_ERLY_TPT_B)
 
+#define _PR_ALPM_CTL_A	0x60948
+#define PR_ALPM_CTL(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _PR_ALPM_CTL_A)
+#define  PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU	BIT(6)
+#define  PR_ALPM_CTL_RFB_UPDATE_CONTROL				BIT(5)
+#define  PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE	BIT(4)
+#define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK		REG_GENMASK(1, 0)
+#define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1_OR_T2	REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 0)
+#define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1		REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 1)
+#define  PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T2		REG_FIELD_PREP(PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_MASK, 2)
+
 #define _ALPM_CTL_A	0x60950
 #define ALPM_CTL(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _ALPM_CTL_A)
 #define  ALPM_CTL_ALPM_ENABLE				REG_BIT(31)
-- 
2.43.0

