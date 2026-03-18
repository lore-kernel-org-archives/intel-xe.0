Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F21FCD0C5
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCD510E441;
	Wed, 18 Mar 2026 07:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lw6HSUjF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC6210E2E9
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817812; x=1805353812;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x051iFqYWmzwPKrHQyoRUaEPX64u1smYSXyS8y594lg=;
 b=lw6HSUjF/gbJ+aYp1VKC7Iew60T8MNCOfNBKKlcbPv8B451oKPQ4Uncu
 CP6hpmKzUAUQGSs7BCnGLoWkC0mB+aFMJ/thJvTbBQtved4+gbnaMOtAZ
 vcHvLEIHmsOp3aUbb5dLaDW+N08PFHRv9rrQckGOINv/WFUabITe4Aaek
 n58TQQEJe9tMGTOmJF2GM4mOeoCq16zu02nn/UcLjjbYIsomh8UnWCGyO
 bOzYfpCVyh9zlhkXoMokXAu/5XiFSQOkGzLZTHceOdk8yqIn5RFd70DJ3
 6B+AA35oHvOvFtKMTaEV1OXc/dZr8ajdDARyIw6W/RX0j/r0+057yE2Xo A==;
X-CSE-ConnectionGUID: EuFCUDWLTLCQU9DWUMA+og==
X-CSE-MsgGUID: 8IH+lLSbQ/CbKrbFwl8IJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764238"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:06 -0700
X-CSE-ConnectionGUID: zXVRW5eITxKzDCo1vwesfw==
X-CSE-MsgGUID: DZkSZ6C9T6WI3PviH/qHGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260423923"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:04 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 00/15] drm/xe: Access counter consumer layer
Date: Wed, 18 Mar 2026 13:14:41 +0530
Message-Id: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

This series implements the Xe access counter consumer layer for discrete
Intel GPUs. Access counters track GPU memory access patterns and emit
notifications when a threshold is exceeded; the KMD uses these as hints
to migrate BOs and SVM ranges to tile-local VRAM.

The series starts by factoring the identical circular buffer code shared
between page faults and access counters into a generic struct
xe_usm_queue, then wires both consumers to it. The access counter consumer reuses
pf_wq rather than allocating a new workqueue.

Two helpers are extracted from the page fault path for reuse:
xe_vma_lock_and_validate() and xe_device_asid_to_fault_vm(). The worker
handles both BO-backed VMAs (migrate + rebind) and SVM VMAs (via
xe_svm_range_setup()).

A new exec queue extension (DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM)
lets userspace configure per-queue trigger/notify thresholds and
granularity, which are programmed into CTX_ACC_CTR_THOLD and CTX_ASID
during LRC init (Bspec: 59264, 59265).

Finally, xe_vma_supports_access_ctr() identifies VMAs ineligible for
access counting, and xe_pt_stage_bind() sets the NC PTE bit on them to
avoid wasting finite hardware counter slots (Bspec: 67095).

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Himal Prasad Ghimiray (15):
  drm/xe: Add xe_usm_queue generic USM circular buffer
  drm/xe/pagefault: Use xe_usm_queue helpers
  drm/xe: Stub out new access_counter layer
  drm/xe: Implement xe_access_counter_init
  drm/xe: Implement xe_access_counter_handler
  drm/xe: Extract xe_vma_lock_and_validate helper
  drm/xe: Move ASID to FAULT VM lookup to xe_device
  drm/xe: Implement xe_access_counter_queue_work
  drm/xe/trace: Add xe_vma_acc trace event for access counter
    notifications
  drm/xe/svm: Handle svm ranges on access ctr trigger
  drm/xe: Add xe_guc_access_counter layer
  drm/xe/uapi: Add access counter parameter extension for exec queue
  drm/xe/lrc: Pass exec_queue to xe_lrc_create for access counter params
  drm/xe/vm: Add xe_vma_supports_access_ctr() helper
  drm/xe/pt: Set NC PTE bit for VMAs ineligible for access counting

 drivers/gpu/drm/xe/Makefile                  |   4 +-
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h        |   2 +-
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h      |  10 +
 drivers/gpu/drm/xe/xe_access_counter.c       | 255 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_access_counter.h       |  17 ++
 drivers/gpu/drm/xe/xe_access_counter_types.h | 123 +++++++++
 drivers/gpu/drm/xe/xe_device.c               |  30 +++
 drivers/gpu/drm/xe/xe_device.h               |   1 +
 drivers/gpu/drm/xe/xe_device_types.h         |   6 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           |  29 ++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   9 +
 drivers/gpu/drm/xe/xe_execlist.c             |   2 +-
 drivers/gpu/drm/xe/xe_guc_access_counter.c   |  62 +++++
 drivers/gpu/drm/xe/xe_guc_access_counter.h   |  15 ++
 drivers/gpu/drm/xe/xe_guc_ct.c               |   4 +
 drivers/gpu/drm/xe/xe_lrc.c                  |  35 ++-
 drivers/gpu/drm/xe/xe_lrc.h                  |   5 +-
 drivers/gpu/drm/xe/xe_pagefault.c            |  79 +-----
 drivers/gpu/drm/xe/xe_pagefault_types.h      |  27 +-
 drivers/gpu/drm/xe/xe_pt.c                   |  11 +
 drivers/gpu/drm/xe/xe_svm.c                  |  59 +++--
 drivers/gpu/drm/xe/xe_svm.h                  |   4 +
 drivers/gpu/drm/xe/xe_trace_bo.h             |  32 ++-
 drivers/gpu/drm/xe/xe_usm_queue.h            | 100 ++++++++
 drivers/gpu/drm/xe/xe_vm.c                   |  72 ++++++
 drivers/gpu/drm/xe/xe_vm.h                   |   6 +
 include/uapi/drm/xe_drm.h                    |  39 +++
 27 files changed, 910 insertions(+), 128 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.c
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.h
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.h
 create mode 100644 drivers/gpu/drm/xe/xe_usm_queue.h

-- 
2.34.1

