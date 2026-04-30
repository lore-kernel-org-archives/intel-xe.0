Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51542CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC0D10F2E3;
	Thu, 30 Apr 2026 10:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJABWSRJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B424210E159
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546308; x=1809082308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cfSVA4cuhGNAR6w1ea0TJwSchmUuHca2qaRntxvr29Q=;
 b=IJABWSRJU3uaf90BSfQceniCJBM2nMhOYrn8gqIwhHXVw+Kk8iRvjwEX
 D8p1EXa5HOfaPFQ6yA7dNF8ILCXwjnKAgg8ghMbhDnxJ6swUgL9wOVugG
 yk1L85zLimROCmgM/yUAThD+zTNg/MHt0FUNb+OX00pv1s2mOwkNBQgaX
 Y2Hjvy+q40MiRyBAymodADLRWUqfSbUgvpRIvBgoQsT4xPFXZ/a4txcvo
 wQx03FqXRe9mqxyr28wzob+zlc9yKFin4hC8nvpaoLZerOxLs1iC2NTxL
 2Q0FrLymqbvy98kMtAe7JpJZEU+cMm76ETu37iKNg3FpRzCKB2OX547yx A==;
X-CSE-ConnectionGUID: hIfcpf3QSuqfGWNOh0HxDg==
X-CSE-MsgGUID: uPjJSh1OS7WkmyAQxr03JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89585847"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89585847"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:51:48 -0700
X-CSE-ConnectionGUID: IS0PAV7CRAypHR/F7xaSuw==
X-CSE-MsgGUID: 9/7u5DJPSveNiMpQywqx5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518407"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:51:42 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 00/24] Intel Xe GPU Debug Support (eudebug) v8
Date: Thu, 30 Apr 2026 13:50:56 +0300
Message-ID: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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

This is the v8 patch series for Intel Xe GPU debug support (eudebug).

This series continues from the following previous submissions:
- v1: https://lists.freedesktop.org/archives/intel-xe/2024-July/043605.html
- v2: https://lists.freedesktop.org/archives/intel-xe/2024-October/052260.html
- v3: https://lists.freedesktop.org/archives/intel-xe/2024-December/061476.html
- v4: https://lists.freedesktop.org/archives/intel-xe/2025-August/091645.html
- v5: https://lists.freedesktop.org/archives/intel-xe/2025-October/097859.html
- v6: https://lists.freedesktop.org/archives/intel-xe/2025-December/106405.html
- v7: https://lists.freedesktop.org/archives/intel-xe/2026-February/115750.html

# Major Changes from v7

Rework of eudebug pagefault handling to better align with xe
core pagefaults (Maciej Patelczyk).
Refactored eu control to streamline common parts.
Refactored resource handle bookkeepping.

# Major Changes from v6

Added documentation. Two new documentation patches introduce .rst
documentation under Documentation/gpu/xe/ and kernel-doc for the
eudebug interface. The eudebug source now includes DOC sections
covering connection establishment, security model, file descriptor
acquisition methods, and the event interface.

UAPI header documentation in xe_drm_eudebug.h has been significantly
expanded with kernel-doc comments for interface structures and ioctls.

Eliminated the separate xe_eudebug_resources struct, removing a level
of indirection. The resources lock has been consolidated with the
target lock, which is now a mutex instead of a spinlock.

Improved input validation: seqno fields are now checked to be zero on
EU control and read_event entry. The read_event ioctl validation was
simplified to only check for DRM_XE_EUDEBUG_EVENT_READ type.

Replaced drm_file->authenticated check with xe_file and device validation,
allowing render node access for debug targets.

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
file descriptor. The 1:1 mapping between DRM clients and their debuggers
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

### Supported Hardware
- Lunarlake (LNL)
- Battlemage (BMG)
- Pantherlake (PTL)

The code for this submission can be found at:
https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-v8

Tests:
https://gitlab.freedesktop.org/DominikPiatkowski-Intel/igt-gpu-tools/-/tree/eudebug-dev-next


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

