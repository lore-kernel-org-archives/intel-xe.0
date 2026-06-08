Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3CBCD8C9F
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62A610F769;
	Mon,  8 Jun 2026 16:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3ORYg1E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EE910F766
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937687; x=1812473687;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XgFb4MEGgsPhylb6o/j8cFYpimCOLO/dI+iQE7ITSvY=;
 b=P3ORYg1EjBm0Sp+2povxL5mLlPT/oZ+nUF94pcax9IPEXOxoOL2dJVyX
 RK3g0hlbJXgxnoyXSeajCf68nlrmSJ4RkNhTVFEREOHQ2x8y17XDL8zNc
 z3/dIBby2LPAsewf6mZ+G4gB3LsU1sxVxD3vjgrytjbout4ZtjynqSIe6
 td68CqPNQIxcGUv6gZAvfan4D+9ZppcBMV7Cswpj6q3INJ+A/ur8HQWI4
 Sp4jzDUg80dLFq1rfUqgAX7saMW76fTz0qKv2foIbrWunAQS2ynvDw/si
 EotPbCex1zyFXp8+QZ0U5vV0UR/OiloubzBt9PTtIupfe+/qGE0Nwz+T6 A==;
X-CSE-ConnectionGUID: u1UGYFjVQ5iQ2FNL4mE83A==
X-CSE-MsgGUID: L8dCrLeNRyCeKwjxCz09vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744527"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744527"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:40 -0700
X-CSE-ConnectionGUID: 0GQ584whRvajG2tHWgq36g==
X-CSE-MsgGUID: MyCv9lQPQ/W+MEXE8UMnfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467514"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 00/16] drm/xe/kunit: Add fake GTTMMADR
Date: Mon,  8 Jun 2026 18:54:13 +0200
Message-ID: <20260608165429.587-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

By defining fake GTTMMADR we can more easily enable more xe components
to run under kunit, and at the end we can stop using stub for the xe_bo
allocation and we can rely on the regular function as on the real device.

The fake GTTMMADR will also allow us to write more tests, where we could
verify if the xe code is accessing registers or GGTT in the expected way.

Michal Wajdeczko (16):
  drm/xe/mmio: Assert MMIO is available
  drm/xe/mmio: Map MMIO BAR using managed version of pci_iomap
  drm/xe/mmio: Add check for minimal BAR size
  drm/xe/mmio: Drop tiles_fini action
  drm/xe/mmio: Check MMIO BAR size when initializing tiles
  drm/xe/mmio: Allow to replace xe_mmio_probe_early() with stub
  drm/xe: Add helper to detect real vs kunit xe_device
  drm/xe/kunit: Skip forcewake operations on fake device
  drm/xe/kunit: Claim minimal RPM support for fake xe device
  drm/xe/tests: Fix fake xe_managed_bo_create_pin_map
  drm/xe/tests: Increase DUT_GGTT_START
  drm/xe/ggtt: Expand __xe_ggtt_init_early()
  drm/xe/kunit: Add fake GTTMMADR
  drm/xe/kunit: Promote GGTT initialization to test_init()
  drm/xe/kunit: Assume fake GGTT is online
  drm/xe/tests: Use regular xe_managed_bo_create_pin_map()

 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |  62 ++++------
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |   8 ++
 drivers/gpu/drm/xe/tests/xe_pci.c           | 118 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h      |  13 +++
 drivers/gpu/drm/xe/xe_device.h              |   9 ++
 drivers/gpu/drm/xe/xe_force_wake.c          |   4 +-
 drivers/gpu/drm/xe/xe_ggtt.c                | 102 ++++++++++-------
 drivers/gpu/drm/xe/xe_mmio.c                |  86 +++++++++-----
 8 files changed, 290 insertions(+), 112 deletions(-)

-- 
2.47.1

