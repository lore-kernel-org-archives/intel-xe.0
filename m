Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A60106B50C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 12:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0E910E1DD;
	Wed, 25 Mar 2026 12:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+ytO395";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B2E10E1DD
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774440038; x=1805976038;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4g0GBmWYmatdMs472yrUYpQ6N/pDk+E6GtofONKWuxA=;
 b=f+ytO395JSaKr55zHfI2hj5OlJ6MT1fJZ5M/ruzxlv6n5b/kkPicsB6B
 oSKz0mR7ks9zmYY+jWAGvegl5ClEw+TZQawu0I4RZ1S8khF9Ma8Uo1F2f
 vA2QjMx+ZJCe6jKd3D8caXqSAHKw2tM1tQ/1EF5Itq0PNj8lYoRIRotDo
 p/yj6/lgllVhKJOmUsJ2FumMJyEmcYTJGtgpOt3Z1oFvgWDF6FZ7iE0U7
 3WCAHALjMlzULpFYNKW2ALGeA8hBjsZGlego+txC0oEIXm+TloUpeOFaI
 E72EzNcB+NNlLbYE63WKNR1Mp4UmNBZWrXjsQv/lORAZAR8H5Ge06JMvE g==;
X-CSE-ConnectionGUID: GXhhX2AdQbGw/wEbcuE58g==
X-CSE-MsgGUID: wf2lmQofRiuf/yQheNICaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="98094647"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="98094647"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:00:37 -0700
X-CSE-ConnectionGUID: A0oEs81qR2qFzlUfnPSoiw==
X-CSE-MsgGUID: zgHu3QVzSKG8jiXYmSkckg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="218087279"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:00:34 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v12 0/7] drm/xe/xe_sysctrl: Add system controller component
 for Xe3p dGPU platforms
Date: Wed, 25 Mar 2026 05:00:27 -0700
Message-ID: <20260325120030.510480-9-anoop.c.vijay@intel.com>
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
https://patchwork.freedesktop.org/series/163562/
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

v12: (Badal)
- Drop empty sysctrl suspend handler
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
 drivers/gpu/drm/xe/xe_pm.c                    |   6 +
 drivers/gpu/drm/xe/xe_sysctrl.c               | 106 +++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  22 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 369 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  31 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  40 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  32 ++
 14 files changed, 723 insertions(+)
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

