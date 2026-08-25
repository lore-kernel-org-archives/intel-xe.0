Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B222C61CE3
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D4F10E153;
	Tue, 25 Aug 2026 06:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvDZ73pH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60C610E13B;
 Tue, 25 Aug 2026 06:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638752; x=1819174752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fL2zoUmt8BrdSfwC1l65Coxjqsw4r1KWLVHznQxLI0g=;
 b=ZvDZ73pHJ2EyI40JTv873oXuxLla9QJc++100BibUHYe1avlOL1ZSCxG
 dL2qzTThLquk7Xhqy+2ZodEkcFyUU3ngLiP5uV8oSrq3Q1WeBer6Xz2st
 VnOQMdpTAHBq30C0Zi5klArfAFtvnSaaaWZJJWGxpTqifhsYYLl2TVj+4
 4z1kn3bmg9jkge4DJXjPbT+E8IqWjustWOG1Y2CiGujXEdXV7WgbUdIzt
 SReMLLGbQ+QPE10MGWhkBZMmwh3r2fGi6lmRnQAg9aOsgJUu6Cr81gbyD
 8feYGDJeEg57BRm2kO9c1MEKzgNZwlE7aYf7dMLYLaK/bICxcBkOW1YK5 A==;
X-CSE-ConnectionGUID: Nrwv1gM8R7CP/186h1ZHEw==
X-CSE-MsgGUID: bA/FkiMUT/ih3y7PXiwHow==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112640"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112640"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:11 -0700
X-CSE-ConnectionGUID: OZf2UqjoQAGE26gJr4z4aw==
X-CSE-MsgGUID: ptlIPFTmSZyQ4lr2+yRwsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263912883"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:02 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 00/15] Enable DP2.1 alpm
Date: Tue, 25 Aug 2026 11:15:21 +0530
Message-Id: <20260825054536.3455704-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

ALPM support added on DP2.1 and xe3p will support DP2.1 alpm.
This patch series extending alpm supoort for DP2.1.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>

Animesh Manna (15):
  drm/i915/alpm: Add DPCD definition for DP2.1 ALPM capability
  drm/i915/alpm: Move alpm sink capabality readout in separate function
  drm/i915/alpm: alpm_init() for DP2.1
  drm/i915/alpm: Enable debugfs for DP2.1
  drm/i915/alpm: Refactor Auxless wake time calculation
  drm/i915/alpm: Auxless wake time calculation for Xe3p
  drm/i915/alpm: table based establishment period
  drm/i915/alpm: Half LFPS cycle calculation
  drm/i915/alpm: Modify LFPS cycle count for DP ALPM
  drm/i915/alpm: Program LTTPR count for DP 2.1 ALPM
  drm/i915/alpm: Enable MAC Transmitting LFPS for LT PHY
  drm/i915/alpm: Replace is_edp() with alpm_is_possible()
  drm/i915/alpm: Introduce has_alpm to decouple from pr/psr2/lobf
  drm/i915/alpm: Compute and program switch to active latency
  drm/i915/alpm: Program zero-based LFPS half cycle duration

 drivers/gpu/drm/i915/display/intel_alpm.c     | 324 +++++++++++++++---
 drivers/gpu/drm/i915/display/intel_alpm.h     |   5 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |   6 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   5 +-
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  15 +-
 .../drm/i915/display/intel_dp_link_training.c |  16 +
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |  27 ++
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |   2 +
 .../gpu/drm/i915/display/intel_lt_phy_regs.h  |   3 +
 drivers/gpu/drm/i915/display/intel_psr.c      |  39 +--
 drivers/gpu/drm/i915/display/intel_psr.h      |   1 -
 drivers/gpu/drm/i915/display/intel_psr_regs.h |   4 +
 include/drm/display/drm_dp.h                  |   4 +-
 14 files changed, 375 insertions(+), 78 deletions(-)

-- 
2.29.0

