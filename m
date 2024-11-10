Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB03D12D4F
	for <intel-xe@archiver.kernel.org>; Sun, 10 Nov 2024 20:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E1610E3C7;
	Sun, 10 Nov 2024 20:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dT1v8X3W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D5610E3D6
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Nov 2024 20:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731271166; x=1762807166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3n+FoJcxsOtyXM21VgxgwnX3a678EPQhvTSIjlNYmU4=;
 b=dT1v8X3WHGNMZr3Vp8pH3EE+KTTmZmJGIPK1Rl19YqsKHIKF8Fvfntrj
 vDwcIAiWJCu6Vzs0ERNIDrWsVJWBPavnzzja6r0OiAKZMwreUVXYb9RxP
 uC+u4SpRlnT+9zwmHFJ+tvnkIpI/TyjxC7vq5zhCg8AQv+IOisBWSlUc8
 ftD58JoGmx1YkaydLCfmap1jfeSljwiq+L/WE6miBa12q8nVzwwLwGnSr
 fm4CVpqvJUDV5LD5GXD2YtOqCDBzNFjCMArYIQIvl3gFHxn/yXYVXbjXk
 7odI6ynkn1DVdzzAHL/80KQEGBsofmwUHGCFwByPZF6ZVYV9kqbBQN+Cu Q==;
X-CSE-ConnectionGUID: wi+bxsMiQ7SL8NIYmsmx8A==
X-CSE-MsgGUID: if/6RO3bSzydzdxl59VF0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="42479035"
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; d="scan'208";a="42479035"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 12:39:25 -0800
X-CSE-ConnectionGUID: fCj2lZAyRhaFTwG63Bw4+Q==
X-CSE-MsgGUID: QDMKLDNiRqyq+VXTiGnlbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; d="scan'208";a="124131125"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.200.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 12:39:23 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, niranjana.vishwanathapura@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v4 0/3] MSI-X support
Date: Sun, 10 Nov 2024 22:39:12 +0200
Message-Id: <20241110203915.729-1-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
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

This patch set introduces MSI-X workflow.
This is a rework of previously published series 135422
(https://patchwork.freedesktop.org/series/135422/).

It includes:
1. Basic MSI-X workflow with GuC-to-host and "default MSI-X"
   interrupt handlers.
2. MSI-X interrupts allocator to allow dynamic resource management.
3. uAPI flag to xe_exec_queue_create_ioctl that allows creating
   an exec queue with its own MSI-X interrupt.


v2: Rebase + fix kernel doc issue
v3: Rebase + fix sriov_basic test failure
v4: Another attempt to fix sriov flows

Dani Liberman (1):
  drm/xe/uapi: Support requesting unique MSI-X for exec queue

Ilia Levi (2):
  drm/xe: Initial MSI-X support for HW engines
  drm/xe: Manage MSI-X interrupts allocation

 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
 drivers/gpu/drm/xe/xe_device.c           |   4 +
 drivers/gpu/drm/xe/xe_device.h           |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h     |  12 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       |  59 ++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   4 +
 drivers/gpu/drm/xe/xe_execlist.c         |   9 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |   7 +-
 drivers/gpu/drm/xe/xe_irq.c              | 116 ++++++++----
 drivers/gpu/drm/xe/xe_irq.h              |   1 +
 drivers/gpu/drm/xe/xe_irq_msix.c         | 216 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_irq_msix.h         |  22 +++
 drivers/gpu/drm/xe/xe_lrc.c              |  24 ++-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 include/uapi/drm/xe_drm.h                |   8 +-
 17 files changed, 444 insertions(+), 50 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.c
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.h

-- 
2.43.2

