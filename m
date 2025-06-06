Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DA5C5B543
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 00:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34C910E2F7;
	Fri,  6 Jun 2025 00:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJaVaFOd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBFF10E2F7
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 00:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749169106; x=1780705106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uw+Fn3xsapVVqMJK9iEhKOD8futUyotsdxShtcKTFWA=;
 b=SJaVaFOdfbKVycIvngwed1ytGTv+NSpkTE03X98dnIRFexa4Q2LVoiVs
 9GHY/m+DyWxdmiabLQ/kh2e2NQszvj0teYPzp5suBzMHwGgD1kYk83fVq
 OkZmsqz4CXCwQl06aADQlbHqWy3h3WyIUAU2nbuZJxdWGFltkr9W2EWm/
 Gou4hgexxX587P0d+8nQ9ihdcywhL/MPl33MNUmpBh4NAuOfpWjCpa4bn
 pduBURfRHOakh6huOCLRUZbkEGBge3qW6WNTqhHNJux0VWMH9H+Lqul9W
 5vSrkTRIcIiZNBB2PC22kVkJvPD7ItueSyDNuVTW49eqWL1EQ1+DeG42z g==;
X-CSE-ConnectionGUID: 2R9kRRjcSJKADUfhkrxQqg==
X-CSE-MsgGUID: IFeJtDiqTZCL9daYBvgudg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61973471"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="61973471"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 17:18:26 -0700
X-CSE-ConnectionGUID: YhfUSF7IRX2H57vQNvio/A==
X-CSE-MsgGUID: iLi+AnCMTTq/hJ3v7WD9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="149507859"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2025 17:18:25 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 0/8] drm/xe/vf: Post-migration recovery of queues and jobs
Date: Fri,  6 Jun 2025 02:18:15 +0200
Message-Id: <20250606001823.1010994-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

To support VF Migration, it is necessary to do fixups to any
non-virtualized resources. These fixups need to be applied within
VM, on the KMD working with VF.

This series adds two fixup functions to the recovery worker:
* for fixing xe_lrc structs within queues
* for fixing xe_job structs and the commands they emit
It also provides some performance and stability fixes - blocking
submissions and resets while the fixups are being applied.
In case of sub-allocator, it removes the cached GGTT addresses
instead of implementing fixups for them.

v2: Switcghed to update of addresses by xe_lrc_write_ctx_reg()
  to avoid kzalloc(), renamed or moved few functions
v3: Renamed and reordered parameters, added kerneldocs
v4: Take job_list_lock, introduce a new atomic for reset
  blocking, add "refresh utilization buffer" patch

Tomasz Lis (8):
  drm/xe/sa: Avoid caching GGTT address within the manager
  drm/xe/vf: Finish RESFIX by reset if CTB not enabled
  drm/xe/vf: Pause submissions during RESFIX fixups
  drm/xe: Block reset while recovering from VF migration
  drm/xe/vf: Rebase HWSP of all contexts after migration
  drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
  drm/xe/vf: Post migration, repopulate ring area for pending request
  drm/xe/vf: Refresh utilization buffer during migration recovery

 drivers/gpu/drm/xe/xe_exec_queue.c    |  40 ++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h    |   4 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c |  13 +++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |   1 +
 drivers/gpu/drm/xe/xe_gt.c            |  10 +++
 drivers/gpu/drm/xe/xe_gt_debugfs.c    |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  25 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h   |   1 +
 drivers/gpu/drm/xe/xe_guc_buf.c       |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c    | 111 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h    |   9 +++
 drivers/gpu/drm/xe/xe_guc_types.h     |   6 ++
 drivers/gpu/drm/xe/xe_lrc.c           |  58 +++++++++++++-
 drivers/gpu/drm/xe/xe_lrc.h           |   4 +
 drivers/gpu/drm/xe/xe_sa.c            |   1 -
 drivers/gpu/drm/xe/xe_sa.h            |  15 +++-
 drivers/gpu/drm/xe/xe_sa_types.h      |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf.c      | 100 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf.h      |   1 +
 19 files changed, 396 insertions(+), 9 deletions(-)

-- 
2.25.1

