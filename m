Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EF9C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358EE10E154;
	Thu,  3 Sep 2026 15:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gBZ1h/Wh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1133710E154
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447605; x=1819983605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EYoRorwsebO/+dMbRqyZeRZQTyE3stmucVJoGpkKXKg=;
 b=gBZ1h/WheJynlKh2ytjhG5AEpOesJrI2kB46CRPnwtVduk2buo57VD6e
 vib1qz+JK2SSpxGdkJLI16DSehG5evtpP8aOYpS6LfcX19UxUZiNuWQBv
 +ncFAaCh+HEWibND3ufdijAfjbgPUiLi9Dhdw6tJxtOmWn6lbU4ARxm0R
 vGk0v79b49Q5IAUp0Fcv8B9CACyqxkWBAUn4cDfL+lE173OeaOPRbQmOu
 DOCBoIUhUgOCYxkJpuUuOvmR0tp3PWfIrbTSUIk5B3FVnm2y0joQvVGBx
 0J/LaiMnDp5dFF6h8kaETboncVyrv8ObA8d4JGFU3+AqgwBCvDzcZ6wmo w==;
X-CSE-ConnectionGUID: V1brDYEQSg+lfrFonau6Ig==
X-CSE-MsgGUID: fRPhm+ZuQmWvAYCTM9/DDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486581"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486581"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:05 -0700
X-CSE-ConnectionGUID: 068zCNLoR9iNQxKDqr8sDA==
X-CSE-MsgGUID: sRnj6np9Ru+7lDhJ8IPt5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440227"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:00 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 00/27] Intel Xe GPU Debug Support (eudebug) v10
Date: Thu,  3 Sep 2026 17:59:24 +0300
Message-ID: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Hi,

This is the v10 patch series for Intel Xe GPU debug support (eudebug).

This series continues from the following previous submissions:
- v1: https://lists.freedesktop.org/archives/intel-xe/2024-July/043605.html
- v2: https://lists.freedesktop.org/archives/intel-xe/2024-October/052260.html
- v3: https://lists.freedesktop.org/archives/intel-xe/2024-December/061476.html
- v4: https://lists.freedesktop.org/archives/intel-xe/2025-August/091645.html
- v5: https://lists.freedesktop.org/archives/intel-xe/2025-October/097859.html
- v6: https://lists.freedesktop.org/archives/intel-xe/2025-December/106405.html
- v7: https://lists.freedesktop.org/archives/intel-xe/2026-February/115750.html
- v8: https://lists.freedesktop.org/archives/intel-xe/2026-April/124147.html
- v9: https://lists.freedesktop.org/archives/intel-xe/2026-June/128834.html

# Series layout: core and page faults

v9 shipped eudebug core only, with EU page fault handling split out to be
sent separately. In v10 the page fault work is included again, but it is
deliberately kept as a distinct block on top of the core:

- Patches 1-19 are eudebug core. This is a self-contained, functional
  debugger interface and can be reviewed and merged on its own.
- Patches 20-27 add EU page fault handling on top. They touch xe page
  fault and SVM paths, and nothing in patches 1-19 depends on them.

They are posted together for completeness, so that reviewers can see
where the core interface is heading and judge the core design with the
page fault use case in view. Treat the second block as a follow-up series
that happens to be in the same posting.

# Major Changes from v9

Page fault support is back in the series (see above).

Continued to work through Sashiko feedback, plus review comments on v9.

Core eudebug:

- Reworked the eudebug workqueues. Deferred ufence signalling no longer
  shares the ordered discovery workqueue, and the per device attention
  poller moved off the shared system workqueue onto a device workqueue of
  its own. Both were sources of head of line blocking: a client's ufence
  signal, which is what releases the debuggee from wait_user_fence, could
  queue behind an unrelated client's discovery, and the attention poller
  blocks on eudebug.lock across a gt reset.
- Connection lifetime and teardown fixes: wake up after detach taking the
  occupied event into account, O_CLOEXEC on the connection fd, hold the
  drm_device for the lifetime of the connection, do not silently truncate
  the target fd, and reject zero as a target fd.
