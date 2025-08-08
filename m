Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4DEC87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 10:44:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CDC10E03F;
	Fri,  8 Aug 2025 10:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGnSMWzr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0A110E03F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 10:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754649851; x=1786185851;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b3LmcSUL9popM7KWXD/lksJvUWU4cRkep2AJWLWr+Go=;
 b=IGnSMWzrlBN92glzyxL5J+z2IVbQ8oxsKHRAPIUzCIajBkwIBr0dVKVe
 Vfe8LSou7+3M46J/uC6JXZGbc/w3hnMZN5H9qR0GZonDK19np69lkWYVR
 I74j+D+RFYIPvFItt+WS8YGm9upP7cZbqwrkevUr52lexfpxV7UpD7UXZ
 J+nxWbFYm3jUjm4ggGi5ndRaaCG1lrdbLPouBysVJFTZqCXhVskgQoJr9
 5cFJDSeJNpHZuYIb3hfBWbWad2wO4MaLnKXfLA/k71PIDxRNtt+QvN3Rz
 ccuzrrDIsynrnWXA7buIG3OjxGSkXFPWDX9eWmDfUq/xrULSXKG+1eQeF w==;
X-CSE-ConnectionGUID: gD8hCzFlSCyP/RXghJKkxg==
X-CSE-MsgGUID: lgZczgxtQB+H1rVSzHYAvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67265577"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="67265577"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 03:44:11 -0700
X-CSE-ConnectionGUID: yD3saYGXTNqmdIv1A71aag==
X-CSE-MsgGUID: Pk0NJBUAS6encwARV9enuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="164518837"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.245.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 03:44:08 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 00/15] Intel Xe GPU Debug Support (eudebug) v4
Date: Fri,  8 Aug 2025 13:43:34 +0300
Message-ID: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
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

This is the v4 patch series for Intel Xe GPU debug support (eudebug).

This series continues from the following previous submissions:
- v1: https://lists.freedesktop.org/archives/intel-xe/2024-July/043605.html
- v2: https://lists.freedesktop.org/archives/intel-xe/2024-October/052260.html
- v3: https://lists.freedesktop.org/archives/intel-xe/2024-December/061476.html

This is a major cleanup and rework of eudebug patch series to address the
feedback for v3. Page fault handling is omitted for until we receive
ack on core design, as there was no feedback on it on previous iterations.

### Major Changes

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

### Supported Hardware with v4
- Lunarlake (LNL)
- Battlemage (BMG)
- Pantherlake (PTL)

The code for this submission can be found at:
https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-v4

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

Mika Kuoppala (5):
  drm/xe/eudebug: Introduce eudebug interface
  drm/xe/eudebug: Introduce discovery for resources
  drm/xe/eudebug: Add UFENCE events with acks
  drm/xe/eudebug: vm open/pread/pwrite
  drm/xe/eudebug: userptr vm pread/pwrite

 drivers/gpu/drm/xe/Kconfig                  |   10 +
 drivers/gpu/drm/xe/Makefile                 |    7 +-
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
 drivers/gpu/drm/xe/xe_device_types.h        |   40 +
 drivers/gpu/drm/xe/xe_eudebug.c             | 2309 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h             |  116 +
 drivers/gpu/drm/xe/xe_eudebug_hw.c          |  730 ++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.h          |   32 +
 drivers/gpu/drm/xe/xe_eudebug_types.h       |  174 ++
 drivers/gpu/drm/xe/xe_eudebug_vm.c          |  434 ++++
 drivers/gpu/drm/xe/xe_eudebug_vm.h          |    8 +
 drivers/gpu/drm/xe/xe_exec.c                |    2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c          |   51 +-
 drivers/gpu/drm/xe/xe_exec_queue.h          |    2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |    7 +
 drivers/gpu/drm/xe/xe_gt.c                  |    1 +
 drivers/gpu/drm/xe/xe_gt_debug.c            |  179 ++
 drivers/gpu/drm/xe/xe_gt_debug.h            |   41 +
 drivers/gpu/drm/xe/xe_hw_engine.h           |   14 +
 drivers/gpu/drm/xe/xe_lrc.c                 |   10 +
 drivers/gpu/drm/xe/xe_oa.c                  |    3 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c           |   10 +
 drivers/gpu/drm/xe/xe_reg_sr.c              |   21 +-
 drivers/gpu/drm/xe/xe_reg_sr.h              |    4 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c       |    2 +-
 drivers/gpu/drm/xe/xe_rtp.c                 |    2 +-
 drivers/gpu/drm/xe/xe_sync.c                |   45 +-
 drivers/gpu/drm/xe/xe_sync.h                |    8 +-
 drivers/gpu/drm/xe/xe_sync_types.h          |   28 +-
 drivers/gpu/drm/xe/xe_vm.c                  |  186 +-
 drivers/gpu/drm/xe/xe_vm.h                  |   26 +
 drivers/gpu/drm/xe/xe_vm_types.h            |   38 +
 drivers/gpu/drm/xe/xe_wa_oob.rules          |    4 +
 include/uapi/drm/xe_drm.h                   |   59 +
 include/uapi/drm/xe_drm_eudebug.h           |  217 ++
 45 files changed, 5552 insertions(+), 47 deletions(-)
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
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
 create mode 100644 include/uapi/drm/xe_drm_eudebug.h

-- 
2.43.0

