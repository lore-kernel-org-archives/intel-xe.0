Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8710C54F51
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 06:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BC010E536;
	Tue, 28 Jul 2026 06:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lAUyQMJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C9D10E52A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 06:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785218491; x=1816754491;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LNbQVeOEG6DIWMVgzRDwFmA8ixIzoSGjDGBefByoisY=;
 b=lAUyQMJTnQ/nNgwUJR3aHfExJozelveY8ZTmstotzhEF0F7sxVFcKj+n
 VIHgzNGacAoK6Jbe7MIVXv6REiu7jsHYD6PN0Iz4ABxLIRQiVf8uYFm79
 lBC+lfnT6pk4UC0p8jLy3XwTzIFNReNTuIfGxuyJia+dSN2xPoQfNq8V5
 eoqv7nvywSry3VogryAnGwLUnJ8k6UNV4b/kjxcG1nQHzqwlBxkT5Ev10
 m6+z6GfJzs5+TxSfhIwA/js41jjhTbbDk4lPT5AhEyENdxx2co/Uh2k9D
 AMjbea4Yzx84zYpgYMC9qviSjTAW9JBH3DPiIgik1PSp6ElX/RrGqcGvG Q==;
X-CSE-ConnectionGUID: Fq7qObBnSJ+YutqlAbBNFg==
X-CSE-MsgGUID: W+6o09AbRjS+1x41bXmGFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96150839"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="96150839"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:01:30 -0700
X-CSE-ConnectionGUID: bI/meKUvR0Guf8WQ44ZsYg==
X-CSE-MsgGUID: 9pJu+RBRQAaQ50nAO1WlIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="284152391"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa001.fm.intel.com with ESMTP; 27 Jul 2026 23:01:28 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v9 0/6] drm/xe: add page size allocation mode control and
 coverage
Date: Tue, 28 Jul 2026 11:31:26 +0530
Message-ID: <20260728060132.4067990-1-naresh.kumar.g@intel.com>
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

v7:
- CI build failure

v8:
- use drmm_mutext_init instead mutex_init
- Ensure calling xe_debug_page_size_alloc_ctrl_init
  unconditionally
- refactor helper routine names xe_debug_page_size_mode_not_none()
  xe_debug_page_size_mode_is_mixed()
- use READ_ONCE for lockless wherever needed for readers and also
  match WRITE_ONCE to align READ_ONCE for protected writers
- Make debugfs mode options more readable for that use string fromat like,
  "none", "only_2m", "only_1g" and "mixed" mode
- simplify repeatative loop of mixed mode flag and align check on
  get_flag_from_cur_index_in_mixed_mode()
- drop https://patchwork.freedesktop.org/patch/740059/?series=168905&rev=5
  as this can be managed to get from bo flags on PT layer
- populate xe_walk.target_leaf_level from bo flags through
  xe_pt_target_leaf_level_from_bo()

v9:
- Make sure probe fail upon drmm_mutex_init failure of pagesize alloc
  init
- Add an OOB guard for mode in page_size_alloc_mode_show().
  This check makes the function display "unknown" if mode has been
  maliciously altered by KMD, preventing out-of-bounds access.
  Under normal operation, values set through debugfs are validated,
  so OOB values should not occur.
- simplify mode-to-string lookup using page_size_alloc_mode_names[]
- use sysfs_match_string() to parse page_size_alloc_mode writes

Nareshkumar Gollakoti (6):
  drm/xe: add page size allocation control state to xe_device
  drm/xe/debugfs: add page-size allocation mode knob
  drm/xe: add XE_BO_FLAG_NEEDS_1G for minimum page-size sizing
  drm/xe: apply debug page-size allocation policy to user BOs
  drm/xe/pt: allow selecting the bind leaf PTE level
  drm/xe/tests: add live KUnit coverage for BO page-size allocation
    modes

 drivers/gpu/drm/xe/Kconfig.debug            |  16 ++
 drivers/gpu/drm/xe/tests/xe_bo.c            | 242 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   6 +
 drivers/gpu/drm/xe/xe_bo.c                  | 160 ++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h                  |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  78 +++++++
 drivers/gpu/drm/xe/xe_device.c              |  25 ++
 drivers/gpu/drm/xe/xe_device.h              |  48 ++++
 drivers/gpu/drm/xe/xe_device_types.h        |  31 +++
 drivers/gpu/drm/xe/xe_pt.c                  |  77 ++++++-
 10 files changed, 680 insertions(+), 4 deletions(-)

-- 
2.43.0

