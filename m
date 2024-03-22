Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB23BC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 09:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872DA10ECF0;
	Fri, 22 Mar 2024 09:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcQPfWsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F89C10E376
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 09:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711098145; x=1742634145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RJ5QW+aolqiuSevIxwE58MqLSHY5u6bxagNo72eo/Yk=;
 b=HcQPfWslaWGcUbTruAvybrs2YK0Ows2FWley/nXFdwn+Hzmske2GGsOx
 1IdVdJar8SFTSe+xYABKIGPnt2BfBLAMLziWdQMNO1aY31TtGv6rBxejO
 AYSMFoBOS6L410gDdscVbTnqQdB2H8FtZYmBwx7FpuCCWs40MRcLpUq1b
 wv8nWcXYLHAPT29gPdbjkmE/NHsvDmouTaPdpb07n2uZT5EM89jCba1tn
 RZEnKgzimh33o9/b37KavzdmkpznoFJ/x3/qtmLmsqY46G75d1cexRV+g
 eIn1uCKIMU5uDZLf3ROy/CXoFfC8FTxKn42tp3e1rCYZbIS0t4Io6JMGs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9087164"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="9087164"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:02:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="15238763"
Received: from ettammin-desk.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.178])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:02:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 0/7] drm/xe: Rework rebinding and allow same-vm eviction 
Date: Fri, 22 Mar 2024 10:02:06 +0100
Message-ID: <20240322090213.6091-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

We were not allowing eviction / shrinking of completely unbound
local objects. Since unbinding is the UMD primary means of
freeing up memory on local VM overcommit situations, fix this.

The funtionality added here also open up the possibility to evict
purgeable local objects with upcoming changes.

To make this work properly, rebinding needs to be moved to the
while-not-all-locked drm-exec loop, since rebinding may allocate
gpu page table bos and thus cause evictions which forces us
to re-run validation.

This is done in patch 5, but when writing that patch, a number
couple of rebinding flaws were discovered.

1) When saving the rebinding fence we always presumed the
   rebinding fences were ordered. That is not true, and is
   fixed in patch 2, where we attach the rebind fences as
   kernel fences to the vm's resv.
2) In fact, TLB invalidation fences may currently not be assumed to be
   ordered at all. This is fixed in patch 3.
3) The combination of fixes for 1) and 2) makes the rebind
   of each vma wait for the TLB invalidation of the previous
   rebind, which is unnecessary and would incur unneeded latency.
   This is fixed in patch 1 where we move rebind TLB invalidation
   to the ring ops.

Patch 4 helps avoid fragile fence context assumptions for binds.
Patch 5 helps us decide which local bos can be evicted
Patch 6 allows evictions of completely unbound local bos

v2:
- Simplify if-statements around the tlb_flush_seqno.
      (Matthew Brost)
- Add some comments and asserts.
- Remove a leftover call to xe_vm_rebind() (Matt Brost)
- Add a helper function xe_vm_validate_rebind() (Matt Brost)
- Rebasing

Thomas Hellström (7):
  drm/xe: Use ring ops TLB invalidation for rebinds
  drm/xe: Rework rebinding
  drm/xe: Make TLB invalidation fences unordered
  drm/xe: Reserve fences where needed
  drm/xe: Move vma rebinding to the drm_exec locking loop
  drm/xe/bo: Forward the decision to evict local objects during
    validation
  drm/xe/bo: Allow eviction of unbound local bos

 drivers/gpu/drm/xe/display/xe_fb_pin.c      |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c            |   6 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c       |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c       |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                  |  40 +++++--
 drivers/gpu/drm/xe/xe_bo.h                  |   2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c             |   2 +-
 drivers/gpu/drm/xe/xe_exec.c                |  75 +------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |   5 +
 drivers/gpu/drm/xe/xe_ggtt.c                |   2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   5 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   1 -
 drivers/gpu/drm/xe/xe_gt_types.h            |   7 --
 drivers/gpu/drm/xe/xe_pt.c                  |  25 ++++-
 drivers/gpu/drm/xe/xe_ring_ops.c            |  11 +-
 drivers/gpu/drm/xe/xe_sched_job.c           |  10 ++
 drivers/gpu/drm/xe/xe_sched_job_types.h     |   2 +
 drivers/gpu/drm/xe/xe_vm.c                  | 114 ++++++++++++--------
 drivers/gpu/drm/xe/xe_vm.h                  |   8 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |  18 +++-
 20 files changed, 174 insertions(+), 167 deletions(-)

-- 
2.44.0

