Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063C0CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 08:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74C5112F66;
	Mon,  1 Jun 2026 08:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtglJIX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FA4112F58;
 Mon,  1 Jun 2026 08:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780301871; x=1811837871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JXF9GFBpyw0W1WSDTg+1dKwD/Z7X7hsvaa+/WRD35QQ=;
 b=YtglJIX2PkUFTFSvQqymAFSYX8XscQnGFno/gzuY95+Ztjokey2Bv5Gc
 cKmbqvZICQog+IcxZ5E++Z/I1bC4E+WZksimOheuHdWh74phk5rMAlbYk
 i/Fq/V8InHGho/+5zF5ea/EJuvi1/bq0GjRxq2q6Xu7ai7xc7woM2JpJO
 C/jneXEIrAySk4CfxPEfgcIXideaJEqI2/UKtBN3X4Yyx79syvChsa6AA
 uvZTq6o/FawQrr8jIdvkMsFC/L6mrMULHeWaev2jI+FR4GFnGs3xRSDLS
 9HnrNueOPhT2ERjY3qvsIvPtjIM4KYGa6g0G+2aC//fevvA7WkxiN/7zk g==;
X-CSE-ConnectionGUID: OAaaLmRkQZuziSRAn1Lw2g==
X-CSE-MsgGUID: HFP/DckBQ7KqokoKYBUapg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80786185"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="80786185"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:17:42 -0700
X-CSE-ConnectionGUID: 8b/C3keMThyz33d4r9BK8g==
X-CSE-MsgGUID: C/myh6F/SlSG6FVEIRU3Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="248602100"
Received: from abityuts-desk.ger.corp.intel.com (HELO hazy) ([10.245.245.124])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 01:17:41 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v4 1/4] drm/i915/display: harden masks in
 HSW_AUD_PIN_ELD_CP_VLD macros
Date: Mon,  1 Jun 2026 11:14:32 +0300
Message-ID: <20260601081730.3146922-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601081730.3146922-1-luciano.coelho@intel.com>
References: <20260601081730.3146922-1-luciano.coelho@intel.com>
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

