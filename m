Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1B5C47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 09:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623F910F42C;
	Wed, 27 Mar 2024 09:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnYoWqcu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4F910F42C
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711530715; x=1743066715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m2F99xeMANVTzu5JDdgoetKmOhIYxZLUt9sq4hzf/YQ=;
 b=lnYoWqcuay4O8QBrvRmkk1536PqMPUt2frYhV8FngA6qnbFfHA6ItNYV
 tuSvajFmAZ8MKE3UQR/wIfPPI4haNgdgqpAksXzYc8aoZooW9LfLsPtjB
 2SiCgwInUOxpeXTdDk8hWsEuBo4JzPq34C5kZot3fofKzwB/O4jPzA6iU
 oumY7i+3HOTAE+E9Je2GnAdKQjW9vEZ9eR57pxvlzckHbpeH0V+p7pgOa
 RIspohj2vjdnrJpqVLsBJV3tVp/d3UhZTy9l18LQQR2feZf69q2+/w8EM
 WpMUAjmqVH4SE+XVliLYi1aIJ4imFDuDyKiCyYGL7JNccQf1+CfdOqmXC A==;
X-CSE-ConnectionGUID: Yy2aBObZSOaqLTcfY0rV0g==
X-CSE-MsgGUID: iWT+dHDVSLCn6DkGv/csRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="29097865"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="29097865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 02:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16615093"
Received: from ktonsber-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.184])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 02:11:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 0/4] drm/xe: Rework rebinding in preparation for same-vm
 eviction 
Date: Wed, 27 Mar 2024 10:11:32 +0100
Message-ID: <20240327091136.3271-1-thomas.hellstrom@linux.intel.com>
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

We are not allowing eviction / shrinking of completely unbound
local objects during exec and rebind worker.
Since unbinding is the UMD primary means of
freeing up memory on local VM overcommit situations,
this needs to be addressed.

Such funtionality will also open up the possibility to evict
purgeable local objects with upcoming changes.

To make this work properly, rebinding needs to be moved to the
while-not-all-locked drm-exec loop, since rebinding may allocate
gpu page table bos and thus cause evictions which forces us
to re-run validation.

This is done in patch 4, but when crafting that patch, a number
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

v2:
- Simplify if-statements around the tlb_flush_seqno.
      (Matthew Brost)
- Add some comments and asserts.
- Remove a leftover call to xe_vm_rebind() (Matt Brost)
- Add a helper function xe_vm_validate_rebind() (Matt Brost)
- Rebasing
v3:
- Only include the patches that reworks rebinding and
  includes it in the drm_exec locking loop, since
  the patches that dealt with same-vm eviction allowed
  page-table allocation to evict the object being bound,
  and while this was addressed properly during exec and
  rebind worker, it was not during the VM_BIND ioctl.
- Squash the patches moving fence reservation and
  moving rebinding into the locking loop since the
  code was not properly working in between those
  patches. (Matt Brost)
- Add code comments (Matt Brost)

Thomas Hellström (4):
  drm/xe: Use ring ops TLB invalidation for rebinds
  drm/xe: Rework rebinding
  drm/xe: Make TLB invalidation fences unordered
  drm/xe: Move vma rebinding to the drm_exec locking loop

 drivers/gpu/drm/xe/xe_exec.c                |  79 ++------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |   5 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   3 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   1 -
 drivers/gpu/drm/xe/xe_gt_types.h            |   7 --
 drivers/gpu/drm/xe/xe_pt.c                  |  25 ++++-
 drivers/gpu/drm/xe/xe_ring_ops.c            |  11 +-
 drivers/gpu/drm/xe/xe_sched_job.c           |  10 ++
 drivers/gpu/drm/xe/xe_sched_job_types.h     |   2 +
 drivers/gpu/drm/xe/xe_vm.c                  | 110 ++++++++++++--------
 drivers/gpu/drm/xe/xe_vm.h                  |   8 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |   8 +-
 12 files changed, 126 insertions(+), 143 deletions(-)

-- 
2.44.0

