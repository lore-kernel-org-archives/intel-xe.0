Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EDAC3DA4B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6689E10E1A0;
	Fri, 12 Jul 2024 21:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FnJzNcyQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3026B10E1A0
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720819757; x=1752355757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1sUAT4JDb7oHaVXSs80iCXckkl1ql385l7xp9xJzCtM=;
 b=FnJzNcyQK+Hm0PcXfxJu+wGpIYUyGVRjG19YS6g3gb6BZi2aRQTEGq3a
 CESx7hDuQT23eEv4nRhpMoXyIi0Zu8HV89a+AhtkJ9t6LX4o4itn0NFSu
 kV03z7xwANk4KB0S4Omq6K+HtIe8u4GYn64i0KsjkZ1o76bg37vI/f4Yf
 H60fuiuyuF4xBgWpWf5ht201CxzwN7WVDvzZm92Mjw/0pUd5J8veVBlfl
 hnSdAbhDGcY/uE6tycFAyXj+27pCDpUgKhjCsHZcHL258KQHxiwEcY3EO
 pNkzPZeXVtlZDV1zRh56NC1hQMvxdG/FrfLRS/iHWXCnRbrbNeGma1L91 Q==;
X-CSE-ConnectionGUID: yBxf1kuhQE2A8PuwvWjWfQ==
X-CSE-MsgGUID: 9DBvPa0aRdWOc4ZWi97pkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17990147"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="17990147"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:16 -0700
X-CSE-ConnectionGUID: PGUnTgsJRvSN7yMjFbkLWw==
X-CSE-MsgGUID: R9QsObEwSTiGqoDN2DAOSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="53864564"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:16 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [RFC 00/14] Add PXP HWDRM support
Date: Fri, 12 Jul 2024 14:28:44 -0700
Message-ID: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
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

PXP (Protected Xe Path) allows execution and flip to display of protected
(i.e. encrypted) objects. The HW supports multiple types of PXP, but
this series only introduces support for PXP HWDRM, which is mainly
targeted at encrypting data that is going to be displayed.

Even though we only plan to support 1 type of PXP for now, the interface
has been designed to allow support for other PXP types to be added at a
later point in time.

A user is expected to mark both BO and exec_queues as using PXP and the
driver will make sure that PXP is running and that the encryption is
valid and that no execution happens with an outdated encryption.

RFC: The series is in a decent state and all my local tests are working
on MTL, but I'm seeing failures on LNL; those are currently trending to
being issues with the contents of the test batch, but I didn't want to
hold the series back until I was sure of that because there are a couple
of choices I made where I'd like feedback, so sending it as a RFC so I
can get that feedback while I complete the debug. The 2 areas in which
I'd like feedback are:

1) VM/BO changes:
    - PXP requires PPGTT submissions from inside the driver, which isn't
      currently supported. I've hooked it up (patch 3), but I'd like an
      expert eye to confirm I didn't do anything stupid.
    - We need to reject submissions using VMs with mapped invalid BOs.
      I've done this by checking all mapped BOs for PXP submissions
      (patch 11), but I'm open to ideas on how to do this differently.

2) API: as mentioned above, I've kept this flexible. Just wanted to
   confirm no one had anything against the approach. See patches 9-11. 

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Daniele Ceraolo Spurio (14):
  drm/xe: Make exec_queue_kill safe to call twice
  drm/xe/pxp: Initialize PXP structure and KCR reg
  drm/xe/pxp: Allocate PXP execution resources
  drm/xe/pxp: Add VCS inline termination support
  drm/xe/pxp: Add GSC session invalidation support
  drm/xe/pxp: Handle the PXP termination interrupt
  drm/xe/pxp: Add GSC session initialization support
  drm/xe/pxp: Add hooks to mark an exec queue as using PXP
  drm/xe/pxp: Add API to mark a queue as using PXP
  drm/xe/pxp: add a query for PXP status
  drm/xe/pxp: Add API to mark a BO as using PXP
  drm/xe/pxp: add PXP PM support
  drm/xe/pxp: Add PXP debugfs support
  drm/xe/pxp: Enable PXP for MTL

 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |  40 +
 .../xe/compat-i915-headers/pxp/intel_pxp.h    |  14 +-
 .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
 .../gpu/drm/xe/instructions/xe_mfx_commands.h |  29 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   5 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   8 +
 drivers/gpu/drm/xe/regs/xe_pxp_regs.h         |  23 +
 drivers/gpu/drm/xe/xe_bo.c                    | 100 ++-
 drivers/gpu/drm/xe/xe_bo.h                    |   5 +
 drivers/gpu/drm/xe/xe_bo_types.h              |   3 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   3 +
 drivers/gpu/drm/xe/xe_device.c                |   6 +
 drivers/gpu/drm/xe/xe_device_types.h          |   8 +-
 drivers/gpu/drm/xe/xe_exec.c                  |   6 +
 drivers/gpu/drm/xe/xe_exec_queue.c            |  48 +-
 drivers/gpu/drm/xe/xe_exec_queue.h            |   5 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |   7 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |   2 +-
 drivers/gpu/drm/xe/xe_irq.c                   |  20 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |  14 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |   7 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pm.c                    |  42 +-
 drivers/gpu/drm/xe/xe_pxp.c                   | 713 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp.h                   |  32 +
 drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 120 +++
 drivers/gpu/drm/xe/xe_pxp_debugfs.h           |  13 +
 drivers/gpu/drm/xe/xe_pxp_submit.c            | 549 ++++++++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.h            |  20 +
 drivers/gpu/drm/xe/xe_pxp_types.h             | 103 +++
 drivers/gpu/drm/xe/xe_query.c                 |  33 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |   4 +-
 drivers/gpu/drm/xe/xe_vm.c                    | 148 +++-
 drivers/gpu/drm/xe/xe_vm.h                    |   8 +
 drivers/gpu/drm/xe/xe_vm_types.h              |   1 +
 include/uapi/drm/xe_drm.h                     |  83 +-
 38 files changed, 2190 insertions(+), 40 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pxp_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_types.h

-- 
2.43.0

