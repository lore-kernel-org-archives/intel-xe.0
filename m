Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBE7105F7AE
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 14:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8540010E0B0;
	Fri, 13 Mar 2026 14:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4udBBV3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E2D10E0B0
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773412391; x=1804948391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oAatLhD2E4ibNzadx8UzsB4mu93ScfxRy3DX4DY8xkI=;
 b=m4udBBV3jClgQ5r7s/1RMDpjLb1KG5teGQmzzlzPrTvbKawvzWwbxqYo
 RJtx3qza0OBtcXPZsLYAClK5oEu8a1k186cuNVTsLKj7pKdhxcvLmYeXn
 goIwI++7RBujGqNYllikkRtCb267AiwHTzU4hpJMcs5t1euGDJxnMHTqv
 EMOvoOq7NnASF4/EMkyuLSSrKelkvPFiUXKe+Zx8RBxKmW8oxJWAkN2VN
 0IksGHDhPoEduEpkowQWQSeElj9fHVK2Qsiioxy0Ni99fT69DcTxOV2vi
 Kxi+fSfqZGukauSxcZqsxLZ9WKtNj5WhOpWQrwtDYYJ8or3oYIXSD8yAS g==;
X-CSE-ConnectionGUID: fS/XTOLjT7eN6xcZfSrZ2Q==
X-CSE-MsgGUID: FR3x0qKSQKK02ZJH9r863A==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="73536509"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="73536509"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 07:33:11 -0700
X-CSE-ConnectionGUID: 693tVG5WRb6N9kzNgVUYiQ==
X-CSE-MsgGUID: Vce0r/AOQEy5EFugcygHog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="216084294"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 07:33:07 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v10 0/7] drm/xe/xe_sysctrl: Add system controller component
 for Xe3p dGPU platforms
Date: Fri, 13 Mar 2026 07:33:03 -0700
Message-ID: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
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

This patch series introduces initial support for System Controller
(sysctrl) component on Intel Xe3p discrete GPU platforms.

System Controller is a firmware-managed entity responsible for selected
platform-level management functions delegated by driver. Interaction
with System Controller is performed via a mailbox interface.

This series adds foundational infrastructure required to detect and
initialize System Controller interface and to exchange commands and
responses with firmware, including support for fragmented message
transfers for larger payloads.

This establishes base for subsequent System Controller feature
enablement and firmware command handling.

Follow-up series covering sysctrl usage are available at:
https://patchwork.freedesktop.org/series/160482/
https://patchwork.freedesktop.org/series/160184/
https://patchwork.freedesktop.org/series/161655/
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

v10: (Riana, Badal, Anshuman, Umesh)
- Removed SCHI terminology and aligned to sysctrl mailbox naming
- Cleaned up commit message
- Updated sysctrl documentation
- Fixed mutex lifetime management
- Added System Controller ABI kernel-doc
- Converted xe_sysctrl_app_msg_hdr data field to u32
- Fixed macro alignment
- Added sysctrl suspend/resume handling
- Dropped redundant header includes and unused variable initialization
- Updated runtime PM guarding in xe_sysctrl_send_command() to use
  guard(xe_pm_runtime_noresume)
---
Anoop Vijay (7):
  drm/xe/xe_sysctrl: Add System Controller types and device integration
  drm/xe/xe_sysctrl: Add System Controller mailbox register definitions
  drm/xe/xe_sysctrl: Add ABI and mailbox interface headers
  drm/xe/xe_sysctrl: Add System Controller initialization support
  drm/xe/xe_sysctrl: Add System Controller mailbox communication support
  drm/xe/xe_sysctrl: Add System Controller power management support
  drm/xe/xe_pci: Enable System Controller support on CRI platform

 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       |  48 +++
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pm.c                    |  11 +
 drivers/gpu/drm/xe/xe_sysctrl.c               | 124 ++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  23 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 369 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  31 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  36 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  32 ++
 14 files changed, 726 insertions(+)
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

