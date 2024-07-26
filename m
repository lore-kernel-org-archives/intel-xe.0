Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F533C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D2F10E9A2;
	Fri, 26 Jul 2024 14:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aq3BOxom";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B09210E9A2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003450; x=1753539450;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fNCOw6pZ2u4FA4zs+vYj+hEQuutmgszSqMk7WG+hsH8=;
 b=Aq3BOxomyAeSLMFcn88c3kpl/mZ3Vag78RNbUyAzlQzB3zUey0dQOfXe
 PDtEchMGE3J3O3/9MT0bVWim8/pSquun+fcHV/STl1J132QoR7UBkSjQA
 aD+8Eh7bA2tUX5qym4a4fo1dLe4gZKzBUHpkpt1Ck8ch3rwDTgKmOxmOG
 6fBixcrx8nFxpx+aBZCLi+Qvmi2YEnnz24nEt+rXRDJwfKYvKhSGmUzcJ
 MT6XHrJzBBkwipT37lDCpNObuCaMj0xz+qtguFnsHKiODtBrnR2x+gn/M
 pWQ20p0hlxtOTzwdsdHhn2c0yJJuawHdNnyZsJ1oDMXM8wcid0fuZBEyf A==;
X-CSE-ConnectionGUID: JjS3v+FFTxiAUJ/P7A6Mfg==
X-CSE-MsgGUID: SMHgwk+SQBqiOhZ2BAuuZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598738"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598738"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:14 -0700
X-CSE-ConnectionGUID: tXtS9u/QSyCGf/VaGYh4Aw==
X-CSE-MsgGUID: SUjj2x8mT9mt8vrt3qQ5Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861333"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:13 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 00/21] GPU debug support (eudebug)
Date: Fri, 26 Jul 2024 17:07:57 +0300
Message-Id: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

Hi,

We (Intel eudebug kernel team) would like to submit this
patchset to enable debug support for Intel GPU devices.

The aim is to allow Level-Zero + GDB (or some other tool)
to attach to xe driver in order to receive information
about relevant driver resources, hardware events and to allow debug
related hardware control. End goal is full debug capability
of supported Intel hardware, see [4].

Debugger first opens a connection to a device through
drm ioctl with debug target process as a pid. This will
return a dedicated file descriptor used for debugging
for further events and control.

Xe internal resources that are considered essential
to debugger functionality are relayed as events to the
debugger. On debugger connection, all existing resources
are relayed to debugger (discovery) and from that
point onwards, as they are created/destroyed.

uapi is extended to allow an application/lib to provide
debug metadata information. These are relayed as events
to the debugger so it can decode the program state.

Along with the resource and metadata events, an event for
hardware exceptions, called EU attention, is provided.
The debugger, with the assistance of an exception handling
program called System Routine (short: SIP) provided
with the pipeline setup, can determine which specific
EU/thread and instruction encountered the breakpoint
or other exceptions.

EU controlling ioctl interface is also introduced where
debugger can manipulate individual threads of the currently
active workload. This interface enables the debugger to
interrupt all threads on demand, check their current state
and resume them individually.

The intent is to provide a similar but not API compatible
functionality as in out-of-tree i915 debugger support:
https://dgpu-docs.intel.com/driver/gpu-debugging.html

For xe the aim is to have all support merged in upstream,
starting with this series. With Lunarlake being first targetted
hardware.

I have split the events into xe_drm_eudebug.h instead
pushing everything into xe_drm.h, in order to help
distinguish what is controlled by which descriptor.
If it's through the original xe fd, it is in xe_drm.h and
if it's through the opened debugger connection fd, it
is in xe_drm_eudebug.h.

Latest code can be found in:
[1] https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-dev

With the associated IGT tests:
[2] https://gitlab.freedesktop.org/cmanszew/igt-gpu-tools/-/tree/eudebug-dev

The user for this uapi:
[3] https://github.com/intel/compute-runtime
Event loop and thread control interaction can be found at:
https://github.com/intel/compute-runtime/tree/master/level_zero/tools/source/debug/linux/xe
And the wrappers in:
https://github.com/intel/compute-runtime/tree/master/shared/source/os_interface/linux/xe
https://github.com/intel/compute-runtime/blob/master/shared/source/os_interface/linux/xe/ioctl_helper_xe_debugger.cpp
Note that the XE support is disabled by default and you will need
NEO_ENABLE_XE_EU_DEBUG_SUPPORT enabled in order to test.

