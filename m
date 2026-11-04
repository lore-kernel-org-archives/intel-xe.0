Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A61606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 03:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fFIxMx5/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F6A10F997;
	Wed,  4 Nov 2026 03:30:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5B110F98F;
 Wed,  4 Nov 2026 03:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793763005; x=1825299005;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=8qkLJvfZvctJjQoyD/vfXOGdcRAdUk1HZj+ZYOhWNm0=;
 b=fFIxMx5/w/RE0ijkQojNC3TpxpdAZUHIMS1k0wBZ1SdE+UweWHodDBAV
 kB9fG9R3OnGRIO04OaNwImrzxL1m5UoDvlOxifHaDt8xkLkuL71Hu8XFE
 tEeXZjSFJpQGqLUeQomyXBqBPJ9QujUVcHR4y+TWiZDctrTniqJYf2upZ
 2+VDT4Eli726HEyRgbz/DcdfjysYeLRse6oMPCWls8MqMojAWQZmGjr71
 p5LtRyvUcdy0ntRbSa6spt25zECCG0yA4FLTyMINqjtXz8JbZg21KXco5
 7DRtcxfU07Jkhvs/ZZL82HGPEuQGMTK4GegklL3cuxfYMKkBvvi3qKEIx g==;
X-CSE-ConnectionGUID: cXJ20+1oROO2aBJFJRnvJA==
X-CSE-MsgGUID: YqZWE4NCRaCnKoWzzHGWpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2505300"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2505300"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 19:30:04 -0800
X-CSE-ConnectionGUID: 2x+wIMHAQAaQwZeMWynDNg==
X-CSE-MsgGUID: a92WS/y5QbybBwBLZumSsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7155632"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2026 19:30:01 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 04 Nov 2026 08:54:46 +0530
Subject: [PATCH v4 2/7] drm/i915/display: Add the DP link layer symbol
 timing generator registers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-vlk-64036-dp-symbol-tg-v4-2-d06fe6c466a9@intel.com>
References: <20261104-vlk-64036-dp-symbol-tg-v4-0-d06fe6c466a9@intel.com>
In-Reply-To: <20261104-vlk-64036-dp-symbol-tg-v4-0-d06fe6c466a9@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the definitions of the registers of the DP link layer (LL) symbol
based timing generator.

v3: change MMIO -> MMIO_TRANS2 (Suraj)

Bspec: 68849, 68922, 69961
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index bbdbc27629d7104c1f80baad44e710872214d42b..1a7badeb327977916c85ce88327ec496623d787b 100644
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
@@ -2332,6 +2334,42 @@
 #define _DP_MIN_HBLANK_CTL_B			0x610ac
 #define DP_MIN_HBLANK_CTL(trans)		_MMIO_TRANS(trans, _DP_MIN_HBLANK_CTL_A, _DP_MIN_HBLANK_CTL_B)
 
+/* DP link layer (LL) symbol based timing generator, display version 35+ */
+#define _TRANS_LLSYM_HACT_A			0x600dc
+#define TRANS_LLSYM_HACT(display, trans) \
+	_MMIO_TRANS2(display, trans, _TRANS_LLSYM_HACT_A)
+#define   TRANS_LLSYM_HACT_MASK			REG_GENMASK(14, 0)
+#define   TRANS_LLSYM_HACT_VAL(x)		REG_FIELD_PREP(TRANS_LLSYM_HACT_MASK, (x))
+
+#define _TRANS_LLSYM_HTOTAL_A			0x600e0
+#define TRANS_LLSYM_HTOTAL(display, trans) \
+	_MMIO_TRANS2(display, trans, _TRANS_LLSYM_HTOTAL_A)
+#define   TRANS_LLSYM_HTOTAL_MASK		REG_GENMASK(14, 0)
+#define   TRANS_LLSYM_HTOTAL_VAL(x)		REG_FIELD_PREP(TRANS_LLSYM_HTOTAL_MASK, (x))
+
+#define _TRANS_LLSYM_CHUNK_SIZE_A		0x600e4
+#define TRANS_LLSYM_CHUNK_SIZE(display, trans) \
+	_MMIO_TRANS2(display, trans, _TRANS_LLSYM_CHUNK_SIZE_A)
+#define   TRANS_LLSYM_CHUNK_SIZE_MASK		REG_GENMASK(11, 0)
+#define   TRANS_LLSYM_CHUNK_SIZE_VAL(x)		REG_FIELD_PREP(TRANS_LLSYM_CHUNK_SIZE_MASK, (x))
+
+/* Data M/N value DW0/DW1 at the base offset, DW2/DW3 in the _EXT register */
+#define _DP_LLSYM_DATAM_A			0x60024
+#define DP_LLSYM_DATAM(display, trans, dw) \
+	_MMIO_TRANS2(display, trans, _DP_LLSYM_DATAM_A + (dw) * 4)
+
+#define _DP_LLSYM_DATAN_A			0x60038
+#define DP_LLSYM_DATAN(display, trans, dw) \
+	_MMIO_TRANS2(display, trans, _DP_LLSYM_DATAN_A + (dw) * 4)
+
+#define _DP_LLSYM_DATAM_EXT_A			0x60470
+#define DP_LLSYM_DATAM_EXT(display, trans, dw) \
+	_MMIO_TRANS2(display, trans, _DP_LLSYM_DATAM_EXT_A + (dw) * 4)
+
+#define _DP_LLSYM_DATAN_EXT_A			0x60478
+#define DP_LLSYM_DATAN_EXT(display, trans, dw) \
+	_MMIO_TRANS2(display, trans, _DP_LLSYM_DATAN_EXT_A + (dw) * 4)
+
 /* SNB eDP training params */
 /* SNB A-stepping */
 #define  EDP_LINK_TRAIN_400MV_0DB_SNB_A		(0x38 << 22)

-- 
2.25.1

