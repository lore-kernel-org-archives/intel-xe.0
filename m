Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3104A606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S+Sa2g5b
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C416710FC78;
	Thu, 26 Nov 2026 06:35:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C8310FC10;
 Thu, 26 Nov 2026 06:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795674905; x=1827210905;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XdU2A+tE8H6g2dTtCvRKFadodty1G3WwiZeojOGOPrg=;
 b=S+Sa2g5bCGIL1yuAQihZDiyKslB0OnwcmqSZ0pTC6rkRmxFkIsmSQBBb
 HtWIq0lqJxdAyiySVJDxYuahAJ90W6ekMQVFbwE3ZAOlNuAbG9lkMyGpm
 DikhUkoq995SkUzFyqS9nIFbLQO64jUdnnrxwIqqjAh7DGLjQjMvCp+7i
 9G3rGcl59FUoIXOfSAXJRElcvqKmQ+mWICkBBZpD9Q4P0YdNwjpt06OCs
 Qga8B6Mb3ZPSWqHulKE5yweCZmaiw3j6LqE1jkXnfzqQL6wHkPE3Stpd8
 lF3aC12Qx3KOg42o7gBJ5l6PWqjVNFTtlrtVKoi/b8lHelZjbOafaQyTS g==;
X-CSE-ConnectionGUID: qwQkyCuuR1KkhDu12YIZDg==
X-CSE-MsgGUID: vSzs4tGSRoe6qmSkOOE08A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462610"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462610"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:35:05 -0800
X-CSE-ConnectionGUID: lo0lzvCsToOwFoqCoLNutQ==
X-CSE-MsgGUID: 5gbpfuTITKqoog9aTWtd4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12346652"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 22:35:03 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 00/15] drm/i915/display: Sync tiled displays with pipelock
Date: Thu, 26 Nov 2026 12:04:44 +0530
Message-Id: <20261126063459.863698-1-suraj.kandpal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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

Suraj Kandpal (15):
  drm/i915/display: Rename port sync master/slave to primary/secondary
  drm/i915/display: Add HAS_PIPELOCK()
  drm/i915/display: Add pipelock bits to TRANS_DDI_FUNC_CTL2
  drm/i915/ddi: Program pipelock in TRANS_DDI_FUNC_CTL2
  drm/i915/ddi: Don't hold the DP link in idle with pipelock
  drm/i915/display: Enable the pipelock primary before its secondaries
  drm/i915/display: Read out and verify pipelock state
  drm/i915/pipelock: Keep SSC, PSR and CMRR off on pipelock tiles
  drm/i915/pipelock: Compute pipelock groups for DP tiled displays
  drm/i915/vrr: Split out setting the guardband
  drm/i915/pipelock: Equalize the guardband across a pipelock group
  drm/i915/dp: Apply link training fallback to the whole tile group
  drm/i915/display: Show transcoder sync state in i915_display_info
  drm/i915/display: Use pipelock on PTL
  drm/i915/ddi: Disable port sync on PTL

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |   2 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |  11 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |   5 +
 drivers/gpu/drm/i915/display/intel_ddi.c      | 130 +++++++++++------
 drivers/gpu/drm/i915/display/intel_display.c  |  57 ++++----
 drivers/gpu/drm/i915/display/intel_display.h  |   5 +-
 .../drm/i915/display/intel_display_debugfs.c  |  22 +++
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../gpu/drm/i915/display/intel_display_regs.h |   6 +
 .../drm/i915/display/intel_display_types.h    |  14 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   6 +-
 .../drm/i915/display/intel_dp_link_training.c |  34 +++++
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |   4 +
 .../drm/i915/display/intel_modeset_setup.c    |  57 ++++----
 drivers/gpu/drm/i915/display/intel_pipelock.c | 133 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_pipelock.h |  24 ++++
 drivers/gpu/drm/i915/display/intel_psr.c      |   7 +
 drivers/gpu/drm/i915/display/intel_vrr.c      |  38 +++--
 drivers/gpu/drm/i915/display/intel_vrr.h      |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 21 files changed, 441 insertions(+), 118 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_pipelock.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pipelock.h

-- 
2.34.1

