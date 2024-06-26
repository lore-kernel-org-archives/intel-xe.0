Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25E3C30653
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 00:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698C810E2DF;
	Wed, 26 Jun 2024 00:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTq0prmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8BD10E280
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 00:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719362324; x=1750898324;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2BBWbj6EbDc9uc3g35fi+g9wVqC6x8Q0M4yumKmuEmY=;
 b=OTq0prmHnnIiqByqv0FjUeNFyWFLDr17Kzsjcg64hQvyp30OfGKWv6Ft
 bzUFe+a9q1gwwFhp+FAikmaWH9q9yApCJwmW1CZ5iVEmaCWweIUzXTfAu
 t68q25Eao9R+05YA91NZhoZ78a8zVC8RyxnbqdM/X9toeKCp3erUWPtZR
 iy38vuxsPy6fMNQZISi0JxDWFsfYfz/PLXwLmM6GWpssuuCdvJdbadfyn
 VJc9T/3c1udTfxHgHv4XS6wYWhAM+zsPpNkPiZiotjqC8VZe8efdBrg0w
 qx1GFH1QzKTlTosKAexuNyMDkDalftDoDRRZhwD3X9iM4gauz88IiAzCY w==;
X-CSE-ConnectionGUID: 1UuitAtATHSL4FYqcEe6Dg==
X-CSE-MsgGUID: pk7FRk9PRraemXoRBGvWCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16238387"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="16238387"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 17:38:44 -0700
X-CSE-ConnectionGUID: A6/tbJO+QqamxcEksDsIRQ==
X-CSE-MsgGUID: bh+NM2OpT+yA7UBG/tBTEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="43629594"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 17:38:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/7] Convert multiple bind ops to 1 job
Date: Tue, 25 Jun 2024 17:39:13 -0700
Message-Id: <20240626003920.4060633-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_migrate.c      |  315 +++----
 drivers/gpu/drm/xe/xe_migrate.h      |   34 +-
 drivers/gpu/drm/xe/xe_pt.c           | 1283 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pt.h           |   14 +-
 drivers/gpu/drm/xe/xe_pt_types.h     |   48 +
 drivers/gpu/drm/xe/xe_trace_bo.h     |   10 +-
 drivers/gpu/drm/xe/xe_vm.c           |  647 +++++--------
 drivers/gpu/drm/xe/xe_vm.h           |    2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |   55 +-
 13 files changed, 1383 insertions(+), 1064 deletions(-)

-- 
2.34.1

