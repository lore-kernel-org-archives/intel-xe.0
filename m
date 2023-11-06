Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ECCC4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9313F10E02C;
	Mon,  6 Nov 2023 11:22:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A0F10E2CB
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269751; x=1730805751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I76Gf+E+R/JM6SsfBatkhTKH6p2yuGp+rhVKZdoY0wA=;
 b=jkO6gHvEu6AQz3/eBcn/DnTczYH3gJPWhOp0Bz8drRIjLyAuH/XOoGMZ
 0n+sJP1w7pHu9Frju1YYwg3nvqSWDFgZsLuHHhjVe17E+0QGQrTauvst7
 Ux0tZi6qzGR3DaKFUsEwSrh+YN00J8t5/4Kgw1JCi14MQNPtcmwFvcOkY
 E/VgwA++eNv49iqOYIgYi3AbWt0rDHDvqmTxAL5IM9MX/RmO06bainblN
 3tY3fShhCFvU+loJjFx799mmC0P81aMmCBcn+HwFacE/sCz/FkNcEbMG5
 VwWcDO8Vbn0rVSJ9Xz5AOvwtG25MbVKEILBozWn2BVQBddrDpy+okNJxk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646751"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646751"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411522"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411522"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:11 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:20 +0200
Message-Id: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 00/25] xe-eudebug: GPU debugging interface
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

This patchset is to allow l0/oneAPI GDB
(or some other debugger) to attach to xe driven
device.

The intent is to provide a similar but not API compatible
functionality as in:
https://dgpu-docs.intel.com/driver/gpu-debugging.html

Debugger first opens a connection to a device through
drm ioctl with debug target as a pid. This will return a
dedicated file descriptor used for debugging for further
events and control.

Xe internal resources that are considered essential
to debugger functionality are relayed as events to the
debugger. On debugger connection, all existing resources
are relayed to debugger (discovery) and from that
point onwards, as they are created/destroyed.

uapi is extended to allow an application/lib to provide
debug metadata information. These are relayed as events
to the debugger so it can decode the program state.
Debug metadata is also attached to capture dumps if
no debugger was connected during the gpu/hw exception.
For capturing, the goal is to allow external tools to
construct symbolic backtraces from error capture dumps.

Along with the resource and metadata events, we provide an event for
EU attention. The debugger can (with the assistance of
SIP program provided with pipeline setup), figure out which
exact eu/thread and instruction encountered the breakpoint or some
other exception.

Latest code can be found in:
https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-dev

With the associated tests in:
https://gitlab.freedesktop.org/Dominisg/igt-gpu-tools/-/tree/eudebug-dev

All comments greatly appreciated,
 - Mika


Christoph Manszewski (1):
  drm/xe/xe_eudebug: Add vm bind events w/o acking

Dominik Grzegorzek (15):
  drm/xe/eudebug: Introduce exec_queue events
  drm/xe/eudebug: hw enablement for eudebug
  drm/xe: define XE_MAX_[DSS|EU]_FUSE_BITS globally
  drm/xe: Introduce for_each_dss_steering loop
  drm/xe: Export xe_hw_engine's mmio accessors
  drm/xe: Add runalone engine property
  drm/xe/eudebug: Introduce per device attention scan worker
  drm/xe: Move and export xe_hw_engine lookup.
  drm/xe/eudebug: Introduce EU control interface
  drm/xe: Debug metadata create/destroy ioctls
  xe/drm: Include debug_metadata in usercoredump
  drm/xe: Set vm debug metadata
  drm/xe/: Include attention in usercapture.
  RFC: xe/drm: attach debug metadata to vma
  drm/xe: Capture metadata attached to vma

Mika Kuoppala (9):
  drm/xe/eudebug: Introduce eudebug support
  drm/xe/eudebug: Introduce discovery for resources
  drm/xe: Extend drm_xe_vm_bind_op
  drm/xe/eudebug: uapi for client to debugger metadata (work in
    progress)
  drm/xe/eudebug: Create/destroy user metadata
  drm/xe/eudebug: Set vm metadata
  drm/xe/eudebug: User coredump support
  drm/xe/eudebug: Add per process coredumps
  drm/xe/eudebug: vm open/pread/pwrite

 drivers/gpu/drm/xe/Makefile                  |    6 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h     |    4 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h         |   46 +
 drivers/gpu/drm/xe/xe_debug_metadata.c       |  120 +
 drivers/gpu/drm/xe/xe_debug_metadata.h       |   26 +
 drivers/gpu/drm/xe/xe_debug_metadata_types.h |   28 +
 drivers/gpu/drm/xe/xe_device.c               |   42 +-
 drivers/gpu/drm/xe/xe_device_types.h         |   40 +
 drivers/gpu/drm/xe/xe_eudebug.c              | 2552 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h              |   42 +
 drivers/gpu/drm/xe/xe_eudebug_types.h        |  271 ++
 drivers/gpu/drm/xe/xe_exec_queue.c           |   63 +-
 drivers/gpu/drm/xe/xe_gt_debug.c             |  150 +
 drivers/gpu/drm/xe/xe_gt_debug.h             |   27 +
 drivers/gpu/drm/xe/xe_gt_mcr.c               |   27 +
 drivers/gpu/drm/xe/xe_gt_mcr.h               |   15 +
 drivers/gpu/drm/xe/xe_gt_topology.c          |    3 -
 drivers/gpu/drm/xe/xe_gt_types.h             |    6 +-
 drivers/gpu/drm/xe/xe_hw_engine.c            |   37 +-
 drivers/gpu/drm/xe/xe_hw_engine.h            |   11 +
 drivers/gpu/drm/xe/xe_lrc.c                  |    8 +
 drivers/gpu/drm/xe/xe_lrc.h                  |    3 +
 drivers/gpu/drm/xe/xe_usercoredump.c         |  710 +++++
 drivers/gpu/drm/xe/xe_usercoredump.h         |   26 +
 drivers/gpu/drm/xe/xe_usercoredump_types.h   |  107 +
 drivers/gpu/drm/xe/xe_vm.c                   |  284 +-
 drivers/gpu/drm/xe/xe_vm.h                   |    5 +
 drivers/gpu/drm/xe/xe_vm_types.h             |   39 +
 include/uapi/drm/xe_drm.h                    |  107 +
 include/uapi/drm/xe_drm_tmp.h                |  172 ++
 30 files changed, 4914 insertions(+), 63 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.c
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.h
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
 create mode 100644 drivers/gpu/drm/xe/xe_usercoredump.c
 create mode 100644 drivers/gpu/drm/xe/xe_usercoredump.h
 create mode 100644 drivers/gpu/drm/xe/xe_usercoredump_types.h
 create mode 100644 include/uapi/drm/xe_drm_tmp.h

-- 
2.34.1

