Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A7EEF48CC
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 08:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D717410E2E8;
	Fri, 13 Feb 2026 08:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkhTrozS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E952010E2E8
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 08:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770970728; x=1802506728;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c2KBAuXml9G3HPRzQLqoqoRCP9k+Y6v7/cMGnw9Ut9Y=;
 b=nkhTrozSuzoPADVx/NHhKEUSELC5T8JxCaFnnI+HYTPD6tuDdRG3AVEV
 y0yeEN1dcqnf0Kb8e9ieRSlysGtR0xmWpc0RnJ10AdkV7RaNnDpEleIwW
 7hoAZ/k7zOAHdKzrevgWl1UEH+eea6cIdd4r8YgBkJchnvgIo5Spabdvw
 9UyrlNaziTpddnKH2dYfWsyc8Saa0xUBrN5ug/oonl6VWxqPY2kbQc6Vk
 f1qjnwS6onSFNaGpYJ3BYzpGhnpFrpJmirxMR3ZBoYcpLY6QUpXPmoNpB
 wF2Q4p2+fxPdcNlET5aAfsVPCB9n3eh5NlnCh7fBqJsRAvkaX4Nl4NGzg w==;
X-CSE-ConnectionGUID: bwr99irYQdKVhD/JLBd7YA==
X-CSE-MsgGUID: pZwNLMxBQ9+TMBwYaKuZfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83522670"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="83522670"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:18:48 -0800
X-CSE-ConnectionGUID: kyKmzuaFSpSUCGhuulcTXw==
X-CSE-MsgGUID: GJKA2ClZTKG8m8E/S9rxrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212696752"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 13 Feb 2026 00:18:45 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/4] Introduce Xe Correctable Error Handling
Date: Fri, 13 Feb 2026 13:45:58 +0530
Message-ID: <20260213081644.2085314-1-raag.jadav@intel.com>
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

Anoop Vijay (1):
  drm/xe/sysctrl: Add System Controller

Raag Jadav (3):
  drm/xe/sysctrl: Add system controller interrupt handler
  drm/xe/sysctrl: Add system controller event support
  drm/xe/ras: Introduce correctable error handling

 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h         |   1 +
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_irq.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   |  87 ++++
 drivers/gpu/drm/xe/xe_ras.h                   |  14 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  79 ++++
 drivers/gpu/drm/xe/xe_sysctrl.c               | 110 +++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  17 +
 drivers/gpu/drm/xe/xe_sysctrl_event.c         |  77 ++++
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h   |  49 +++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 390 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  45 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  42 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  40 ++
 19 files changed, 1007 insertions(+)
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

