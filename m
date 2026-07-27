Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99133C53219
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 22:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D58B10E4E2;
	Mon, 27 Jul 2026 22:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ke78F1wr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4F110E4D0;
 Mon, 27 Jul 2026 22:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785190930; x=1816726930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=alMnTNUZUgfzVpDM5p1voNPlMHJO4EDiJPuk0pS+2NA=;
 b=ke78F1wrNGJvZuI3p38USCOAB/1Z3Kgha93Q6pccbCiZ8FpdfSuz0xfY
 pjWmYJ3o7vk5Fcr9R/VYA+Vwy3H0divIiNPZhx+Rv8Xnh8IiZpP+RPrkd
 GK8CphcJxRx2YFw0dATE9orhtf2P7v+C8pIAJQ5Ke/l/nrje72Lytk5Io
 Xi4PRgeObySKthCdssUVnLCBZCZKJXl9/MwMOLkA3WYN7L7DBuff+0rGc
 VeQvLC0fPLWwQTo1SJ+OfgTCBtG3dstTbkBM2iNd474wWrvJz/AVgo9+d
 gi75Lub+c1eEr+DU1JcyEEqiyJ6sUJsMJX4KPxEWcVYD0dwSxXnBas9Fm w==;
X-CSE-ConnectionGUID: xiQRx5NDTdqW6SmVM0pFSQ==
X-CSE-MsgGUID: YcJ+4bwMSXSQQd1x86quKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85781806"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="85781806"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 15:22:10 -0700
X-CSE-ConnectionGUID: vLFjtD3gQoGfEPxEGVKg9g==
X-CSE-MsgGUID: HeqOEVdbRBG9UfiFZusBPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="256167310"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP; 27 Jul 2026 15:22:07 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 1/2] drm/i915/display: fix SKL_DSSM register masks
Date: Tue, 28 Jul 2026 00:21:24 +0200
Message-ID: <20260727222125.2459634-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260727222125.2459634-1-michal.grzelak@intel.com>
References: <20260727222125.2459634-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Add indentation into SKL_DSSM reference clock macros. Replace bit shifts
with REG_GENMASK().

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 0f5018482497..0677ca2dde00 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1779,10 +1779,10 @@
 #define   XE2LPD_DE_CAP_SCALER_SINGLE	1
 
 #define SKL_DSSM				_MMIO(0x51004)
-#define ICL_DSSM_CDCLK_PLL_REFCLK_MASK		(7 << 29)
-#define ICL_DSSM_CDCLK_PLL_REFCLK_24MHz		(0 << 29)
-#define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
-#define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
+#define   ICL_DSSM_CDCLK_PLL_REFCLK_MASK	REG_GENMASK(31, 29)
+#define   ICL_DSSM_CDCLK_PLL_REFCLK_24MHz	0
+#define   ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	REG_GENMASK(29, 29)
+#define   ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	REG_GENMASK(30, 29)
 
 /*GEN11 chicken */
 #define _PIPEA_CHICKEN				0x70038
-- 
2.45.2

