Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED50FD4F19
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 18:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D431F10E29B;
	Tue, 10 Mar 2026 18:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flTow7kU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9246710E29B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 18:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773167025; x=1804703025;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j0LN/s5UdRqklERMT+lZ1KLJUzXZjucPwosk6BOECtU=;
 b=flTow7kUiGvTIf7ZhjxP1lozh6RE4598bp7h9I5vL1cfYary4PXU7TZc
 NpTjfbJlBOyhmw32BLSzAWPPmFcW8qMoZiS/tzUwWQuYD3xNqUxGMZIt2
 X0uo2SBCoPU7QYBglqtltbonfiZaOfwoduM5RVKKWhdzx9xppBoDFbA06
 PvlraL2EhCHcc8qo9rMfw1AGk6AfLRCGj2unLRpXAecay4A16TsV2kbNV
 qykcmPBMm1fucK+eAAl1MqWGLZBxkOZrVAKlJfkl6Ysj0VyzqNwYswwEO
 koiu0WtzGr+gcR0CYvRXBwtRCUBcQTJ7WqQjJLlmotVplUZ7ZQ2zxtvnL w==;
X-CSE-ConnectionGUID: +en/VgraSVCc8R2ZaDly/Q==
X-CSE-MsgGUID: JWpD2Ba/TUur1YYwjlCf6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78109802"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="78109802"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 11:23:44 -0700
X-CSE-ConnectionGUID: 6iKEPmdaQE6H/xOfixrJpQ==
X-CSE-MsgGUID: yuGEN/WmQhidzkMyiuXKwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="258127606"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 11:23:40 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v9 0/6] drm/xe/sysctrl: Add system controller component for
 Xe3p dGPU platforms
Date: Tue, 10 Mar 2026 11:23:19 -0700
Message-ID: <20260310182336.611041-8-anoop.c.vijay@intel.com>
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

v7:
- Fix for CI failure

v8: (Matt, Michal, Shuicheng)
- Reordered patches for logical flow
- Moved ABI definitions to dedicated header
- Static functions renamed with short prefix
- Fixed include order
- Added VF check
- Converted runtime checks to assertions
- Changed xe_sysctrl_send_command() function parameter from 'xe' to 'sc'
- Added frame length validation and command overflow protection
- Use REG_FIELD_PREP for hardware registers
- Changed error format to %pe
- Removed unnecessary NULL checks and explicit zeros
- Fixed kernel-doc syntax
- Added sc_to_xe() helper

v9: (Matt, Umesh, Badal)
- Extended commit message to explain System Controller and purpose of
  `has_sysctrl` flag
- Normalized hexadecimal literal casing
- Renamed MKHI to SCHI (System Controller Host Interface)
- Fixed kernel-doc syntax
---

Anoop Vijay (6):
  drm/xe/sysctrl: Add System Controller types and device integration
  drm/xe/sysctrl: Add System Controller register definitions
  drm/xe/sysctrl: Add mailbox communication headers
  drm/xe/sysctrl: Add System Controller initialization
  drm/xe/sysctrl: Add mailbox communication implementation
  drm/xe/pci: Enable System Controller for CRI platform

 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       |  31 ++
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_sysctrl.c               |  84 ++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  21 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 364 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  31 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  35 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  32 ++
 13 files changed, 650 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

-- 
2.43.0

