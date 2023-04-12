Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11C6C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFFC10E856;
	Wed, 12 Apr 2023 14:20:26 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F3810E849
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309225; x=1712845225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7en3aA7e+9IWEgGdwk3gnc8uFM2eO7TWDXqki+7LBT0=;
 b=ZoHRtMO0Nvv/Bk636QbpLzwL+OMAYWOVkQcctrZYMWa7NWoPpFxHgb3Y
 UTeS7LnQsnwXpqtlA2fyjgXJruaZGe2FLZeud8BiCBPICFEOmJnKwKJT2
 N4NpMsToMwTLxxKHBGF/tHF3sBlQ5r7lLTyyfKVkgJ+vcV1Ul95GNkfcE
 gI2rs1XVgYFFORKnquY12s4upIbLeWoFRfIA4ewkCZwjSdHTlvlmUa0MS
 rztdiO5/IEmZUuZWMeKgNDRefx3EE4Sd3ia3BAckmqjNzsjJctmPoUf68
 h5VgJOXapH7tSwt9bJyi3G4ejPcuRmoPI8KcK5fXuVeQq2XaacfH6Uxvn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409048281"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="409048281"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721584345"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="721584345"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:25 +0300
Message-Id: <20230412142006.877109-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/41] xe & i915 display integration ifdef
 cleanups, part 2
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This continues the ifdef cleanups [1].

BR,
Jani.

[1] https://lore.kernel.org/r/20230405153920.926583-1-jani.nikula@intel.com

Jani Nikula (41):
  drm/i915/display: add I915 conditional build to g4x_dp.h
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/i915/display: add I915 conditional build to intel_dpio_phy.h
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/i915/display: add I915 conditional build to intel_crt.h
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/i915/display: add I915 conditional build to vlv_dsi.h
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remove all uncore mmio accesses in favor of
    intel_de
  drm/i915/display: remove unnecessary i915_debugfs.h includes
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile

 drivers/gpu/drm/i915/display/g4x_dp.h         |  26 ++++
 .../gpu/drm/i915/display/intel_atomic_plane.c |   5 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  15 --
 drivers/gpu/drm/i915/display/intel_crt.h      |  14 ++
 drivers/gpu/drm/i915/display/intel_crtc.c     |   4 -
 drivers/gpu/drm/i915/display/intel_display.c  |  55 ++------
 .../gpu/drm/i915/display/intel_display_core.h |   4 -
 .../drm/i915/display/intel_display_debugfs.c  |   9 +-
 .../drm/i915/display/intel_display_power.c    |  10 --
 .../i915/display/intel_display_power_map.c    |   8 --
 .../i915/display/intel_display_power_well.c   |  17 +--
 .../drm/i915/display/intel_display_trace.h    |   2 -
 .../drm/i915/display/intel_display_types.h    |   9 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  10 --
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |   4 -
 drivers/gpu/drm/i915/display/intel_dpio_phy.h | 104 ++++++++++++--
 drivers/gpu/drm/i915/display/intel_dpll.c     |   7 -
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   4 -
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  20 +--
 drivers/gpu/drm/i915/display/intel_fbc.c      |   3 +-
 drivers/gpu/drm/i915/display/intel_pps.c      |  13 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |   4 -
 drivers/gpu/drm/i915/display/skl_scaler.c     |   2 -
 .../drm/i915/display/skl_universal_plane.c    |  30 +---
 drivers/gpu/drm/i915/display/vlv_dsi.h        |  13 ++
 .../drm/xe/compat-i915-headers/i915_debugfs.h |  14 ++
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   4 -
 .../drm/xe/compat-i915-headers/i915_trace.h   |   6 +
 .../drm/xe/compat-i915-headers/i915_vgpu.h    |  44 ++++++
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   1 +
 .../drm/xe/compat-i915-headers/vlv_sideband.h | 132 ++++++++++++++++++
 .../xe/compat-i915-headers/vlv_sideband_reg.h |   1 +
 drivers/gpu/drm/xe/display/ext/i915_irq.h     |   8 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 34 files changed, 383 insertions(+), 225 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h

-- 
2.39.2