- Event fifo allocated with GFP_KERNEL_ACCOUNT, resource handles preallocated.
- ufence acks: avoid double signal when the fence is not tracked, clear
  the bind ref seqno when there is no debugger or when tracking fails,
  and stop referencing the ack after dropping the lock.
- EU control: take runtime pm around hw access, gate SR-IOV, proper
  teardown when runtime is not active, and no warn on wrong context.
- Documentation and kernel-doc fixes throughout, including the ioctl_lock
  in struct xe_file, which is held across a whole ioctl and therefore
  nests outside every lock those ioctls take. The security model DOC now
  states which fd acquisition methods the ptrace_may_access() parity
  claim actually covers.

Page faults:

  Reworked on top of 'Fine grained fault locking, threaded prefetch,
  storm cache' series (merged). Added svm support and improved multiple
  fault handling.

TODO:
access_process_vm(task, ...) still has the possible race with
execve due to mm changing for task, pointed by Sashiko.
See the relevant code and XXX FIXME in xe_eudebug_vm.c, in
xe_eudebug_vma_access(), and in xe_eudebug_track_userptr_task()
in xe_userptr.h. The most straightforward way to fix this
would be to export access_remote_vm(mm, ...) and then use the
notifier mm for it.

# Supported Hardware
- Lunarlake (LNL)
- Battlemage (BMG)
- Pantherlake (PTL)

The code for this submission can be found at:
https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-v10

Tests:
https://gitlab.freedesktop.org/DominikPiatkowski-Intel/igt-gpu-tools/-/tree/eudebug-dev-next


Christoph Manszewski (5):
  drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops
  drm/xe/eudebug: Introduce vm bind and vm bind debug data events
  drm/xe/eudebug_test: Introduce eudebug live tests
  drm/xe: Implement SR-IOV and eudebug exclusivity
  drm/xe: Add xe_client_debugfs and introduce debug_data file

Dominik Grzegorzek (5):
  drm/xe: Add EUDEBUG_ENABLE exec queue property
  drm/xe/eudebug: Introduce exec_queue events
  drm/xe/eudebug: Add hw enablement
  drm/xe/eudebug: Introduce EU control interface
  drm/xe/eudebug: Introduce per device attention scan worker

Gwan-gyeong Mun (5):
  drm/xe/eudebug: Add read/count/compare helper for eu attention
  drm/xe/vm: Support for adding null page VMA to VM on request
  drm/xe/vm: Add xe_vm_svm_vma_subtract() to carve out a sub-range from
    an SVM VMA
  drm/xe/eudebug: Introduce EU pagefault handling interface
  drm/xe/eudebug: Enable EU pagefault handling

Maciej Patelczyk (3):
  drm/xe/pagefault: export pagefault queue properties
  drm/xe: Support for xe_vma_unbind()
  drm/xe: export prep_vma_destroy as xe_vm_prep_vma_destroy

