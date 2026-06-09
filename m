Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65E5CD8CA4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 09:55:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D8E10E202;
	Tue,  9 Jun 2026 09:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYbPrvbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C611810E1FD;
 Tue,  9 Jun 2026 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780998941; x=1812534941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JXF9GFBpyw0W1WSDTg+1dKwD/Z7X7hsvaa+/WRD35QQ=;
 b=KYbPrvbK8jEHgyFFD5sJ/qVm8MtpRZQ4mPiGZKo+ET/6UB7KvfvF6pa3
 Q9K+4RwhR5QCNDPg/EcoJtGFzRFvZZjpYaa2F3lI7dCIUmObvOqsVo9jw
 b5f8BTV5NRbZSw8aWVBbZB+E/U3nIC4ACZpRrU8YjcOdxqosFQVQQyn62
 XCirUN5kayh9mG4AikW68NLKC8Ci2TQlxgDWwluJ4uRAuS/XUPwQ+mxQp
 N54v3OOfUbE8fAX0zemdh2I1uuF4eGzlK8ATX/ROp55Qm8KiuYZhnKz/S
 PDB7BGxIvoWpH/3fL0cSA4EGWaMGUk78ltLiSPJ/dxPLp+nT/KQdbi6Mn g==;
X-CSE-ConnectionGUID: lxe0xgecTf2fEp80LVVaYQ==
X-CSE-MsgGUID: jybpcEFoQfyoHwqgbROmoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81759162"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81759162"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 02:55:41 -0700
X-CSE-ConnectionGUID: R7UmXi7iRmiERrvvXBPLDQ==
X-CSE-MsgGUID: VqMIgWLeQYGK3U0P8567Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="250898083"
Received: from amilburn-desk.amilburn-desk (HELO hazy.intel.com)
 ([10.245.245.108])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 02:55:38 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 1/4] drm/i915/display: harden masks in
 HSW_AUD_PIN_ELD_CP_VLD macros
Date: Tue,  9 Jun 2026 12:52:36 +0300
Message-ID: <20260609095525.570614-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609095525.570614-1-luciano.coelho@intel.com>
References: <20260609095525.570614-1-luciano.coelho@intel.com>
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

HSW_AUD_PIN_ELD_CP_VLD has a 4-bit field per transcoder for
TRANSCODER_A..TRANSCODER_D only (bits 0..15).  Any other transcoder
value (TRANSCODER_EDP, TRANSCODER_DSI_*, INVALID_TRANSCODER) is not
valid here.

This is not a problem with the current implementation, because trans
is always valid when these macros are called, but it's more robust to
mask the index to the low 2 bits so the shift is always well-defined.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio_regs.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio_regs.h b/drivers/gpu/drm/i915/display/intel_audio_regs.h
index 4c31844d21df..f3d2a99c03d0 100644
--- a/drivers/gpu/drm/i915/display/intel_audio_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_audio_regs.h
@@ -109,12 +109,20 @@
 #define _HSW_AUD_EDID_DATA_B		0x65150
 #define HSW_AUD_EDID_DATA(trans)	_MMIO_TRANS(trans, _HSW_AUD_EDID_DATA_A, _HSW_AUD_EDID_DATA_B)
 
+/*
+ * HSW_AUD_PIN_ELD_CP_VLD has a 4-bit field per transcoder for
+ * TRANSCODER_A..TRANSCODER_D only (bits 0..15).  Any other transcoder
+ * value (TRANSCODER_EDP, TRANSCODER_DSI_*, INVALID_TRANSCODER) is not
+ * valid here.  Mask the index to the low 2 bits so the shift is
+ * always well-defined.
+ */
 #define HSW_AUD_PIPE_CONV_CFG		_MMIO(0x6507c)
 #define HSW_AUD_PIN_ELD_CP_VLD		_MMIO(0x650c0)
-#define   AUDIO_INACTIVE(trans)		((1 << 3) << ((trans) * 4))
-#define   AUDIO_OUTPUT_ENABLE(trans)	((1 << 2) << ((trans) * 4))
-#define   AUDIO_CP_READY(trans)		((1 << 1) << ((trans) * 4))
-#define   AUDIO_ELD_VALID(trans)	((1 << 0) << ((trans) * 4))
+#define   __AUDIO_TRANS_SHIFT(trans)	(((trans) & 0x3) * 4)
+#define   AUDIO_INACTIVE(trans)		REG_BIT(__AUDIO_TRANS_SHIFT(trans) + 3)
+#define   AUDIO_OUTPUT_ENABLE(trans)	REG_BIT(__AUDIO_TRANS_SHIFT(trans) + 2)
+#define   AUDIO_CP_READY(trans)		REG_BIT(__AUDIO_TRANS_SHIFT(trans) + 1)
+#define   AUDIO_ELD_VALID(trans)	REG_BIT(__AUDIO_TRANS_SHIFT(trans))
 
 #define _AUD_TCA_DP_2DOT0_CTRL		0x650bc
 #define _AUD_TCB_DP_2DOT0_CTRL		0x651bc
-- 
2.53.0

