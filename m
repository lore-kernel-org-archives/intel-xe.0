Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08333C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 01:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA8B10E28A;
	Fri,  1 Aug 2025 01:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+8vM3+F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0A110E28A
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 01:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754013027; x=1785549027;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8QERt1pfLL063+B9HubTo97ukAdo5cKd0/9VH727Fug=;
 b=h+8vM3+FAW5O8JRoGUYFqMWGWQFj5ICPMeX/8HE5x253Y85N2ZBR9XWO
 J2Iwv7KMnn5NcXnTSMRWCg/SE/d/jO8l/1O6Igv56Pgk6UCErvvAHfPpl
 4zyu+0xPP52gWfu5Qh3XxHikxs1XWS8SblB1rqOabkOM6Puu8maZ36wR1
 xA7FwZYZSD/zetRJAxcSb0ufnBrzMoGIs/danr4uetgXeE+RaH7k1wDSb
 klKGC3FSpCDalNYFnH6/sE8e9DxLfb8q3xOSdFVbR2GKuJrbRHGH46BFC
 bBZIUcDO/obg3jaLOtNI7GDfWcD2WhFC0ZPOpfEJYle6HBEne2MG/9Lp2 w==;
X-CSE-ConnectionGUID: Ru/bqb6USsqJvzjQCVhrJg==
X-CSE-MsgGUID: q4+8rIwDSo2iR2i/T69pzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="43953668"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="43953668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 18:50:27 -0700
X-CSE-ConnectionGUID: mRWI8XtPQdGD1Dkv9L4amQ==
X-CSE-MsgGUID: t9ZRLjhkQgCpsQEh19cOEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194401358"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa002.jf.intel.com with ESMTP; 31 Jul 2025 18:50:25 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 0/8] drm/xe/vf: Post-migration recovery of queues and jobs
Date: Fri,  1 Aug 2025 03:50:37 +0200
Message-Id: <20250801015045.957609-1-tomasz.lis@intel.com>
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

