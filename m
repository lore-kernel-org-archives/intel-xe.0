Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69E2C44507
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 02:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1485C10E170;
	Tue, 14 Jul 2026 02:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PehLuzbH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90AC10E0D2
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 02:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783997863; x=1815533863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MJklz98uB2I9epj3UOHF+AdLhWkRhct0HxEI9orIX7g=;
 b=PehLuzbHLE8/P7UKOwMMrdIS2biC1MHVaqV1RIjv74ShHe9a/f8Hz2qW
 beUYe8vvuKxkIhFUJas8wTXnJZ9rRteCToa0Ca5B04uXI84UjtLJ3nwkB
 FyEOpNleGwYY9pW8Eur34IkJYS+nWwYE5wv9eBXjMfe5S8apYo5gPzBHo
 KNSK5BZNL1ak6tjXGdn9aa+xFfugXN8c3zW3zFTwII1aUMk7K2x5tUDIg
 xlO88vfFOBIn6/+RGj4nCXLWoNEy6AYkTWwkS2elsHeru6JsJVuz3lUtZ
 jmrrbmHwphUba044unpGF/V33vOqIHX4Q7PmRz3gSLEayZH+dHnHhYXIm g==;
X-CSE-ConnectionGUID: XfvqWW8TRkqOI9+YuKW7/Q==
X-CSE-MsgGUID: Cu+RVwpvRR6t1WmdRk7+hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84661059"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84661059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 19:57:42 -0700
X-CSE-ConnectionGUID: 7Ap/sSJOTP++NrmtdhTmYg==
X-CSE-MsgGUID: g4pmLDs3Teu33flMMMspgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255777055"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 13 Jul 2026 19:57:41 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH V6 0/7] drm/xe: add page size allocation mode control and
 coverage
Date: Tue, 14 Jul 2026 08:27:50 +0530
Message-ID: <20260714025757.3369931-1-naresh.kumar.g@intel.com>
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
including 4K, 64K, 2M, and 1G

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
- due to space missing after drm/xe: it created a new series
  https://patchwork.freedesktop.org/series/170246/

v4
- initialize page-size control state before userspace-visible registration
- add Kconfig support before CONFIG_DRM_XE_DEBUG_PAGE_SIZE users
- limit debugfs and BO policy handling to supported dGFX VRAM paths
- add fast-path mode checks and ALIGN() overflow handling
- preserve existing BO NEEDS_* flags
- defer mixed-mode index advancement until successful
  BO create ioctl completion
- replace 2M/1G vma_flags propagation with stable target_leaf_level state
- propagate target_leaf_level from bind op to VMA and into PT bind
- allow smaller huge-page fallback and fix clear_pt handling in PT walk
- skip VRAM-only live KUnit tests on non-dGFX
  and restore state on all exits

v5:
- Guard debug page-size control support with CONFIG_DRM_XE_DEBUG_PAGE_SIZE
- Fix kernel-doc warnings in xe_device_types.h for page_size_alloc_ctrl
- Keep the normal BO creation path unchanged when no debug mode is selected
- Reword commit messages for clarity and to match the implementation

v6:
- Add Gaurd to kunit tests

Nareshkumar Gollakoti (7):
  drm/xe: add page size allocation control state to xe_device
  drm/xe/debugfs: add page-size allocation mode knob
  drm/xe: add XE_BO_FLAG_NEEDS_1G for minimum page-size sizing
  drm/xe: apply debug page-size allocation policy to user BOs
  drm/xe/vm: propagate BO page-size requirements to VMA map flags
  drm/xe/pt: allow selecting the bind leaf PTE level
  drm/xe/tests: add live KUnit coverage for BO page-size allocation
    modes

 drivers/gpu/drm/xe/Kconfig.debug            |  16 ++
 drivers/gpu/drm/xe/tests/xe_bo.c            | 240 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   6 +
 drivers/gpu/drm/xe/xe_bo.c                  | 166 +++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h                  |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  62 +++++
 drivers/gpu/drm/xe/xe_device.c              |  13 +-
 drivers/gpu/drm/xe/xe_device.h              |  30 +++
 drivers/gpu/drm/xe/xe_device_types.h        |  31 +++
 drivers/gpu/drm/xe/xe_pt.c                  |  53 ++++-
 drivers/gpu/drm/xe/xe_vm.c                  |  30 +++
 drivers/gpu/drm/xe/xe_vm_types.h            |   9 +
 12 files changed, 652 insertions(+), 5 deletions(-)

-- 
2.43.0

