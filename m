Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95803C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 18:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AD810E0C0;
	Mon, 29 Jun 2026 18:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JxeSB2C9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF5E10E0C0;
 Mon, 29 Jun 2026 18:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782758095; x=1814294095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VhjgJHzcn5c1bTkUXNJe+ClDtIj8+i65Is4zFo+x8C4=;
 b=JxeSB2C9n+YXVTaPLFioGp8It7ER8xBxw9gc8zaIitTv2ObkLjq/HUZG
 uXncoUiPCGeutda6iXL7c75Gw8pTXLqxBC9lRfVAOmS4mGZY1xLV89etH
 jN5vvHhFqE0x8QXG1vLe4bnLdHrvu7VdCXDtPOIZBanDfo9x79k3nBqU1
 hIGBumIdqZQ6eePgBmHr2T76FIjOk3I/aXikkWtWh28HAxE0QAs164pjX
 Ky+SVx7QM3MPY+2XuZXZ41yqD6+97/wumH8OgNdKPAbp4AhQXBctdboxn
 YbC30xDjUOBytQx9qxICqxX9DVpevhY/ybdT5ELg2jpv8jT5AELFmhlaH w==;
X-CSE-ConnectionGUID: +bLUwszxTcm9irF2cjscjQ==
X-CSE-MsgGUID: C3ln9iNxTmu63+ZuHNAAQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="86010628"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="86010628"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 11:34:55 -0700
X-CSE-ConnectionGUID: yaT4mYY9R7uA7+PNugXE5Q==
X-CSE-MsgGUID: G8pcJS8fT5GR8eItNuGPrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="256956670"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.190.238.88])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jun 2026 11:34:53 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 suraj.kandpal@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 0/2] Fix array-index-out-of-bounds in intel_cmtg_disable()
Date: Mon, 29 Jun 2026 23:32:34 +0530
Message-Id: <20260629180236.1353704-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

intel_cmtg_disable() maps crtc_state->cpu_transcoder to a CMTG transcoder
via to_cmtg_transcoder(), which only returns a valid transcoder for
TRANSCODER_A/B. The disable call sites only checked the sticky
crtc->cmtg.enabled flag, so during a big-joiner reconfiguration that moves
the eDP across pipes intel_cmtg_disable() could be reached with a
cpu_transcoder that does not map to a CMTG transcoder. That led to a
negative register-array index (trans_offsets[-1]) and a UBSAN
array-index-out-of-bounds splat.

v1 fixed this with a silent early return inside intel_cmtg_disable().
Following review feedback, v2 instead gates the call sites with
intel_cmtg_is_allowed() (the actual fix) and keeps a drm_WARN_ON() inside
intel_cmtg_disable() as a backstop that documents the invariant.

The patches are ordered so that the series stays splat-free at every step:
patch 1 prevents any invalid call from reaching intel_cmtg_disable(), and
patch 2 then adds the drm_WARN_ON() that should never fire in normal
operation.

Animesh Manna (2):
  drm/i915/display: Guard CMTG disable with intel_cmtg_is_allowed()
  drm/i915/cmtg: Warn on invalid CMTG transcoder in intel_cmtg_disable()

 drivers/gpu/drm/i915/display/intel_cmtg.c    | 3 +++
 drivers/gpu/drm/i915/display/intel_display.c | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.29.0

