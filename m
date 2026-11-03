Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13F2606A81C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O9j9EbYY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7800310F4B0;
	Tue,  3 Nov 2026 10:03:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E3410E7DA;
 Tue,  3 Nov 2026 10:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793700218; x=1825236218;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=b6GFi/HZQ6c0zoEJegPLANlEzTmDwghl4qD48clkH3I=;
 b=O9j9EbYYngiUXXu38Uz/iaNaM5niDmgcliIKyOUnM5D2qaDcsAF4m+VP
 Ke5byaRnmg8VXCDcMDmD90BW/+7CXXU4Ev2qc6mbecFurYIzSztuBvY49
 uchOgdlQYpas9JTBxuv9saDI9/BV2+dkv59x9vBmx03wkZ/8W2NrvlLf1
 1LhKYdJCt4UchLqgeEVJ7j2CVR8y74yIUaMgNduPvxrWEri3zcP9mk/Wj
 6S3Ta2/72Rj8eeSTZWNOewq1dKKzYDPEkX2CiKCe22yLBjBQfAmHOZFwg
 lr9ZhlA2I046d2qVuJmS2/rFWysssBxitqiKdF4rLNNy+GkvnUysEbYmu Q==;
X-CSE-ConnectionGUID: bQGusp3FSy+3hXlQRaVnoQ==
X-CSE-MsgGUID: FROG33nRQT2jpqyINYPCBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2296960"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2296960"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 02:03:37 -0800
X-CSE-ConnectionGUID: ViptxQCmQXSOMqrkhd/k3A==
X-CSE-MsgGUID: yMew6xUqTquTQq2eNixeMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6718585"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2026 02:03:34 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v4 0/7] drm/i915/dp: Add support for the DP symbol based
 timing generator
Date: Tue, 03 Nov 2026 15:28:15 +0530
Message-Id: <20261103-vlk-64036-dp-symbol-tg-v4-0-6cf8a588b54c@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADiw6WoC/4XNTQ6CMBCG4auQrh1TpmMBV97DuNB2gEb+QkkjM
 dzdwoqYGJfvl8wzb+F5dOzFOXmLkYPzru9i0CERpr53FYOzsQVK1KnEDELzBE1SabAD+Ll99A1
 MFdgMDSFiftIs4vEwculeG3y9xa6dn/px3v6EdF3/kiEFCYZ0Sfwodcb24rqJm6PpW7GSAfdM/
 pPByJDKqTAKT1bhN6P2TPGTUZHRhUQkJC7TbM8sy/IBEmIuyUoBAAA=
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
 - Patch 3 adds the symbol based timing generator state to the crtc
   state, with its state dump and state checker comparison.
 - Patch 4 adds HAS_DP_SYMBOL_TG().
 - Patch 5 computes the timing generator parameters.
 - Patch 6 programs and enables the timing generator, including the
   state readout.
 - Patch 7 lifts the Link M/N ratio limit when the symbol based timing
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
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://lore.kernel.org/r/20261029-vlk-64036-dp-symbol-tg-v3-0-69022424ef17@intel.com

Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20261028-vlk-64036-dp-symbol-tg-v2-0-43849c325d32@intel.com

Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20261027-vlk-64036-dp-symbol-tg-v1-0-c46f4ebf67ed@intel.com

---
Arun R Murthy (7):
      drm/i915/dp: Factor out the DSC slice count and link bpp lookup
      drm/i915/display: Add the DP link layer symbol timing generator registers
      drm/i915/display: Add the DP symbol timing generator crtc state
      drm/i915/display: Add HAS_DP_SYMBOL_TG()
      drm/i915/dp: Compute the DP symbol based timing generator parameters
      drm/i915/display: Program and enable the DP symbol based timing generator
      drm/i915/dp: Don't limit the Link M/N ratio with the symbol timing generator

 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |  11 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   2 +
 drivers/gpu/drm/i915/display/intel_display.c       | 112 +++++++++-
 drivers/gpu/drm/i915/display/intel_display.h       |   1 +
 .../gpu/drm/i915/display/intel_display_device.h    |   1 +
 drivers/gpu/drm/i915/display/intel_display_regs.h  |  38 ++++
 drivers/gpu/drm/i915/display/intel_display_types.h |  13 ++
 drivers/gpu/drm/i915/display/intel_dp.c            | 239 +++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h            |   3 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  10 +-
 10 files changed, 405 insertions(+), 25 deletions(-)
---
base-commit: d56ff005f0d16ec136ee31fe3238eb447fefdc1a
change-id: 20261027-vlk-64036-dp-symbol-tg-d72c4222856e

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

