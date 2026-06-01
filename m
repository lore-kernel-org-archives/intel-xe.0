Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7756CCD6E60
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 08:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A972112F68;
	Mon,  1 Jun 2026 08:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8CtJI37";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A19B112F58;
 Mon,  1 Jun 2026 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780301871; x=1811837871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uv5EKULOjPW/H7yp4qPt6z/iYDrM0237db1gQ0hzwl4=;
 b=R8CtJI37F7mz5hOjMZX8TP5VQlbwS6RL9w2L9CX/V840KZwQAUnfLg2+
 GedRKZ0PwqFKhH1rOrnccq43nubQFC6v2dg9olp47DVMnNq4Hh+04ljit
 HwhbUfTtZ+uRqUJfUVygOuwU3NZXInZiEeSWBQUNjshayBF6s31WmJeAd
 9Rru1YPfgMXRE7e7Ii87JxdCH9AlhKTG7O8OCGSNzma2CtkB1yzjpps6Z
 8Ms3MgBC8yjx/lhmmrBud0t9dJ/KQ18lcL0mJLglAHIhFRlIXNxVfssJB
 qAlHttQePXX9Yq6dRRyV1u2UGsEIPcMwjmAcp26OcBzSVRczFgjIBBQn8 g==;
X-CSE-ConnectionGUID: lKp3pfKZSi+ak5yCK7mgYg==
X-CSE-MsgGUID: zARXe1QmRCCxU2CD2hiypQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80786180"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="80786180"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:17:41 -0700
X-CSE-ConnectionGUID: i20eZ74tTtaG+uBu+J6zuA==
X-CSE-MsgGUID: dlpGizfcSW+GB8sdAxZuyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="248602092"
Received: from abityuts-desk.ger.corp.intel.com (HELO hazy) ([10.245.245.124])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 01:17:40 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v4 0/4] drm/i915/display: harden some bit-shifting operations
Date: Mon,  1 Jun 2026 11:14:31 +0300
Message-ID: <20260601081730.3146922-1-luciano.coelho@intel.com>
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

