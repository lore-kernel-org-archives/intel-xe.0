Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B936CD6E6D
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 16:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE65D11A15E;
	Thu,  4 Jun 2026 16:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="IklQ44Pr";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4503911A15B
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780589213;
 bh=p0XRwFDkcszljs6q6dIO3tR203Hg8Pi97V4peZUsFWQ=;
 h=From:To:Subject:Date:From;
 b=IklQ44PrqKKpPsYDlhcyv3Lsee48ZAKL3zOHRJX/IIbBsrJ5nb5sNppy9duW7JNSt
 /eEQpcdyaqf5ugW9wGiUI+PmVzPPikrNtRbzdJHBnvFq1meIC3XiP9WdZguUnBOreC
 bEf+ykfiaevk/Bwmx3EiZF1Bjbu8/cZ/ojCj8JqICqJBhE6Ff+AtXMQFlVKTfMw/bX
 /k8XOYDqjadoMtASVC+Rng9Ct+1DQ0gHzhFILpRBZqO2r/0nYfcJjwA3tFBLp0qy1m
 5yAFWSbx9yfaTYT5RO3B5WUTrtvAESQ97Xre5lX4zgvE9OTCzJhypZ7kh+pqGR/ea9
 jfY0uRR9CeRcQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI 00/24]  CPU binds and ULLS on migration queue
Date: Thu,  4 Jun 2026 18:06:29 +0200
Message-ID: <20260604160655.50036-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
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

Rebase of https://lore.kernel.org/all/20260228013501.106680-1-matthew.brost@intel.com/

This is a test for CI to check if it's clean. Some small changes have been made
to compile on newer kernels.

Of note was that max_jobs < 64 now, so I had to remove an assertion in GuC
submission that assumed max_jobs was greater.

I also fixed a SINGAL -> SIGNAL typo.

No reviews or feedback please, I first want to check if the test results
from the mostly unmodified patch series are still clean after rebasing, then
I can work on addressing the review feedback in the original series.

Matthew Brost (24):
  drm/xe: Drop struct xe_migrate_pt_update argument from populate/clear
    vfuns
  drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper
  drm/xe: Decouple exec queue idle check from LRC
  drm/xe: Add job count to GuC exec queue snapshot
  drm/xe: Update xe_bo_put_deferred arguments to include writeback flag
  drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
  drm/xe: Update scheduler job layer to support PT jobs
  drm/xe: Add helpers to access PT ops
  drm/xe: Add struct xe_pt_job_ops
  drm/xe: Update GuC submission backend to run PT jobs
  drm/xe: Store level in struct xe_vm_pgtable_update
  drm/xe: Don't use migrate exec queue for page fault binds
  drm/xe: Enable CPU binds for jobs
  drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
  drm/xe: Make bind queues operate cross-tile
  drm/xe: Add CPU bind layer
  drm/xe: Add device flag to enable PT mirroring across tiles
  drm/xe: Add xe_hw_engine_write_ring_tail
  drm/xe: Add ULLS support to LRC
  drm/xe: Add ULLS migration job support to migration layer
  drm/xe: Add ULLS migration job support to ring ops
  drm/xe: Add ULLS migration job support to GuC submission
  drm/xe: Enter ULLS for migration jobs upon page fault or SVM prefetch
  drm/xe: Add modparam to enable / disable ULLS on migrate queue

 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/xe_bo.c               |   8 +-
 drivers/gpu/drm/xe/xe_bo.h               |  11 +-
 drivers/gpu/drm/xe/xe_bo_types.h         |   2 -
 drivers/gpu/drm/xe/xe_cpu_bind.c         | 296 +++++++++
 drivers/gpu/drm/xe/xe_cpu_bind.h         | 118 ++++
 drivers/gpu/drm/xe/xe_debugfs.c          |   1 +
 drivers/gpu/drm/xe/xe_defaults.h         |   1 +
 drivers/gpu/drm/xe/xe_device.c           |  16 +-
 drivers/gpu/drm/xe/xe_device_types.h     |  11 +
 drivers/gpu/drm/xe/xe_drm_client.c       |   2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 164 ++---
 drivers/gpu/drm/xe/xe_exec_queue.h       |  18 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  20 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       |  78 ++-
 drivers/gpu/drm/xe/xe_guc_submit_types.h |   2 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |  20 +
 drivers/gpu/drm/xe/xe_hw_engine.h        |   1 +
 drivers/gpu/drm/xe/xe_lrc.c              |  51 ++
 drivers/gpu/drm/xe/xe_lrc.h              |   3 +
 drivers/gpu/drm/xe/xe_lrc_types.h        |   4 +
 drivers/gpu/drm/xe/xe_migrate.c          | 595 ++++++-----------
 drivers/gpu/drm/xe/xe_migrate.h          |  93 +--
 drivers/gpu/drm/xe/xe_module.c           |   4 +
 drivers/gpu/drm/xe/xe_module.h           |   1 +
 drivers/gpu/drm/xe/xe_pagefault.c        |   3 +
 drivers/gpu/drm/xe/xe_pci.c              |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h        |   3 +-
 drivers/gpu/drm/xe/xe_pt.c               | 773 ++++++++++++++---------
 drivers/gpu/drm/xe/xe_pt.h               |  12 +-
 drivers/gpu/drm/xe/xe_pt_types.h         |  49 +-
 drivers/gpu/drm/xe/xe_ring_ops.c         |  31 +
 drivers/gpu/drm/xe/xe_sched_job.c        | 100 ++-
 drivers/gpu/drm/xe/xe_sched_job_types.h  |  36 +-
 drivers/gpu/drm/xe/xe_sync.c             |  20 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c    |  28 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.h    |   4 +-
 drivers/gpu/drm/xe/xe_vm.c               | 240 +++----
 drivers/gpu/drm/xe/xe_vm.h               |   3 +
 drivers/gpu/drm/xe/xe_vm_types.h         |  22 +-
 40 files changed, 1661 insertions(+), 1186 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_cpu_bind.c
 create mode 100644 drivers/gpu/drm/xe/xe_cpu_bind.h

-- 
2.53.0

