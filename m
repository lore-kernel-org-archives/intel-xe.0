Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDABC5AC82
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 18:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307C910E37C;
	Thu,  6 Aug 2026 18:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGXronOL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1220210E36A
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 18:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786042332; x=1817578332;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PFnyGATQ/ZhsOdRpEZAfLcKa98MSECggT1JQe71nDyQ=;
 b=hGXronOL8lX4xDLZdVYNcrNa38i9EjwQxq2AUsdYlBH1A2YtZjnx3yLO
 lIRyay+DlE4hJGBy0ElKHAZUj7AnwOLMMJtw5RGMqTazZucR12bwdA5h4
 G7mr/f+ngItKAoAUdElozlNRzpVKmoXo5UezEwh/woV0Wk8P+7Fc+BM4G
 xYFXHb3H6gizkZXZTjyNwYKps0njRxVhHAqZvPDWZJ+7SldfuQdrffjPI
 tHdZFdmy53HbDm3mcOEsj1OIlPl7PRKtc2D9dWyiOwdAKzAq3QFSNpwj8
 XVEIMZ3tVHzVBKyH2N0QGNfS6U7+6zckHafEps/jckjtCAnR8bs50FYgu w==;
X-CSE-ConnectionGUID: i4H7QuS8T+m6fBt/r8IpTw==
X-CSE-MsgGUID: Rh+gZZWlQ32AxWjCh1ZvVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86854802"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="86854802"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 11:52:10 -0700
X-CSE-ConnectionGUID: 3Mkw5m/+TzuuVpv4JDnrEA==
X-CSE-MsgGUID: noti8mOnQGGLUfaPGnuMpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="266414593"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 11:52:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 00/12] Fine grained fault locking, threaded prefetch,
 storm cache
Date: Thu,  6 Aug 2026 11:51:50 -0700
Message-Id: <20260806185202.3922432-1-matthew.brost@intel.com>
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
v7:
 - Dedicated prefetch work queue (Sashiko, arch choice)
 - Clean up unwind paths (Sashiko)
v8:
 - Still fighting valid Sashiko issues (unwind, locking issues, reset flows)
v9:
 - Use -ENODATA on races
 - Minor style, comment cleanups

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
 drivers/gpu/drm/xe/xe_device_types.h    |  23 +-
 drivers/gpu/drm/xe/xe_gt_stats.c        |   7 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h  |  22 +
 drivers/gpu/drm/xe/xe_guc_ct.c          |  95 +++-
 drivers/gpu/drm/xe/xe_guc_ct.h          |  38 +-
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  39 +-
 drivers/gpu/drm/xe/xe_guc_types.h       |   6 +
 drivers/gpu/drm/xe/xe_module.c          |   4 +
 drivers/gpu/drm/xe/xe_module.h          |   1 +
 drivers/gpu/drm/xe/xe_pagefault.c       | 689 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_pagefault.h       |  74 +++
 drivers/gpu/drm/xe/xe_pagefault_types.h | 112 +++-
 drivers/gpu/drm/xe/xe_pt.c              |   6 +
 drivers/gpu/drm/xe/xe_svm.c             | 146 +++--
 drivers/gpu/drm/xe/xe_svm.h             |  59 +-
 drivers/gpu/drm/xe/xe_userptr.c         |  19 +-
 drivers/gpu/drm/xe/xe_vm.c              | 298 +++++++---
 drivers/gpu/drm/xe/xe_vm_types.h        |  42 +-
 21 files changed, 1397 insertions(+), 309 deletions(-)

-- 
2.34.1

