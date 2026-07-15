Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A88C44507
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 12:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB1E10F016;
	Wed, 15 Jul 2026 12:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lofOKfUW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7F110F010;
 Wed, 15 Jul 2026 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117371; x=1815653371;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2MOEquo8nyIbvcFM2/a6XakccQDrlEi2oqBL5Z7WSwM=;
 b=lofOKfUWFs8bxkmgHmYFeYof///rv1KVcQUBXu3hyFJShm5CAczeIu4Y
 qhz2sVkU92v9kHMxRSVNrLsmC5IOEV3BibWbP2s+JkgZJal9qkzQbwHCg
 5HVOvujL0Ie0y28sFAqLpzwIae9JEWexlVxR/Kh+9LAu2OxTAouRu9DVG
 8CBm4R7rySQuiddKvEc/CPG1rKEoLOlBBik67pxO9tyu4qdrIBGon9WwN
 hjVYWLPWfptGVNhXnuTQcdwT5QPEVv6cd8BI0qQSdtbvGPCCRfQkoF27L
 90Jqmhl1Tp6cluqh5Jc0/J+p8i1Sc9zPMWGrduFFgiVpWx4iMzsot2zIj w==;
X-CSE-ConnectionGUID: /zdtSJW0R1W6AHtCO7FIfw==
X-CSE-MsgGUID: GQlIrl9bSoyB5XGBHptrGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96120981"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="96120981"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:09:31 -0700
X-CSE-ConnectionGUID: PO0q/4nPQSOF51G4JszX8Q==
X-CSE-MsgGUID: +lN1DSxYQR6Fr2ta/mpqPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="254420553"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.168])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:09:29 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] drm/i915/cdclk: Workaround some kind of scaler 2PPC issue
Date: Wed, 15 Jul 2026 15:09:22 +0300
Message-ID: <20260715120926.10786-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Apparently ever since the hardware started to do 2 pixels per CDCLK
(GLK+) we need an extra bump in CDCLK for certain horizontal scale
factors. The current BSpec formula for that is insufficient so instead
go for an empirically derived formula for now.

Ville Syrjälä (4):
  drm/i915/cdclk: Use intel_cdclk_ppc() in
    intel_modeset_readout_hw_state()
  drm/i915/cdclk: Introduce HAS_2PPC()
  drm/i915/cdclk: Introduce crtc_state->pixel_rate_cdclk
  drm/i915/cdclk: Deal with 2 PPC hscale issues when calculating min
    CDCLK

 drivers/gpu/drm/i915/display/hsw_ips.c        |  2 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  4 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  6 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display.c  | 32 ++++++++++-
 .../drm/i915/display/intel_display_device.h   |  1 +
 .../drm/i915/display/intel_display_types.h    |  7 +++
 drivers/gpu/drm/i915/display/intel_fbc.c      |  2 +-
 .../drm/i915/display/intel_modeset_setup.c    | 12 ++--
 drivers/gpu/drm/i915/display/intel_plane.c    | 55 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_plane.h    |  5 ++
 drivers/gpu/drm/i915/display/intel_sprite.c   | 18 +++---
 .../drm/i915/display/skl_universal_plane.c    |  6 +-
 13 files changed, 122 insertions(+), 29 deletions(-)

-- 
2.54.0

