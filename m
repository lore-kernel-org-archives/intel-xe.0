Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C2DC44512
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 04:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C2F10E350;
	Wed, 22 Jul 2026 04:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDOgNyxa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7B210E350;
 Wed, 22 Jul 2026 04:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784695780; x=1816231780;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uD/kWLEc1jZVJLYWH2gFr1utJroxJ+6MYe2xbzhWjBk=;
 b=WDOgNyxa7hKCD1UhVMgAX1pA/i8n87EEm2lL/6NzwUtxQwdTQ7lW+j5r
 oKh+gsrMLV2g86f85IPvE7Ix07Ubiicb6bd2jKq4wpk6zfBDP/I9qNDwC
 IS19BD2Aqv8hex9kckxzICM5U0UE7Qq7gd4YoMe7DazlzyDKyE9/QzMqC
 ys/8WUbwiL+ssZxQxeSzjGNWh2Raxmah+KKQTyDlheSUBgCfD4zAVe3ju
 5cAdWZRXeu8fYruWKLLiw49XPFszFVL34VBYxtcg/qQHJaQwZBsapsamZ
 iRiLd75bBt6E24Z/mdYkFHbaC+2FtbrUDVhTplrfFLKwdGVIa9Web7qyR g==;
X-CSE-ConnectionGUID: gSWLQ/jcRM+Um7TUFhDC3w==
X-CSE-MsgGUID: nugiFQ17QTWFcp73NzzcHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84298479"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="84298479"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 21:49:40 -0700
X-CSE-ConnectionGUID: ARyL2hMpRhuSuK7rp/bTng==
X-CSE-MsgGUID: hd1I3AneSrKiNqZhpItd9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253603213"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2026 21:49:39 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v6 0/9] Enable CMRR in fixed-RR VRR path
Date: Wed, 22 Jul 2026 10:09:12 +0530
Message-ID: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
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

The existing CMRR fractional-timing code was permanently
disabled (if (!HAS_CMRR || true)), eDP-only, and relied
on a heuristic to guess when the fractional path was needed.
This series reworks it into a generic, debugfs-driven feature,
which later will be controlled via userspace when respective
uapi will be in-palce.

Mitul Golani (9):
  drm/i915/vrr: Return from PSR2 compute config in case of CMRR enabled
  drm/i915/vrr: Restrict CMRR enable condition to VRR-TG-default
    platforms
  drm/i915/vrr: Add per-CRTC vrr/cmrr debugfs control
  drm/i915/vrr: Update AS_SDP target_rr_divider based on CMRR config
    request
  drm/i915/display: Move CMRR crtc_state members under VRR
  drm/i915/vrr: Compute CMRR fractional timings generically
  drm/i915/vrr: Dump CMRR state in the crtc state dump
  drm/i915/vrr: Program CMRR enable/disable from transcoder timings
  drm/i915/vrr: Enable cmrr

 drivers/gpu/drm/i915/display/intel_cmtg.c     |   2 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  10 +-
 .../drm/i915/display/intel_display_debugfs.c  |   2 +
 .../drm/i915/display/intel_display_types.h    |  17 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   9 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |   6 +
 drivers/gpu/drm/i915/display/intel_vrr.c      | 316 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_vrr.h      |   2 +
 9 files changed, 270 insertions(+), 97 deletions(-)

-- 
2.48.1

