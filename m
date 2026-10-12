Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC6ACA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B586910F055;
	Mon, 12 Oct 2026 12:41:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033FB10E476;
 Mon, 12 Oct 2026 12:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791808909; x=1823344909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+jCNzngaJnAdzdUGap3BM/zcrURDTGBsWkxG5OZILY0=;
 b=Bpa0zxqES0++r83rldAGh0SlPczCp0xWsLt3pKkBP178zWmhoBfhquS+
 Xvk7fj6NqocXuSSbasTCVQRdQ+qcVN/sr1GjRiHCMBpoSw3n/7Vo/weX1
 QeQOT2OmPjvibOdqGrfPposgOoayAEo+61lesLpf2QrN6bP8gLKEM8y4J
 E0KSul4ghy2vQSuXDTUi4rjGchg0+DTagIJx9L1gs/PmMP7zJdLqGm+hE
 MzSQ9IcxUhbkH1Fg2n1SQExgywScgLH4JACexMLDi4wh9YUhWTJ8wRXbH
 76phXYq1YEyFN0OJ+rPOQS/UZEIvYbCzs7JymIJrubr8O6ibTrAyhHrQE w==;
X-CSE-ConnectionGUID: bSleI60KRAaRPrEwrBrqkA==
X-CSE-MsgGUID: fUC4z2cURBaFfzW1dnSwCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="506197"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="506197"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:41:48 -0700
X-CSE-ConnectionGUID: W2EzE+kcSYimQL635+RIbQ==
X-CSE-MsgGUID: NiAOSD4cRbes02OTc5VhFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="808135"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa007.jf.intel.com with ESMTP; 12 Oct 2026 05:41:48 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 0/6] drm/i915/psr: Panel Replay and PSR2 with the joiner
Date: Mon, 12 Oct 2026 12:41:39 +0000
Message-ID: <20261012124145.1960050-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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

This is v2 of [1], with the following changes

- Split the active_non_psr_pipes change out of patch 1 into its own
  patch
- Use pipe_mode rather than the adjusted mode as the per-pipe area
  reference
- Do not force a full update when only one of the joined pipes has
  damage. A plane confined to one half is simply not visible on the
  other pipe, so an empty pipe is skipped in the merge and the fallback
  only kicks in when no joined pipe has any damage at all
- Redo the early transport alignment on the merged area. Merging only
  ever grows the area, so a cursor that missed its own pipe's area can
  end up partially covered
- Break out of the per-pipe compute loop on the first full update
- Drop psr_joiner_config_valid(). It duplicated the existing eDP Panel
  Replay pipe A/B check and wrongly applied it to DP Panel Replay,
  which has no such restriction. Extend the existing check to cover the
  whole joined pipe mask instead

[1] https://lore.kernel.org/intel-xe/20260923115941.746934-1-mika.kahola@intel.com/

Mika Kahola (6):
  drm/i915/psr: Track all joined pipes for frontbuffer tracking
  drm/i915/psr: Exclude the joiner secondary from active_non_psr_pipes
  drm/i915/psr: Take the selective fetch area from pipe_mode
  drm/i915/psr: Merge the selective fetch area across joined pipes
  drm/i915/psr: Allow Panel Replay and PSR2 with joiner
  drm/i915/display: Allow forcing the joiner on eDP

 .../drm/i915/display/intel_display_debugfs.c  |   5 +-
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  12 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 339 ++++++++++++------
 drivers/gpu/drm/i915/display/intel_vdsc.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h     |   2 +-
 6 files changed, 253 insertions(+), 108 deletions(-)

-- 
2.43.0

