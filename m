Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E876FA3728
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jan 2026 16:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B74E10E0A9;
	Fri,  2 Jan 2026 16:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DP/QQdRE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9143710E0A9
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jan 2026 16:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767372907; x=1798908907;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YXXk8W8woWO9+4zzd6LKkBwUw4mV9d2d9zKFnuTwve8=;
 b=DP/QQdREY3b5uezOiJMJMq7rfCnx7IHMW+0VpuUmcmjxpN+axZikEtKL
 VgWhe9/rg2XKLRBGv4alAFxd58KWYJTwjNK1p/PoegqJ4Jbug64jHS6Do
 G1JDsHuUBcpAETdbreMyzkMJ4+fvEjMl7fgz3roI30rAtRseTtW5KNMvx
 Yi73PTWd11jyA3QOSDYGOQBUtePsOoMeUZV6x0YJAPU6cClYg02RvCe/D
 cXslkkfhO4LLuuhAF0d85UsflwYyvtKws5ufzqRPbKJ7ogRkyjzGU7Eig
 DIY3gRHRbzNKSKCMi1gsZv6e5S49xZQMPE+tOhWxVEa4FYVGe6AcJXG7/ Q==;
X-CSE-ConnectionGUID: lIlb9mGPTZ6fgOfzFV/NcQ==
X-CSE-MsgGUID: BLQFvdmpRtGW2RZZ5nlCwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="86285038"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; d="scan'208";a="86285038"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 08:55:06 -0800
X-CSE-ConnectionGUID: j8hjCubmThiAAA/E1meGVw==
X-CSE-MsgGUID: xN/SRUKmTIGYkOxCP32myg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; d="scan'208";a="201732004"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 08:55:02 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, ravi.kishore.koppuravuri@intel.com,
 anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com
Subject: [PATCH v2 0/1] drm/xe/sysctrl: Add system controller component for
 Xe3p dGPU platforms
Date: Fri,  2 Jan 2026 08:54:49 -0800
Message-ID: <20260102165450.561614-3-anoop.c.vijay@intel.com>
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

This patch introduces System Controller (sysctrl) component for Intel Xe3p dGPU platforms.

This component provides the foundational infrastructure for communication
with the System Controller firmware using MKHI protocol over a mailbox interface.

Key features introduced:
- Detection and initialization of System Controller interface on Xe3p dGPU platforms
- Mailbox communication with System Controller firmware
- Fragmented message transfer for large command payloads

This implementation establishes the base for future System Controller feature
enablement and firmware command handling.

Changes in v2:
- General code cleanup and improved inline documentation.
- Rebased on latest upstream branch.
- Addressed all warnings and kernel coding style issues reported in v1 patch.
- Improved function parameter alignment and line wrapping.
- Updated macro definitions in header files to avoid long lines.
- Updated variable and parameter names for better readability.

Anoop Vijay (1):
  drm/xe/sysctrl: Add system controller component for Xe3p dGPU
    platforms

 drivers/gpu/drm/xe/Makefile               |   2 +
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h |  44 +++
 drivers/gpu/drm/xe/xe_device.c            |   5 +
 drivers/gpu/drm/xe/xe_device_types.h      |   6 +
 drivers/gpu/drm/xe/xe_pci.c               |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h         |   1 +
 drivers/gpu/drm/xe/xe_sysctrl.c           |  62 ++++
 drivers/gpu/drm/xe/xe_sysctrl.h           |  18 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c   | 409 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h   |  77 ++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h     |  23 ++
 11 files changed, 649 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

-- 
2.43.0

