Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FA4CD37B7
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 05:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD6810E47A;
	Mon, 11 May 2026 05:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQzuCnWG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D457010E47A;
 Mon, 11 May 2026 05:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778476750; x=1810012750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zH7KDmfdPWQflsBYL6kTy3844hOnH/j2JPlvbUjDzdU=;
 b=NQzuCnWG5IUuH613H5gTjjDNa74rhDOOJ1IFt+RDjG4WUT9oG2Xd+XYO
 dzoK9K8PSdIC1qQdtTqtF95X+JLrj/NQVXxV3f5KL2Oy8ge3o2D/1IsLb
 t637dGUkaeMyooBsIemeK90pbCrvCwU1u8bdkrzCUWkIMsat5djCx8tVg
 p7zJLJ4WrP1Wt6w9UYtv6nW/7ZUN/RCeLV1lSYICUiF0pzqhE4FvNAg3Z
 awacGGM3XX/UvT/B3DLjD62sMIH1jPjs2pZP9XDg3UMg/UqC7VqHN7qBj
 U2flinFAsqcY7mEi4iG5OoVgf3mi1dTKQQcMLVG3g/bgXLmJ9NZfKEBsi A==;
X-CSE-ConnectionGUID: 5gUlck9+QQ2TjviqJWG1xg==
X-CSE-MsgGUID: g6itszSwS56g5y2YZQk7YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="81921091"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="81921091"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:19:09 -0700
X-CSE-ConnectionGUID: EFZ6WwfFSEquGORLuXe+sQ==
X-CSE-MsgGUID: 3F2aQYZ1TPSuA+VvgBFLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="261086222"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:19:08 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, jani.nikula@intel.com,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [RFC 0/7] drm/display/dp_tunnel: Add debugfs surface for BWA
 validation
Date: Mon, 11 May 2026 11:10:21 +0530
Message-Id: <20260511054028.1310995-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add a debugfs surface to the DRM display DP-tunnel core so IGT
(kms_tbt) can drive deterministic tests of Bandwidth Allocation
Mode on Thunderbolt / USB4 docks without depending on transient
sink behaviour.

Three debugfs files are exposed per tunnel:
  - info       (read-only)  estimated BW, allocated BW, DPRX caps, BWA state
  - bw_alloc_enable (r/w)   toggle BWA on/off
  - bw_limit        (r/w)   inject a BW cap for mode-filtering pressure

Patches 1-3 add the DRM-core helpers, 4-5 wire them into i915,
and 6-7 fix two latent BWA bugs found while testing:
  - allocated_bw not synced after BWA enable (teardown loop)
  - MST children lose dp_tunnel/ after tunnel re-detect

Companion IGT series (kms_tbt) posted separately.

Kunal Joshi (7):
  drm/display/dp_tunnel: Add debugfs interface with info file
  drm/display/dp_tunnel: Add bw_alloc_enable debugfs knob
  drm/display/dp_tunnel: Add bw_limit debugfs cap for BW pressure
    injection
  drm/i915/dp_tunnel: Wire up DP tunnel debugfs from DRM core
  drm/i915/display: Expose DP tunnel debugfs under each connector
  drm/display/dp_tunnel: Sync SW allocated_bw after enabling BW alloc
  drm/i915/dp_tunnel: Re-attach dp_tunnel debugfs to MST children on
    re-detect

 drivers/gpu/drm/display/drm_dp_tunnel.c       | 402 +++++++++++++++++-
 .../drm/i915/display/intel_display_debugfs.c  |  22 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  11 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  11 +
 .../gpu/drm/i915/display/intel_dp_tunnel.c    |  50 ++-
 include/drm/display/drm_dp_tunnel.h           |  17 +
 6 files changed, 511 insertions(+), 2 deletions(-)

-- 
2.25.1

