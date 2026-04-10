Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39100E99076
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 10:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FBA10E92C;
	Fri, 10 Apr 2026 10:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1yQp+4h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1798310E92C
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Apr 2026 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775817052; x=1807353052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kgCBXAMzOIueiC0QLDlMGusWnPrdoUVKA2cAWqcBOXo=;
 b=X1yQp+4h/Hn+oqcpGP8FRJU0FbRMzKBIE7IVL2Yba6V2jxgj3EN8Ddpd
 mttGkHkH//bjTe1y1+T0I2Ev54RTS+s9VBIAntzASMHp+QwvXKkQ9PHea
 WRzWmtMnRUczZYse6QOcr+JGgR8/J7MMBwXPap3AedBo2FnebbUM55Hrb
 dlpc/4xXPGXvIfywmvNcj2u8nCTPzFuelnbGqKwyRN5q7703AaYUbEF2N
 DecyZvPT6pkPkzOCTBbReE/5QEsR1IMV7a3EGVjohhQzFeKWRhbNqurR7
 RkLPUKgXM3v6inaDVNSd8Vi59AJjZiCGDuAJKqSTCleq8/42R/vcuriTh A==;
X-CSE-ConnectionGUID: KFSUJBjgQGe0kMSEdGPdLA==
X-CSE-MsgGUID: 3Etj+1WrR5uCsHu+6dO5ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76724432"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76724432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 03:30:51 -0700
X-CSE-ConnectionGUID: IOUHdhtETkKO9FgiAKrXGQ==
X-CSE-MsgGUID: bbXvOg70R4Ww5XGDcEZjGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="226331224"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2026 03:30:48 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 0/3] Introduce Xe Correctable Error Handling
Date: Fri, 10 Apr 2026 15:57:41 +0530
Message-ID: <20260410102744.427150-1-raag.jadav@intel.com>
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

Raag Jadav (3):
  drm/xe/sysctrl: Add system controller interrupt handler
  drm/xe/sysctrl: Add system controller event support
  drm/xe/ras: Introduce correctable error handling

 drivers/gpu/drm/xe/Makefile                   |  2 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h         |  1 +
 drivers/gpu/drm/xe/xe_irq.c                   |  2 +
 drivers/gpu/drm/xe/xe_ras.c                   | 92 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   | 15 +++
 drivers/gpu/drm/xe/xe_ras_types.h             | 73 +++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.c               | 46 ++++++++--
 drivers/gpu/drm/xe/xe_sysctrl.h               |  2 +
 drivers/gpu/drm/xe/xe_sysctrl_event.c         | 85 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 57 ++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 18 ++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  7 ++
 12 files changed, 393 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h

-- 
2.43.0

