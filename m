Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B07D43352
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 21:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A90B10E06C;
	Thu, 11 Dec 2025 21:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nGMCKsCJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A9F10E06C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765486837; x=1797022837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4wj9jL858y/CpOzJCi2NueUylQ981N6jC5Sfq659aas=;
 b=nGMCKsCJ2RYHULnG0b2Gsmr2rlb7UK5Ry/o0xcQNVNvO3KFmpSvzlPpU
 iNhY3tD7J6Vm+a6zwTeDQL+X+wAz1I/Bh6/Tw7zWKJxXD2V4b2+u42s8m
 I1hlWpwXHjkJGf1f8bYUVMiQt5W3S8dfhzWxsFq5ihEr68YwsDjhsQLvv
 PIiPh/45uQdhzzMdC6yDdsDfFQB+F6WphUhZcv/lsZLi2YTp6YtslcFMe
 AvJV6e6vme9XBpz1FgD0DuyzhMpj0S5GxsjxhkdWtANyhRkgDI5eOL5i9
 dbyqZj52EqDeoy894FFcDMUSDEV2iRc6U/mhwaAUitt8v533vy2EGiFrr w==;
X-CSE-ConnectionGUID: S/Mapj8jRviKbnly3yvBaQ==
X-CSE-MsgGUID: e/NCpDTbT7uoQptic/18vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67649717"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67649717"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:00:37 -0800
X-CSE-ConnectionGUID: mOkSKuurTg6ibyhMVlk7Dg==
X-CSE-MsgGUID: 5Lo/s16IRAOwbGzBcVc0xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="234297941"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:00:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH 0/6] Fix performance when pagefaults and 3d/display share
 resources
Date: Thu, 11 Dec 2025 13:00:26 -0800
Message-Id: <20251211210032.1520113-1-matthew.brost@intel.com>
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

Matt

[1] https://github.com/intel-sandbox/xello_raytracer

Matthew Brost (6):
  drm/xe: Adjust long-running workload timeslices to reasonable values
  drm/xe: Use usleep_range for accurate long-running workload
    timeslicing
  drm/xe: Add debugfs knobs to control long running workload timeslicing
  drm/xe: Skip exec queue schedule toggle if queue is idle during
    suspend
  drm/xe: Wait on in-syncs when swicthing to dma-fence mode
  drm/xe: Add more GT stats around pagefault mode switch flows

 drivers/gpu/drm/xe/xe_debugfs.c         | 74 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h    |  6 ++
 drivers/gpu/drm/xe/xe_exec.c            |  3 +-
 drivers/gpu/drm/xe/xe_exec_queue.h      | 17 ++++++
 drivers/gpu/drm/xe/xe_gt_stats.c        |  6 ++
 drivers/gpu/drm/xe/xe_gt_stats_types.h  |  3 +
 drivers/gpu/drm/xe/xe_guc_submit.c      | 46 +++++++++++++--
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 66 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_hw_engine_group.h |  4 +-
 drivers/gpu/drm/xe/xe_sync.c            | 14 +++++
 drivers/gpu/drm/xe/xe_sync.h            |  1 +
 drivers/gpu/drm/xe/xe_vm.c              |  5 +-
 drivers/gpu/drm/xe/xe_vm_types.h        |  2 +-
 14 files changed, 232 insertions(+), 16 deletions(-)

-- 
2.34.1

