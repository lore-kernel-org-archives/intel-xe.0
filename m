Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A814C606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PlgtZFDj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567F21120F5;
	Fri, 27 Nov 2026 06:09:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDE21120B3;
 Fri, 27 Nov 2026 06:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759777; x=1827295777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=plX6vxTl5CWjiRz2Zd5ML6VyDG8n6baqDwgZk6NSd34=;
 b=PlgtZFDjMOTHGGMG4e0zpAswJVd8iB9hLTBNatFC95242v0pkIBaPxVz
 Kaa8vKKYalbA0rrCU+i3kyiJasH24w8pAgDijh/xIwqM2aSE6cqSml+ay
 o1WovZ1SiGUNT/bWBNm84EEP8aQKE+pObj2CkK9Yte9furXP8iTUcS5Lf
 ix6L/UN5WEo8YAIhvVfsO0+UuszVp6WtHf0iymv7GKuJtydHiKDb2yYkd
 iCVfo5rpqU7/3xB3gWn0gUDaq16ASvxnP7LvYYrShxNFDkTPFegX6elbt
 cbmeuCq2YJHDz/kLUd5NWGlNFARV9zBFZC2gnDCYTyDBQWaWIaTQpUepj Q==;
X-CSE-ConnectionGUID: 5dOPsl01RSaeU+IMvNkAAw==
X-CSE-MsgGUID: A4E73y0qQriJaPkc/zuJIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4578237"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4578237"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:09:36 -0800
X-CSE-ConnectionGUID: +WSMz4SvSHq7GTRCKV45rg==
X-CSE-MsgGUID: uhPqXihfRVeuDlSwqlXoOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14361894"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 22:09:33 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 00/18] drm/i915/display: Sync tiled displays with pipelock
Date: Fri, 27 Nov 2026 11:39:06 +0530
Message-Id: <20261127060924.1648295-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Port sync is deprecated from Xe3p onwards and replaced by pipelock, so
the tiles of a DP tiled display currently run unsynchronized on NVL.
This series syncs them with pipelock instead.

The port sync topology is reused, renamed to primary/secondary. With
pipelock the secondary is set up as a local genlock secondary of the
primary in TRANS_DDI_FUNC_CTL2, the primary is enabled before its
secondaries, and the DP link is no longer held in idle. The tiles need
the same PLL, timings and SDPs, SSC, PSR and CMRR are kept off on them,
and the guardband is raised to the largest one in the group. A link
training fallback on one tile is applied to all of them, so they stay
in sync.

The last two commits move PTL from port sync to pipelock as well.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (18):
  drm/i915/display: Rename port sync master/slave to primary/secondary
  drm/i915/display: Add HAS_PIPELOCK()
  drm/i915/display: Add pipelock bits to TRANS_DDI_FUNC_CTL2
  drm/i915/ddi: Program pipelock in TRANS_DDI_FUNC_CTL2
  drm/i915/ddi: Don't hold the DP link in idle with pipelock
  drm/i915/display: Enable the pipelock primary before its secondaries
  drm/i915/display: Read out and verify pipelock state
  drm/i915/pipelock: Keep SSC, PSR and CMRR off on pipelock tiles
  drm/i915/pipelock: Document pipelock
  drm/i915/display: Add HAS_PORT_SYNC()
  drm/i915/ddi: Rename the port sync transcoders to transcoder_mask
  drm/i915/pipelock: Compute pipelock groups for DP tiled displays
  drm/i915/vrr: Split out setting the guardband
  drm/i915/pipelock: Equalize the guardband across a pipelock group
  drm/i915/dp: Apply link training fallback to the whole tile group
  drm/i915/display: Show transcoder sync state in i915_display_info
  drm/i915/display: Use pipelock on PTL
  drm/i915/display: Disable port sync on PTL

 Documentation/gpu/intel-display/index.rst     |   1 +
 Documentation/gpu/intel-display/pipelock.rst  |   8 +
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |   2 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |  11 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |   6 +
 drivers/gpu/drm/i915/display/intel_ddi.c      | 149 ++++++++++-----
 drivers/gpu/drm/i915/display/intel_display.c  |  57 +++---
 drivers/gpu/drm/i915/display/intel_display.h  |   5 +-
 .../drm/i915/display/intel_display_debugfs.c  |  22 +++
 .../drm/i915/display/intel_display_device.h   |   2 +
 .../gpu/drm/i915/display/intel_display_regs.h |   6 +
 .../drm/i915/display/intel_display_types.h    |  14 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   6 +-
 .../drm/i915/display/intel_dp_link_training.c |  34 ++++
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |   4 +
 .../drm/i915/display/intel_modeset_setup.c    |  57 +++---
 drivers/gpu/drm/i915/display/intel_pipelock.c | 180 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_pipelock.h |  24 +++
 drivers/gpu/drm/i915/display/intel_psr.c      |   7 +
 drivers/gpu/drm/i915/display/intel_vrr.c      |  38 ++--
 drivers/gpu/drm/i915/display/intel_vrr.h      |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 23 files changed, 509 insertions(+), 127 deletions(-)
 create mode 100644 Documentation/gpu/intel-display/pipelock.rst
 create mode 100644 drivers/gpu/drm/i915/display/intel_pipelock.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pipelock.h

-- 
2.34.1

