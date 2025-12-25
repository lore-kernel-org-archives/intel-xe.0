Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC911E784A9
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C96113F6E;
	Thu, 25 Dec 2025 01:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPxa+Lpi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC7B112ACD
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625461; x=1798161461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dliK0YEinAEy0GSK+Mu9gSToWGo/7See9z1lttLpz0w=;
 b=WPxa+LpiFf2uaMdWwfZensvgNNm4PsMieS7eIx1SwwZqIwKkHem1kSWV
 mrDdGaccXsrC7GoLtYxzibHWVl6p++g56DyGqZtEAlh8wXG/7IHCVk/1Y
 yZIPsEyNSF1VFW9mY1OxAdLkw8CpL2Y4175aJcUOyUdx0vah6sCHyv1kL
 xIJhDdQ3Vd0YopqcFI0xzHRhTQhhtIi0yS9Lvym4r8ldmbmpemIF4bXLA
 JPZS69Yq3sGCUP67LcfF6Sj8nnPdoa2KLF3td37vQPlgusa7LnqcAit2c
 Dh/mJ8BkR3J+sC0dB1x9BNnsNFdwz/ThU99I+5Qc61PEL9vqty5iL4Nur w==;
X-CSE-ConnectionGUID: JBespBEWTBSCg0JpEG8MlA==
X-CSE-MsgGUID: q9aCcROwQxONCM6cjIZvmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866354"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866354"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
X-CSE-ConnectionGUID: b03JMTO3Rw2zHhG04ZCusw==
X-CSE-MsgGUID: ifshbtyHRE+Q+Vijzw865g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629115"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 00/13] Fence deadlines in Xe 
Date: Wed, 24 Dec 2025 17:17:21 -0800
Message-Id: <20251225011734.341683-1-matthew.brost@intel.com>
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

Implement fence deadlines in Xe. The idea is that if a deadline is set
on a fence, we try hard to complete it within 3 ms of the deadline. This
means for queues tied to a fence with CAP_SYS_ADMIN, we bump the
priority, and for all queues tied to a fence, we ramp up the GPU
frequency. The expected use case is a compositor that needs a steady
frame rate but does not want to run at a higher priority than the
application rendering the frame.

Lightly tested; seems to be behaving as expected and not crashing.

Matt

Matthew Brost (13):
  drm/xe: Add dedicated message lock
  drm/xe: Add EXEC_QUEUE_FLAG_CAP_SYS_NICE
  drm/xe: Store exec queue in hardware fence
  drm/xe: Add deadline exec queue vfuncs
  drm/xe: Export to_xe_hw_fence
  drm/xe: Add deadline manager
  drm/xe: Add deadline manager to user exec queues
  drm/xe: Stub out execlists deadline vfuncs as NOPs
  drm/xe: Make scheduler message lock IRQ-safe
  drm/xe: Implement GuC submission backend ops for deadlines
  drm/xe: Enable deadlines on hardware fences
  drm/xe: Add CONFIG_DRM_XE_DEADLINE_WINDOW
  drm/xe: Add exec queue deadline trace points

 drivers/gpu/drm/xe/Kconfig.profile           |   6 +
 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/xe_deadline_mgr.c         | 219 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_deadline_mgr.h         |  26 +++
 drivers/gpu/drm/xe/xe_deadline_mgr_types.h   |  34 +++
 drivers/gpu/drm/xe/xe_exec_queue.c           |   7 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |  15 ++
 drivers/gpu/drm/xe/xe_execlist.c             |  20 ++
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  33 +--
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  11 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |   2 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 137 ++++++++++--
 drivers/gpu/drm/xe/xe_hw_fence.c             |  29 ++-
 drivers/gpu/drm/xe/xe_hw_fence.h             |   5 +-
 drivers/gpu/drm/xe/xe_hw_fence_types.h       |  13 ++
 drivers/gpu/drm/xe/xe_lrc.c                  |   6 +-
 drivers/gpu/drm/xe/xe_lrc.h                  |   3 +-
 drivers/gpu/drm/xe/xe_sched_job.c            |   2 +-
 drivers/gpu/drm/xe/xe_trace.h                |  10 +
 20 files changed, 530 insertions(+), 51 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_deadline_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_deadline_mgr.h
 create mode 100644 drivers/gpu/drm/xe/xe_deadline_mgr_types.h

-- 
2.34.1

