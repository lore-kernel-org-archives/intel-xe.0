Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EB4E9A049
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 13:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6518E10E6DB;
	Thu, 19 Feb 2026 13:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AM9p7HK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B668E10E6D9;
 Thu, 19 Feb 2026 13:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771506485; x=1803042485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jU3YyP49OwClXLo88lyrTO1NdVA/8i6y5PTpBQd+Gkk=;
 b=AM9p7HK8grz1cdfjWSDvy8GxHb1McaGnmdWLSLgusttxiJuWDCVfa/qZ
 nP8VbUqncTERk39TwIEcHD2rI5cLy6hOEZc7Ht1Lqx6niyC1QGfgRUxq6
 Gi/tpqyEbBwtef75aBBc86RqUPBBWaHRoMOSoQHg7zOeZjBiA2sfUGvLS
 8uKE637cXrvx4z1pGyXFagdvWVKTxtEQYVmc9jq1an3sL9VSNAzmCK8j6
 OOZJucZwcL+/JLevc6EuR53ieul+nOCqr+N3E0yS6ADR4xNrcsV5Oh9nQ
 OqBL0Q1l6IzcPOmxNBbGK+bz/qxYaIrMmCs6kuhWhEbiybUuSRxWRaK4E w==;
X-CSE-ConnectionGUID: 2unAWu8LQGObt4ehZrYk7w==
X-CSE-MsgGUID: NmTEO7cOSfewMPHdrsrGXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72475510"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72475510"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 05:08:05 -0800
X-CSE-ConnectionGUID: Y2xIEctATymsa5bre7CEfA==
X-CSE-MsgGUID: C7/xqK2QQ+iKhYxi5erzvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="212458570"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.120])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 05:08:04 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 2/5] drm/i915/psr: Add DSC_SU_PARAMETER_SET_0 registers for
 PSR configuration
Date: Thu, 19 Feb 2026 15:07:40 +0200
Message-ID: <20260219130743.1232188-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219130743.1232188-1-jouni.hogander@intel.com>
References: <20260219130743.1232188-1-jouni.hogander@intel.com>
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

Add DSC_SU_PARAMETER_SET_0_DSC0 and DSC_SU_PARAMETER_SET_0_DSC1 register
definitions for Selective Update Early Transport configuration.

Bspec: 71709
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr_regs.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
index 8afbf5a38335..3d1523dece8b 100644
--- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
@@ -266,6 +266,18 @@
 #define _PIPE_SRCSZ_ERLY_TPT_B	0x71074
 #define PIPE_SRCSZ_ERLY_TPT(pipe)	_MMIO_PIPE((pipe), _PIPE_SRCSZ_ERLY_TPT_A, _PIPE_SRCSZ_ERLY_TPT_B)
 
+#define _DSC_SU_PARAMETER_SET_0_DSC0_A		0x78064
+#define _DSC_SU_PARAMETER_SET_0_DSC0_B		0x78264
+#define DSC_SU_PARAMETER_SET_0_DSC0(pipe)	_MMIO_PIPE((pipe), _DSC_SU_PARAMETER_SET_0_DSC0_A, _DSC_SU_PARAMETER_SET_0_DSC0_B)
+#define   DSC_SU_PARAMETER_SET_0_SU_SLICE_ROW_PER_FRAME_MASK	REG_GENMASK(31, 20)
+#define   DSC_SU_PARAMETER_SET_0_SU_SLICE_ROW_PER_FRAME(rows)	REG_FIELD_PREP(DSC_SU_PARAMETER_SET_0_SU_SLICE_ROW_PER_FRAME_MASK, (rows))
+#define   DSC_SU_PARAMETER_SET_0_SU_PIC_HEIGHT_MASK		REG_GENMASK(15, 0)
+#define   DSC_SU_PARAMETER_SET_0_SU_PIC_HEIGHT(h)		REG_FIELD_PREP(DSC_SU_PARAMETER_SET_0_SU_PIC_HEIGHT_MASK, (h))
+
+#define _DSC_SU_PARAMETER_SET_0_DSC1_A		0x78164
+#define _DSC_SU_PARAMETER_SET_0_DSC1_B		0x78364
+#define DSC_SU_PARAMETER_SET_0_DSC1(pipe)	_MMIO_PIPE((pipe), _DSC_SU_PARAMETER_SET_0_DSC1_A, _DSC_SU_PARAMETER_SET_0_DSC1_B)
+
 #define _PR_ALPM_CTL_A	0x60948
 #define PR_ALPM_CTL(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _PR_ALPM_CTL_A)
 #define  PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU	BIT(6)
-- 
2.43.0

