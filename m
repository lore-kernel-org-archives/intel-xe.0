Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11C7EF4EC2
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 08:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357BA10E211;
	Mon,  6 Apr 2026 08:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5q8Qdvf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3624A10E211
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 08:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775465923; x=1807001923;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ymvLxnAigorHt4NwJ+nz6sgJLAA9qfpRnbFNgSCi0m4=;
 b=X5q8QdvfAB6LLE97WwN0ZpVsI7vigdO+mhq+H4hJnJ0KHxFge5B6W6wO
 vZf9wM3r9X5u2aTew+tNCGdC0AvGmXPexcbY2CwJbh1+BMsvZoP3oS7ti
 4/2JynvFLiwZ/15vQIUzeuAaaVLZdLfML9CRBFYVFMf7M3fEo14jJFpaD
 AT+/WelJBFYwpHWybD9zNdG0K6QRtYHPSE8gfz3FeqMtyVj/O4h9qRUhM
 UNOU7/2gjG+bRYV22UBxAYgYRpzsnufMrRLOglVHgXRylwVHPJtuHA0u8
 Mxdfc5ncC9L3MmwbsuvZl2+uZ1kX0WfaK0eQZhOebiIrrGEf4BReuf5mz Q==;
X-CSE-ConnectionGUID: /wDEzITgSim+BLmqYYw1pg==
X-CSE-MsgGUID: BCKB2fz4RxKSYBocG5t6kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="80012880"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="80012880"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:42 -0700
X-CSE-ConnectionGUID: 9jw98O0JT8KEfHwCtamJVA==
X-CSE-MsgGUID: xSCtSS6oSdyek8N1nb4BDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227775152"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:40 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC v2 0/7] drm/xe/svm: Add MMU notifier-based madvise autoreset on
 munmap
Date: Mon,  6 Apr 2026 14:28:23 +0530
Message-ID: <20260406085830.1118431-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series implements automatic reset of GPU memory attributes when
userspace unmaps memory, ensuring non-default attributes set via the
MADVISE ioctl do not persist after CPU mappings are freed.

MMU interval notifiers detect munmap on CPU-only VMAs (not yet
GPU-faulted) and queue a worker to reset attributes. GPU-touched
VMAs continue using existing SVM notifiers.

Key aspects:
 - cpu_autoreset_active (xe_vma) tracks CPU-only vs GPU-touched state.
   XE_VMA_CPU_AUTORESET_ACTIVE is pipeline-only and not stored in gpuva.flags.
 - MMU notifier callback does not allocate. work_struct is embedded in
   xe_madvise_notifier and initialised at ioctl time. Overlapping munmap
   events are coalesced via min/max.
 - teardown_rwsem serialises VM teardown against callbacks.
 - struct maple_tree tracks notifiers: O(log N) dedup + insert.
 - Notifiers registered outside vm->lock; vm->lock taken only for dedup.
   Callback only queues work.

Patch organisation:
 1. Track cpu_autoreset_active in xe_vma and add pipeline-only flag.
 2. Preserve state across GPUVA operations.
 3. Clear state on first GPU fault.
 4. Add MMU notifier and worker infrastructure.
 5. Deactivate notifier on GPU touch.
 6. Wire notifiers into VM lifecycle.
 7. Fix partial unmap attribute reset.

Changes in v2:
 - Move runtime state to xe_vma bool cpu_autoreset_active. (Matt)
 - Embed work_struct in xe_madvise_notifier; no allocation in callback. (Thomas)
 - Coalesce overlapping munmap events via min/max.
 - Replace closing state with teardown_rwsem. (Matt)
 - Use maple_tree for notifier tracking. (Matt)
 - Register notifiers outside vm->lock; take it only for the maple-tree dedup check.
 - Add xe_vma_effective_create_flags() and fix REMAP split handling.
 - Move xe_vma_gpu_touch() to success path in pagefault handler. (Matt)
 - Use plain bool active in notifier. (Matt)
 - Add lockdep assertions for vm->lock.

Arvind Yadav (6):
  drm/xe/vm: Track CPU_AUTORESET state in xe_vma
  drm/xe/vm: Preserve cpu_autoreset_active across GPUVA operations
  drm/xe/svm: Clear CPU_AUTORESET_ACTIVE on first GPU fault
  drm/xe/vm: Add madvise autoreset interval notifier worker
    infrastructure
  drm/xe/vm: Deactivate madvise notifier on GPU touch
  drm/xe/vm: Wire MADVISE_AUTORESET notifiers into VM lifecycle

Himal Prasad Ghimiray (1):
  drm/xe/svm: Correct memory attribute reset for partial unmap

 drivers/gpu/drm/xe/xe_svm.c        |  80 ++++-
 drivers/gpu/drm/xe/xe_svm.h        |  10 +
 drivers/gpu/drm/xe/xe_vm.c         |  82 ++++-
 drivers/gpu/drm/xe/xe_vm.h         |  18 ++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 498 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm_madvise.h |   9 +
 drivers/gpu/drm/xe/xe_vm_types.h   |  87 +++++
 7 files changed, 761 insertions(+), 23 deletions(-)

-- 
2.43.0

