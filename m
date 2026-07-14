Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3976DC44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 10:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25F288C4C;
	Tue, 14 Jul 2026 10:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMkjnnTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D5810ECD7;
 Tue, 14 Jul 2026 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784026201; x=1815562201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zlo3Zgy+UMvYBHtDmIjwGEL9ImAEraFZ6+BTGXJUm70=;
 b=YMkjnnTjIw28mLEvmuDknhXkn7oM+a7l1ZkCjvy/JTl8erXTjQmHQw0m
 rU1JbKIWydO1oa1TBMwF9XaEqSxvSXGOjcdEL6GkEx78o4IX4BeJykkl2
 qJMZkuYkhN09H9hq3dYC0smFegxSHjC5Sd/MpI9ySasqsTlDCKfjiGIi5
 Odsu/Rp0UVD85pFYTd6u/zr1lSEdRCfRB0gEC8JZXyP/K+1fiRF0zqduB
 hyKhWSLPOyJclGvIT7w6xgFA4Vjc3+CaVaD9XESqFyeGrDWHp2i0y5wy/
 cwGS3M+3qYOHygYo3ygfql5pbgX6iz6iKPPtd9jdo3ruN6DHxDRtko1PW Q==;
X-CSE-ConnectionGUID: AyS23yR6SQqhwVMbp5Ibxw==
X-CSE-MsgGUID: SSJst+PaQ8mIvTx0VqMnmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88544439"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="88544439"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:50:00 -0700
X-CSE-ConnectionGUID: S6SBzlKMRvG/cmHNJZnsEQ==
X-CSE-MsgGUID: 446xNav/TR2ylEjvwvd4og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="260134489"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa005.jf.intel.com with ESMTP; 14 Jul 2026 03:49:59 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v3 0/8] Enable CMRR in fixed-RR VRR path
Date: Tue, 14 Jul 2026 16:09:29 +0530
Message-ID: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
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

Mitul Golani (8):
  drm/i915/vrr: Add per-CRTC vrr/cmrr debugfs control
  drm/i915/display: Move CMRR crtc_state members under VRR
  drm/i915/vrr: Compute CMRR fractional timings generically
  drm/i915/vrr: Dump CMRR state in the crtc state dump
  drm/i915/vrr: Move CMRR hw registers to fix refresh rate path
  drm/i915/vrr: Program CMRR enable/disable from transcoder timings
  drm/i915/vrr: Return from CMRR compute config in case of PSR2 enabled
  drm/i915/vrr: Enable cmrr

 drivers/gpu/drm/i915/display/intel_cmtg.c     |   2 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  10 +-
 .../drm/i915/display/intel_display_debugfs.c  |   2 +
 .../drm/i915/display/intel_display_types.h    |  17 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_vrr.c      | 315 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_vrr.h      |   2 +
 8 files changed, 253 insertions(+), 100 deletions(-)

-- 
2.48.1

