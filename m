Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E32C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 10:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5D910E48F;
	Thu, 12 Jun 2025 10:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lR1x4lIi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B791410E48F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 10:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749723893; x=1781259893;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ftC8RmBra5s0Ap9CSE8ACflS9oFalVjWZL1rjPHvH6c=;
 b=lR1x4lIib+QvzVtu2kkJBqhpkvJWdVnbQKlwMxDKS0kpfBX1TJJqOaH2
 U64XOGGFa34VmAbRffohYcPZV+U/Difrkp+EK28wgF1SQLCG+iR5RjFB7
 BJqyx75mhA1dPw3L8ZDeMJ/qMXS99bejjv9tSTPRQ69ADAAMWyQXsQoL3
 h6jzNvjEhI80/24217xGGx2gbh7RFNlyB+hezsWVybhjCEO18Wy9MvLEz
 00i5/mcpUzG/2zH+eMHBZGdHGIQVqZ0CqCuMb0bcLUa7RZc/uPQNH8xYy
 4KDx0cSZFehRRYyoqNECrCr+DSMLHbR9QHXkdzSG3TUE7OnXjFoyPyB2H A==;
X-CSE-ConnectionGUID: ngTzjz1FRVSKdaXIwiaVPg==
X-CSE-MsgGUID: Wl7LMCHXQ2qgGYmyPlCeDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51608598"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51608598"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:24:52 -0700
X-CSE-ConnectionGUID: yv0qYqOdQXGsJa3cmn0LDA==
X-CSE-MsgGUID: 7LxlAeBlRAu+/tr3SJIbDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152382741"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2025 03:24:50 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 0/8] drm/xe/vf: Post-migration recovery of queues and jobs
Date: Thu, 12 Jun 2025 12:24:41 +0200
Message-Id: <20250612102449.1412058-1-tomasz.lis@intel.com>
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
v5: Replaced "Finish RESFIX by reset" patch with "Skip fixups
  before getting GGTT info", rebased "Refresh utilization buffer"
  patch

Tomasz Lis (8):
  drm/xe/sa: Avoid caching GGTT address within the manager
  drm/xe/vf: Skip fixups on migration before getting GGTT info
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
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  23 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h   |   1 +
 drivers/gpu/drm/xe/xe_guc_buf.c       |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c    | 111 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h    |   9 +++
 drivers/gpu/drm/xe/xe_guc_types.h     |   6 ++
 drivers/gpu/drm/xe/xe_lrc.c           |  65 ++++++++++++++-
 drivers/gpu/drm/xe/xe_lrc.h           |   4 +
 drivers/gpu/drm/xe/xe_sa.c            |   1 -
 drivers/gpu/drm/xe/xe_sa.h            |  15 +++-
 drivers/gpu/drm/xe/xe_sa_types.h      |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf.c      |  84 ++++++++++++++++++-
 18 files changed, 384 insertions(+), 9 deletions(-)

-- 
2.25.1

