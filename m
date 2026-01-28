Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1435D3568D
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 08:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A5F10E625;
	Wed, 28 Jan 2026 08:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zzna5Gdg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BBE10E627
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769588069; x=1801124069;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+N/biAZHeqAo5/0g5xrQEtfO9W/SDgO7lJIBacoRaBQ=;
 b=Zzna5Gdg7PM8ZVrtTvs5xApYpQJQY+nsckmOpCLfRzlE57YrSZOUUouI
 Lw9pWejGHUI+HZ/ACR+weB3GaaRfrcy0hn2o5PvRJ5nxVR6XFaeYS8ine
 QvDQYEJVkjFx52ejXY0eGoGiqimddfVbZXEUQbs4MkTxnCRugD00SWyJv
 w70TfIhC0EWZLLMgHq15vyC5oHMW288qKd7VZEjKeV0yJz5Comp2t29Ls
 0lt4YosbQkHShCpYvcV+gfD1uscyzQ+hCY8xL8VQen2pW7dPDAQmmqG5Y
 CgGHhAwTFzUylFFzL9f1vTdrnluN2mC0QombYSz7dtTvkCYPRzEpY+2cu w==;
X-CSE-ConnectionGUID: Cd/PL6VTR/qlxK0/KMHGxw==
X-CSE-MsgGUID: AOkoEJ4HRTGy/iSdc0Yd+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74643440"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74643440"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:14:10 -0800
X-CSE-ConnectionGUID: nROPZ11ESTuTRURum2SOSw==
X-CSE-MsgGUID: fhGgeQP6TAuhSOf4y1rzFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231156806"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:14:07 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v6 0/6] drm/xe/sysctrl: Add system controller component for
 Xe3p dGPU platforms
Date: Wed, 28 Jan 2026 00:14:02 -0800
Message-ID: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

This patch series introduces System Controller (sysctrl) component for Intel Xe3p 
dGPU platforms.

This component provides the foundational infrastructure for communication
with the System Controller firmware using MKHI protocol over a mailbox interface.

Key features introduced:
- Detection and initialization of System Controller interface on Xe3p dGPU platforms
- Mailbox communication with System Controller firmware
- Fragmented message transfer for large command payloads

This implementation establishes the base for future System Controller feature
enablement and firmware command handling.
---
v2: (Umesh)
- Fix commit message to 75 chars per line
- Address CI.Hooks and checkpatch warnings
- Add sc_to_xe() helper for cleaner conversions
- Alphabetical order for headers
- Simplify write/read frame logic using memcpy
- Drop redundant frame length checks
- Use xe_mmio_rmw32() for register updates
- Align FIELD_PREP macros
- Improve error handling and timeout messages
- Handle phase_bit revert on write-frame failure
- Update rdata_len on partial receive before return
- Remove unnecessary headers

v3: (Matt, Riana, Umesh)
- Split patch into logical series
- Rename SC_* macros to SYSCTRL_* for consistency
- Move MKHI_* defines to .c file
- Pass xe directly to helpers
- Place devm_add_action_or_reset() after set_sysctrl_region()
- Add kernel-doc for xe_sysctrl_mailbox_init()
- Add short documentation for System Controller in xe_sysctrl.c
- Avoid hardcoded sizes
- Move structs to _types.h

v4: (Matt, Mike)
- Code style improvements
- Add domain-specific MMIO accessor
- Change phase_bit to bool type
- Add input validation and buffer overflow protection

v5: (Umesh, Riana)
- Reset phase bit to 0 on error conditions
- Refactor mailbox receive path
- Updated xe_err messages for consistency

v6: (Matt)
- Move protocol constants from xe_sysctrl_regs.h to xe_sysctrl_mailbox_types.h
- Add SYSCTRL_MB_CTRL_MKHI_CMD helper macro
---

Anoop Vijay (6):
  drm/xe/sysctrl: Add System Controller register definitions
  drm/xe/sysctrl: Add System Controller types and structures
  drm/xe/sysctrl: Add System Controller mailbox implementation
  drm/xe/sysctrl: Add System Controller initialization
  drm/xe/sysctrl: Integrate System Controller into device
  drm/xe/sysctrl: Enable System Controller for Xe3p

 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_sysctrl.c               |  80 ++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  13 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 390 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  35 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  42 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  33 ++
 12 files changed, 645 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

-- 
2.43.0

