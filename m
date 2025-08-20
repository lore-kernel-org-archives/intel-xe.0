Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6318CA0EF8
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 22:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF8F10E809;
	Wed, 20 Aug 2025 22:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOjKx3Cs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBEA10E809
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755729957; x=1787265957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FdoUBEgQHR/CnL2/LdFGy17nBHI7yV8bbwJw3avjRzc=;
 b=ZOjKx3CsS8zKKqwMyezMAPfqRAFCbvd2qrKFoeIblaUsarLDOo7Ae6tz
 LDIZclAqCsCAto+mTKcfYcw7k050uJbg0g4CQeuMIcbJv6nYdmVss73bN
 tLQ4VNZdARTjQ26HOTg00ospitBnlX17MFuBEi11niNmjEi/W0iPRde7m
 2ilee8FSAgphFP20CF+X3xNz8Uzx9chR4/fBPUl71zXKD9NOYzn6WLhWU
 RpR37LnGE82kCTiZxyzSDeeyEyhoopKglEdFFlNaE2T3KxNWvLZdx0Tkp
 XOF7HuuThD8S0lxlwXimZkHf/+0XSXodrHmpbIii4mYDEqSldsQRw43/W A==;
X-CSE-ConnectionGUID: FNGBzcXoSr6sFuWRaf99Aw==
X-CSE-MsgGUID: Fk2I6s/VQxWri6liopQBrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57927805"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="57927805"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 15:45:57 -0700
X-CSE-ConnectionGUID: JPrR4K6FRq6HK12YmtgsNA==
X-CSE-MsgGUID: wiWkk/5wRKuiMz3dltPa/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172472378"
Received: from dut137arlu.fm.intel.com ([10.105.23.66])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 15:45:55 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/9] Add TLB invalidation abstraction
Date: Wed, 20 Aug 2025 22:45:43 +0000
Message-Id: <20250820224552.65797-1-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
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

This is a new collection of patches from Matt that has
been floating around internally and on the mailing list.
The goal here is to abstract the actual mechanism of
the invalidation from the higher level invalidation triggers
(like page table updates).

Most of these were brought in unmodified by Matt, but
I've done some minor rebase work here and there and
added my signoff where those rebases seemed a little
more extensive.

Tested on BMG locally.

v7: Add a little more documentation around the TLB worker
    cancel on teardown and move that cancelation to a
    drm teardown helper.
v6: Fix for UAF in timer.c due to outstanding TLB inval
    on teardown.
v5: Make sure seqno_lock covers the prep and send in
    the later patches (Matt)
v4: Replace CT lock with seqno_lock
v3: Minor spelling fixes and added R-B's per updates on
    on the mailing list
v2: Start the series with a new patch to drop the
    explicit CT lock (Matt)
    Pull in the remaining patches from [1]

[1] https://patchwork.freedesktop.org/series/151670/#rev1

Matthew Brost (7):
  drm/xe: s/tlb_invalidation/tlb_inval
  drm/xe: Add xe_tlb_inval structure
  drm/xe: Add xe_gt_tlb_invalidation_done_handler
  drm/xe: Decouple TLB invalidations from GT
  drm/xe: Prep TLB invalidation fence before sending
  drm/xe: Add helpers to send TLB invalidations
  drm/xe: Split TLB invalidation code in frontend and backend

Stuart Summers (2):
  drm/xe: Move explicit CT lock in TLB invalidation sequence
  drm/xe: Cancel pending TLB inval workers on teardown

 drivers/gpu/drm/xe/Makefile                   |   5 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |   4 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   8 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |   1 -
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h      |  34 -
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 604 ------------------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  40 --
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  32 -
 drivers/gpu/drm/xe/xe_gt_types.h              |  33 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   8 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c         | 242 +++++++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.h         |  19 +
 drivers/gpu/drm/xe/xe_lmtt.c                  |  12 +-
 drivers/gpu/drm/xe/xe_migrate.h               |  10 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +-
 drivers/gpu/drm/xe/xe_pci_types.h             |   2 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  63 +-
 drivers/gpu/drm/xe/xe_svm.c                   |   3 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c             | 442 +++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h             |  46 ++
 ..._gt_tlb_inval_job.c => xe_tlb_inval_job.c} | 154 +++--
 drivers/gpu/drm/xe/xe_tlb_inval_job.h         |  33 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h       | 130 ++++
 drivers/gpu/drm/xe/xe_trace.h                 |  24 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  66 +-
 drivers/gpu/drm/xe/xe_vm.h                    |   4 +-
 28 files changed, 1106 insertions(+), 925 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_inval.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_inval.h
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval.c
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval.h
 rename drivers/gpu/drm/xe/{xe_gt_tlb_inval_job.c => xe_tlb_inval_job.c} (50%)
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval_job.h
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval_types.h

-- 
2.34.1

