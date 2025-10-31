Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A898CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4385110E380;
	Fri, 31 Oct 2025 18:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnKKdHAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2DB10E380
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761934196; x=1793470196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=acWCAdcpt8FJKoq5JXflONjpBJ1zwBBiN2o+3EfvTKE=;
 b=RnKKdHAhp0FkmRSqyLLr3uOGNwxqPTNEp6LJW4urdfcXyX0D/x3rpfpJ
 VwIy/dIbCmtHyjYHtBI9/S98YP39F9fa/By4n+KzFRWv9Jr4FdpjBOTsr
 dD2UQxrYIC8vTyenNEzx+4c2rQLvPTDi4kqgAPMSJzL+GILMe4JRSH3A4
 m1Kx9pVoEeOtB+m/tkB/JuvKVat8q/yID1ZU14tR6gZVbLfDWcVhdts9T
 Z62QgKNQ1lAZ8jKoPZPur2DJ4BAwkW/7sblmaxspTWAcZLjFb4tZsgcLy
 c8wf8SofU5rHzf6xW+unUyr4Xhy+gBgdTmBCo+lB5fxNS1W9ZV5nLVVQS Q==;
X-CSE-ConnectionGUID: 8j5whrjNTYmpZQN2qm16Mg==
X-CSE-MsgGUID: lIsLc42+QQKbUbth5Qvh4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63305197"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63305197"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:09:55 -0700
X-CSE-ConnectionGUID: tnZsUvhyRFuADUszCvMoEw==
X-CSE-MsgGUID: l5/90YQnRm2yocFOhDWGlA==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:09:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v6 0/6] Fix serialization on burst of unbinds - v2
Date: Fri, 31 Oct 2025 11:09:43 -0700
Message-Id: <20251031180949.2968311-1-matthew.brost@intel.com>
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

Attempting to resolve part of [1]; this solution differs than v1 [2] by
changing last fence semantics detailed in the patches.

Overview of issue in [1]:

When a burst of unbind jobs is issued, a dependency chain can form
between the TLB invalidation of a previous unbind job and the current
one. This leads to undesirable serialization, causing current jobs to
wait unnecessarily for prior TLB invalidations, execute on the GPU when
not needed, and significantly slow down the unbind burst—resulting in up
to a 4× to 8× slowdown depending on platform.
 
Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
[2] https://patchwork.freedesktop.org/series/156144/

Matthew Brost (6):
  drm/xe: Enforce correct user fence signaling order using
  drm/xe: Attach last fence to TLB invalidation job queues
  drm/xe: Decouple bind queue last fence from TLB invalidations
  drm/xe: Skip TLB invalidation waits in page fault binds
  drm/xe: Disallow input fences on zero batch execs and zero binds
  drm/xe: Remove last fence dependency check from binds and execs

 drivers/gpu/drm/xe/xe_exec.c             |   7 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 119 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.h       |  23 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  12 +++
 drivers/gpu/drm/xe/xe_migrate.c          |  14 +++
 drivers/gpu/drm/xe/xe_migrate.h          |   8 ++
 drivers/gpu/drm/xe/xe_oa.c               |  45 ++++++---
 drivers/gpu/drm/xe/xe_oa_types.h         |   8 ++
 drivers/gpu/drm/xe/xe_pt.c               |  80 +++++----------
 drivers/gpu/drm/xe/xe_sched_job.c        |  17 ----
 drivers/gpu/drm/xe/xe_sched_job.h        |   1 -
 drivers/gpu/drm/xe/xe_sync.c             |  91 ++++++++++-------
 drivers/gpu/drm/xe/xe_sync.h             |   3 +
 drivers/gpu/drm/xe/xe_sync_types.h       |   3 +
 drivers/gpu/drm/xe/xe_tlb_inval_job.c    |  31 ++++--
 drivers/gpu/drm/xe/xe_tlb_inval_job.h    |   5 +-
 drivers/gpu/drm/xe/xe_vm.c               |  97 ++++++++++--------
 drivers/gpu/drm/xe/xe_vm_types.h         |   6 +-
 18 files changed, 376 insertions(+), 194 deletions(-)

-- 
2.34.1

