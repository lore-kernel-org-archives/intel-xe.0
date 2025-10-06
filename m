Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4895ACCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DF910E33F;
	Mon,  6 Oct 2025 11:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8Bkq/lP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69AC10E33F
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749445; x=1791285445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nGD/YzKLqDt0OqvfvU/MWTyJLS4Of9xdihIAS2rtjUM=;
 b=J8Bkq/lPHrn9WpyCHFh5iKVq2yTyar8TEt/Blkzwk9Ii/elh1/X2pSEt
 ATk2kqwU2CmnUW5C6ktmWB7v+MRP/SwQoAd3YIYnF8303jaKJOGvZMZGP
 zDJWc4x/4SS12mAIn54ovYL5L2Icpjckep8dwCcYOoRAVFZMgRmF0KhdG
 33v3/uRe+rl2gptrxDMjV9bMjZN8o6epBjhACyWwk5g2S0Blh0slt27vc
 5Az52Fbv9mWG8oIEZDkOoByx3qFpLr8NBz3x0Y7OFWGvbPaNiAi4lIBdV
 cBqtkolS4FCE+27fzQeTqCOQ+cc8Gk0xIlsNJPv9hI52cZt+hwq6reKD9 Q==;
X-CSE-ConnectionGUID: F/NnLMnwRheAEAGegRnqog==
X-CSE-MsgGUID: goCvSEX1SmGkPsRC5gd7wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61825384"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61825384"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:17:24 -0700
X-CSE-ConnectionGUID: 98adShYfT+m6gsnKbDYVjA==
X-CSE-MsgGUID: Ca3De+BJS/2dI7xtCRWjUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="216946857"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.245.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:17:21 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 00/20] Intel Xe GPU Debug Support (eudebug) v5
Date: Mon,  6 Oct 2025 14:16:50 +0300
Message-ID: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
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

This is the v5 patch series for Intel Xe GPU debug support (eudebug).

As the initial feedback on v4 was positive, we brought the
rest of the features from v3, namely the page fault support
into this series.

This series continues from the following previous submissions:
- v1: https://lists.freedesktop.org/archives/intel-xe/2024-July/043605.html
- v2: https://lists.freedesktop.org/archives/intel-xe/2024-October/052260.html
- v3: https://lists.freedesktop.org/archives/intel-xe/2024-December/061476.html
- v4: https://lists.freedesktop.org/archives/intel-xe/2025-August/091645.html

Known shortcomings: With multiple debug clients page faults can
race into how attention polling is stopped/started and lead to
missing attentions.

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

### Supported Hardware with v5
- Lunarlake (LNL)
- Battlemage (BMG)
- Pantherlake (PTL)

The code for this submission can be found at:
https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-v5

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
  drm/xe/eudebug: Introduce EU pagefault handling interface
  drm/xe/vm: Support for adding null page VMA to VM on request
  drm/xe/eudebug: Enable EU pagefault handling

Mika Kuoppala (6):
  drm/xe/eudebug: Introduce eudebug interface
  drm/xe/eudebug: Introduce discovery for resources
  drm/xe/eudebug: Add UFENCE events with acks
  drm/xe/eudebug: vm open/pread/pwrite
  drm/xe/eudebug: userptr vm pread/pwrite
  drm/xe/eudebug: Mark guc contexts as debuggable

 drivers/gpu/drm/xe/Kconfig                  |   10 +
 drivers/gpu/drm/xe/Makefile                 |    7 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h    |    5 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h    |    7 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h        |   43 +
 drivers/gpu/drm/xe/tests/xe_eudebug.c       |  189 ++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |    5 +
 drivers/gpu/drm/xe/xe_client_debugfs.c      |  118 +
 drivers/gpu/drm/xe/xe_client_debugfs.h      |   19 +
 drivers/gpu/drm/xe/xe_debug_data.c          |  279 +++
 drivers/gpu/drm/xe/xe_debug_data.h          |   22 +
 drivers/gpu/drm/xe/xe_debug_data_types.h    |   25 +
 drivers/gpu/drm/xe/xe_device.c              |   30 +-
 drivers/gpu/drm/xe/xe_device.h              |   42 +
 drivers/gpu/drm/xe/xe_device_types.h        |   41 +-
 drivers/gpu/drm/xe/xe_eudebug.c             | 2360 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h             |  157 ++
 drivers/gpu/drm/xe/xe_eudebug_hw.c          |  798 +++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.h          |   36 +
 drivers/gpu/drm/xe/xe_eudebug_pagefault.c   |  391 +++
 drivers/gpu/drm/xe/xe_eudebug_pagefault.h   |   15 +
 drivers/gpu/drm/xe/xe_eudebug_types.h       |  232 ++
 drivers/gpu/drm/xe/xe_eudebug_vm.c          |  434 ++++
 drivers/gpu/drm/xe/xe_eudebug_vm.h          |    8 +
 drivers/gpu/drm/xe/xe_exec.c                |    2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c          |   51 +-
 drivers/gpu/drm/xe/xe_exec_queue.h          |    2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |    7 +
 drivers/gpu/drm/xe/xe_gt.c                  |    1 +
 drivers/gpu/drm/xe/xe_gt_debug.c            |  243 ++
 drivers/gpu/drm/xe/xe_gt_debug.h            |   47 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   80 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |    4 +
 drivers/gpu/drm/xe/xe_hw_engine.h           |   14 +
 drivers/gpu/drm/xe/xe_lrc.c                 |   10 +
 drivers/gpu/drm/xe/xe_oa.c                  |    3 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c           |   10 +
 drivers/gpu/drm/xe/xe_reg_sr.c              |   21 +-
 drivers/gpu/drm/xe/xe_reg_sr.h              |    4 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c       |    2 +-
 drivers/gpu/drm/xe/xe_rtp.c                 |    2 +-
 drivers/gpu/drm/xe/xe_sync.c                |   47 +-
 drivers/gpu/drm/xe/xe_sync.h                |    8 +-
 drivers/gpu/drm/xe/xe_sync_types.h          |   28 +-
 drivers/gpu/drm/xe/xe_userptr.c             |    4 +
 drivers/gpu/drm/xe/xe_userptr.h             |   32 +
 drivers/gpu/drm/xe/xe_vm.c                  |  215 +-
 drivers/gpu/drm/xe/xe_vm.h                  |    2 +
 drivers/gpu/drm/xe/xe_vm_types.h            |   32 +
 drivers/gpu/drm/xe/xe_wa_oob.rules          |    4 +
 include/uapi/drm/xe_drm.h                   |   59 +
 include/uapi/drm/xe_drm_eudebug.h           |  229 ++
 52 files changed, 6382 insertions(+), 54 deletions(-)
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
 create mode 100644 include/uapi/drm/xe_drm_eudebug.h

-- 
2.43.0

