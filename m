Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872E6C87FCA
	for <intel-xe@archiver.kernel.org>; Sat,  2 Aug 2025 03:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E93810E066;
	Sat,  2 Aug 2025 03:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hREJDqTO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DDC10E066
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Aug 2025 03:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754104226; x=1785640226;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GCdrsH0RM9OfQq2g8S83okxkh8hFvODIPZk9Qwjsn3g=;
 b=hREJDqTOcaDEAeUdAUr5cCVTbNW3Tk5BZcYZ2I+o1BRXj1+ajLeg9d5b
 C1TIBoqUyuisAfC6I/SmCK1oHctEqbeh7LXx/xEzPfVRfu2dx/3JT6Cob
 ZaWWSt+Hhq/av2/dSQ6TlEd6viii98WwfbdIQjdj/okcK/6JBtbZvVx/7
 NP7V7Gti0MiKMsUpDlYCXMSGzm+1+IEUSD94f4VNP2hr9tMHbKkgJur8j
 uQY3V87LmANfZWHS4KKQv9DUXlTOUNXsgZTWZKYVBQEwuhHuUN/BDsFWD
 fslBJa0nsK15XA1QoZ7mtwTSBi/EAGhwNE03HfYfyL4rJkJsS+Z8sxaWx Q==;
X-CSE-ConnectionGUID: Qdtb5xswS7mL8hvgARRwLg==
X-CSE-MsgGUID: Won4aYLLRdKRK825ffLOGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73910605"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="73910605"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 20:10:26 -0700
X-CSE-ConnectionGUID: 28ukm10DQbitaOFJnRn+PA==
X-CSE-MsgGUID: p1tohjIsSt2inMUuJr73hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="169093836"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa005.jf.intel.com with ESMTP; 01 Aug 2025 20:10:24 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v9 0/8] drm/xe/vf: Post-migration recovery of queues and jobs
Date: Sat,  2 Aug 2025 05:10:37 +0200
Message-Id: <20250802031045.1127138-1-tomasz.lis@intel.com>
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
v7: Used better matching atomic functs, fixed noop item at end of
  WQ ring, added more exit conditions in wq ring
v8: Improve error/warn logging, add propagation of errors,
 make enum for offsets
v9: Rephrased comments in one patch

Tomasz Lis (8):
  drm/xe/sa: Avoid caching GGTT address within the manager
  drm/xe/vf: Pause submissions during RESFIX fixups
  drm/xe: Block reset while recovering from VF migration
  drm/xe/vf: Rebase HWSP of all contexts after migration
  drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
  drm/xe/vf: Post migration, repopulate ring area for pending request
  drm/xe/vf: Refresh utilization buffer during migration recovery
  drm/xe/vf: Rebase exec queue parallel commands during migration
    recovery

 drivers/gpu/drm/xe/abi/guc_actions_abi.h |   8 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       |  48 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.h       |   4 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c    |  13 ++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h    |   1 +
 drivers/gpu/drm/xe/xe_gt.c               |  10 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c       |   5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c      |  14 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h      |   1 +
 drivers/gpu/drm/xe/xe_guc_buf.c          |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       | 175 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h       |   9 ++
 drivers/gpu/drm/xe/xe_guc_types.h        |   6 +
 drivers/gpu/drm/xe/xe_lrc.c              | 107 ++++++++++++--
 drivers/gpu/drm/xe/xe_lrc.h              |   9 ++
 drivers/gpu/drm/xe/xe_sa.c               |   1 -
 drivers/gpu/drm/xe/xe_sa.h               |  15 +-
 drivers/gpu/drm/xe/xe_sa_types.h         |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf.c         |  78 +++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c     |   2 +-
 20 files changed, 490 insertions(+), 19 deletions(-)

-- 
2.25.1

