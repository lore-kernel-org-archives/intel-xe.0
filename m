Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1C6C624A4
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 12:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBB110E81D;
	Mon, 31 Aug 2026 12:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJrEoJBf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BD910E76C;
 Mon, 31 Aug 2026 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788179962; x=1819715962;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W3dld68d4JNGAl3sKfe4RxI2voIW/WHAYSp6sagIUaw=;
 b=KJrEoJBfmVgWRN0oAbAMVkHrnmSaDenGYFPIIjTS1UjiKlroT5t7qMKi
 HI3n1l6K/DxGNcYktCm1bIxY7Oj04oytkUYzmF6QaauvOzMzgrbfK7B9Q
 OMLMzKdsjVFHeRQWmtEyW75w9lb1neLOhKo2O2T9jw2ekO7sXa+ZW6NHA
 I+6W4SiBt9j34HFU/UmkwItmlZZUrZH0WdUah/aN08b+++GNnTh5F56UK
 nVt8cAXlRbE09y5AeYCWqDnQuk4NTa8VACbXvsZi9gXtIAncv/dyiGH7E
 nGpJLRzaFzm/rw/MtAqAPadKBQnNgmCYZcLVMcd8acZ9FWiTb2DIEX7Sp Q==;
X-CSE-ConnectionGUID: 3vfX6I7dSpyvpEztJqyB9Q==
X-CSE-MsgGUID: nc9DkCvsTmmPYgQvdE4qCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88513946"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="88513946"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 05:39:22 -0700
X-CSE-ConnectionGUID: 0vld40dWQKK0zYQXgT7tcg==
X-CSE-MsgGUID: nxjBcloxQReHXNt8LkNQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="292289469"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 31 Aug 2026 05:39:20 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 0/4] drm/i915/display: Enable AS SDP Skip Frames
Date: Mon, 31 Aug 2026 18:29:09 +0530
Message-ID: <20260831125914.1736501-1-uma.shankar@intel.com>
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

 drivers/gpu/drm/i915/display/intel_alpm.c     | 158 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_alpm.h     |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  19 ++-
 .../drm/i915/display/intel_display_params.c   |   6 +
 .../drm/i915/display/intel_display_params.h   |   1 +
 .../drm/i915/display/intel_display_power.c    |   9 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h |   2 +
 7 files changed, 181 insertions(+), 17 deletions(-)

-- 
2.50.1

