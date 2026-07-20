Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45560C44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 09:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CCC10E838;
	Mon, 20 Jul 2026 09:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEDChaI8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541F010E15D;
 Mon, 20 Jul 2026 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784538721; x=1816074721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yHveYdiKZtukxFvtDhNIAQQ/tZQY75rWJShbUvo78KY=;
 b=gEDChaI8Ssig2IdGlrzpZX2aRF3JfyqhesS1kd5M1FJ+lm6XCn4XdcTa
 youvJGc/eyBkNmUktQDzARNMptJDVXczxmOb/Xi2XIViDll+ku/2ekmtC
 wPrgf3NszLs6fR3WgkkWxLdIjEOtPFwaCzO1L48AUqj7u/Q/WuusttVUR
 m++nXcORmhBvVcNVGxO/ZeMLqwqkhoKzjCOiYhYJ+BpFOcJMM7uCoRQ2/
 m6XLXoI4l95HjIlcUD9NFZ4ciqTxaO/AuMtHwlGLvCf8eDF5KPXhLeVeZ
 VhHJSPr0wNhw1geuOlu0//D2pG094gGRITPDMUI1PhI2+9vmvf09RuLpr g==;
X-CSE-ConnectionGUID: AGwWXqpIR6uzEAkDCZLKAg==
X-CSE-MsgGUID: n5NtT8vCR8epl4yNd9IctA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102664759"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="102664759"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:12:00 -0700
X-CSE-ConnectionGUID: KoP6XpX+SMiEAF6C2TDBDg==
X-CSE-MsgGUID: nb8fyg/LTzK64DlDCpKh3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="260963344"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 20 Jul 2026 02:11:59 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v4 0/9] Enable CMRR in fixed-RR VRR path
Date: Mon, 20 Jul 2026 14:31:32 +0530
Message-ID: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
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
  drm/i915/vrr: Return from CMRR compute config in case of PSR2 enabled
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
 drivers/gpu/drm/i915/display/intel_vrr.c      | 304 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_vrr.h      |   2 +
 9 files changed, 257 insertions(+), 98 deletions(-)

-- 
2.48.1

