Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83FEC53200
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 01:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E5910F27B;
	Fri, 24 Jul 2026 01:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHbPIcLB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A516510E639
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 01:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784855392; x=1816391392;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W6mo3GxtbnIZAzeXVYaw40CG3zC+yekwkYvkJ/P3pj4=;
 b=jHbPIcLBkWW59xw+KhIW2vPW+oqYi73K+itVc4POeuMjsz5lcOa4S1MJ
 mrEFIWNEQOhxLdyp2vcL3ezCr0XNHyG5bG6Vhm/ZVe4vjRMLPBe+h94Ay
 vkqlo/GrY6mwNkAs1xpapSGCiJEg6LPP8LqW2Xu7WBytxelMmWI/qZm2z
 wglAIR/5fipZdEoTr2RZVJX23jHIkLxPUGIahNQ0n3D4/K2XvWjSxh1xR
 0Qd2rEZNbXoJz+NFRebcgwsvZl+rPsWWFD+3LoHLYpnUYjj7bZOPLpWyg
 uuEqXpY5jEiJ3rOQqf8SUue99WvO43OT7PN7hVNHtf89JHrxl6cGgmSpT A==;
X-CSE-ConnectionGUID: WW8CCun/SLCWaWV2WQqmsQ==
X-CSE-MsgGUID: LTcJWKn2QNCrUG91giyVmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="73064787"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="73064787"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 18:09:52 -0700
X-CSE-ConnectionGUID: rYhdmPaJSNWoDS9NImnNTw==
X-CSE-MsgGUID: u+mJOlppSo6ibKxzd5kmHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="255929075"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 18:09:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 00/12] Fine grained fault locking, threaded prefetch,
 storm cache
Date: Thu, 23 Jul 2026 18:09:35 -0700
Message-Id: <20260724010947.1573757-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fine-grained fault locking provides immediate benefits: it allows page
faults from the same VM to be processed in parallel (unless they target
the same range) and enables a sane multi-threaded prefetch
implementation. UMD prefetch benchmarks see 10% to 50% improvement in
prefetch performance on BMG depending on PCIe bus speed.

Once parallel fault processing is available, the pagefault queue can be
unified into a single queue with multiple workers pulling faults to
process. A single queue then allows a sensible pagefault cache to be
implemented, so that multiple faults targeting the same region can be
batched together and acknowledged in, ideally, a single pass. This saves
CPU cycles during pagefault handling and improves overall throughput of
the fault handler.

Significant improvements in UMD pagefault benchmarks can be seen when
utilizing this caching.

v3:
 - Fix kunit build (CI)
v4:
 - Actually fix kunit build (CI)
v5:
 - Address v4 feedback, rebase, fix several CI bugs
v6:
 - Address Sashiko feedback: https://sashiko.dev/#/patchset/20260723214743.1498125-1-matthew.brost%40intel.com
 - CI fixes

Matt

Matthew Brost (12):
  drm/xe: Fine grained page fault locking
  drm/xe: Allow prefetch-only VM bind IOCTLs to use VM read lock
  drm/xe: Thread prefetch of SVM ranges
  drm/xe: Use a single page-fault queue with multiple workers
  drm/xe: Add num_pf_work modparam
  drm/xe: Engine class and instance into a u8
  drm/xe: Track pagefault worker runtime
  drm/xe: Chain page faults via queue-resident cache to avoid fault
    storms
  drm/xe: Add pagefault chaining stats
  drm/xe: Add debugfs pagefault_info
  drm/xe: batch CT pagefault acks with periodic flush
  drm/xe: Track parallel page fault activity in GT stats

 drivers/gpu/drm/xe/xe_debugfs.c         |  11 +
 drivers/gpu/drm/xe/xe_defaults.h        |   1 +
 drivers/gpu/drm/xe/xe_device.c          |  14 +-
 drivers/gpu/drm/xe/xe_device_types.h    |  17 +-
 drivers/gpu/drm/xe/xe_gt_stats.c        |   7 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h  |  22 +
 drivers/gpu/drm/xe/xe_guc_ct.c          |  95 +++-
 drivers/gpu/drm/xe/xe_guc_ct.h          |  36 +-
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  39 +-
 drivers/gpu/drm/xe/xe_guc_types.h       |   6 +
 drivers/gpu/drm/xe/xe_module.c          |   4 +
 drivers/gpu/drm/xe/xe_module.h          |   1 +
 drivers/gpu/drm/xe/xe_pagefault.c       | 688 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_pagefault.h       |  74 +++
 drivers/gpu/drm/xe/xe_pagefault_types.h | 112 +++-
 drivers/gpu/drm/xe/xe_svm.c             | 159 ++++--
 drivers/gpu/drm/xe/xe_svm.h             |  59 +-
 drivers/gpu/drm/xe/xe_userptr.c         |  21 +-
 drivers/gpu/drm/xe/xe_vm.c              | 260 ++++++---
 drivers/gpu/drm/xe/xe_vm_types.h        |  42 +-
 20 files changed, 1373 insertions(+), 295 deletions(-)

-- 
2.34.1

