Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04088606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 04:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c0AeISf0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16DD10F9AC;
	Wed, 28 Oct 2026 04:53:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F4510E17E;
 Wed, 28 Oct 2026 04:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793163219; x=1824699219;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=FQZUgC+1hqKC4hV+F7VQvkwpLt/NGPO0cTm/gJx/OpA=;
 b=c0AeISf04Lctkszl/cZeRB7a2vOJuh/i5NKt1dG76NQCGoIscvO3waYB
 IQQTnBqAwpBQrWvzxeetedBgEF7in9irRiXZVOTjCfMvgd/XzBBs1LGU9
 1pRnEGigd7QrYuplqVacz4ik7Lrkcf8uZjbtygb/y2apaQhWRQ9h7hGma
 fJ3H/unbJEbUAOukLL0uFFKKqjDDNpZ47CQrp20l84dx7P0x/VBGJGPGc
 7PsQFSF3pvsOqNRE7BmeGp114WmUs2uXDQCbr9D1vEGVz09+S3rzxwYyg
 z3xxpOQEll9J2aWdje0vR1fY4bfCFZ26RD2TGSXrWMK3Whaa2xc7R8X2c w==;
X-CSE-ConnectionGUID: h53GUvbKSSWdtEE0KxRdWg==
X-CSE-MsgGUID: RyPHHa6OT6WwIAPWrnnN5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1757329"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1757329"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 21:53:38 -0700
X-CSE-ConnectionGUID: VpuIZizSSG6jznhRiIk0CA==
X-CSE-MsgGUID: Lz38+MkMQbmkA8klZzwQ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4638264"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa007.jf.intel.com with ESMTP; 27 Oct 2026 21:53:36 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 28 Oct 2026 10:18:12 +0530
Subject: [PATCH v2 2/6] drm/i915/display: Add the DP link layer symbol
 timing generator registers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-vlk-64036-dp-symbol-tg-v2-2-43849c325d32@intel.com>
References: <20261028-vlk-64036-dp-symbol-tg-v2-0-43849c325d32@intel.com>
In-Reply-To: <20261028-vlk-64036-dp-symbol-tg-v2-0-43849c325d32@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 chaitanya.kumar.borah@intel.com, uma.shankar@intel.com, 
 suraj.kandpal@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the definitions of the registers of the DP link layer (LL) symbol
based timing generator.

Bspec: 68849, 68922, 69961
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index bbdbc27629d7104c1f80baad44e710872214d42b..678b21e38a193ad2afdb337d4b1bac77e791969f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -879,6 +879,7 @@
 #define   TRANSCONF_DSI_PLL_LOCKED		REG_BIT(29) /* vlv & pipe A only */
 #define   TRANSCONF_FRAME_START_DELAY_MASK	REG_GENMASK(28, 27) /* pre-hsw */
 #define   TRANSCONF_FRAME_START_DELAY(x)		REG_FIELD_PREP(TRANSCONF_FRAME_START_DELAY_MASK, (x)) /* pre-hsw: 0-3 */
+#define   TRANSCONF_DP_SYMBOL_TG_ENABLE		REG_BIT(28) /* xe3p+ */
 #define   TRANSCONF_PIPE_LOCKED			REG_BIT(25)
 #define   TRANSCONF_FORCE_BORDER			REG_BIT(25)
 #define   TRANSCONF_GAMMA_MODE_MASK_I9XX		REG_BIT(24) /* gmch */
@@ -930,6 +931,7 @@
 #define   TRANSCONF_DITHER_TYPE_TEMP		REG_FIELD_PREP(TRANSCONF_DITHER_TYPE_MASK, 3)
 #define   TRANSCONF_PIXEL_COUNT_SCALING_MASK	REG_GENMASK(1, 0)
 #define   TRANSCONF_PIXEL_COUNT_SCALING_X4	1
+#define   TRANSCONF_PIXEL_COUNT_SCALING_X1	3 /* xe3p+ */
 
 #define _PIPEASTAT		0x70024
 #define PIPESTAT(dev_priv, pipe)		_MMIO_PIPE2(dev_priv, pipe, _PIPEASTAT)
