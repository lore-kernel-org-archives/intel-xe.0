Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88400CD6E44
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 09:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FCF10EEEB;
	Thu, 28 May 2026 09:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fO91w4mO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DE910EEEA;
 Thu, 28 May 2026 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779960753; x=1811496753;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0C7X3BVLwfv63u1tBUC3yfySdtWkeeEjMd0J4VA1QD8=;
 b=fO91w4mOX0AS+RVusgn0KD/bqeEokoAQZ4jDA5R9rqa7RcfZCdykQDNx
 v9KTrZre5Sh8b8J27RDm1jt6mnrOaJSbtqGs8AVxAAr5vKqMnQE18COIR
 64yTiVnOLccQYhA9IjMZtBg2B9MTj8+wVn6l1IdFbf+wG5rvun+rFOU7X
 4j2Yb5PnVEX2HmP1RqrfDU8HbP5Rvdln/qazeyikgN4BZtPrZli7BqW+Z
 c4Q7Sg/30g/RoHtzRVIx0rtEWoeM4M/QqBr9rkE9wE++7E9Prjtljcf/G
 io6qr3vd9VthvfShv+m+ruWBsXYM9SPOHpDnjBkl6vNP5j2iGnqnqVswX g==;
X-CSE-ConnectionGUID: 9TRmBcwTSBOjhR+1yHGlIA==
X-CSE-MsgGUID: 6+C+26ixSe+fPGFTWDRNUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84426931"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="84426931"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 02:32:33 -0700
X-CSE-ConnectionGUID: IRstBe8qRwSlIw2ZwHpkiw==
X-CSE-MsgGUID: jBiJyx9XQSG82yVgD/58SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="242352057"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO hazy) ([10.245.245.229])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 02:32:31 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v2 0/4] drm/i915/display: harden some bit-shifting operations
Date: Thu, 28 May 2026 12:30:24 +0300
Message-ID: <20260528093222.2758007-1-luciano.coelho@intel.com>
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

