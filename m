Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C79ACC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 10:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53C310E95D;
	Wed, 14 Oct 2026 10:53:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2F810E642;
 Wed, 14 Oct 2026 10:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791975190; x=1823511190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N0yCXLOfx8UqIc2EAnNyr8QgKUeXH0nZ6JINJHhdTJo=;
 b=lPAUQNZW0Ev18S8JDJCb1J7HcLKratDLQsniJ1ViPCsHhdmFgGebXZsZ
 glAFX5wROjbPvmtJHo2yqkShVBoLiSzGDSaPT5ag3IaHLmdX+R7ew+acW
 FcqoUvvzv8fQe3r1q4l2jqw2r7UE9ycuqTJzfLOCiuV/3foYcTSgjzYM8
 TIwkEuAQq/v5KFNPlr7lm+HME/4MVZUReE/8WjvcLYwSmP9LlL8u+O4Up
 Xt8LBqlvAQJzWuQcKDr2rL3grsfiNOU/Hd/O1Q071edq+Ian8NwEhunuM
 YNX1PuAdJcnVABD2rvG/qCP4wi7C57X9JIn9pLXdxlmyJsuskzL3cN2Xn A==;
X-CSE-ConnectionGUID: y+eboueiRtii5/Thi4RSgg==
X-CSE-MsgGUID: AuKV5HTFRCe4a9e/e4+Q7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="596790"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="596790"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:53:10 -0700
X-CSE-ConnectionGUID: vO7xVtAGRROjz768GOJ/hQ==
X-CSE-MsgGUID: FqPingNCTD2nGfhe+kBeFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1416915"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 14 Oct 2026 03:53:08 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 0/4] Move the PLL power save W/A to the display W/A
 framework
Date: Wed, 14 Oct 2026 10:53:02 +0000
Message-ID: <20261014105306.2761683-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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

This is v2 of [1], with the following changes
- apply WA to all ports with C10 phy connected. With this change
  the WCL with C10 phy on both ports A and B is now supported.

[1] https://lore.kernel.org/intel-xe/20261009103552.1864818-1-mika.kahola@intel.com/

Mika Kahola (4):
  drm/i915/dpll: move the PLL power save W/A to the display W/A
    framework
  drm/i915/lt_phy: split out intel_lt_phy_pll_calc_state_from_table()
  drm/i915/lt_phy: drop the unused pll argument from
    intel_lt_phy_pll_enable()
  drm/i915/lt_phy: apply the PLL power save W/A on LT PHY platforms

 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |  60 ++++------
 drivers/gpu/drm/i915/display/intel_cx0_phy.h  |   2 +-
 .../drm/i915/display/intel_display_reset.c    |   4 +-
 .../gpu/drm/i915/display/intel_display_wa.c   |   2 +
 .../gpu/drm/i915/display/intel_display_wa.h   |   1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  34 +++++-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h |   1 +
 drivers/gpu/drm/i915/display/intel_lt_phy.c   | 103 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |   2 +-
 9 files changed, 136 insertions(+), 73 deletions(-)

-- 
2.43.0

