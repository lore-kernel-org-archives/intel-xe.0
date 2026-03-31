Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22D5FF60FB
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 10:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD9710E9EA;
	Tue, 31 Mar 2026 10:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEZ8T2xl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4CC10E9EA
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774952840; x=1806488840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wfncumLUi0/x7FmG1+8M4E3KQ8hXOl5cj3gP27o8KrA=;
 b=TEZ8T2xlXu4/u8oapDATNq4zgXAygfbVyLi8Rrqp5kcm46Jz3QxhCHmC
 E8/korIUCpl1UQeqCzvfRT0rRNEm6YmDcPsMgCbJfz2A/D7herUUg1KnE
 FctgiZc9qXS2IVAMLkZEutbVBvKDXk/24wtauLpaNNnz7Lw1ubzQ4hQ39
 Pt1Q76+EiThenAY66jAcB7q3ASB8k3QfSEGtty8guxbDXCcsN/xnDewdV
 oUggaZvZ4kdjAVfxdZvr+HGalI20ZevNz/WY6PwaN7XfZ27QOzors6Is5
 OfWXk3i0sypkbW3GG7qJKbiZAdmHMXUsAR+GWueBgYEuL2TFxh3Inw5JY g==;
X-CSE-ConnectionGUID: xY6jHQ4oTJe/OnENGVujnA==
X-CSE-MsgGUID: qx6qBRegQMK/dvBk9U3EoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86655528"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="86655528"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 03:27:20 -0700
X-CSE-ConnectionGUID: XWUPy5PkSym4CFEqN2Leug==
X-CSE-MsgGUID: MNxJIsVMSAqyPMOfp3WdCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="226576941"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 31 Mar 2026 03:27:16 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 0/3] Introduce Xe Correctable Error Handling
Date: Tue, 31 Mar 2026 15:53:42 +0530
Message-ID: <20260331102346.1034100-1-raag.jadav@intel.com>
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

v4: Handle IRQ before sysctrl initialization (Mallesh)
    Fix Severity/Component logging (Mallesh)
    s/xe_ras_error/xe_ras_error_class (Riana)

Raag Jadav (3):
  drm/xe/sysctrl: Add system controller interrupt handler
  drm/xe/sysctrl: Add system controller event support
  drm/xe/ras: Introduce correctable error handling

 drivers/gpu/drm/xe/Makefile                 |  2 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h       |  1 +
 drivers/gpu/drm/xe/xe_irq.c                 |  2 +
 drivers/gpu/drm/xe/xe_ras.c                 | 90 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                 | 14 ++++
 drivers/gpu/drm/xe/xe_ras_types.h           | 73 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.c             | 46 +++++++++--
 drivers/gpu/drm/xe/xe_sysctrl.h             |  2 +
 drivers/gpu/drm/xe/xe_sysctrl_event.c       | 89 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h | 52 ++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h     | 10 +++
 drivers/gpu/drm/xe/xe_sysctrl_types.h       |  7 ++
 12 files changed, 382 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h

-- 
2.43.0

