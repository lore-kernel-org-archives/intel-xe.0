Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8E4C44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 14:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D914E10E46D;
	Wed, 22 Jul 2026 14:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvHKjiJq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C326F10E46D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784731071; x=1816267071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4XBNYODmxASqWJkLzXzRBY8hjnHjr5lKD52amdOZgqk=;
 b=IvHKjiJqMzhhj2WeLJGWDSDjmDpRnlDI3XBpe4GflCtTvydWkfeiMln3
 6qRGK3AgTtpX5CO/amoOOm3GjHdaaSM6GS16+qDR6kIYAhYyMJpOThLZ8
 tt4IiBvN54PuvWPTLCS9h8BtbJnS0kS8TmEN6MEK5lDOMiZrx4QqkA60w
 x+cVFXnObF5HCOqUmS1KLvfCnWNyDnEIDOx0pBIDRzfg3Bf/0L9+A7DNL
 wvHwxWQ0lf2K4r/rxa4yr8xd6pf0UJs8OT0WPzqHlfyNq2KedJlanrBsp
 iSzVD+HzcYmtTY5cfbDpJ+lSYM5xVXkSYrY+hjqjDXVKhACB/noU1tsQX g==;
X-CSE-ConnectionGUID: CprUCqfXSgKjtiKqR21ojA==
X-CSE-MsgGUID: pUaNiRSXTQmFo3biJFp9gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102777829"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="102777829"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:37:50 -0700
X-CSE-ConnectionGUID: E16HM/pnSgO5PrdaqxuzEw==
X-CSE-MsgGUID: xRAy0zJPRf2dHiIAGIVP2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="261653195"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 22 Jul 2026 07:37:49 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v8 0/6] drm/xe: add page size allocation mode control and
 coverage
Date: Wed, 22 Jul 2026 20:07:53 +0530
Message-ID: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
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

Nareshkumar Gollakoti (6):
  drm/xe: add page size allocation control state to xe_device
  drm/xe/debugfs: add page-size allocation mode knob
  drm/xe: add XE_BO_FLAG_NEEDS_1G for minimum page-size sizing
  drm/xe: apply debug page-size allocation policy to user BOs
  drm/xe/pt: allow selecting the bind leaf PTE level
  drm/xe/tests: add live KUnit coverage for BO page-size allocation
    modes

 drivers/gpu/drm/xe/Kconfig.debug            |  16 ++
 drivers/gpu/drm/xe/tests/xe_bo.c            | 240 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   6 +
 drivers/gpu/drm/xe/xe_bo.c                  | 160 ++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h                  |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  88 +++++++
 drivers/gpu/drm/xe/xe_device.c              |  19 ++
 drivers/gpu/drm/xe/xe_device.h              |  48 ++++
 drivers/gpu/drm/xe/xe_device_types.h        |  31 +++
 drivers/gpu/drm/xe/xe_pt.c                  |  77 ++++++-
 10 files changed, 682 insertions(+), 4 deletions(-)

-- 
2.43.0

