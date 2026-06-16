Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16047CD98EC
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DF910EB22;
	Tue, 16 Jun 2026 12:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZcLc5Eu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1A310EB22;
 Tue, 16 Jun 2026 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613950; x=1813149950;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3BEEp+Rv1If5988oNCx39cjzwY0N4AytafD+2OwRDMk=;
 b=JZcLc5EusHUWLRmxG8OG5DI8olNAkrGxzBUz/6yzem+R7rG7sytv64mG
 V984+pSgpnydWK1LCu7iNvdlhyI97H4NOqrx59z8CvQUmKBHGIuXx/mCW
 MuHjuQ6w3VFnatgY65cAnfv2smHaN/s52U4QrkMOvNMT+go5+uFCFyT5X
 xJj1GAHHejZUPiB3RbdaUX4ixb5h/wz9J/PqgEhjEFKj4OlDT76DfIvBK
 nLW2z/D/TxVvaHQdsCGcm45U9DqA85+z0e+TU++adtNkXpyN0YsyyNvAU
 GRxN30YmE4wEgaUiSaja0fxeCviXOum4/UOfDkJQsksrfpD1DFcnmcHeN g==;
X-CSE-ConnectionGUID: MgfNvg1nQHuTFFZQ8TcRSw==
X-CSE-MsgGUID: 623Og1NZQqibdQdfhxSSgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513265"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:49 -0700
X-CSE-ConnectionGUID: 6XIi/MvNQqG88ltigIH34A==
X-CSE-MsgGUID: vmg+X0N0TC+gTaeGfKicdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876342"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:48 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 25/39] drm/i915/display: Use FIELD_PREP() for DC state enable
 bits
Date: Tue, 16 Jun 2026 18:14:01 +0530
Message-ID: <20260616124416.2442161-26-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

Replace open-coded shifts with REG_GENMASK() and REG_FIELD_PREP()
for the DC state enable field.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 01f6a88fd1a7..2255d9d31ca4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -3075,11 +3075,12 @@ enum skl_power_gate {
 #define  DC_STATE_DC3CO_STATUS		REG_BIT(29)
 #define  HOLD_PHY_CLKREQ_PG1_LATCH	REG_BIT(21)
 #define  HOLD_PHY_PG1_LATCH		REG_BIT(20)
-#define  DC_STATE_EN_UPTO_DC5		(1 << 0)
 #define  DC_STATE_EN_DC9		(1 << 3)
-#define  DC_STATE_EN_UPTO_DC6		(2 << 0)
-#define  DC_STATE_EN_UPTO_DC3CO	(3 << 0)
-#define  DC_STATE_EN_UPTO_DC3CO_DC5_DC6_MASK   0x3
+#define  DC_STATE_EN_UPTO_DC3CO_DC5_DC6_MASK	REG_GENMASK(1, 0)
+#define  DC_STATE_EN_DISABLE		REG_FIELD_PREP(DC_STATE_EN_UPTO_DC3CO_DC5_DC6_MASK, 0)
+#define  DC_STATE_EN_UPTO_DC5		REG_FIELD_PREP(DC_STATE_EN_UPTO_DC3CO_DC5_DC6_MASK, 1)
+#define  DC_STATE_EN_UPTO_DC6		REG_FIELD_PREP(DC_STATE_EN_UPTO_DC3CO_DC5_DC6_MASK, 2)
+#define  DC_STATE_EN_UPTO_DC3CO	REG_FIELD_PREP(DC_STATE_EN_UPTO_DC3CO_DC5_DC6_MASK, 3)
 
 #define  DC_STATE_DEBUG                  _MMIO(0x45520)
 #define  DC_STATE_DEBUG_MASK_CORES	(1 << 0)
-- 
2.43.0

