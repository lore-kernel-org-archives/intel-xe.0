Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA01C83F05
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 23:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296AF10E7B4;
	Wed,  2 Jul 2025 23:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJzxiNQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D3910E7B3
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 23:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751499643; x=1783035643;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Q7DHzZNglBoQjb6QZ3Xb6UWOAPOmT7oG1L7uia9N+A=;
 b=oJzxiNQ+KMvLkW2YUYoDqGxEZOt4gZRuI/3/a7o3cH0YcFZiMhvmVPpq
 7b6w/HYNja+vt+kRe9mk2SY9AcIt3eD10yNn74lK06dtf6PYZti+Suolv
 y/Y45xDw+z6esKzi/Gwj2PplCvw5BVbK0UauENDCF07ZCOokEAUTLSUwn
 AggKHbQPQ1ltiJaVBQ156KL83oNe5t2WOXhFzfDZNSV/8lK4B3yXw0TZC
 zlWUkuGBlqG0kFgKDQgy2cko/B/1djGs8d7mem4+lKVPgsj7L48TgGFOl
 o3fCof8c6XY8foc8F5AMem70/d2pLgYokPIyGaDR0bNkl1bpPAzWGdn/p A==;
X-CSE-ConnectionGUID: Jel31t6aReOMPLPdUu+4Hw==
X-CSE-MsgGUID: VRSMab1IRcO1mXtGZ7h/SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57489468"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="57489468"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:42 -0700
X-CSE-ConnectionGUID: gakYqMdDTCeyDpRbwdnAGg==
X-CSE-MsgGUID: bH6vxyxORxmNXVH90W1lhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153624520"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 0/9] Use DRM scheduler for delayed GT TLB invalidations
Date: Wed,  2 Jul 2025 16:42:13 -0700
Message-Id: <20250702234222.3278264-1-matthew.brost@intel.com>
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

Use the DRM scheduler for delayed GT TLB invalidations, which properly
fixes the issue raised in [1]. GT TLB fences have their own dma-fence
context, so even if the invalidations are ordered, the dma-resv/DRM
scheduler cannot squash the fences. This results in O(M*N*N) complexity
in the garbage collector, where M is the number of ranges in the garbage
collector and N is the number of pending GT TLB invalidations. After
this change, the resulting complexity in O(M*C) where C is the number of
TLB invalidation contexts (i.e., number of exec queue, GTs tuples) with
an invalidation in flight.

Admittedly, it's quite a lot of code, but the series includes extensive
kernel documentation and clear code comments. It introduces a generic
dependency scheduler that can be reused in the future and is logically
much cleaner than the previous open-coded solution for delaying GT TLB
invalidations until a bind job completes.

v2:
 - Various cleanup covered in detail in change logs
 - Use a per-GT ordered workqueue as DRM scheduler workqueue
 - Remove unused ftrace points

Matt

[1] https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1

Matthew Brost (9):
  drm/xe: Explicitly mark migration queues with flag
  drm/xe: Add generic dependecy jobs / scheduler
  drm: Simplify drmm_alloc_ordered_workqueue return
  drm/xe: Create ordered workqueue for GT TLB invalidation jobs
  drm/xe: Add dependency scheduler for GT TLB invalidations to bind
    queues
  drm/xe: Add xe_migrate_job_lock/unlock helpers
  drm/xe: Add GT TLB invalidation jobs
  drm/xe: Use GT TLB invalidation jobs in PT layer
  drm/xe: Remove unused GT TLB invalidation trace points

 drivers/gpu/drm/vkms/vkms_crtc.c            |   2 -
 drivers/gpu/drm/xe/Makefile                 |   2 +
 drivers/gpu/drm/xe/xe_dep_job_types.h       |  29 +++
 drivers/gpu/drm/xe/xe_dep_scheduler.c       | 145 +++++++++++
 drivers/gpu/drm/xe/xe_dep_scheduler.h       |  21 ++
 drivers/gpu/drm/xe/xe_exec_queue.c          |  48 ++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |  15 ++
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c    | 271 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h    |  34 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   8 +
 drivers/gpu/drm/xe/xe_gt_types.h            |   2 +
 drivers/gpu/drm/xe/xe_migrate.c             |  42 ++-
 drivers/gpu/drm/xe/xe_migrate.h             |  13 +
 drivers/gpu/drm/xe/xe_pt.c                  | 178 +++++--------
 drivers/gpu/drm/xe/xe_trace.h               |  16 --
 include/drm/drm_managed.h                   |  15 +-
 16 files changed, 712 insertions(+), 129 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
 create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h

-- 
2.34.1

