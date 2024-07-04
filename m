Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C89BC41513
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 04:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CE010E322;
	Thu,  4 Jul 2024 04:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sp/3AV3X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CFA10E174
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 04:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720065946; x=1751601946;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2+N9V5liawjmPUtahpwk4mPGuB5l4VL/3Lvq7u/F3c8=;
 b=Sp/3AV3XUueEG2pCu/c1UuBHpXRYkgiNESiMtllW1dhNj+38JmLxQ3Ee
 380MgTJxofrHcf6mQZxw8cSlqosy7cTB4xkwb02K2OTCZJNP+eTK9prTR
 MvP+nWnZ8tAPcR6oC7LOLlZ9o9RrnN9D1X8wsCz/KgVP988tOUYMF55up
 oU/OxDl8pspbxxKfrRDHrJV7K8lPPnNS1JJsiEAh9JCxWhdI8S2IkLq9A
 jBoNvN9fpIoKueCoybKqOBeqfdejccGQQSD3KgzogWjkYJ/pkeQ+Y7q6p
 jUqP9m8wlbPmBMYTukx5ufNxYA3KpNC42lU3FC1Sb9r2TA4eCyjRlbL/f w==;
X-CSE-ConnectionGUID: r+5MUKcWSQa2qtfIOTxOFA==
X-CSE-MsgGUID: QLScSGSXQYqbh1tudDXmkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="20227726"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="20227726"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 21:05:46 -0700
X-CSE-ConnectionGUID: ZUc3mJhHSQ+nfHwDC47CyA==
X-CSE-MsgGUID: XABvR2NhQX63PFeaomfpXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46477977"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 21:05:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 0/7] Convert multiple bind ops to 1 job
Date: Wed,  3 Jul 2024 21:06:16 -0700
Message-Id: <20240704040623.267526-1-matthew.brost@intel.com>
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
v3:
 - Rebase
 - Error injection patch omitted in this rev
v4:
 - Rebase
 - Fix tlb invalidation (Paulo)
 - Add missing last fence dep / test to inspection (Inspection)
 - Add error injection patch back in 
v5:
 - Address Matthew Auld's feedback
v6:
 - Fix CI failure (Matthew Auld, CI)
 - Fix checkpatch issues
 - Return -ENOBUFS in Xe layer rather than DRM SA layer to avoid warns (Matthew Auld)
v7:
 - Address Matthew Auld's feedback
 - Fix mesa failure in which VM bind jobs timed on integrated parts if number of PTE updates > 510 (Paulo)

Matt

[1] https://patchwork.freedesktop.org/series/125608/
[2] https://patchwork.freedesktop.org/series/129606/

Matthew Brost (7):
  drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
  drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
  drm/xe: Add xe_exec_queue_last_fence_test_dep
  drm/xe: Convert multiple bind ops into single job
  drm/xe: Update VM trace events
  drm/xe: Update PT layer with better error handling
  drm/xe: Add VM bind IOCTL error injection

 drivers/gpu/drm/xe/xe_bo_types.h     |    2 +
 drivers/gpu/drm/xe/xe_device_types.h |   12 +
 drivers/gpu/drm/xe/xe_exec_queue.c   |   23 +
 drivers/gpu/drm/xe/xe_exec_queue.h   |    2 +
 drivers/gpu/drm/xe/xe_migrate.c      |  342 ++++---
 drivers/gpu/drm/xe/xe_migrate.h      |   34 +-
 drivers/gpu/drm/xe/xe_pt.c           | 1284 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pt.h           |   14 +-
 drivers/gpu/drm/xe/xe_pt_types.h     |   48 +
 drivers/gpu/drm/xe/xe_sa.c           |    7 +
 drivers/gpu/drm/xe/xe_trace_bo.h     |   10 +-
 drivers/gpu/drm/xe/xe_vm.c           |  647 +++++--------
 drivers/gpu/drm/xe/xe_vm.h           |    2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |   55 +-
 14 files changed, 1413 insertions(+), 1069 deletions(-)

-- 
2.34.1

