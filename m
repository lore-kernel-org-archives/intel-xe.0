Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B47C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 20:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FB810E70F;
	Tue, 22 Jul 2025 20:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H73oq7ch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1D310E709
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 20:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753215733; x=1784751733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uwFCmflCr6v1AdufPIx3cfwMeVNc1xDi2nhapcO892I=;
 b=H73oq7ch82Il4GG+5ZRjXdavw1mjCfUKVueGb1q4HOcLd4yJJL+8LRv7
 H49RXQNf0UUko5VgL4NKc+nz87JeAN2nlvXpDGGATRgVYGh1028EUPfhd
 f6RUSF3S/pHbR1E/IZUzuzcsKEI7/5jPZ6ljH53VcdB4WodYTRtz3maRr
 0hQH+uiCzqnSu15cNA7iFLITXqFVxgB1oor49/dgPbMK6tj7IgOhShxoi
 Fv0rSk0zwaKjemft9wx2140fJPJlMRRY/SO1YCQoceO+CRx+sAlviRAN0
 4lExqkdxrWFJQaP/ngQ6gdxWDMn2oEpixz9hLGa3XaGgpTg3vRgLg25u9 A==;
X-CSE-ConnectionGUID: GDAvPGC7RFm5Xui29ehQzw==
X-CSE-MsgGUID: DwtMPr+GR0y51DE59J17UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="58098047"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="58098047"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 13:22:12 -0700
X-CSE-ConnectionGUID: TNC6CU5zQOqWLGAt3lO2gQ==
X-CSE-MsgGUID: WDfWKGuuRUOhIVq/VAgMng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="182947247"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 13:22:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 0/7] Use DRM scheduler for delayed GT TLB invalidations
Date: Tue, 22 Jul 2025 13:23:50 -0700
Message-Id: <20250722202357.3718853-1-matthew.brost@intel.com>
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
v3:
 - Address Stuarts feedback
 - Fix kernel doc, minor cleanups

Matt

[1] https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1

Matthew Brost (7):
  drm/xe: Explicitly mark migration queues with flag
  drm/xe: Add generic dependecy jobs / scheduler
  drm/xe: Create ordered workqueue for GT TLB invalidation jobs
  drm/xe: Add dependency scheduler for GT TLB invalidations to bind
    queues
  drm/xe: Add GT TLB invalidation jobs
  drm/xe: Use GT TLB invalidation jobs in PT layer
  drm/xe: Remove unused GT TLB invalidation trace points

 drivers/gpu/drm/xe/Makefile                 |   2 +
 drivers/gpu/drm/xe/xe_dep_job_types.h       |  29 +++
 drivers/gpu/drm/xe/xe_dep_scheduler.c       | 143 ++++++++++
 drivers/gpu/drm/xe/xe_dep_scheduler.h       |  21 ++
 drivers/gpu/drm/xe/xe_exec_queue.c          |  48 ++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |  15 ++
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c    | 274 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h    |  34 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   8 +
 drivers/gpu/drm/xe/xe_gt_types.h            |   2 +
 drivers/gpu/drm/xe/xe_migrate.c             |  42 ++-
 drivers/gpu/drm/xe/xe_migrate.h             |  13 +
 drivers/gpu/drm/xe/xe_pt.c                  | 178 +++++--------
 drivers/gpu/drm/xe/xe_trace.h               |  16 --
 14 files changed, 700 insertions(+), 125 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
 create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h

-- 
2.34.1

