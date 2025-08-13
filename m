Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC44CA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 19:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD2910E12A;
	Wed, 13 Aug 2025 19:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VH2mV5Lz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5704B10E12A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 19:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755114492; x=1786650492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=agNwPJm6SrY0MQIWwdvPZGGXrxRPRhRaO1BWrAu3WdQ=;
 b=VH2mV5LzXDyj6xZ2mWday4RW+SlwVb5FPiaqxWqDgAiAIG5h9M7FdiR6
 v9nZQ8ic5yrrn4rzJGtt7mes6hjwuyBqe1fNBT1ZB1f+zKA4++W7vNLoC
 BaTspbYdfS53/XjxD4mzvxcuPjEGnlZ97qU5+Guy5zcRCRzHWAE6SwnSR
 P+i9BMkAdPiCm6S6tSPQIbr1mn21RL12uJPN+QbPW3OkkEt+e7XizlVEb
 SfyqdouXBuy/YfWnIPcRzBqiCeDSWT9TvAGEqu5CODo+eOxhWOadGByUH
 OAePuiDKm3rYmYizu8E9mGxDLyOG16CU9OwTN2wAkOsvVYF+jHx300HKF Q==;
X-CSE-ConnectionGUID: sZpnq4KBSiSJuvXb9WysGw==
X-CSE-MsgGUID: j8brjDRlQ+y/m2Owy2tncg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60047015"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="60047015"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 12:48:12 -0700
X-CSE-ConnectionGUID: S3Yt7zktTdiePbWc0jl1RA==
X-CSE-MsgGUID: Nc7DAiwPSFSqw9Vt5lcpJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166206175"
Received: from dut137arlu.fm.intel.com ([10.105.23.66])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 12:48:12 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, stuartsummers <stuart.summers@intel.com>
Subject: [PATCH 0/9] Add TLB invalidation abstraction
Date: Wed, 13 Aug 2025 19:47:57 +0000
Message-Id: <20250813194806.140500-1-stuart.summers@intel.com>
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

stuartsummers (2):
  drm/xe: Move explicit CT lock in TLB invalidation sequence
  drm/xe: Stop the TLB fence timer on driver teardown

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
 drivers/gpu/drm/xe/xe_tlb_inval.c             | 421 ++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h             |  46 ++
 ..._gt_tlb_inval_job.c => xe_tlb_inval_job.c} | 154 +++--
 drivers/gpu/drm/xe/xe_tlb_inval_job.h         |  33 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h       | 130 ++++
 drivers/gpu/drm/xe/xe_trace.h                 |  24 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  66 +-
 drivers/gpu/drm/xe/xe_vm.h                    |   4 +-
 28 files changed, 1085 insertions(+), 925 deletions(-)
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

