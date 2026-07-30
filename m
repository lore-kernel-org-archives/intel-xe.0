Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D63C55169
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63B710EED2;
	Thu, 30 Jul 2026 11:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKoy65iG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90C410EECD;
 Thu, 30 Jul 2026 11:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409778; x=1816945778;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V0WPOTFbV7Ju2SRCByZYWFuV0h92kAQ1uIY6wjBETZY=;
 b=bKoy65iGe+7iwfEWRKoNZxCbTG/0VROz+WcbIXMzE497L4XinN7XQd6L
 sLLytLVYcpUi9TAAMM7Ssx48lwrmiN40ThEXntj49maCrqV5RxtzCFpUz
 4DlNhh/j/zSK0NJ+bvnG2EcVR3TQ8NODyVWHBXPMnHAlfofcBzUnMOzqi
 rwxm6WIjJBYbo7cIZKgIqMNo/WXo0KSds4d8/U/KeZtfQc2RKra6Ly8VW
 asOYWbNquF4vJgUruxMogrMd15YvYn+KneQmLo9ZyKEARrlxnDRLwiCeF
 84d2v3/A4tr63Xz0SqWak7p0crwYzfZ3tGdDM5a31KbsNjGDyEVznZXzf A==;
X-CSE-ConnectionGUID: zzG/J/aER7KnZhTSEP0HYA==
X-CSE-MsgGUID: vFu3jIzaT9m6XPfobCLHsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86217225"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86217225"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:32 -0700
X-CSE-ConnectionGUID: ivmNMpSdS523CmEqdeG6Ew==
X-CSE-MsgGUID: Fq7zygRHTVuV8QZ6tueZrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="298482243"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa001.jf.intel.com with ESMTP; 30 Jul 2026 04:09:30 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v8 00/10] Enable CMRR in fixed-RR VRR path
Date: Thu, 30 Jul 2026 16:29:07 +0530
Message-ID: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
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

Mitul Golani (10):
  drm/i915/psr: Do not enable PSR2 when CMRR is enabled
  drm/i915/vrr: Restrict CMRR enable condition to VRR-TG-default
    platforms
  drm/i915/vrr: Add per-CRTC vrr/cmrr debugfs control
  drm/i915/vrr: Update AS_SDP target_rr_divider based on CMRR config
    request
  drm/i915/display: Move CMRR crtc_state members under VRR
  drm/i915/vrr: Compute CMRR fractional timings generically
  drm/i915/vrr: Latch CMRR ratio via atomic commit on debugfs write
  drm/i915/vrr: Program CMRR enable/disable from transcoder timings
  drm/i915/vrr: Dump CMRR state in the crtc state dump
  drm/i915/vrr: Enable cmrr

 drivers/gpu/drm/i915/display/intel_cmtg.c     |   2 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  10 +-
 .../drm/i915/display/intel_display_debugfs.c  |   2 +
 .../drm/i915/display/intel_display_types.h    |  17 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   9 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |   6 +
 drivers/gpu/drm/i915/display/intel_vrr.c      | 393 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_vrr.h      |   2 +
 9 files changed, 345 insertions(+), 99 deletions(-)

-- 
2.48.1

