Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34090C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 13:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA31010EB87;
	Tue, 11 Aug 2026 13:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1hrRowq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F4510EB87
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786453220; x=1817989220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XhABQy5iaWcRz/AbGne/lAKnT/FKUVwVwsrohDcHYlY=;
 b=C1hrRowqBqUUU3SYiGAwZiDnlZw/K5+76xjQ2Iz4AIMiIAtlAlAy2YTV
 wLng6bctIGLSpxG8xZ80FSwpCPTezwgWqBdDbeX27g/CrX6sAS6bfOyH5
 rBwXfea2Gc93NosOBJ7jjB0FTS7kIpiITcWxkXLg5nCf8MpOhcgez76yZ
 F3FeXsROQcnKmEPXjJ2Hm24ip+zhEE8OroyphNGngrANXI11l3y13aCXA
 7YJqkOQ4Ttv/d29ceYOjd9KyidgZfhtfPocwO6tNg6DmKw6A1wqYYyeyB
 94XSrblT95J9A4BCPfAWRjQabk/yMtv7S9lsTalj76kUKUdxj3N5RNg+4 g==;
X-CSE-ConnectionGUID: B8OaCu+pRgeucItnaPQOQA==
X-CSE-MsgGUID: VzaKRw1BStG6NSK1rY38xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87006950"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="87006950"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 06:00:19 -0700
X-CSE-ConnectionGUID: 6krdlxYVRl2UOQlEZGm1qA==
X-CSE-MsgGUID: BCvfP2cVQnicPs4PaP/IgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="266819261"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa003.jf.intel.com with ESMTP; 11 Aug 2026 06:00:18 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH 0/2] drm/xe/guc: handle exec queue teardown after hot-unplug
Date: Tue, 11 Aug 2026 19:07:54 +0530
Message-ID: <20260811133753.1742666-4-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

This series moves the hot-unplug handling for GuC exec queue teardown into
the GuC message submision layer.

The issue was seen with the new core_hotunplug "with-load" IGT subtests,
where an exec queue can be destroyed from a deferred fd close after the
device has already been hot-unplugged:

  guc_exec_queue_add_msg()
  guc_exec_queue_destroy()
  xe_exec_queue_destroy()
  xe_file_close()

The warning is:

  Missing outer runtime PM protection

After some debugging, this does not look like a missing runtime PM
reference or a zero usage count. At the warning point I saw:
usage_count=3, status=RPM_SUSPENDED and disable_depth=1

During hot-unplug, the PCI remove path disables runtime PM. The old
struct device can still remain alive because the old drm_device is still
referenced by an open fd. When that fd is finally closed,
guc_exec_queue_destroy() runs on the old device where runtime PM is
already disabled. In that state pm_runtime_get_if_in_use() returns
-EINVAL even with a non-zero usage count, so
xe_pm_runtime_get_noresume() cannot observe the existing PM state and
warns.

Instead of suppressing the warning in xe_pm_runtime_get_noresume(), this
series handles the unplug case where the GuC exec queue message is queued
and processed.

Patch 1 reworks the GuC exec queue message teardown handling.
Patch 2 removes EXEC_QUEUE_FLAG_PERMANENT, which is no longer needed.

Observed with new igt tests:

  igt@core_hotunplug@hotreplug-with-load
  igt@core_hotunplug@hotunplug-rescan-with-load
  
Link: https://patchwork.freedesktop.org/patch/725773/?series=166744&rev=4

v2:
 - Drop the drm_dev_is_unplugged() bypass from guc_exec_queue_destroy()
   and instead exclude hot-unplug from the WARN in
   xe_pm_runtime_get_noresume().

v3:
 - Rework the fix in the message-submission layer instead of touching the
   WARN; gate PM/HW work on drm_dev_enter() and route all queues through
   the CLEANUP message. (Matthew Brost)
 - Prove the root cause (runtime PM disabled on unplug, not a zero
   refcount) and record it in the commit message. (Matt B, Raag Jadav)
 - Also remove EXEC_QUEUE_FLAG_PERMANENT flag in
   separate patch (Matthew Brost)


Nitin Gote (2):
  drm/xe/guc: rework exec queue teardown PM/unplug handling
  drm/xe: remove EXEC_QUEUE_FLAG_PERMANENT

 drivers/gpu/drm/xe/xe_exec_queue.c       |  3 -
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 14 ++--
 drivers/gpu/drm/xe/xe_gsc.c              |  3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       | 98 ++++++++++++------------
 drivers/gpu/drm/xe/xe_migrate.c          |  2 -
 drivers/gpu/drm/xe/xe_pm.c               |  5 ++
 drivers/gpu/drm/xe/xe_pxp_submit.c       |  5 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c     |  1 -
 drivers/gpu/drm/xe/xe_vm.c               |  1 -
 9 files changed, 65 insertions(+), 67 deletions(-)

-- 
2.50.1

