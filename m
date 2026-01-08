Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE119D185E8
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 12:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710C210E293;
	Thu,  8 Jan 2026 12:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8Kf66rF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC7C10E293
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 12:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767874002; x=1799410002;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uVddouHbUOaR9tbbZ8G/IGv2OZUFJnfpTHb4adXAvyY=;
 b=A8Kf66rFguMvgz6we+nG6d8JZjZiPqOyCCC97WUSFBpq+XaO1kb+wbw9
 IXFN7tsbmyNvba3kGNrKaBluOO+OCKdaIosl2gCaefvOXlqP5yTNbK3OE
 vPOooN0U1kreVB2f6eTKQWMxwNZrChqgK7oNEHDxdLljN2wNXEryr751H
 dKtI1MgWR9W9D7MywJ+K+Byuu6SXiOq0AYVWuCloK29RhWDFAOBd8OF4p
 3Rfo6xJKFi+xZEZ11PFHnQeyEO8JvRH4V1z4UEiZF+PwjpKHDggpT9Ab2
 TLAiIlb0nhyWggGf/eYziLaLmmcIu7f/BQ1lUDjTdi26voS8G8s2vJFF8 g==;
X-CSE-ConnectionGUID: UJx1OupDTaq2RWukYv/VUQ==
X-CSE-MsgGUID: r4vToqBXSCeD7dJCjvbWVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86839531"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="86839531"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:06:42 -0800
X-CSE-ConnectionGUID: SQYlb0xoTBqxz2HotOeXWg==
X-CSE-MsgGUID: DJiUh28rQ5iGOl4S/Yo19A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="203463923"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:06:38 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v3 0/6] drm/xe/sysctrl: Add system controller component for
 Xe3p dGPU platforms
Date: Thu,  8 Jan 2026 04:05:48 -0800
Message-ID: <20260108120548.1015154-8-anoop.c.vijay@intel.com>
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
---

Anoop Vijay (6):
  drm/xe/sysctrl: Add System Controller register definitions
  drm/xe/sysctrl: Add System Controller types and structures
  drm/xe/sysctrl: Add System Controller mailbox implementation
  drm/xe/sysctrl: Add System Controller initialization
  drm/xe/sysctrl: Integrate System Controller into device
  drm/xe/sysctrl: Enable System Controller for Xe3p

 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  44 ++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_sysctrl.c               |  70 +++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  13 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 429 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  35 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  36 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  23 +
 12 files changed, 666 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

-- 
2.43.0

