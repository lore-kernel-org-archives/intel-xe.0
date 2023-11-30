Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1006C10DC2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A1210E06F;
	Thu, 30 Nov 2023 18:40:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4281310E06F
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369611; x=1732905611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T1VYX6x4SZvWnYrbXIQbjzzq1B5Tv3Nlt3ncpKvE4ss=;
 b=Lykd5ncNuaZAvQ2TwEh/zIWNmkOlPZosFmp6SCwZrEXu+MKvpoZ6OQ1l
 RANBJRluvQY7HDn+r8Aoo04WfHaQwOxz5wYW7+G555HZzAodMpYnG847u
 YA4dpEvnDxBtJ+lgyETrWEDOen2aI0Ec6Sk4/K38yhVsPjOWq5ny8Rnq5
 ffUBUAQ/6rpv08Srae1a8DUjqaJAu+8eGJxl9iV6N5XPlh1eMkTc74AsF
 rSML3SR1yK0FX6/EtavdyD7ZDdtl5xN1q423eEKAEpHCT4M4wAUqzaVg0
 fDygQvRgKN21YtSSzkearB8OjGGShCPWddLOPf5wdFPM2kpIKbswcYd/R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111702"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111702"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294904"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294904"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:09 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:39 +0000
Message-Id: <20231130183955.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 00/16] uAPI Alignment - Cleanup and future
 proof
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The series "uAPI Alignment - take 2 v3" [1] has grown too much which makes
it difficult to review and to digest by UMDs. This new series is a third
break down, which cleans up the uAPI and prepares for future needs.

Corresponding IGT series is here [2].

v2: Fix according to feedback from v1, rebase on drm-xe-next, add new fixes

v3: Rebase, bundle other already reviewed uAPI changes

[1] https://patchwork.freedesktop.org/series/126203/
[2] https://patchwork.freedesktop.org/series/126537/

Francois Dugast (3):
  drm/xe/uapi: Align on a common way to return arrays (memory regions)
  drm/xe/uapi: Align on a common way to return arrays (gt)
  drm/xe/uapi: Align on a common way to return arrays (engines)

José Roberto de Souza (1):
  drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof

Mauro Carvalho Chehab (1):
  drm/xe/uapi: Reject bo creation of unaligned size

Mika Kuoppala (1):
  drm/xe: Extend drm_xe_vm_bind_op

Rodrigo Vivi (9):
  drm/xe/uapi: Separate bo_create placement from flags
  drm/xe/uapi: Split xe_sync types from flags
  drm/xe/uapi: Kill tile_mask
  drm/xe/uapi: Crystal Reference Clock updates
  drm/xe/uapi: Add Tile ID information to the GT info query
  drm/xe/uapi: Fix various struct padding for 64b alignment
  drm/xe/uapi: Move xe_exec after xe_exec_queue
  drm/xe: Remove unused extension definition
  drm/xe/uapi: Kill exec_queue_set_property

Thomas Hellström (1):
  drm/xe/uapi: Use LR abbrev for long-running vms

 drivers/gpu/drm/xe/tests/xe_dma_buf.c |   8 +-
 drivers/gpu/drm/xe/xe_bo.c            |  38 ++--
 drivers/gpu/drm/xe/xe_device.c        |   2 -
 drivers/gpu/drm/xe/xe_exec_queue.c    |  38 ----
 drivers/gpu/drm/xe/xe_exec_queue.h    |   2 -
 drivers/gpu/drm/xe/xe_gt_clock.c      |   4 +-
 drivers/gpu/drm/xe/xe_gt_types.h      |   4 +-
 drivers/gpu/drm/xe/xe_query.c         |  87 +++++----
 drivers/gpu/drm/xe/xe_sync.c          |  23 +--
 drivers/gpu/drm/xe/xe_sync_types.h    |   1 +
 drivers/gpu/drm/xe/xe_vm.c            |  56 ++----
 drivers/gpu/drm/xe/xe_vm_types.h      |   2 -
 include/uapi/drm/xe_drm.h             | 267 +++++++++++++++-----------
 13 files changed, 262 insertions(+), 270 deletions(-)

-- 
2.34.1

