Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5266CC44501
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 18:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91C510E0FF;
	Mon, 13 Jul 2026 18:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJQXH0vM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE3510E0FF
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 18:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783966541; x=1815502541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q5H0rpChItNxjOURNa4gvm186XeyY1wY65zQFxWN8VE=;
 b=NJQXH0vMTuUG2Exnqp2aD+mw/IVFAQ793Y4rVPs4R6x1jU6SJvXdBqxF
 e49St62MtWfApYLIal8t47l2TOdEtqbLEhBsvn4LPt/eo7X4JuT4TYRPe
 UqszjwJQ/rVldt1XDkHfS8Qc5AkHlIRpJfMtxVssthdq0Cdk3FC+WRo6T
 2CVbf1vrQBc9KPdWtdXGECD46pd6GYN2KRR4UI3a8QLg1NQUdy+rauOEE
 R3QqQCz2KrDDP9vy9eAknBr+uOXY7Y6LqnQSOdt+kNVrGvrIvIRLm8gK4
 p46m+4y45ruHjh4QCGy0fyG9eEki6qjW4gNUCCZgg5KoNvSoJncOi4OV2 w==;
X-CSE-ConnectionGUID: XTG6rhb8RQqi17HlVXdG3Q==
X-CSE-MsgGUID: S4afDkFzRtCIkhn4e/GsEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84460870"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84460870"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 11:15:41 -0700
X-CSE-ConnectionGUID: tfruUYYwQcGeRlP4EReKJQ==
X-CSE-MsgGUID: xwHLSj+RTGube4E4DVxD7w==
X-ExtLoop1: 1
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jul 2026 11:15:39 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v5 0/7] drm/xe: add page size allocation mode control and
 coverage
Date: Mon, 13 Jul 2026 23:45:58 +0530
Message-ID: <20260713181605.3127204-1-naresh.kumar.g@intel.com>
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

v5
v5:
- Guard debug page-size control support with CONFIG_DRM_XE_DEBUG_PAGE_SIZE
- Fix kernel-doc warnings in xe_device_types.h for page_size_alloc_ctrl
- Keep the normal BO creation path unchanged when no debug mode is selected
- Reword commit messages for clarity and to match the implementation

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
 drivers/gpu/drm/xe/tests/xe_bo.c            | 249 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   2 +
 drivers/gpu/drm/xe/xe_bo.c                  | 166 ++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h                  |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  62 +++++
 drivers/gpu/drm/xe/xe_device.c              |  13 +-
 drivers/gpu/drm/xe/xe_device.h              |  30 +++
 drivers/gpu/drm/xe/xe_device_types.h        |  31 +++
 drivers/gpu/drm/xe/xe_pt.c                  |  53 ++++-
 drivers/gpu/drm/xe/xe_vm.c                  |  29 +++
 drivers/gpu/drm/xe/xe_vm_types.h            |   9 +
 12 files changed, 656 insertions(+), 5 deletions(-)

-- 
2.43.0

