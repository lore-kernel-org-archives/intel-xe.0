Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F11FC43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 02:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA79710E05D;
	Mon, 13 Jul 2026 02:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpbAOtlR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EEA10E05D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 02:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783909659; x=1815445659;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4j4dWhC8FXv+gfWFt6i8hXLd874NA0N8jO2O9n8YYOs=;
 b=UpbAOtlRbxv99RIqimZuhrio6XAvDvMdWXsGcOr8W6RQ0Mb3TdWMjbja
 1Lx6XgW2u6g+BBpjy4cxH5kc7Aj6aEe6MwQEeIVi0dP2yYIaPHwtc8Muw
 3MmsyK+oXEcygRO+xWusAvJ1gaIAlEDEvdRtiR0xer5LhZIzM/sXdGKzs
 pLbAudwPZc3F8qfIv8QRzwYomqhYNDWKGByPHbRDjdxJfNJNucKVwI9nB
 T8Al5vPYVo5XhOoqKMTKedsV5MbulbcHO7I0ZWIPcMAFLNR5YSGa2OmUU
 05TY/zWYDDX01HV9YE2Vvs4gQc7cg9qNXfor6fJca16G8LaXS4htnT1cP g==;
X-CSE-ConnectionGUID: nFAIWKqGTTariP/pzCIO2w==
X-CSE-MsgGUID: 7MsN1BbZTCCU1QZsh7y1KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88197447"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88197447"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 19:27:38 -0700
X-CSE-ConnectionGUID: CS/zXA33TuyJSh58ozXTkw==
X-CSE-MsgGUID: KgDoTTAxTvetvjW6KtV7Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253680017"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 12 Jul 2026 19:27:37 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v4 0/8] drm/xe: add page size allocation mode control and
 coverage
Date: Mon, 13 Jul 2026 07:55:33 +0530
Message-ID: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
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
 - add Kconfig option for debug page-size allocation control
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

Nareshkumar Gollakoti (8):
  drm/xe: add page size allocation control state to xe_device
  drm/xe: add Kconfig option for debug page-size allocation control
  drm/xe/debugfs: add page-size allocation mode knob
  drm/xe: add XE_BO_FLAG_NEEDS_1G for minimum page-size sizing
  drm/xe: apply debug page-size allocation policy to user BOs
  drm/xe/vm: propagate BO page-size requirements to VMA map flags
  drm/xe/pt: allow selecting the bind leaf PTE level
  drm/xe/tests: add live KUnit coverage for BO page-size allocation
    modes

 drivers/gpu/drm/xe/Kconfig.debug            |  16 ++
 drivers/gpu/drm/xe/tests/xe_bo.c            | 244 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   2 +
 drivers/gpu/drm/xe/xe_bo.c                  | 157 ++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h                  |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  62 +++++
 drivers/gpu/drm/xe/xe_device.c              |   9 +
 drivers/gpu/drm/xe/xe_device_types.h        |  25 ++
 drivers/gpu/drm/xe/xe_pt.c                  |  29 ++-
 drivers/gpu/drm/xe/xe_vm.c                  |  23 ++
 drivers/gpu/drm/xe/xe_vm_types.h            |   9 +
 11 files changed, 573 insertions(+), 4 deletions(-)

-- 
2.43.0

