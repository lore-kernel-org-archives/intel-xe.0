Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FEFCA0EC2
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 22:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E0F10E7D1;
	Wed,  6 Aug 2025 22:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOdwEIgU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EAB10E156
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 22:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754519047; x=1786055047;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=miTLcLE/fqOEWPlgky7US5wfEUV7LhiNG5GMKBxYq/I=;
 b=NOdwEIgU30l6+D7IsgHYEDRtc8LbEYlC1wfiSFyJ2rNVeDAJ7B75d+82
 mJALz8yVglVukbYvcRTzxnsLk/Mpp526/J1zln5GGz8tICXEUx82IeegT
 mhrWRMM09zmPpejXoz5QmRlMM90h0SDGmDKttKQ/N0d/zWcoo/ZqXxKtj
 FDRShZG8Bv1dcIDXPbqKxDBBRukgkUcc/ZDdBVRNB5iuzI54ZlZZAMCg9
 pofRHovtaNpQadyXrfAN6K42kvLveCJM1K4t9FyKUDPD7VGNuk7+Tt2SA
 oQ7fp15HT8KA23yChWqGOUWPiru392T80aVOQ3liILRxcGI/9Q8r4z5z4 g==;
X-CSE-ConnectionGUID: c2nRUZ2yTZuNjX3W74k9Ug==
X-CSE-MsgGUID: Lb69ohymTuqc1t3eVY0YOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56928149"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56928149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 15:24:07 -0700
X-CSE-ConnectionGUID: 8mYXwM4sS52gmuA+2A8qtg==
X-CSE-MsgGUID: htckEFgCTsiO0JJVsTodRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="188560817"
Received: from dut136arlu.fm.intel.com ([10.105.23.73])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 15:24:06 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, farah.kassabri@intel.com,
 intel-xe@lists.freedesktop.org, stuartsummers <stuart.summers@intel.com>
Subject: [PATCH 0/8] Add TLB invalidation abstraction
Date: Wed,  6 Aug 2025 22:23:56 +0000
Message-Id: <20250806222404.30333-1-stuart.summers@intel.com>
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

stuartsummers (1):
  drm/xe: Move explicit CT lock in TLB invalidation sequence

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
 drivers/gpu/drm/xe/xe_tlb_inval.c             | 407 ++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h             |  46 ++
 ..._gt_tlb_inval_job.c => xe_tlb_inval_job.c} | 154 +++--
 drivers/gpu/drm/xe/xe_tlb_inval_job.h         |  33 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h       | 128 ++++
 drivers/gpu/drm/xe/xe_trace.h                 |  24 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  66 +-
 drivers/gpu/drm/xe/xe_vm.h                    |   4 +-
 28 files changed, 1069 insertions(+), 925 deletions(-)
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

