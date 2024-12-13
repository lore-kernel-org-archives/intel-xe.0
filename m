Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5909AE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 07:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D07C10E113;
	Fri, 13 Dec 2024 07:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ouc+TJwx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C4B10E113
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 07:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734074761; x=1765610761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EYsGRyJwS89gQoDJG4kbbSsGs6e9rOsEoqEACkxEMII=;
 b=Ouc+TJwxD4wxmG/eFjdm/raNTMw7gg7Ag7u7O6/xKrJAKG9dIlzz0lEs
 H+Ssv+pqpGGVrjK+BeYIJ4FFQ8KThHlFG503uZsqTF8D9WabHEhIc0hns
 bypvVnp4a6lCaESWs5Tn9kja2s3bg0kqNFPfAvQWtGLwXUfcfuC85vQh5
 Mu9yPqqGb2HkwL1m7WDsfdii7iBsNedNT5oZlKbL0t3C4l9cbqGRCd2pc
 07PzY10Jeu2999mzBR0WexvYGh68ZtbI+oGd1KGVkCNJxQvIeP1M5kXwX
 07rotfLNLWBGPNWa/eHwpfJazR1+tkucVDIT4ZTYEBP7V+X9YRI3ilFWx A==;
X-CSE-ConnectionGUID: u1migKX3Rb2SdJMlIrwwIg==
X-CSE-MsgGUID: Q9qsHDN5TQSvLX53vWvR8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="38299845"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="38299845"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 23:26:00 -0800
X-CSE-ConnectionGUID: /yPH2L73RUu1W86LiVk1Cw==
X-CSE-MsgGUID: UU1mZArySZWcInIXJbCMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97252412"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.160.81])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 23:26:00 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com
Subject: [PATCH v6 0/4] MSI-X support
Date: Fri, 13 Dec 2024 09:25:34 +0200
Message-Id: <20241213072538.6823-1-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128125345.1115-1-ilia.levi@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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


This patch set introduces MSI-X workflow.
This is a rework of previously published series 135422
(https://patchwork.freedesktop.org/series/135422/) and a continuation
of series 140877 (https://patchwork.freedesktop.org/series/140877/).

It includes:
1. Basic MSI-X workflow with GuC-to-host and "default MSI-X"
   interrupt handlers.
2. MSI-X interrupts allocator to allow dynamic resource management.
3. uAPI flag to xe_exec_queue_create_ioctl that allows creating
   an exec queue with its own MSI-X interrupt.


v2: Rebase + fix kernel doc issue
v3: Rebase + fix sriov_basic test failure
v4: Another attempt to fix sriov flows
v5:
 - Rebase
 - Optimize irq.enabled access (additional patch)
 - Check irq.enabled in new IRQ handlers
 - Code review comments (Piotr)
v6:
 - Rebase
 - Remove merged patch
 - Cosmetic fix (Piotr)


Dani Liberman (1):
  drm/xe/uapi: Support requesting unique MSI-X for exec queue

Ilia Levi (3):
  drm/xe/irq: Separate MSI and MSI-X flows
  drm/xe: Initial MSI-X support for HW engines
  drm/xe/irq: Manage MSI-X interrupts allocation

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
 drivers/gpu/drm/xe/xe_device.c           |   4 +-
 drivers/gpu/drm/xe/xe_device.h           |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h     |   8 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |  59 +++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   4 +
 drivers/gpu/drm/xe/xe_execlist.c         |  10 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |   7 +-
 drivers/gpu/drm/xe/xe_irq.c              | 331 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_irq.h              |   9 +
 drivers/gpu/drm/xe/xe_lrc.c              |  24 +-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 include/uapi/drm/xe_drm.h                |   8 +-
 14 files changed, 423 insertions(+), 52 deletions(-)

-- 
2.43.2