@@ -2332,6 +2334,49 @@
 #define _DP_MIN_HBLANK_CTL_B			0x610ac
 #define DP_MIN_HBLANK_CTL(trans)		_MMIO_TRANS(trans, _DP_MIN_HBLANK_CTL_A, _DP_MIN_HBLANK_CTL_B)
 
+/* DP link layer (LL) symbol based timing generator, display version 35+ */
+#define _TRANS_LLSYM_HACT_A			0x600dc
+#define _TRANS_LLSYM_HACT_B			0x610dc
+#define TRANS_LLSYM_HACT(trans) \
+	_MMIO_TRANS(trans, _TRANS_LLSYM_HACT_A, _TRANS_LLSYM_HACT_B)
+#define   TRANS_LLSYM_HACT_MASK			REG_GENMASK(14, 0)
+#define   TRANS_LLSYM_HACT_VAL(x)		REG_FIELD_PREP(TRANS_LLSYM_HACT_MASK, (x))
+
+#define _TRANS_LLSYM_HTOTAL_A			0x600e0
+#define _TRANS_LLSYM_HTOTAL_B			0x610e0
+#define TRANS_LLSYM_HTOTAL(trans) \
+	_MMIO_TRANS(trans, _TRANS_LLSYM_HTOTAL_A, _TRANS_LLSYM_HTOTAL_B)
+#define   TRANS_LLSYM_HTOTAL_MASK		REG_GENMASK(14, 0)
+#define   TRANS_LLSYM_HTOTAL_VAL(x)		REG_FIELD_PREP(TRANS_LLSYM_HTOTAL_MASK, (x))
+
+#define _TRANS_LLSYM_CHUNK_SIZE_A		0x600e4
+#define _TRANS_LLSYM_CHUNK_SIZE_B		0x610e4
+#define TRANS_LLSYM_CHUNK_SIZE(trans) \
+	_MMIO_TRANS(trans, _TRANS_LLSYM_CHUNK_SIZE_A, _TRANS_LLSYM_CHUNK_SIZE_B)
+#define   TRANS_LLSYM_CHUNK_SIZE_MASK		REG_GENMASK(11, 0)
+#define   TRANS_LLSYM_CHUNK_SIZE_VAL(x)		REG_FIELD_PREP(TRANS_LLSYM_CHUNK_SIZE_MASK, (x))
+
+/* Data M/N value DW0/DW1 at the base offset, DW2/DW3 in the _EXT register */
+#define _DP_LLSYM_DATAM_A			0x60024
+#define _DP_LLSYM_DATAM_B			0x61024
+#define DP_LLSYM_DATAM(trans, dw) \
+	_MMIO(_TRANS(trans, _DP_LLSYM_DATAM_A, _DP_LLSYM_DATAM_B) + 4 * (dw))
+
+#define _DP_LLSYM_DATAN_A			0x60038
+#define _DP_LLSYM_DATAN_B			0x61038
+#define DP_LLSYM_DATAN(trans, dw) \
+	_MMIO(_TRANS(trans, _DP_LLSYM_DATAN_A, _DP_LLSYM_DATAN_B) + 4 * (dw))
+
+#define _DP_LLSYM_DATAM_EXT_A			0x60470
+#define _DP_LLSYM_DATAM_EXT_B			0x61470
+#define DP_LLSYM_DATAM_EXT(trans, dw) \
+	_MMIO(_TRANS(trans, _DP_LLSYM_DATAM_EXT_A, _DP_LLSYM_DATAM_EXT_B) + 4 * (dw))
+
+#define _DP_LLSYM_DATAN_EXT_A			0x60478
+#define _DP_LLSYM_DATAN_EXT_B			0x61478
+#define DP_LLSYM_DATAN_EXT(trans, dw) \
+	_MMIO(_TRANS(trans, _DP_LLSYM_DATAN_EXT_A, _DP_LLSYM_DATAN_EXT_B) + 4 * (dw))
+
 /* SNB eDP training params */
 /* SNB A-stepping */
 #define  EDP_LINK_TRAIN_400MV_0DB_SNB_A		(0x38 << 22)

-- 
2.25.1

