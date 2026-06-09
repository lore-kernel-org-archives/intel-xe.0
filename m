Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F04CD8CA7
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 09:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B79610E1F1;
	Tue,  9 Jun 2026 09:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgApDjnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77FD10E1F1;
 Tue,  9 Jun 2026 09:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780998939; x=1812534939;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aJxDu/1qeId6/66KDDIob8xvs8ZGO7w6kvdidhpQuBs=;
 b=dgApDjnjJujupeKYZzPgLjMz51usbjvRLgavsSZfyxN+AscDF5uYOJ2L
 1YJAKrKYzczhnfccI5cPzQ1HckER1UOdH9Ik3bEdol5Zh0G2VsB1LI8ui
 6blEvjnXsLzWO2GiXEUr2j7LCk8C5PMlY2NBOJBffotuP2RSGwLU1zues
 Z9O35YVuelr3OoEDtu7Eb44O2JjBKEIwQ28uWB2EuWobXpzYvefhhWasI
 TMy3FR373AQhS3h426XH55olje6U2GjPP7WMy+9N1Uk5w8VM6hblyxglk
 VgX5+K8pI402sEsma60IABGS26qlno2eM3rbQtxbaw1ngBXUrEak0HwLH w==;
X-CSE-ConnectionGUID: liNVKW6KS4+/lB8jAd4lGg==
X-CSE-MsgGUID: wEw40MmaSXGMXbRlhX1HLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81759153"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81759153"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 02:55:39 -0700
X-CSE-ConnectionGUID: HL1HsNHoS+WVgXvS3K+c9g==
X-CSE-MsgGUID: cagrvKTeQOeD7fzWkSCrLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="250898082"
Received: from amilburn-desk.amilburn-desk (HELO hazy.intel.com)
 ([10.245.245.108])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 02:55:36 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 0/4] drm/i915/display: harden some bit-shifting operations
Date: Tue,  9 Jun 2026 12:52:35 +0300
Message-ID: <20260609095525.570614-1-luciano.coelho@intel.com>
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

In v6:
   * Fixed the placement of a parenthesis (Co-Pilot -- GPT 5.5).

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

