Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0129CD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 08:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1C910E18A;
	Tue,  9 Jun 2026 08:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAC1Smdp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA5D10E18A;
 Tue,  9 Jun 2026 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780993264; x=1812529264;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zkVa0noFTZdsK8GQMp2rtNbrtJ7kVXTGubPY7IV0iYE=;
 b=PAC1SmdpgCpWKtXpu2q20NpaZKC/BTYX203i8iDCUB9zonXbyzUloxx/
 1PjGO2e0vay0DArE+cez4HeLYL25t3c1ukBF65yZgjzd6UqcQ9KEoHzG6
 3fq4ilp0GQ5dwKVAVeKLtvHQJSOupRBbl82Se1YX6Jx6AzXyze9l32YFE
 WSV5N8/lxVML3fgLChsA5k7QWh+VsIRO8ja9VL4JJj0W61EfntM6FjgjA
 +yCOWp5ne18bPh2gwK9UmpDXgTS4lF9RBc4DNAQlA7UtuawrYCg0bg5j8
 YJV9DEB2gpPiTCl0X6aP0wESsd3W8mUxljJ/LWJyNr3XVf0QZwgebui+b g==;
X-CSE-ConnectionGUID: tPvoyHFySku3gPPoTKYm4Q==
X-CSE-MsgGUID: jsqy49LSQ1CdQgIa52DOAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81494376"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81494376"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:21:04 -0700
X-CSE-ConnectionGUID: cVur3zQ7TwSHTQ1V3bU82g==
X-CSE-MsgGUID: 0AGYM3g4T0SPULPbCbP7sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="245647598"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.95])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:21:03 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/4] drm/i915/display: harden some bit-shifting operations
Date: Tue,  9 Jun 2026 11:19:50 +0300
Message-ID: <20260609082040.524725-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
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

Hi,

This patchset addresses a number of potential undefined behaviors in
bit-shifting operations where the shift amount is derived from an enum
that can in theory hold a negative value (e.g. INVALID_TRANSCODER,
PHY_NONE), as reported by static analyzers.

None of these are actual problems with the current implementation,
because the values are always valid when the code is reached, but
it's more robust to make the shifts always well-defined.

In v2:
   * Use REG_* helpers instead of BIT with casting (Jani);
   * Remove unnecessary PHY_NULL, instead of casting it (Jani).

In v3:
   * Fixed small whitespace damage (Jani).

In v4:
   * Fixed missing whitespace after if (patchwork).

In v5:
   * Just rebased.

Please review.

Cheers,
Luca.


Luca Coelho (4):
  drm/i915/display: harden masks in HSW_AUD_PIN_ELD_CP_VLD macros
  drm/i915/display: harden shifts in ICL_DPCLKA_CFGCR0_DDI_CLK_SEL
    macros
  drm/i915/display: harden shift in intel_ddi_compute_config_late()
  drm/i915/display: remove unnecessary PHY_NONE definition

 drivers/gpu/drm/i915/display/intel_audio_regs.h  | 16 ++++++++++++----
 drivers/gpu/drm/i915/display/intel_ddi.c         |  4 ++--
 drivers/gpu/drm/i915/display/intel_display.c     | 10 ++++++----
 drivers/gpu/drm/i915/display/intel_display.h     |  2 --
 .../drm/i915/display/intel_display_power_well.c  |  6 +++++-
 .../gpu/drm/i915/display/intel_display_regs.h    | 16 +++++++++++++---
 drivers/gpu/drm/i915/display/intel_hti.c         |  3 ---
 7 files changed, 38 insertions(+), 19 deletions(-)

-- 
2.53.0

