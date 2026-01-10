Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14208D277CA
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 01:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C1310E2BD;
	Sat, 10 Jan 2026 01:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juXipzj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737FF10E234
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 01:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768008468; x=1799544468;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wJt6vgvow0QhZCm0V9GE5hAmBzh5C/FFCmnKTGtw8PI=;
 b=juXipzj+R9jqJzzS7lyzqvvGuexdJcrTzHK//jdfd9KXtoBdEeIU3fcQ
 NkPMuAtDgyiq3k578GVwJkeeFr3ooXyyAYoQ3+gc5QSQQss5lJ4ldaNx2
 iBOKN7qDnU2UnhdnrT9l6bjmQ41BkgZxQbyz5WkCAeEfXLSYDRahxTJxQ
 c863m/1YOizTCb8lhj1byKZ0m5Xy0XZRFGN12fPI+5W3OLCVXoXQ98YUR
 cxpXPnkoZzlhRlfsWGjWMf7Mjd4Q7mu6+f8rXUqKixXAiwdbzOVvpyL/b
 CjBhLCPC0FLIz/qGBVzceteQ2T0+0+oi2IK0uDlAyxhn8Qqn9aohf13vz A==;
X-CSE-ConnectionGUID: XHDQLC2JTcygt/r3Lq8gYQ==
X-CSE-MsgGUID: g3XpMNG/RIeb2vn4nk0H1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73021812"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="73021812"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 17:27:47 -0800
X-CSE-ConnectionGUID: sIIWPAuUQN+aCiqPpN41bQ==
X-CSE-MsgGUID: ZOjJrgc6TRytI6vhV/5iZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="208132047"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 17:27:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 0/7] Fix DRM scheduler layering violations in Xe
Date: Fri,  9 Jan 2026 17:27:32 -0800
Message-Id: <20260110012739.2888434-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

At XDC, we discussed that drivers should avoid accessing DRM scheduler
internals, misusing DRM scheduler locks, and adopt a well-defined
pending job list iterator. This series proposes the necessary changes to
the DRM scheduler to bring Xe in line with that agreement and updates Xe
to use the new DRM scheduler API.

While here, cleanup LR queue handling and simplify GuC state machine in
Xe too. Also rework LRC timestamp sampling to avoid scheduling toggle.

v2:
 - Fix checkpatch / naming issues
v3:
 - Only allow pending job list iterator to be called on stopped schedulers
 - Cleanup LR queue handling / fix a few misselanous Xe scheduler issues
v4:
 - Address Niranjana's feedback
 - Add patch to avoid toggling scheduler state in the TDR
v5:
 - Rebase
 - Fixup LRC timeout check (Umesh)
v6:
 - Fix VF bugs (Testing)
v7:
 - Disable timestamp WA on VF
v9:
 - CI rerun

Matt

Matthew Brost (7):
  drm/xe: Add dedicated message lock
  drm/xe: Stop abusing DRM scheduler internals
  drm/xe: Only toggle scheduling in TDR if GuC is running
  drm/xe: Do not deregister queues in TDR
  drm/xe: Remove special casing for LR queues in submission
  drm/xe: Disable timestamp WA on VFs
  drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR

 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |   9 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  37 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |   2 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 -
 drivers/gpu/drm/xe/xe_guc_submit.c           | 366 +++----------------
 drivers/gpu/drm/xe/xe_guc_submit_types.h     |  11 -
 drivers/gpu/drm/xe/xe_hw_fence.c             |  16 -
 drivers/gpu/drm/xe/xe_hw_fence.h             |   2 -
 drivers/gpu/drm/xe/xe_lrc.c                  |  45 ++-
 drivers/gpu/drm/xe/xe_lrc.h                  |   3 +-
 drivers/gpu/drm/xe/xe_ring_ops.c             |  25 +-
 drivers/gpu/drm/xe/xe_sched_job.c            |   1 +
 drivers/gpu/drm/xe/xe_sched_job_types.h      |   2 +
 drivers/gpu/drm/xe/xe_trace.h                |   5 -
 14 files changed, 128 insertions(+), 398 deletions(-)

-- 
2.34.1

