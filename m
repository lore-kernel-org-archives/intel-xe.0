Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1702C79FAA
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 07:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EBF10EF86;
	Wed,  9 Sep 2026 07:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FH3oTq17";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD33810E541;
 Wed,  9 Sep 2026 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788940090; x=1820476090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fTjZ4z1yl6MF/xwxBZ5en+RKdII9RL8Q4pdEnXlAe3k=;
 b=FH3oTq17Gge+mAiuyXXeI4q3dNhBVkASr4+9rz+qSAWawUsmbd3P+TpG
 kCZxMaEZCN4rrD7ilVnnS7oSZopDv+Ap/6UVFWWfDEtKYsN0KOcueBEO2
 pVqDxYj3hRy01di5Jaq0Y/mwZer6i0OsaBnBrIrZ+LNcNuwo1EPQGZcHZ
 +9Uo7q+TeuG/tWMNR1Yi3F4Mghpv9pJeF6XtsNvMn5tvRHDNrQ/MaPFAG
 /x2W/B675F34EMb1NcAOoCQCxCnfGoT90Nl3xZYsOu/KImhJyYIt9QbIp
 ZrY+oXAFWNMI2Va7EAGYDxa7PkJJ1WDV6NI7emTqL2GvNm27IKV7hHze6 A==;
X-CSE-ConnectionGUID: zX8FdtXmQBOrwxn9DmL2PQ==
X-CSE-MsgGUID: zg88mEPtQK+SVpUMlAocKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89480426"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89480426"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:48:09 -0700
X-CSE-ConnectionGUID: V0/KOUT+Rge0Msw/1VUt6w==
X-CSE-MsgGUID: 5W0Ejeu0QXmPO4iTJuR44g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="268680898"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2026 00:48:07 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dibin.moolakadan.subrahmanian@intel.com, ramanaidu.naladala@intel.com
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [v5 0/4] drm/i915/display: Enable AS SDP Skip Frames
Date: Wed,  9 Sep 2026 13:38:06 +0530
Message-ID: <20260909080810.2202879-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
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

When Panel Replay is active the transcoder timing generator runs at the
panel's maximum refresh rate, but content is often presented at a lower
rate. In that case the Adaptive-Sync SDP (AS SDP) only needs to reach the
panel often enough to satisfy its maximum frame time, so transmitting it
on every frame is redundant and shows up as repeated SDPs on the link.

Xe3LPD adds a HW skip-frame counter in PR_ALPM_CTL that lets the source
send a single AS SDP and then suppress it for a programmed number of
frames. Program this counter so that one AS SDP is followed by
(max_vrefresh / flip_rate - 1) idle frames, matching the effective
content rate and allowing the link to be driven down to as low as 1Hz
when the hardware supports it.

v5: Drop module param and add debugfs

v4:
 - Fix Sashiko review comments

v3:
 - Add module parameter
 - Fix Skip count clearing issue (Dibin)
 - Add DC3Co checks and enabling conditions

Uma Shankar (4):
  drm/i915/display: Enable periodic AS SDP skip frames
  drm/i915/display: Force disable DC3co when AS SDP skip frames is
    enabled
  drm/i915/display: Reprogram AS SDP skip frames on seamless VRR
    transitions
  drm/i915/display: Gate periodic AS SDP skip frames behind a debugfs
    knob

 drivers/gpu/drm/i915/display/intel_alpm.c     | 154 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_alpm.h     |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  18 ++
 .../drm/i915/display/intel_display_params.h   |   5 +
 .../drm/i915/display/intel_display_power.c    |   9 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h |   2 +
 6 files changed, 175 insertions(+), 16 deletions(-)

-- 
2.50.1

