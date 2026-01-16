Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB07ED4A61D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 09:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E00B10E843;
	Fri, 16 Jan 2026 09:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTnJAAom";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC7A10E840
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768556207; x=1800092207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EXP/3ih+AZnRR7+jd8l9I4jcG/a9Uufl5XGno73rsLU=;
 b=cTnJAAombaww5aagkmzGOWmWgJLKgdbQ4bQwKVtTM4xBivdm2y0IDEYo
 hCLOM1J0yAPE/7u1gaVkVIt2o7WN56EjYFNsiq1OXBb9xsWZiyM6CKM/Q
 k5TMvAzFgdtnciIGZ+xIwEt5OSwbRGY53gc+zDdRMg8Q7i++zYr1bJvBn
 gqYJXzv91H7OH1RPogkzk83fWHOjDE+y4ok45D8COovpIvAfQ+KBvGzRF
 SfLgVGwZ/B0hk4CpuiBVBOiErEJ0v7iqzyXsAS1UToOMXcyc9bf7j3X0y
 tHY5JA4z+ro1mvQlLU/hybN33AvS16Qm2k9pLHZtPkcjuqjtaz6j7Y0FN w==;
X-CSE-ConnectionGUID: LkjO6VReS+62B1Xcx7p/uQ==
X-CSE-MsgGUID: EiY+TDYwQ0qvlOx4/5rGAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80174984"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="80174984"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 01:36:47 -0800
X-CSE-ConnectionGUID: HAY66WYgTDy/6Mju9VI1nA==
X-CSE-MsgGUID: 6p6UOsvSR5qWEvCoXjLHtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="205619587"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2026 01:36:45 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, umesh.nerlige.ramappa@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/4] Introduce Xe Correctable Error Handling
Date: Fri, 16 Jan 2026 15:03:29 +0530
Message-ID: <20260116093432.914040-1-raag.jadav@intel.com>
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

Anoop Vijay (1):
  drm/xe/sysctrl: Add System Controller

Raag Jadav (3):
  drm/xe/sysctrl: Add system controller interrupt handler
  drm/xe/sysctrl: Add system controller event support
  drm/xe/ras: Introduce correctable error handling

 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h         |   1 +
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  44 ++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_irq.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   |  86 ++++
 drivers/gpu/drm/xe/xe_ras.h                   |  14 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  79 ++++
 drivers/gpu/drm/xe/xe_sysctrl.c               | 116 +++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  17 +
 drivers/gpu/drm/xe/xe_sysctrl_event.c         |  78 ++++
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h   |  49 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 429 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  45 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  36 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  30 ++
 19 files changed, 1044 insertions(+)
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

