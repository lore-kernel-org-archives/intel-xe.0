Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A7F606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 04:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=heUTDnbM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EEB10F98C;
	Wed, 28 Oct 2026 04:53:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0517210E1DE;
 Wed, 28 Oct 2026 04:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793163214; x=1824699214;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=xBHwl4P8mqdK6km3R+rEMNGuE23FAz+kLJZj1Qn20v0=;
 b=heUTDnbMpUBnYHRYI2GIgVx0XhtK+LKMPQexeXF+9lQu3jIPNdom/eIz
 wGzZ+rl5uQiDKeT7NDHSyFxuR+8GRC8eXKh0HcU10GZG9Z0UupQTgr10w
 draXvP3rSQoG0GGdSp+4X9q+iD1+GeYWEELyjTjidSlKfQEuKZkDwRhdN
 4Tg20B3vYXJmx9MAYfyk1pXZ9tAT5TrQgFbKGJyhJZx6LIhVxLTntrDSM
 drgVQzr049JounT8hC67zc8zMKaTLnpqZVPCQO2nKQlIglvl3shETJ1OC
 Dwz9uTjMP2sZPUtA6iEavmyKJ4fWrjgYE2HQvr6JuNd7OPs1sX/PtQe+1 Q==;
X-CSE-ConnectionGUID: JAuKMfjaTfmhKUioKUT49g==
X-CSE-MsgGUID: nSoP6Me/R+m/fYopQ5tAJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1757316"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1757316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 21:53:34 -0700
X-CSE-ConnectionGUID: VngUO47URrKqF2tby+kRaA==
X-CSE-MsgGUID: ze2/tEDfRwacWbk5fq8PgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4638228"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa007.jf.intel.com with ESMTP; 27 Oct 2026 21:53:31 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v2 0/6] drm/i915/dp: Add support for the DP symbol based
 timing generator
Date: Wed, 28 Oct 2026 10:18:10 +0530
Message-Id: <20261028-vlk-64036-dp-symbol-tg-v2-0-43849c325d32@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIt+4WoC/4WNQQ6CMBBFr0Jm7Zgy1mJceQ/DQtoBJgIlLWkkh
 LtbuYDL95L//gaRg3CEe7FB4CRR/JSBTgXY/jV1jOIyAykypaIK0/BGo9XFoJsxrmPjB1w6dBV
 ZTUS3q2HI4zlwK58j/Kwz9xIXH9bjJ5U/+zeZSlRotWk1N62p2D1kWng4Wz9Cve/7FxzbhR28A
 AAA
X-Change-ID: 20261027-vlk-64036-dp-symbol-tg-d72c4222856e
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

Xe3p adds a DP link layer (LL) symbol based timing generator, as an
alternative to the pixel clock based one. It generates the transcoder
timings in LL symbol cycles instead of pixels, which makes the per-line
symbol insertion for 8b/10b MST and 128b/132b SST/MST compliant with
the DP 2.1 hblank symbol cycle count. This reduces the line-to-line
hblank jitter that some sinks can't handle, and the Min Hblank
mechanism can't be used together with it.

This series computes the LL symbol HACT/HTOTAL/CHUNK_SIZE and the 128
bit Data M/N for the symbol based timing generator, programs and enables
it, and drops the Link M/N ratio limit, which only applies to the pixel
based timing generator. If the symbol based timing generator can't be
used (MSO/eDP splitter, timings out of range, Data M/N above 1.0), the
pixel based one is kept.

Patch overview:
 - Patch 1 factors out the DSC slice count and link bpp lookup, to be
   shared with the Min Hblank computation.
 - Patch 2 adds the symbol based timing generator registers.
 - Patch 3 adds HAS_DP_SYMBOL_TG().
 - Patch 4 computes the timing generator parameters.
 - Patch 5 programs and enables the timing generator, including the
   state readout and the state checker.
 - Patch 6 lifts the Link M/N ratio limit when the symbol based timing
   generator is used.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: chaitanya.kumar.borah@intel.com
Cc: uma.shankar@intel.com
Cc: suraj.kandpal@intel.com
To: intel-gfx@lists.freedesktop.org
To: intel-xe@lists.freedesktop.org

Bspec: 68922
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20261027-vlk-64036-dp-symbol-tg-v1-0-c46f4ebf67ed@intel.com

---
Arun R Murthy (6):
      drm/i915/dp: Factor out the DSC slice count and link bpp lookup
      drm/i915/display: Add the DP link layer symbol timing generator registers
      drm/i915/display: Add HAS_DP_SYMBOL_TG()
      drm/i915/dp: Compute the DP symbol based timing generator parameters
      drm/i915/display: Program and enable the DP symbol based timing generator
      drm/i915/dp: Don't limit the Link M/N ratio with the symbol timing generator

 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |  11 +
 drivers/gpu/drm/i915/display/intel_display.c       | 100 ++++++-
 .../gpu/drm/i915/display/intel_display_device.h    |   1 +
 drivers/gpu/drm/i915/display/intel_display_regs.h  |  45 ++++
 drivers/gpu/drm/i915/display/intel_display_types.h |  13 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 293 +++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h            |   5 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   8 +-
 8 files changed, 446 insertions(+), 30 deletions(-)
---
base-commit: d56ff005f0d16ec136ee31fe3238eb447fefdc1a
change-id: 20261027-vlk-64036-dp-symbol-tg-d72c4222856e

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

