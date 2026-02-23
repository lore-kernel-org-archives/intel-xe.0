Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B73DEA4FBA
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2720A10E425;
	Mon, 23 Feb 2026 14:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6VGaaIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4FA10E425
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855416; x=1803391416;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+IEMYsDFEbYLOjofXCV1J/mj5+AEp9F0G/qndtIf1hM=;
 b=S6VGaaIzn7Gsuq2lkNEmqieS69JuuDignPZEPUVvqF/BrtO8KcmyJoVE
 FnTVuPCuIZwCp7z1dynG/dYV5O+JemtuYz7xPR/KHgpnvbsOjItji+0T9
 tbMmGW1Zv+bsoLrQWlG2rj/1eN3jO8sJNZ6TSn4hyLdQCqjP54/ONmtGf
 UR1ljhZdKT3APDg735kTEWCkq3LxVN8NkIUTIqkIs7x/pzrtTjUBiUmkZ
 gd2Dn/MB5oiJMT1lwMFOVX4exTFu02IRjDPUJoMeBGky40vHFl7xcXHI7
 zVdW8g8C1szAyu8apMFIpPt6Y50RsgdkXi2GrH66KU7rH4sL6GDYh6ytE Q==;
X-CSE-ConnectionGUID: 3EeT4uEMQjSHnflnbzvyFg==
X-CSE-MsgGUID: PWUKat16SpykgpMmXy4UIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76460768"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76460768"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:03:33 -0800
X-CSE-ConnectionGUID: hYyPhXF5R2WzwwtB/EVr7g==
X-CSE-MsgGUID: 0Fr8uQCTT1WVFiuTpqe2lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214656191"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.3])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:03:29 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 00/22] Intel Xe GPU Debug Support (eudebug) v7
Date: Mon, 23 Feb 2026 16:02:55 +0200
Message-ID: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
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

This is the v7 patch series for Intel Xe GPU debug support (eudebug).

This series continues from the following previous submissions:
- v1: https://lists.freedesktop.org/archives/intel-xe/2024-July/043605.html
- v2: https://lists.freedesktop.org/archives/intel-xe/2024-October/052260.html
- v3: https://lists.freedesktop.org/archives/intel-xe/2024-December/061476.html
- v4: https://lists.freedesktop.org/archives/intel-xe/2025-August/091645.html
- v5: https://lists.freedesktop.org/archives/intel-xe/2025-October/097859.html
- v6: https://lists.freedesktop.org/archives/intel-xe/2025-December/106405.html

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
https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-v7

Tests:
https://gitlab.freedesktop.org/cmanszew/igt-gpu-tools/-/tree/eudebug-dev-next


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

Mika Kuoppala (8):
  drm/xe/eudebug: Introduce eudebug interface
  drm/xe/eudebug: Add documentation
  drm/xe/eudebug: Add connection establishment documentation
  drm/xe/eudebug: Introduce discovery for resources
  drm/xe/eudebug: Mark guc contexts as debuggable
  drm/xe/eudebug: Add UFENCE events with acks
  drm/xe/eudebug: vm open/pread/pwrite
  drm/xe/eudebug: userptr vm pread/pwrite

 Documentation/gpu/xe/index.rst              |    1 +
 Documentation/gpu/xe/xe_eudebug.rst         |   83 +
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
 drivers/gpu/drm/xe/xe_device_types.h        |   41 +
 drivers/gpu/drm/xe/xe_eudebug.c             | 2292 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h             |  111 +
 drivers/gpu/drm/xe/xe_eudebug_hw.c          |  746 ++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.h          |   32 +
 drivers/gpu/drm/xe/xe_eudebug_pagefault.c   |  440 ++++
 drivers/gpu/drm/xe/xe_eudebug_pagefault.h   |   47 +
 drivers/gpu/drm/xe/xe_eudebug_types.h       |  236 ++
 drivers/gpu/drm/xe/xe_eudebug_vm.c          |  434 ++++
 drivers/gpu/drm/xe/xe_eudebug_vm.h          |    8 +
 drivers/gpu/drm/xe/xe_exec_queue.c          |   56 +-
 drivers/gpu/drm/xe/xe_exec_queue.h          |    2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |    7 +
 drivers/gpu/drm/xe/xe_gt_debug.c            |  244 ++
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
 58 files changed, 6625 insertions(+), 47 deletions(-)
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