GDB support:
[4]: https://sourceware.org/pipermail/gdb-patches/2024-July/210264.html

Thank you in advance for any comments and insight.


Andrzej Hajda (1):
  drm/xe/eudebug: implement userptr_vma access

Christoph Manszewski (3):
  drm/xe/eudebug: Add vm bind and vm bind ops
  drm/xe/eudebug: Dynamically toggle debugger functionality
  drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test

Dominik Grzegorzek (10):
  drm/xe: Export xe_hw_engine's mmio accessors
  drm/xe: Move and export xe_hw_engine lookup.
  drm/xe/eudebug: Introduce exec_queue events
  drm/xe/eudebug: hw enablement for eudebug
  drm/xe: Add EUDEBUG_ENABLE exec queue property
  drm/xe/eudebug: Introduce per device attention scan worker
  drm/xe/eudebug: Introduce EU control interface
  drm/xe: Debug metadata create/destroy ioctls
  drm/xe: Attach debug metadata to vma
  drm/xe/eudebug: Add debug metadata support for xe_eudebug

Jonathan Cavitt (1):
  drm/xe/eudebug: Use ptrace_may_access for xe_eudebug_attach

Mika Kuoppala (6):
  drm/xe/eudebug: Introduce eudebug support
  kernel: export ptrace_may_access
  drm/xe/eudebug: Introduce discovery for resources
  drm/xe/eudebug: Add UFENCE events with acks
  drm/xe/eudebug: vm open/pread/pwrite
  drm/xe/eudebug: Implement vm_bind_op discovery

 drivers/gpu/drm/xe/Makefile                  |    5 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h     |    8 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h         |   43 +
 drivers/gpu/drm/xe/tests/xe_eudebug.c        |  170 +
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c  |    2 +
 drivers/gpu/drm/xe/xe_debug_metadata.c       |  125 +
 drivers/gpu/drm/xe/xe_debug_metadata.h       |   25 +
 drivers/gpu/drm/xe/xe_debug_metadata_types.h |   28 +
 drivers/gpu/drm/xe/xe_device.c               |   47 +-
 drivers/gpu/drm/xe/xe_device_types.h         |   45 +
 drivers/gpu/drm/xe/xe_eudebug.c              | 3841 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h              |   51 +
 drivers/gpu/drm/xe/xe_eudebug_types.h        |  326 ++
 drivers/gpu/drm/xe/xe_exec.c                 |    2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           |   80 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |    7 +
 drivers/gpu/drm/xe/xe_gt_debug.c             |  152 +
 drivers/gpu/drm/xe/xe_gt_debug.h             |   27 +
 drivers/gpu/drm/xe/xe_hw_engine.c            |   39 +-
 drivers/gpu/drm/xe/xe_hw_engine.h            |   11 +
 drivers/gpu/drm/xe/xe_lrc.c                  |   16 +-
 drivers/gpu/drm/xe/xe_lrc.h                  |    4 +-
 drivers/gpu/drm/xe/xe_reg_sr.c               |   21 +-
 drivers/gpu/drm/xe/xe_reg_sr.h               |    4 +-
 drivers/gpu/drm/xe/xe_rtp.c                  |    2 +-
 drivers/gpu/drm/xe/xe_rtp_types.h            |    1 +
 drivers/gpu/drm/xe/xe_sync.c                 |   49 +-
 drivers/gpu/drm/xe/xe_sync.h                 |    8 +-
 drivers/gpu/drm/xe/xe_sync_types.h           |   26 +-
 drivers/gpu/drm/xe/xe_vm.c                   |  227 +-
 drivers/gpu/drm/xe/xe_vm_types.h             |   26 +
 include/uapi/drm/xe_drm.h                    |   96 +-
 include/uapi/drm/xe_drm_eudebug.h            |  226 ++
 kernel/ptrace.c                              |    1 +
 34 files changed, 5655 insertions(+), 86 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug.c
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.c
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.h
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
 create mode 100644 include/uapi/drm/xe_drm_eudebug.h

-- 
2.34.1

