Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CF5D1BDF3
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 20:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E6710E4C5;
	Mon,  4 Nov 2024 20:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hrHe6UqC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A8010E4C5
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 20:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730753782; x=1762289782;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lBfweG1MPJ9XWCe5Md1zNxCRD4p3XUdGN4Qf5rH1XSU=;
 b=hrHe6UqC7s/30M5EfS8cx6AssnVV9S8uYXiZOcUYAE3ZXdgx5dc3PpxP
 H3L4luLFchcz8/2d2C+TChvRtsyNwTYTdj0juWty7WBXCV0rT9Ho3g0Xx
 BYAi8G1sWhhC/bMldQwDs1bNmp6hGBPTfoJKzjDpSvO1Rl/bnA1ur5sav
 Chf6Nb+1d3FKpuyi7hfP7auPpwX/atbWE2j3iC5Ok4Sjy2EZRVBca1cBq
 mVllfO80bfpdjsfUKf0+7Z53k+vtJUmSbR6MhhHE+L1oqS2OGYeRl9SAj
 A3MEIFOgDwOYE9vNKA27WJGmBLKHvRPNE1Gr1pInCrG+P/3bB8D+5Y1UR A==;
X-CSE-ConnectionGUID: UuEGN1v4RqeNmHVE6rrb6w==
X-CSE-MsgGUID: S3vLezXcTsWMzVSavHzojQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30635336"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30635336"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 12:56:22 -0800
X-CSE-ConnectionGUID: oc8HZcHiTPiFRkQjvupezw==
X-CSE-MsgGUID: q9948ZVbRyWtXOIpagiUCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="88525439"
Received: from ilevi-mobl.ger.corp.intel.com ([10.245.146.70])
 by orviesa003.jf.intel.com with ESMTP; 04 Nov 2024 12:56:21 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, niranjana.vishwanathapura@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH 0/3] MSI-X support
Date: Mon,  4 Nov 2024 22:56:14 +0200
Message-ID: <20241104205619.1410-1-ilia.levi@intel.com>
X-Mailer: git-send-email 2.47.0.windows.2
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
 drivers/gpu/drm/xe/xe_irq.c              | 119 +++++++++----
 drivers/gpu/drm/xe/xe_irq.h              |   1 +
 drivers/gpu/drm/xe/xe_irq_msix.c         | 216 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_irq_msix.h         |  22 +++
 drivers/gpu/drm/xe/xe_lrc.c              |  23 ++-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 include/uapi/drm/xe_drm.h                |   8 +-
 17 files changed, 443 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.c
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.h

-- 
2.43.2

