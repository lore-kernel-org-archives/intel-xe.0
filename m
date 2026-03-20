Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038CB1093181
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 07:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F15810E00D;
	Fri, 20 Mar 2026 07:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aetwDhfe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F68310E00D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 07:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773991537; x=1805527537;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zX4xfX7L+wlMAfYKP7xAzPdVvnqirNlqa6p19EqZFTY=;
 b=aetwDhfeVc1tZmT4FlX1e7KxzM1pNX8r+AAtKkKtkzPhB3Lai5Skg9UE
 0I9Lv8IdeDvJX3ZYBWDy5vJDJl84rsAcMLmoLuIt2HaKTYeU9+jW6PkNl
 hbaX9WHHt5nwZHjdDXkg1xUlZHlZUc48KZLqC8J9IuHRJ8/Y1gwuT7I2h
 TSgq6HqT0uokofpGBCPF6JAXvl3VJ8fihmCYeF9gA749aa5fLdJ/y7GEK
 sDCqTz0lmtHRPzm/RFmfqeEyV34xb1gZCgyH4frkiGEhZNnWO2yTpmftq
 cNN+397Va1fmNEmCU6HhqqurXrCnJiRv7lep2OvA0+A3RdPDYft6HeWaa w==;
X-CSE-ConnectionGUID: EtJ8ISyVTYCpZEKQkb0hXA==
X-CSE-MsgGUID: D08L1I0kTHa72mdxK/wjVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62634646"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="62634646"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:25:36 -0700
X-CSE-ConnectionGUID: xTB3IVAPRwOGNmzg4x3DyA==
X-CSE-MsgGUID: 9eELHnueS62AKwp3nLGLSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227335832"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:25:32 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [RFC v1 0/5] drm/xe/fwctl: Add FWCTL interface for Xe firmware
 management
Date: Fri, 20 Mar 2026 00:25:28 -0700
Message-ID: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
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

This series builds on top of System Controller series[1] and adds FWCTL
framework support for System Controller firmware access on Intel Xe discrete
GPUs.

Patches introduce generic FWCTL infrastructure with pluggable firmware
backend support, implementing initial System Controller backend to enable
userspace firmware management through standard FWCTL device interfaces.

Key features introduced:
- Generic xe_fw_ops interface for firmware backend implementations
- FWCTL device registration and ioctl handlers (info, rpc)
- System Controller FWCTL backend with scope validation and RPC execution
- Userspace-accessible firmware RPCs through /dev/fwctl/fwctl<N>

[1] https://patchwork.freedesktop.org/series/163196/

Anoop Vijay (5):
  drm/xe/xe_sysctrl: Add System Controller support
  drm/xe/fwctl: Add uAPI definitions for Xe FWCTL support
  drm/xe/fwctl: Add Xe FWCTL type definitions
  drm/xe/fwctl: Add Xe FWCTL infrastructure support
  drm/xe/fwctl: Add System Controller FWCTL RPC handler

 Documentation/userspace-api/fwctl/index.rst   |   1 +
 drivers/gpu/drm/xe/Kconfig                    |   1 +
 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       |  94 ++++
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_device.c                |  10 +
 drivers/gpu/drm/xe/xe_device_types.h          |  10 +
 drivers/gpu/drm/xe/xe_fwctl.c                 | 206 +++++++++
 drivers/gpu/drm/xe/xe_fwctl.h                 |  15 +
 drivers/gpu/drm/xe/xe_fwctl_types.h           |  52 +++
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pm.c                    |  11 +
 drivers/gpu/drm/xe/xe_sysctrl.c               | 128 ++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  23 +
 drivers/gpu/drm/xe/xe_sysctrl_fwctl.c         | 136 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 400 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  33 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  40 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  32 ++
 include/uapi/fwctl/fwctl.h                    |   1 +
 include/uapi/fwctl/xe.h                       |  65 +++
 22 files changed, 1301 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_fwctl.c
 create mode 100644 drivers/gpu/drm/xe/xe_fwctl.h
 create mode 100644 drivers/gpu/drm/xe/xe_fwctl_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
 create mode 100644 include/uapi/fwctl/xe.h

-- 
2.43.0

