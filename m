Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075A5FED2F7
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 09:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A083810E352;
	Thu, 12 Mar 2026 09:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsLFZW1u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BCF10E352
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 09:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773306577; x=1804842577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BIhgrsuIWJWF+ofqT03SgwYVkYvLi4PZ20c8zmtLKu4=;
 b=KsLFZW1ugzUhFd3uBYrVFAM4RE/OSqkvRmAaNg/2W1WeLgwevONgYtx2
 zhA1udUF+nYmSjMGwYfq/Odx05e7cyVBufGpaEf+KhB7NHsV9zGmvlcTr
 NzKeTnZTonUMMPWG5AuTsNnjt395E27qt+Z710vOrO+d+hb/K4vT9F66g
 H07zhXWkhtV4tA0ESpw9VjXOjCcDrLWw/XEk9oWJd3/iCzXyKiE020iIt
 fEVWQuaXamtvjP5ivyVyP82kqsD53DtSrglYmv5jKWSq+qk4LlVDcGFxj
 ffN68dxPxtyv5pnttidHvGVWSy6ISVZ87J3o0aeiqEifVG2Rpmmi5hUig w==;
X-CSE-ConnectionGUID: 872KsRnyQv2vtp+BsFI8vg==
X-CSE-MsgGUID: fEWQQWmdTIi+6+mpzardvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77994746"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="77994746"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 02:09:37 -0700
X-CSE-ConnectionGUID: /4dkiHe5T+W1lHmXz9MGDw==
X-CSE-MsgGUID: yOUwViu0TR+PQWHyYphlkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220815062"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 12 Mar 2026 02:09:34 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 0/4] Introduce Xe Correctable Error Handling
Date: Thu, 12 Mar 2026 14:36:53 +0530
Message-ID: <20260312090657.4026013-1-raag.jadav@intel.com>
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

This series builds on top of system controller series[1] and adds initial
support for correctable error handling in xe. This serves as a foundation
for RAS infrastructure and will be further extended to facilitate other
RAS features.

Detailed description in commit message.

[1] https://patchwork.freedesktop.org/series/159554/

v2: Use system_percpu_wq instead of dedicated (Matthew Brost)
    Handle unexpected response length (Mallesh)

v3: Handle event flood (Mallesh)

Anoop Vijay (1):
  drm/xe/sysctrl: Add System Controller

Raag Jadav (3):
  drm/xe/sysctrl: Add system controller interrupt handler
  drm/xe/sysctrl: Add system controller event support
  drm/xe/ras: Introduce correctable error handling

 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       |  31 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h         |   1 +
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_irq.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   |  89 +++++
 drivers/gpu/drm/xe/xe_ras.h                   |  14 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  73 ++++
 drivers/gpu/drm/xe/xe_sysctrl.c               | 113 ++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  23 ++
 drivers/gpu/drm/xe/xe_sysctrl_event.c         |  83 ++++
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h   |  52 +++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 364 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  41 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  35 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  39 ++
 20 files changed, 1014 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

-- 
2.43.0

