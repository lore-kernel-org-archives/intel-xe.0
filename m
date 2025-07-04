Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D09C83F03
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 21:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199B210E0DD;
	Fri,  4 Jul 2025 21:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdRAD3UK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805A910E0DD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 21:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751662953; x=1783198953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IHs3vJP56a5jZ9m17VJRFy3AehKUJDKbdxpa0SRmYto=;
 b=VdRAD3UKS8pBBFP8QiWShNUzvs5S/+14PZauO51bfJtctqGJH5wlT9X8
 yhIisQYwip6hjTRb8KN+tIDFWawKXmn/aqFUan8HBbDXSre/5hcwdZ//g
 S8+8R6b4ckihD8e6lNStNsSnCh5FYIoatUODJb8/gT98gWGN5lWwxcmGp
 +bf8myANqn2o/Dwu+z5baPfa0vs4hMSKgHTA+nxhdg7OgC4dmXkBCkjSW
 g6H44tnO9q6tElz/bV9qE2be6nM6aFVVWjGfAN9BVX/mtwFy32m1+fAgc
 GC30tZLCalvOiddIx0a3DZA2ijy2eSIgV89MJr6EXRJ7mEDU9qaGhM+Uh g==;
X-CSE-ConnectionGUID: wSCB+T3TTF+TVi9d7hN3hg==
X-CSE-MsgGUID: nWXFTR3QTx+scPQ4vfhJqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="54111442"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="54111442"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 14:02:32 -0700
X-CSE-ConnectionGUID: l2K5vV1fTmuIdnmIEd1XVw==
X-CSE-MsgGUID: 5BS+UJ9nQhSKbd6MRqnF5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="154840028"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa007.jf.intel.com with ESMTP; 04 Jul 2025 14:02:31 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 0/9] drm/xe/vf: Post-migration recovery of queues and jobs
Date: Fri,  4 Jul 2025 23:02:19 +0200
Message-Id: <20250704210228.825843-1-tomasz.lis@intel.com>
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
v6: Rebased to changes in "Make multi-GT migration less error prone",
  used a scratch buffer, and added one more ring recovery patch

Tomasz Lis (9):
  drm/xe/sa: Avoid caching GGTT address within the manager
  drm/xe/vf: Skip fixups on migration before getting GGTT info
  drm/xe/vf: Pause submissions during RESFIX fixups
  drm/xe: Block reset while recovering from VF migration
  drm/xe/vf: Rebase HWSP of all contexts after migration
  drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
  drm/xe/vf: Post migration, repopulate ring area for pending request
  drm/xe/vf: Refresh utilization buffer during migration recovery
  drm/xe/vf: Rebase exec queue parallel commands during migration
    recovery

 drivers/gpu/drm/xe/xe_exec_queue.c    |  41 ++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h    |   4 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c |  13 +++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |   1 +
 drivers/gpu/drm/xe/xe_gt.c            |  10 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c    |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  23 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h   |   1 +
 drivers/gpu/drm/xe/xe_guc_buf.c       |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c    | 136 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h    |   9 ++
 drivers/gpu/drm/xe/xe_guc_types.h     |   6 ++
 drivers/gpu/drm/xe/xe_lrc.c           | 123 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_lrc.h           |   9 ++
 drivers/gpu/drm/xe/xe_sa.c            |   1 -
 drivers/gpu/drm/xe/xe_sa.h            |  15 ++-
 drivers/gpu/drm/xe/xe_sa_types.h      |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf.c      |  75 +++++++++++++-
 18 files changed, 446 insertions(+), 27 deletions(-)

-- 
2.25.1

