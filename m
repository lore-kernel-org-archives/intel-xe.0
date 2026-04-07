Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CDEEDB7FD
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 11:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F8E10E3ED;
	Tue,  7 Apr 2026 11:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHkSX6na";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F81E10E3ED
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 11:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775560149; x=1807096149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eXIdDAXH1aD709pIFuVZFUugeYceV5Pybl8u1T1v58U=;
 b=MHkSX6naL4yvz8AfLdHrCBsDCOOjOnQJAHVufk8ednVSKDJSM4m4w4PN
 bSy1kFbcrXbz6YyegdJXrk0+PN3mCBuKf1DAR+XHPDOZQZeaT+atVKVS7
 7njn6MQwQz2Qi+LlR1OxwBZwdIZf+gs/uuPvApG9CkPl+ymGXQoai8FJT
 Xk4ndObHeClFxTW0E18+d/YP6OAPwFFA79/8YVyTi7Qy2DnFCQuD0LWNm
 UFzWAi1DkiBh67zUNoboKH7W13pQOkj51uqpTO2Bz8nVAjILCuZ+ItzL+
 oyAPIFfTOITEsMj6+aq97zYyZNX8bIeiXil+vbfeLUEfbLXTbt/8S9NJi g==;
X-CSE-ConnectionGUID: wf83U3apQBeUq9ZL+x/DfQ==
X-CSE-MsgGUID: bmg1IKMPRkSLvx/LMPCrVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="94100373"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="94100373"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 04:09:09 -0700
X-CSE-ConnectionGUID: 2QVuIq7ETvy+z7YelubRrA==
X-CSE-MsgGUID: l9ogyhqJTPGTBhSWTzXOPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228045841"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 07 Apr 2026 04:09:06 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 0/3] Introduce Xe Correctable Error Handling
Date: Tue,  7 Apr 2026 16:36:26 +0530
Message-ID: <20260407110629.198158-1-raag.jadav@intel.com>
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

Raag Jadav (3):
  drm/xe/sysctrl: Add system controller interrupt handler
  drm/xe/sysctrl: Add system controller event support
  drm/xe/ras: Introduce correctable error handling

 drivers/gpu/drm/xe/Makefile                 |  2 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h       |  1 +
 drivers/gpu/drm/xe/xe_irq.c                 |  2 +
 drivers/gpu/drm/xe/xe_ras.c                 | 96 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                 | 14 +++
 drivers/gpu/drm/xe/xe_ras_types.h           | 73 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.c             | 46 ++++++++--
 drivers/gpu/drm/xe/xe_sysctrl.h             |  2 +
 drivers/gpu/drm/xe/xe_sysctrl_event.c       | 89 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h | 52 +++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h     | 10 +++
 drivers/gpu/drm/xe/xe_sysctrl_types.h       |  7 ++
 12 files changed, 388 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h

-- 
2.43.0

