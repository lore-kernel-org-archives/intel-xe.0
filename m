Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E65AC624C6
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 21:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60C110E012;
	Mon, 31 Aug 2026 21:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PegZC7eF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A3410E012;
 Mon, 31 Aug 2026 21:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788210869; x=1819746869;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mh5FmupPi9APDSbA1KjMY1yaJLXbpgc93Cl58Y2e3mI=;
 b=PegZC7eFdFAnE15tesIAlNJuijRC8SZNxAc8GTUDXkVQ46Y/kjbgM2OI
 FfK2Y9u5XrFV+QdvUs2tJzuNxO4kt+ptzu4y2UcEMTzqJS650RtnDZDzi
 Md9V/oSySON4poryScCbrQMlPVSU5V7iMTX3WXUIUdQHeA/oKGkTJlbEc
 Zzh9Gnjpmy9S64v9HwjJwvzStdtyocNNyyWaimB+otPhhbuIBPHmJFL+d
 iLW0tTBUyuClLd6cjmHkJZoTLZhrvkb+Zb44ZvsO7kWa/Au0FNknyjB36
 z/YMXaQ8tLRKWasMDG3+LZbph1eh/8OClQWhx32I4ftnC7fyZx150hLL4 w==;
X-CSE-ConnectionGUID: D6m+yxuURze9K2Bc0tExrQ==
X-CSE-MsgGUID: oZ8QxjzqSKmGePrBOul9Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87762498"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="87762498"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 14:14:28 -0700
X-CSE-ConnectionGUID: sDKvOxwpRUG7NGRJsX9AjA==
X-CSE-MsgGUID: n3p++T4xRUuxHT19rTvbPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="264612786"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 31 Aug 2026 14:14:27 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 0/4] drm/i915/display: Enable AS SDP Skip Frames
Date: Tue,  1 Sep 2026 03:04:17 +0530
Message-ID: <20260831213421.1804635-1-uma.shankar@intel.com>
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
  drm/i915/display: Gate periodic AS SDP skip frames behind a module
    parameter

 drivers/gpu/drm/i915/display/intel_alpm.c     | 154 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_alpm.h     |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  18 ++
 .../drm/i915/display/intel_display_params.c   |   6 +
 .../drm/i915/display/intel_display_params.h   |   1 +
 .../drm/i915/display/intel_display_power.c    |   9 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h |   2 +
 7 files changed, 177 insertions(+), 16 deletions(-)

-- 
2.50.1

