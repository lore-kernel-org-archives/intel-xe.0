Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E3DCD6E60
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 07:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EBD112F33;
	Mon,  1 Jun 2026 07:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LunyOzo+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA6E112F33;
 Mon,  1 Jun 2026 07:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780300623; x=1811836623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yan7m+zw1nZOT3rkZ8h216TC+7RlXY9NJCUSqvN3nkA=;
 b=LunyOzo+O/C6+vGWUcBCxrnJy6p79mbLsx05XovjxHgoW/cXHW9GgE43
 YzkXtp+ta7sCTDX4Psy31FBe2vnHdLcQeKOL2dS/+pKtBKQ3LTsdbCNcA
 pvxOvoBmwJEpMdrYvU/dtWR5inEtbgVUBr68Bg9K1E1yBAPw/RlfCIlUY
 ovUUA+GZKqx3Kdp+8npxnrx6eNtEEyhYlvsvYrN4uz/Jzdam0gflh7q51
 sDGIS5jhnY0jaN7M0pRIdHi4VrIKUQmZpNzyVb4zjjXIjb+n3Y2lMhU6T
 d7hMKawiqEvZ8DWnUwAtquSFGhpQIIOkFP4+CB8DoVVawBcHsNyoMXbD5 Q==;
X-CSE-ConnectionGUID: yVgss1AeTEq0y/ecJKqFgA==
X-CSE-MsgGUID: E1gdVbA8RoO/O7EP04nCWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="84941084"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="84941084"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 00:56:43 -0700
X-CSE-ConnectionGUID: p7f89NHFTrGXGQWfOEak+w==
X-CSE-MsgGUID: vza47xwZT8+BjnqhrdVXng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="243601786"
Received: from abityuts-desk.ger.corp.intel.com (HELO hazy) ([10.245.245.124])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 00:56:41 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v3 0/4] drm/i915/display: harden some bit-shifting operations
Date: Mon,  1 Jun 2026 10:55:52 +0300
Message-ID: <20260601075631.3102348-1-luciano.coelho@intel.com>
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

