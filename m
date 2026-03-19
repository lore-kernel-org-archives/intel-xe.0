Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCC0109025E
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 17:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4C010E163;
	Thu, 19 Mar 2026 17:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZEyE6r6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653A210E163
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 17:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773941439; x=1805477439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IZXQV0/u62ZRbuP/zqi/0+uqglmnoKk9zprd2O2vnDE=;
 b=cZEyE6r6ZiYRmdUX2R4PdMs7lEHfdlLLyPpyIxNdcnzm49GH0NftSi4C
 /WrN1kJTI7Nw2MxLN+UioJhnq0GoZWvay7wWOychbapISHT3fU2g5UkSi
 Q2WbwnZTwngduyRmGO6hTIT//3ww25hWAlKbgeWiJiiUrWk7HsOkU32C1
 +Ufr2T+1Mv9etbUkJ6gK0vqR8GYe3+n+Cp3lLnOjOEvcofenO6PDlottk
 nS9B54jd3B+1OvhChvEvgfSaQUby7I7IpWAImKhqkOw6GXOWgIezbjcqG
 yZzw07KTWFMPQZ0KO1GiOLm9WyJfNJg/csyevQiLjX85+zO1mUGXF4FHD w==;
X-CSE-ConnectionGUID: 6ld6yIL8T0Ss0q3YY7q7zA==
X-CSE-MsgGUID: 5gpzD813TySciSdJDdVg1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86385100"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="86385100"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 10:30:39 -0700
X-CSE-ConnectionGUID: sXFcMDNISOeGLUSSlBo9NQ==
X-CSE-MsgGUID: i451rpc6QTOrLdCEE2BhJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="260925175"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 10:30:35 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v11 0/7] drm/xe/xe_sysctrl: Add system controller component
 for Xe3p dGPU platforms
Date: Thu, 19 Mar 2026 10:30:30 -0700
Message-ID: <20260319173031.1320708-9-anoop.c.vijay@intel.com>
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

v11: (Umesh, Badal)
- Improve struct member spacing for readability
- Updated System Controller ABI doc
- Remove explicit SoC remapper disable on suspend
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
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       |  65 +++
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pm.c                    |  11 +
 drivers/gpu/drm/xe/xe_sysctrl.c               | 128 ++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  23 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 369 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  31 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  40 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  32 ++
 14 files changed, 751 insertions(+)
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

