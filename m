Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B67EF8FF0
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 14:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526CF10EA26;
	Wed,  4 Mar 2026 14:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDYWubWa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F056510EA17;
 Wed,  4 Mar 2026 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772635260; x=1804171260;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wi0xU58MwDDZApqGPzC3+ppeAFchr7YSj2b+nQzDPWM=;
 b=hDYWubWap1dXESeJAGstzZqvSn6dtetUEtyt/T4Zk8Pjn9DTvOUdHdlZ
 Ga7eJpDCitdpWUPmG1sMA0uD3w8/HNhWJFVCGX6JWgvW6Bzdp87NO6Azg
 hOetQgfYRRyC+WeN5h56cjWrwNj2NVky2ScqhAENjMaMqEahRXNLQ+ORO
 LhBEQf9NCvmF7sige+gTImxFVB9gvAj3laH219rG2HtgjHp7Sibwej3fK
 KdFmD/QTyyHZUJ/A8lgJElGpo4zKSqyDhUdjv6ElwaUl6qnjwzxVE70ft
 PA3COXi3MHtCTw9aAyIS2m+KlP1rTDwr8QO0P4jEsimVgkVASig7dScMP Q==;
X-CSE-ConnectionGUID: 728K4DvDSNq3WQr8HQanFw==
X-CSE-MsgGUID: aJxy3KbsQHydy7T+VvJ11g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84330018"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="84330018"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:41:00 -0800
X-CSE-ConnectionGUID: OCjHdQ+WTmCY3ZlItbi21A==
X-CSE-MsgGUID: m2sLyKorT9qORLudFIYSoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="218479306"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:40:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/8] drm/{i915,xe}: sort out step enums between the drivers
Date: Wed,  4 Mar 2026 16:40:45 +0200
Message-ID: <cover.1772635152.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

A bunch of cleanup to share step enum across drivers.

Jani Nikula (8):
  drm/i915/dmc: simplify stepping info initialization
  drm/i915/display: add step name in display runtime info
  drm/i915/dmc: use step name from runtime info
  drm/xe/compat: remove intel_step_name macro
  drm/intel: add shared step.h and switch i915 to use it
  drm/xe/step: switch to the shared step definitions with i915
  drm/xe/step: switch from enum xe_step to intel_step naming
  drm/i915/display: switch to including common step file directly

 drivers/gpu/drm/i915/display/intel_cdclk.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 .../drm/i915/display/intel_display_device.c   | 30 +++++++--
 .../drm/i915/display/intel_display_device.h   |  1 +
 .../drm/i915/display/intel_display_power.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      | 19 +++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_flipq.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  2 +-
 .../drm/i915/display/skl_universal_plane.c    |  2 +-
 drivers/gpu/drm/i915/intel_step.h             | 57 +----------------
 .../drm/xe/compat-i915-headers/intel_step.h   | 14 -----
 drivers/gpu/drm/xe/tests/xe_pci.c             |  4 +-
 drivers/gpu/drm/xe/xe_step.c                  |  2 +-
 drivers/gpu/drm/xe/xe_step.h                  |  4 +-
 drivers/gpu/drm/xe/xe_step_types.h            | 61 +-----------------
 include/drm/intel/step.h                      | 62 +++++++++++++++++++
 21 files changed, 117 insertions(+), 159 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
 create mode 100644 include/drm/intel/step.h

-- 
2.47.3

