Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A6DD69105
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 12:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE5510E477;
	Thu, 28 Nov 2024 12:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbwSfkTw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5AF10E477
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Nov 2024 12:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732798452; x=1764334452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yWtkyrRc8GV8yDja/yKacrlrtfpfISFq9KP9cBjKI8I=;
 b=ZbwSfkTwJzQIsmVT+5dXFuKyYfAQE5Y3+76ei45g4e3Y7ZozZosOwPev
 3hDZCTSfHHyENSwi9QG/f4uDAuB/l/WoiS+rfpX+Sy3mi+lK+Sa2j2XGD
 6noulQHby4TK7XQiZLz+6U0xGpCrrx/rKNe7MsCzy+R3CQdTVA463K3xe
 9KqLfLmNRrthOUCfJHYbn6PdmEA+cHaG8yUPbSTKSTGKSoyzG7g4EyOP+
 L9oS4EHQHms4Q8xj8QViiTpHzhxWxh9768gEA7U4MhbcOOQWHvppVbzi4
 6uh/sVKiezxqHAadlRCOSJrOXL0THBNPBSMpujvozozw0oY+mgf0xL9A/ w==;
X-CSE-ConnectionGUID: fs8ADQ0zRVOMsBq006voBw==
X-CSE-MsgGUID: Mr5DXi8VTH2715qJDkQMzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43698642"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="43698642"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 04:53:57 -0800
X-CSE-ConnectionGUID: 6nuA9iNHT4mToOwYKS7XXA==
X-CSE-MsgGUID: R6SZZG5ySWOJRoJ7UhMJJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="93069832"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.200.63])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 04:53:53 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, piotr.piorkowski@intel.com,
 niranjana.vishwanathapura@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
Subject: [PATCH v5 0/5] MSI-X support
Date: Thu, 28 Nov 2024 14:53:40 +0200
Message-Id: <20241128125345.1115-1-ilia.levi@intel.com>
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
v5:
 - Rebase
 - Optimize irq.enabled access (additional patch)
 - Check irq.enabled in new IRQ handlers
 - Code review comments (Piotr)

Dani Liberman (1):
  drm/xe/uapi: Support requesting unique MSI-X for exec queue

Ilia Levi (4):
  drm/xe: Make irq enabled flag atomic
  drm/xe/irq: Separate MSI and MSI-X flows
  drm/xe: Initial MSI-X support for HW engines
  drm/xe/irq: Manage MSI-X interrupts allocation

 drivers/gpu/drm/xe/display/ext/i915_irq.c |   2 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h  |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h   |   3 +
 drivers/gpu/drm/xe/xe_device.c            |   4 +-
 drivers/gpu/drm/xe/xe_device.h            |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h      |  10 +-
 drivers/gpu/drm/xe/xe_exec_queue.c        |  59 +++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h  |   4 +
 drivers/gpu/drm/xe/xe_execlist.c          |  10 +-
 drivers/gpu/drm/xe/xe_hw_engine.c         |   7 +-
 drivers/gpu/drm/xe/xe_irq.c               | 360 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_irq.h               |   9 +
 drivers/gpu/drm/xe/xe_lrc.c               |  24 +-
 drivers/gpu/drm/xe/xe_lrc.h               |   2 +-
 include/uapi/drm/xe_drm.h                 |   8 +-
 15 files changed, 432 insertions(+), 76 deletions(-)

-- 
2.43.2

