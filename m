Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67337D59D87
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 18:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00CC10E92F;
	Fri, 12 Dec 2025 18:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvgLFwlU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA9810E92C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 18:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765564134; x=1797100134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vfwcOpLJ/Jt+VMnMQlrjS2R7fwjWXAtZoyoJjiMUOzI=;
 b=SvgLFwlUeYF8dAXf/ulmJJ14v1MsEbnG4xt8AGa5oWdqVX+mGTkFjz3u
 TZC/N1ydzi1v4J+TF0aW50qI1OGZaETM8wTkqBdmSiLk+qelXyDvOSAZw
 tVRWsVsIf1yOHdbtEqsK4Ml0BzWOcd9HtOqI3L9kJQhODF0pHggymjX6u
 CfPUA6vnd93jW+R0rfJBtKULCT1hRzhuiv5/VqsM6NBW7hWNGgnVek4aa
 i2rofTSbUfIoL9M6K45T+S9UyRZDlM7Rkwx3qOH7ohPEll0NRFJDGwbAu
 5VfUjA4bECmH8W6kf4qqoSaTy9FH4vS5gqxQHBugK5GuAjd/Pm5tNMJ+e g==;
X-CSE-ConnectionGUID: k9rRxul9SWWid7S44y0Wmw==
X-CSE-MsgGUID: YWwvgF3KQ4mT7v7n1jfSKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71432795"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71432795"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:54 -0800
X-CSE-ConnectionGUID: d17BmH7QRJuHK4d3KWeqDg==
X-CSE-MsgGUID: KPo3wrgsQ3qJJZPv+zZdIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201633937"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH v2 0/7] Fix performance when pagefaults and 3d/display share
 resources
Date: Fri, 12 Dec 2025 10:28:40 -0800
Message-Id: <20251212182847.1683222-1-matthew.brost@intel.com>
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

xello_raytracer [1] showed a significant performance regression (~40×
slowdown) when the compute UMD enabled page faults. The issue was traced
to the implementation that allows page-fault workloads and dma-fence
workloads (3D/display) to coexist.

This series fixes several issues, bringing page-fault performance in
this benchmark to within 6% of preempt-fence mode (no page faults).

v2:
 - Fix CI failures, address early feedback

Matt

[1] https://github.com/intel-sandbox/xello_raytracer

Matthew Brost (7):
  drm/xe: Adjust long-running workload timeslices to reasonable values
  drm/xe: Use usleep_range for accurate long-running workload
    timeslicing
  drm/xe: Add debugfs knobs to control long running workload timeslicing
  drm/xe: Skip exec queue schedule toggle if queue is idle during
    suspend
  drm/xe: Wait on in-syncs when swicthing to dma-fence mode
  drm/xe: Add GT stats ktime helpers
  drm/xe: Add more GT stats around pagefault mode switch flows

 drivers/gpu/drm/xe/xe_debugfs.c         | 74 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h    |  6 ++
 drivers/gpu/drm/xe/xe_exec.c            |  9 ++-
 drivers/gpu/drm/xe/xe_exec_queue.h      | 17 ++++++
 drivers/gpu/drm/xe/xe_gt_stats.c        |  6 ++
 drivers/gpu/drm/xe/xe_gt_stats.h        | 33 ++++++++++-
 drivers/gpu/drm/xe/xe_gt_stats_types.h  |  3 +
 drivers/gpu/drm/xe/xe_guc_submit.c      | 75 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 64 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_hw_engine_group.h |  4 +-
 drivers/gpu/drm/xe/xe_svm.c             | 29 +++-------
 drivers/gpu/drm/xe/xe_sync.c            | 29 ++++++++++
 drivers/gpu/drm/xe/xe_sync.h            |  2 +
 drivers/gpu/drm/xe/xe_vm.c              |  5 +-
 drivers/gpu/drm/xe/xe_vm_types.h        |  2 +-
 16 files changed, 322 insertions(+), 37 deletions(-)

-- 
2.34.1

