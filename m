Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5964DC43458
	for <intel-xe@archiver.kernel.org>; Sun, 12 Jul 2026 11:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BDD10E2BB;
	Sun, 12 Jul 2026 11:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/V38eim";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5289410E2BB
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Jul 2026 11:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783854890; x=1815390890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bsn1cVXWDTjKgHXAY1w0b/CJxFbRO9RG8WLzwUtlhrw=;
 b=k/V38eimBq7J3DY+WcENUgysmdx2zUbzaxleZwLzkxE30zaO1gPiPaJE
 7UPdxXgwFMWlKfU7d3YclBk/ELc5xgCMuk0hi0gyF9od2FAuj+VmHkFFy
 eCFBpgrLwdyib9ueWoZNK+eS1DjLulR7vLfUQ2TJRRPik/8u45nF54pVY
 tUJV1I/I/wL6IfpBonLIo9iXX8thuNF2EFyFYX5zCxxaBzLWphD8S5G0K
 HQawdMY3v+HDdfKq6QUaQ2GfmQ75A9AEOp4GL9M5pD88Stb4Q/+UBP+dR
 qehueZdPLfyDBsg/nuC14STYRMnPp17qgAeU4GFiDjcf8c/0ufsRP1OzL w==;
X-CSE-ConnectionGUID: cuKB2ooKQB+Cg0x/fBtDTQ==
X-CSE-MsgGUID: OY9K8hQfSKuXbhVtx4uo4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84457612"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84457612"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 04:14:50 -0700
X-CSE-ConnectionGUID: TrKvsjzcSVOahKr2Nigoag==
X-CSE-MsgGUID: NDXUyAuzQS2L2OcMzon46g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255367696"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 12 Jul 2026 04:14:49 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v3 0/8] drm/xe:add page size allocation mode control and
 coverage
Date: Sun, 12 Jul 2026 16:45:09 +0530
Message-ID: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
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

Some platforms support multiple page sizes for user BO allocations,
including 4K, 64K, 2M, and 1G.

For validation and debug, it is useful to control the page size
selection policy for user BOs so that specific allocation paths can be
exercised deterministically. In particular, this makes it possible to
force allocations into 2M-only, 1G-only, or mixed modes.

In mixed mode, allocations are distributed across the supported page
sizes in a round-robin manner. For example, for four user BOs, the
selected page sizes would be:
  - BO1: 4K
  - BO2: 64K
  - BO3: 2M
  - BO4: 1G

This series adds debug page-size allocation control for user BO in xe

This series includes:
 - debug control state in xe_device
 - a debugfs knob to select allocation mode
 - add Kconfig option for debug page-size allocation control
 - 1G BO alignment flag handling
 - debug policy application at user BO create time
 - propagation into VMA map flags
 - PT bind support for selecting leaf level (4K/64K, 2M, 1G paths)
 - add live Kunit coverage for BO page size allocation

The default path is unchanged when the debug control is not enabled.

v2
-- addressed v1 comments at 
   https://patchwork.freedesktop.org/series/169640/

v3
- refactor the design
- update patches based on review feedback

Nareshkumar Gollakoti (8):
  drm/xe: add page size allocation control state to xe_device
  drm/xe/debugfs: add page-size allocation mode knob
  drm/xe: add Kconfig option for debug page-size allocation control
  drm/xe: add XE_BO_FLAG_NEEDS_1G for minimum page-size sizing
  drm/xe: apply debug page-size allocation policy to user BOs
  drm/xe/vm: propagate BO page-size requirements to VMA map flags
  drm/xe/pt: allow selecting the bind leaf PTE level
  drm/xe/tests: add live KUnit coverage for BO page-size allocation
    modes

 drivers/gpu/drm/xe/Kconfig.debug            |  17 ++
 drivers/gpu/drm/xe/tests/xe_bo.c            | 234 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   2 +
 drivers/gpu/drm/xe/xe_bo.c                  |  91 +++++++-
 drivers/gpu/drm/xe/xe_bo.h                  |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  61 +++++
 drivers/gpu/drm/xe/xe_device.c              |   9 +
 drivers/gpu/drm/xe/xe_device_types.h        |  25 +++
 drivers/gpu/drm/xe/xe_pt.c                  |  25 ++-
 drivers/gpu/drm/xe/xe_vm.c                  |  25 +++
 10 files changed, 486 insertions(+), 4 deletions(-)

-- 
2.43.0

