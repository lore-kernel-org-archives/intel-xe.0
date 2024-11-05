Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC1BD12663
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 09:24:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DD610E545;
	Tue,  5 Nov 2024 09:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Na3QmxXg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7CF10E545
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730798664; x=1762334664;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WKFcZTBw4pN6Ln6M/U+YTUyQ3oEwo8PaICeNJCZQD0E=;
 b=Na3QmxXga/f5RMHTW2RThHMqsg5BxTw7jBJXNh9PUL659ap8NtiC7wa5
 k8KQVrPlJjSB6kdxqj+6mm3UxTajOeKnMiBpfP9k5eGqjUqI7t7TRblKm
 dF2HpbT5BbVAWHmNX4eJnQnVMsqVj+1Bd6bmoDfngFw9ac6r0/TMaxuCs
 WJfRbRNGZpXum1yT8Sle7W1YMDxRg/9AE2yJjWqAU8uRCOMQzDRdIwo/P
 6uD40m/lKNP7P1d6cOxU8G9uyjMoucRtG7yUUBU60OwBbSh+5E1DPNnfF
 ljzvvvObqC3E86YrsO1+L5mZRR5s9t9L4IktAUcY0CyZsYGAnuCFK89Bg g==;
X-CSE-ConnectionGUID: cO2Eget5RVKzZRrCqzAPew==
X-CSE-MsgGUID: eZKS1y9FRJOIpBIZO03aHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41905274"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="41905274"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 01:24:24 -0800
X-CSE-ConnectionGUID: NK5roLgESIKFfRPB1mdrbA==
X-CSE-MsgGUID: a2CyW1z9TU+2TasmqhH4/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="84058618"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.160.90])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 01:24:23 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, niranjana.vishwanathapura@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v2 0/3] MSI-X support
Date: Tue,  5 Nov 2024 11:24:09 +0200
Message-Id: <20241105092412.11871-1-ilia.levi@intel.com>
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
 drivers/gpu/drm/xe/xe_lrc.c              |  24 ++-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 include/uapi/drm/xe_drm.h                |   8 +-
 17 files changed, 444 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.c
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.h

-- 
2.43.2

