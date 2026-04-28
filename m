Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04B9FF886F
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 05:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED5210E2F1;
	Tue, 28 Apr 2026 05:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgPOMgoS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F2B10E2F1
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 05:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777355483; x=1808891483;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wJxBIuhWo3euJZUlwgyHbN2gPBMxBmtB2NLO1nW4q28=;
 b=JgPOMgoS7VpeqcuYMMaU8KbEGur+LXZZ/28J2+BSzxUBSxo5LGZF6n68
 VKUPNTBAk4723yrFwHRa9GjrZlp9SNDdSNJ9p88PvhZLHdchKbkhiznsu
 MfdbS6gpA9TFaL5pXEGCcPM9hOayC1g9yGKPgi7utlQA0WUZFMdGN/mGe
 gzVhP7SC8eR3Dm8P7KKLzuhzNbe794yXmWE+ACLHtPI6R7fptDIZab2ac
 0fle+YIvowTjNG0oDfxmGwEjz6THujD4bmt8vDi/M6J+hX3+1DBbjsNY0
 8baGlWz86PEY3DP5EOLecOgWH1fRDlLQI0Zh6BhDjpHnL+VEkHNzRRwWm g==;
X-CSE-ConnectionGUID: KI9JAdgpQL2GvYFSnNAPaQ==
X-CSE-MsgGUID: /osh0OXgRg2iXdNjcEMrrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82119227"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="82119227"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 22:51:22 -0700
X-CSE-ConnectionGUID: hbpe6OvRTB60yAzQ76IcPg==
X-CSE-MsgGUID: L5ol+PgdSbOw/vbFQZ+7CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="271978567"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 27 Apr 2026 22:51:19 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 0/3] Introduce Xe Correctable Error Handling
Date: Tue, 28 Apr 2026 11:18:23 +0530
Message-ID: <20260428054826.1202076-1-raag.jadav@intel.com>
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

[1] https://patchwork.freedesktop.org/series/163196/

v2: Use system_percpu_wq instead of dedicated (Matthew Brost)
    Handle unexpected response length (Mallesh)

v3: Handle event flood (Mallesh)

v4: Handle IRQ before sysctrl initialization (Mallesh)
    Fix Severity/Component logging (Mallesh)
    s/xe_ras_error/xe_ras_error_class (Riana)

v5: Handle unexpected counter threshold crossed (Mallesh)

v6: Drop unused xe_device parameter (Mallesh)
    Fix unexpected counter threshold logic (Mallesh)
    Introduce work_lock in the patch it is used in (Riana)
    Drop xe prefix from static functions (Riana)
    Don't fail on unexpected event (Riana)
    Move sysctrl commands to xe_sysctrl_mailbox_types.h (Riana)
    Add kernel doc (Riana)
    Use xe_device parameter for xe_ras functions (Riana)
    Shorten dmesg logging (Riana)
    s/xe_ras_threshold_crossed_data/xe_ras_threshold_crossed (Riana)

v7: Use consistent error logs (Riana)
    s/reserved2/reserved1 (Riana)
    Update event count kdoc (Riana)

Raag Jadav (3):
  drm/xe/sysctrl: Add system controller interrupt handler
  drm/xe/sysctrl: Add system controller event support
  drm/xe/ras: Introduce correctable error handling

 drivers/gpu/drm/xe/Makefile                   |  2 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h         |  1 +
 drivers/gpu/drm/xe/xe_irq.c                   |  2 +
 drivers/gpu/drm/xe/xe_ras.c                   | 93 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   | 15 +++
 drivers/gpu/drm/xe/xe_ras_types.h             | 73 +++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.c               | 45 +++++++--
 drivers/gpu/drm/xe/xe_sysctrl.h               |  2 +
 drivers/gpu/drm/xe/xe_sysctrl_event.c         | 88 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 57 ++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 18 ++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  7 ++
 12 files changed, 396 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h

-- 
2.43.0