Mika Kuoppala (9):
  drm/xe/eudebug: Introduce eudebug interface
  drm/xe/eudebug: Add documentation
  drm/xe/eudebug: Add connection establishment documentation
  drm/xe/eudebug: Introduce discovery for resources
  drm/xe/eudebug: Mark guc contexts as debuggable
  drm/xe: Remove ifdef in DRM_GPUVA_OP_DRIVER svm subop checking
  drm/xe/eudebug: Add ufence events with acks
  drm/xe/eudebug: Add vm open/pread/pwrite
  drm/xe/eudebug: Add userptr vm pread/pwrite

 .../ABI/testing/sysfs-driver-intel-xe-eudebug |   21 +
 Documentation/gpu/driver-uapi.rst             |    2 +
 Documentation/gpu/xe/index.rst                |    1 +
 Documentation/gpu/xe/xe_eudebug.rst           |   83 +
 MAINTAINERS                                   |    2 +
 drivers/gpu/drm/xe/Kconfig                    |   10 +
 drivers/gpu/drm/xe/Makefile                   |    7 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |    5 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |    1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |    1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   43 +
 drivers/gpu/drm/xe/tests/xe_eudebug_test.c    |  227 ++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c   |    5 +
 drivers/gpu/drm/xe/xe_client_debugfs.c        |  108 +
 drivers/gpu/drm/xe/xe_client_debugfs.h        |   17 +
 drivers/gpu/drm/xe/xe_debug_data.c            |  383 +++
 drivers/gpu/drm/xe/xe_debug_data.h            |   22 +
 drivers/gpu/drm/xe/xe_debug_data_types.h      |   25 +
 drivers/gpu/drm/xe/xe_device.c                |   28 +-
 drivers/gpu/drm/xe/xe_device.h                |   42 +
 drivers/gpu/drm/xe/xe_device_types.h          |   57 +
 drivers/gpu/drm/xe/xe_eudebug.c               | 2514 +++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h               |  119 +
 drivers/gpu/drm/xe/xe_eudebug_hw.c            |  730 +++++
 drivers/gpu/drm/xe/xe_eudebug_hw.h            |   30 +
 drivers/gpu/drm/xe/xe_eudebug_pagefault.c     |  722 +++++
 drivers/gpu/drm/xe/xe_eudebug_pagefault.h     |   81 +
 drivers/gpu/drm/xe/xe_eudebug_types.h         |  284 ++
 drivers/gpu/drm/xe/xe_eudebug_vm.c            |  501 ++++
 drivers/gpu/drm/xe/xe_eudebug_vm.h            |    8 +
 drivers/gpu/drm/xe/xe_exec_queue.c            |   77 +-
 drivers/gpu/drm/xe/xe_exec_queue.h            |    2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |    7 +
 drivers/gpu/drm/xe/xe_gt_debug.c              |  251 ++
 drivers/gpu/drm/xe/xe_gt_debug.h              |   36 +
 drivers/gpu/drm/xe/xe_gt_debug_types.h        |   22 +
 drivers/gpu/drm/xe/xe_guc.c                   |    8 +
 drivers/gpu/drm/xe/xe_guc.h                   |    6 +
 drivers/gpu/drm/xe/xe_guc_ads.c               |   12 +
 drivers/gpu/drm/xe/xe_guc_pagefault.c         |   10 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   34 +
 drivers/gpu/drm/xe/xe_guc_submit.h            |    1 +
 drivers/gpu/drm/xe/xe_hw_engine.h             |   14 +
 drivers/gpu/drm/xe/xe_pagefault.c             |  150 +-
 drivers/gpu/drm/xe/xe_pagefault.h             |   10 +
 drivers/gpu/drm/xe/xe_pagefault_types.h       |   38 +-
 drivers/gpu/drm/xe/xe_pt.c                    |    2 -
 drivers/gpu/drm/xe/xe_reg_sr.c                |   12 +-
 drivers/gpu/drm/xe/xe_reg_sr.h                |    4 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |    2 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |    2 +-
 drivers/gpu/drm/xe/xe_sync.c                  |   45 +-
 drivers/gpu/drm/xe/xe_sync.h                  |    7 +-
 drivers/gpu/drm/xe/xe_sync_types.h            |   29 +-
 drivers/gpu/drm/xe/xe_userptr.c               |    4 +
 drivers/gpu/drm/xe/xe_userptr.h               |   32 +
 drivers/gpu/drm/xe/xe_vm.c                    |  491 +++-
 drivers/gpu/drm/xe/xe_vm.h                    |   13 +
 drivers/gpu/drm/xe/xe_vm_types.h              |   28 +
 drivers/gpu/drm/xe/xe_wa_oob.rules            |    4 +
 include/uapi/drm/xe_drm.h                     |   89 +
 include/uapi/drm/xe_drm_eudebug.h             |  416 +++
 62 files changed, 7826 insertions(+), 111 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-eudebug
 create mode 100644 Documentation/gpu/xe/xe_eudebug.rst
 create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_debug_data.c
 create mode 100644 drivers/gpu/drm/xe/xe_debug_data.h
 create mode 100644 drivers/gpu/drm/xe/xe_debug_data_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_hw.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_hw.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug_types.h
 create mode 100644 include/uapi/drm/xe_drm_eudebug.h

-- 
2.53.0

