Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C894ECD98DA
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 20:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6C410E6E7;
	Mon, 15 Jun 2026 20:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6ZhaLrg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDA010E6C6;
 Mon, 15 Jun 2026 20:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781555742; x=1813091742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LLW9lcK3wMbp8DteoKn8wrFmZX30di6thuM6N7hzuM0=;
 b=P6ZhaLrgAt9ilyNwt7w6T4ZiLCtuRjzCYsiXZv796MOXHqYgdAEGbqUd
 QCc9WVfzh8dndy12YLm9I4bcxPKqSMaYUGFHHvYDo2zTNmLbi5qqSvULj
 rs+0iWeIbs375TaCL5zp8AaCHNecicHjhnMgHtHmuXZGhm+HpOCbM/8jS
 UayoMnnOsWOG1b19sbLUbjUq6MgYfz+BYwRYWn/IdapX1KC9N/nBEhC2O
 1N1pMkOMSh8lmuTp42ZSfGfbFTYocwT4AHIUEczXjDYnSV4vCKx1f89iA
 gLRSuHjqBqENofL4uqn6UNajyYSPPEHG3T6pT/VDaFXNNdsirRegbjScq A==;
X-CSE-ConnectionGUID: gqFKRNpDTxmnlq1iOM13lw==
X-CSE-MsgGUID: idlSBLKBQB2Dx7/3TntEyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93694714"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="93694714"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:35:42 -0700
X-CSE-ConnectionGUID: 9BV9iF8uREW4/IGE3x3FGA==
X-CSE-MsgGUID: kam8jrfVQPm84/FZbhtUow==
X-ExtLoop1: 1
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.190.238.88])
 by fmviesa003.fm.intel.com with ESMTP; 15 Jun 2026 13:35:40 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v9 00/22] CMTG enablement
Date: Tue, 16 Jun 2026 01:33:17 +0530
Message-Id: <20260615200339.885190-1-animesh.manna@intel.com>
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

Common mode timing generator (CMTG) support is added NVL onwards.
Enable CMTG which will be needed by other fearure like dynamic dc
state enablement later.

Testing ongoing, currently counters are incrementing as expected.

Animesh Manna (19):
  drm/i915/cmtg: Add intel_cmtg_is_allowed() for CMTG
  drm/i915/cmtg: Set CMTG clock select
  drm/i915/cmtg: Add CMTG transcoder offset in struct _device_info
  drm/i915/display: Pass target transcoder to
    intel_set_transcoder_timings()
  drm/i915/display: Rename cpu_transcoder parameter to transcoder
  drm/i915/display: Skip DP_MIN_HBLANK_CTL programming for CMTG
    transcoders
  drm/i915/display: Pass transcoder to
    intel_set_transcoder_timings_lrr()
  drm/i915/display: Rename cpu_transcoder parameter to transcoder in LRR
    path
  drm/i915/cmtg: Set timings for CMTG by using transcoder timing helpers
  drm/i915/vrr: Pass transcoder to intel_vrr_set_fixed_rr_timings()
  drm/i915/display: Rename cpu_transcoder parameter to transcoder in VRR
    fixed-rr path
  drm/i915/cmtg: Program VRR fixed-rate timings for CMTG transcoder
  drm/i915/cmtg: Program VRR control register for CMTG transcoder
  drm/i915/cmtg: Set link M/N for CMTG transcoder
  drm/i915/cmtg: Add hook to enable CMTG with sync to port
  drm/i915/cmtg: Add a hook to make eDP transcoder secondary
  drm/i915/cmtg: Add trigger to enable/disable cmtg
  drm/i915/cmtg: Restore CMTG after DC6 exit
  drm/i915/cmtg: Add CMTG interrupt handling

Dibin Moolakadan Subrahmanian (3):
  drm/i915/cmtg: Modify existing hook to disable CMTG
  drm/i915/cmtg: Add CMTG HWGB programming
  drm/i915/cmtg: Add CMTG scan line programming

 drivers/gpu/drm/i915/display/intel_cmtg.c     | 277 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_cmtg.h     |  17 ++
 .../gpu/drm/i915/display/intel_cmtg_regs.h    |  24 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |  11 +
 drivers/gpu/drm/i915/display/intel_display.c  |  84 ++++--
 drivers/gpu/drm/i915/display/intel_display.h  |   4 +
 .../drm/i915/display/intel_display_device.c   |  14 +
 .../drm/i915/display/intel_display_device.h   |   2 +-
 .../gpu/drm/i915/display/intel_display_irq.c  |  19 ++
 .../gpu/drm/i915/display/intel_display_irq.h  |   2 +
 .../drm/i915/display/intel_display_limits.h   |   2 +
 .../drm/i915/display/intel_display_power.c    |  23 ++
 .../drm/i915/display/intel_display_power.h    |   2 +
 .../gpu/drm/i915/display/intel_display_regs.h |   2 +
 .../drm/i915/display/intel_display_types.h    |   4 +
 drivers/gpu/drm/i915/display/intel_vrr.c      |  19 +-
 drivers/gpu/drm/i915/display/intel_vrr.h      |   4 +-
 17 files changed, 460 insertions(+), 50 deletions(-)

-- 
2.29.0

