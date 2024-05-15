Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78DDC04FFE
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 00:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2D010E1CB;
	Wed, 15 May 2024 00:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNAEOCq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520BF10E1BD
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 00:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715733572; x=1747269572;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mi3EO/xHIXwfVOQYLUsv4JNAib6t+0h0jhM71sJJ9NI=;
 b=gNAEOCq+EirO0i2fPHoW7KltqbXVtqoxfPaW/DQR+A2zJTsCXqH4E63p
 Mn8nrIaVM9/SgN62tBJK1a/nID6U9TjdunEUDqkHumw68Ebsg6wqPyBT/
 BgW66/dRn1aNFcWSUQbsq8T/QZsxDxcjUahZLmEH6178dl7OilEMGmnWj
 GhUfNQpGWt66WCsmX2A9jnPx7YNXtOXTcUU/62cXigl6SbwNJ3HegYgM7
 5l+ezNiP7R8Z1QGbX0AVl20IjdXEO9X2YwTt6Hz2NrtV7J/+QbS8EaEzU
 4HMiOE9WX3X7BqgEIqZ2nqq8VxtcjcpTtY3oy4fvfm7asrPqkay4tsHTb A==;
X-CSE-ConnectionGUID: cGAhBFrjTX+xObBsTHxDHw==
X-CSE-MsgGUID: +9IJBYOjTIa2fPrv1Lffuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="14700164"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="14700164"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 17:39:32 -0700
X-CSE-ConnectionGUID: Sc3PQVi6SA2QIlrWdHxnpQ==
X-CSE-MsgGUID: zNEieAF8Rduaxu96qtajZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="30982691"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 17:39:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/6] Convert multiple bind ops to 1 job
Date: Tue, 14 May 2024 17:40:04 -0700
Message-Id: <20240515004010.100091-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Continuation of merging parts of [1]. Patch #2 in this series is quite
large but unsure how to split the patch without breaking functionality.

Tested with [2].

v2:
 - Rebase
 - Add error injection patch
 - Fix dma-fence reservation for binds

Matt

[1] https://patchwork.freedesktop.org/series/125608/
[2] https://patchwork.freedesktop.org/series/129606/

Matthew Brost (6):
  drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
  drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
  drm/xe: Convert multiple bind ops into single job
  drm/xe: Update VM trace events
  drm/xe: Update PT layer with better error handling
  drm/xe: Add VM bind IOCTL error injection

 drivers/gpu/drm/xe/xe_bo_types.h     |    2 +
 drivers/gpu/drm/xe/xe_device_types.h |   12 +
 drivers/gpu/drm/xe/xe_migrate.c      |  307 +++---
 drivers/gpu/drm/xe/xe_migrate.h      |   34 +-
 drivers/gpu/drm/xe/xe_pt.c           | 1286 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pt.h           |   14 +-
 drivers/gpu/drm/xe/xe_pt_types.h     |   48 +
 drivers/gpu/drm/xe/xe_trace.h        |   10 +-
 drivers/gpu/drm/xe/xe_vm.c           |  647 +++++--------
 drivers/gpu/drm/xe/xe_vm.h           |    2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |   53 +-
 11 files changed, 1360 insertions(+), 1055 deletions(-)

-- 
2.34.1

