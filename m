Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C7BCFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC49210E63E;
	Tue,  2 Dec 2025 13:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GTy+UjpA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466A310E63E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683573; x=1796219573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EDULk69ZgCQ2/pfDzz1MxHYYESPnvapsHeXQAdaRnHM=;
 b=GTy+UjpAxVS5u3B2WnlAEpUPdrWW7kkDCEgEFJL1XhVFwuQWDQXs5Tmo
 QvfIoe9okox7ScklOSiegJbAWdP0hKH6eoJf6iUN/1Lr/OarVREiY2G3O
 aCEoD5yI0pknosvheWkwUAs6Aea+Yfhzl/ZGpml1DAIAcjgLBEhNVal7L
 5QQODxLq7md5c1BR4ZEJdHYZapIfdPtSTEGtKjYDwV8z1h8tD6hSndWgo
 Nq7528z7hY5Vy+uqXPq0/8mwZaPSfTXiuV57aipzDU2fGTQvod/mjrBgj
 o896yMpt0VTvaJ4hRr/SbJX1xyy+DBMeVzVxVyclHtNVBZn8tRGSQrMjl w==;
X-CSE-ConnectionGUID: G5EZAkLZQ1mfwbuhCQyhHg==
X-CSE-MsgGUID: 7L3Frf15SCmZZ0eurNACkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537010"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537010"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:52:52 -0800
X-CSE-ConnectionGUID: +vuCpXuAR6ibTx5diyQSkQ==
X-CSE-MsgGUID: Trt1sJVwQ7+A75ZNWJamfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505547"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:52:49 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 00/20] Intel Xe GPU Debug Support (eudebug) v6
Date: Tue,  2 Dec 2025 15:52:19 +0200
Message-ID: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

This is the v6 patch series for Intel Xe GPU debug support (eudebug).

This series continues from the following previous submissions:
- v1: https://lists.freedesktop.org/archives/intel-xe/2024-July/043605.html
- v2: https://lists.freedesktop.org/archives/intel-xe/2024-October/052260.html
- v3: https://lists.freedesktop.org/archives/intel-xe/2024-December/061476.html
- v4: https://lists.freedesktop.org/archives/intel-xe/2025-August/091645.html
- v5: https://lists.freedesktop.org/archives/intel-xe/2025-October/097859.html

# Major Changes from v5

With v5, when relaying vm bind with the associated ops, the transient
bind relay state was held in struct xe_vm. As debug metadata add
and remove ops simplifies the way binds are handled wrt v3,
this gave us opportunity to use vm_ops for relaying instead of
using eudebug baked bind ops state. This change removes ~200 lines.

Debuggable GuC context support was reworked. Now GuC version
is required to be 70.49.4 or higher for eudebug support.

Eudebug pagefaults were reworked on top of producer/consumer
pagefaults, introduced in core xe side. We reduced the footprint
eudebug pagefaults have in xe pagefault handler side.

# Major Changes from v4

v4 omitted page fault support, it is reworked from v3 and included
in this series.

### Major Changes from v3

#### 1. Elimination of ptrace_may_access() and pid

In previous series, the connection attempt was made using the process ID
(PID) as the target. Access was checked using the `ptrace_may_access()`
helper to achieve security parity with CPU-side debugging.

In v4, this has been changed to connect to a DRM client, using a file
descriptor as the target. This approach eliminates the need for the
`ptrace_may_access()` symbol export, as access control is now managed
through the debugger process's access to the file descriptor. For example,
accessing a remote DRM client requires the debugger process to
successfully call `pidfd_getfd()` to obtain a duplicate of the target
file descriptor.The 1:1 mapping between DRM clients and their debuggers
eliminates the need for `EVENT_OPEN` and simplifies overall connection
tracking.

#### 2. ELF binaries not held in kernel memory

In v4, debug data is delivered as a VM bind 'OP_ADD_DEBUG_DATA' extension.
The ELF binaries are no longer stored within the Xe KMD but are instead
kept in a file. The file path is passed as part of an extension in
the newly introduced 'OP_ADD_DEBUG_DATA' VM bind operation. Alternatively
pseudo-paths can be used to annotate special address ranges similar to
/proc/<pid>/maps.

#### 3. Debug metadata not carried in VMA struct

Instead of attaching debug data to vma created by 'OP_MAP',
we introduce separate ops for managing the metadata.
Debug data is no longer held in the VMA struct. xe_vm contains a
list of all associated debug data.

#### 4. Reading debug data via debugfs

This revision introduces the possibility to access debug data using per
client debugfs entries. The intent was to achieve similar interface to
'/proc/<pid>/maps'

### Supported Hardware with v6
- Lunarlake (LNL)
- Battlemage (BMG)
- Pantherlake (PTL)

The code for this submission can be found at:
https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-v6


Christoph Manszewski (5):
  drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops
  drm/xe/eudebug: Introduce vm bind and vm bind debug data events
  drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
  drm/xe: Implement SR-IOV and eudebug exclusivity
  drm/xe: Add xe_client_debugfs and introduce debug_data file

