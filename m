Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C97F54ACA
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 14:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BD010E665;
	Tue, 24 Mar 2026 14:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoIsT12H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9632B10E6E9;
 Tue, 24 Mar 2026 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774362894; x=1805898894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5qtHBg2ptzhbS9IaXrlG5ptez/5+6eluYPoHl3XBg0E=;
 b=PoIsT12He17C+MDfgbsvmY5I741Hh1T1MUR99AB2m+8+Bk8/G+J86XHU
 P1MmpXBoH3YyGur8hWd2bmA+aTe0Wt4Iml3v24904hgIdc1g6iRs+fdl7
 D0i9mDsZfvzJ+TYtO7e6Sq7uKY8ZgPXsxdRUdZBD7LZKCHPYIBs95Hid7
 IuDh4xOIb6OmyDuAn8VkmSAqTDOs0auVhTrPdJtwSL894wtLDabmgSXAC
 oUreTaM7PptxP2PXO/kiB2f7/Q5zOqpDEM2JGsRWzgdxNtRGvsF/FT5K6
 IltCdcXqp0VTV5inytBFi57QQXuFgufx9vMzga/atzW9jIs8btr3zjRsP g==;
X-CSE-ConnectionGUID: RZJy0jPXTpKASNrIgxeb3w==
X-CSE-MsgGUID: Q7xByLL8SlKv1YHMsxGEhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75405176"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75405176"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:34:54 -0700
X-CSE-ConnectionGUID: 7qlCfKhMQniahUM9pZhI/g==
X-CSE-MsgGUID: kpbVwiNnSpmi+Z5V4nDvaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228843243"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.170])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:34:52 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH 8/8] drm/i915: remove HAS_PCH_NOP() dependency from clock
 gating
Date: Tue, 24 Mar 2026 16:29:57 +0200
Message-ID: <20260324143420.310800-9-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324143420.310800-1-luciano.coelho@intel.com>
References: <20260324143420.310800-1-luciano.coelho@intel.com>
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

intel_pch_init_clock_gating() already handles unsupported PCH types,
including PCH_NOP, by doing nothing.

Drop the explicit HAS_PCH_NOP() check from the IVB clock gating
path and always call the display helper directly. This removes one
more direct dependency on display-side PCH macros from
intel_clock_gating.c.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/intel_clock_gating.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 98c048387a0a..6a5254e02ddf 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -287,8 +287,7 @@ static void ivb_init_clock_gating(struct drm_i915_private *i915)
 	intel_uncore_rmw(&i915->uncore, GEN6_MBCUNIT_SNPCR, GEN6_MBC_SNPCR_MASK,
 			 GEN6_MBC_SNPCR_MED);
 
-	if (!HAS_PCH_NOP(display))
-		intel_pch_init_clock_gating(display);
+	intel_pch_init_clock_gating(display);
 
 	gen6_check_mch_setup(i915);
 }
-- 
2.53.0