Maciej Patelczyk (2):
  drm/xe/eudebug: Allow getting eudebug instance during discovery
  drm/xe/eudebug: Disable SVM in Xe for Eudebug

Mika Kuoppala (8):
  drm/xe/eudebug: Introduce eudebug interface
  drm/xe/eudebug: Add documentation
  drm/xe/eudebug: Add connection establishment documentation
  drm/xe/eudebug: Introduce discovery for resources
  drm/xe/eudebug: Mark guc contexts as debuggable
  drm/xe/eudebug: Add ufence events with acks
  drm/xe/eudebug: vm open/pread/pwrite
  drm/xe/eudebug: userptr vm pread/pwrite

 Documentation/gpu/xe/index.rst              |    1 +
 Documentation/gpu/xe/xe_eudebug.rst         |   83 +
 drivers/gpu/drm/xe/Kconfig                  |   16 +-
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
 drivers/gpu/drm/xe/xe_device_types.h        |   49 +
 drivers/gpu/drm/xe/xe_eudebug.c             | 2360 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h             |  112 +
 drivers/gpu/drm/xe/xe_eudebug_hw.c          |  725 ++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.h          |   32 +
 drivers/gpu/drm/xe/xe_eudebug_pagefault.c   |  417 ++++
 drivers/gpu/drm/xe/xe_eudebug_pagefault.h   |   77 +
 drivers/gpu/drm/xe/xe_eudebug_types.h       |  228 ++
 drivers/gpu/drm/xe/xe_eudebug_vm.c          |  436 ++++
 drivers/gpu/drm/xe/xe_eudebug_vm.h          |    8 +
 drivers/gpu/drm/xe/xe_exec_queue.c          |   56 +-
 drivers/gpu/drm/xe/xe_exec_queue.h          |    2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |    7 +
 drivers/gpu/drm/xe/xe_gt_debug.c            |  242 ++
 drivers/gpu/drm/xe/xe_gt_debug.h            |   39 +
 drivers/gpu/drm/xe/xe_gt_debug_types.h      |   22 +
 drivers/gpu/drm/xe/xe_guc.c                 |   17 +
 drivers/gpu/drm/xe/xe_guc.h                 |    3 +
 drivers/gpu/drm/xe/xe_guc_ads.c             |   17 +
 drivers/gpu/drm/xe/xe_guc_pagefault.c       |   10 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |   34 +
 drivers/gpu/drm/xe/xe_guc_submit.h          |    1 +
 drivers/gpu/drm/xe/xe_hw_engine.h           |   14 +
 drivers/gpu/drm/xe/xe_lrc.c                 |   10 +
 drivers/gpu/drm/xe/xe_pagefault.c           |   77 +-
 drivers/gpu/drm/xe/xe_pagefault_types.h     |   10 +
 drivers/gpu/drm/xe/xe_reg_sr.c              |   21 +-
 drivers/gpu/drm/xe/xe_reg_sr.h              |    4 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c       |    2 +-
 drivers/gpu/drm/xe/xe_rtp.c                 |    2 +-
 drivers/gpu/drm/xe/xe_sync.c                |   43 +-
 drivers/gpu/drm/xe/xe_sync.h                |    7 +-
 drivers/gpu/drm/xe/xe_sync_types.h          |   28 +-
 drivers/gpu/drm/xe/xe_userptr.c             |    4 +
 drivers/gpu/drm/xe/xe_userptr.h             |   32 +
 drivers/gpu/drm/xe/xe_vm.c                  |  201 +-
 drivers/gpu/drm/xe/xe_vm.h                  |    3 +
 drivers/gpu/drm/xe/xe_vm_types.h            |   19 +
 drivers/gpu/drm/xe/xe_wa_oob.rules          |    5 +-
 include/uapi/drm/xe_drm.h                   |   95 +
 include/uapi/drm/xe_drm_eudebug.h           |  377 +++
 58 files changed, 6722 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_eudebug.rst
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