Dominik Grzegorzek (5):
  drm/xe/eudebug: Introduce exec_queue events
  drm/xe: Add EUDEBUG_ENABLE exec queue property
  drm/xe/eudebug: hw enablement for eudebug
  drm/xe/eudebug: Introduce EU control interface
  drm/xe/eudebug: Introduce per device attention scan worker

Gwan-gyeong Mun (4):
  drm/xe/eudebug: Add read/count/compare helper for eu attention
  drm/xe/vm: Support for adding null page VMA to VM on request
  drm/xe/eudebug: Introduce EU pagefault handling interface
  drm/xe/eudebug: Enable EU pagefault handling

Mika Kuoppala (6):
  drm/xe/eudebug: Introduce eudebug interface
  drm/xe/eudebug: Introduce discovery for resources
  drm/xe/eudebug: Mark guc contexts as debuggable
  drm/xe/eudebug: Add UFENCE events with acks
  drm/xe/eudebug: vm open/pread/pwrite
  drm/xe/eudebug: userptr vm pread/pwrite

 drivers/gpu/drm/xe/Kconfig                  |   10 +
 drivers/gpu/drm/xe/Makefile                 |    7 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h    |    5 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h       |    1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h    |    5 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h        |   43 +
 drivers/gpu/drm/xe/tests/xe_eudebug.c       |  193 ++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |    5 +
 drivers/gpu/drm/xe/xe_client_debugfs.c      |  118 +
 drivers/gpu/drm/xe/xe_client_debugfs.h      |   19 +
 drivers/gpu/drm/xe/xe_debug_data.c          |  314 +++
 drivers/gpu/drm/xe/xe_debug_data.h          |   22 +
 drivers/gpu/drm/xe/xe_debug_data_types.h    |   25 +
 drivers/gpu/drm/xe/xe_device.c              |   30 +-
 drivers/gpu/drm/xe/xe_device.h              |   42 +
 drivers/gpu/drm/xe/xe_device_types.h        |   40 +
 drivers/gpu/drm/xe/xe_eudebug.c             | 2189 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h             |  111 +
 drivers/gpu/drm/xe/xe_eudebug_hw.c          |  743 +++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.h          |   32 +
 drivers/gpu/drm/xe/xe_eudebug_pagefault.c   |  441 ++++
 drivers/gpu/drm/xe/xe_eudebug_pagefault.h   |   47 +
 drivers/gpu/drm/xe/xe_eudebug_types.h       |  241 ++
 drivers/gpu/drm/xe/xe_eudebug_vm.c          |  434 ++++
 drivers/gpu/drm/xe/xe_eudebug_vm.h          |    8 +
 drivers/gpu/drm/xe/xe_exec_queue.c          |   56 +-
 drivers/gpu/drm/xe/xe_exec_queue.h          |    2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |    7 +
 drivers/gpu/drm/xe/xe_gt_debug.c            |  244 +++
 drivers/gpu/drm/xe/xe_gt_debug.h            |   39 +
 drivers/gpu/drm/xe/xe_gt_debug_types.h      |   23 +
 drivers/gpu/drm/xe/xe_guc.c                 |   17 +
 drivers/gpu/drm/xe/xe_guc.h                 |    3 +
 drivers/gpu/drm/xe/xe_guc_ads.c             |   17 +
 drivers/gpu/drm/xe/xe_guc_pagefault.c       |    8 +
 drivers/gpu/drm/xe/xe_guc_submit.c          |   34 +
 drivers/gpu/drm/xe/xe_guc_submit.h          |    1 +
 drivers/gpu/drm/xe/xe_hw_engine.h           |   14 +
 drivers/gpu/drm/xe/xe_lrc.c                 |   10 +
 drivers/gpu/drm/xe/xe_pagefault.c           |   31 +-
 drivers/gpu/drm/xe/xe_pagefault_types.h     |   13 +
 drivers/gpu/drm/xe/xe_reg_sr.c              |   21 +-
 drivers/gpu/drm/xe/xe_reg_sr.h              |    4 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c       |    2 +-
 drivers/gpu/drm/xe/xe_rtp.c                 |    2 +-
 drivers/gpu/drm/xe/xe_sync.c                |   39 +-
 drivers/gpu/drm/xe/xe_sync.h                |    7 +-
 drivers/gpu/drm/xe/xe_sync_types.h          |   28 +-
 drivers/gpu/drm/xe/xe_userptr.c             |    4 +
 drivers/gpu/drm/xe/xe_userptr.h             |   32 +
 drivers/gpu/drm/xe/xe_vm.c                  |  201 +-
 drivers/gpu/drm/xe/xe_vm.h                  |    2 +
 drivers/gpu/drm/xe/xe_vm_types.h            |   19 +
 drivers/gpu/drm/xe/xe_wa_oob.rules          |    4 +
 include/uapi/drm/xe_drm.h                   |   59 +
 include/uapi/drm/xe_drm_eudebug.h           |  227 ++
 56 files changed, 6252 insertions(+), 43 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug.c
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
2.43.0

