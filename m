Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27929C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 02:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B0810E052;
	Mon, 12 Aug 2024 02:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcLK8A/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94D310E052
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 02:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723430788; x=1754966788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0N7cF1B8m1oz73WStfu1QFcCqPOhauHT5j/OikBvSUU=;
 b=OcLK8A/6yD4rQWfDGoz6FyUbP1EYMNmlnTgK0Pf5B8jlqIUXuQTbYMCg
 vRbBqzMnfq0vr+BtQKWvewzLtGlkoJcgQD4N6qGH+CnQSjAAmqNTxI79P
 9eeqXCUtBST2js38xZy5a6nBcBttBgBfNUM61dGXY4kzgQPlcYIhZNqaw
 zunxUFxBcsmGLSM4VokbAef4W5oH3PWx03jp2CVWy1IrjMmNT1/5rjyJ8
 89SzBbQGJHcUL18rRsfph6bZIUgZAODdP91uwpIKgiZgDuAFHOslhJfnf
 8zkIfpmiAu3cgai98dEcUIj+z01xi2754mOiVDVbgxx/QB7GaA/Xt3hUB g==;
X-CSE-ConnectionGUID: jrBNU+AiQLKfLGBaC/+fxw==
X-CSE-MsgGUID: Xp09lMh2QCejFXA+HZ8Ilw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32099516"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32099516"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
X-CSE-ConnectionGUID: DtClXy2cSj+Ptrip8AhC8Q==
X-CSE-MsgGUID: V/PVwMC4Q/CIqGsdMdpyyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62256296"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 0/8] ULLS for kernel submission of migration jobs
Date: Sun, 11 Aug 2024 19:47:09 -0700
Message-Id: <20240812024717.3584636-1-matthew.brost@intel.com>
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

Ultra low latency for kernel submission of migration jobs.

The basic idea is that faults (CPU or GPU) typically depend on migration
jobs. Faults should be addressed as quickly as possible, but context
switches via GuC on hardware are slow. To avoid context switches,
perform ULLS in the kernel for migration jobs on discrete faulting
devices with an LR VM open.

This is implemented by switching the migration layer to ULLS mode upon
opening an LR VM. In ULLS mode, migration jobs have a preamble and
postamble: the preamble clears the current semaphore value, and the
postamble waits for the next semaphore value. Each job submission sets
the current semaphore in memory, bypassing the GuC. The net effect is
that the migration execution queue never gets switched off the hardware
while an LR VM is open.

There may be concerns regarding power management, as the ring program
continuously runs on a copy engine, and a force wake reference to a copy
engine is held with an LR VM open.

The implementation has been lightly tested but seems to be working.

This approach will likely be put on hold until SVM is operational with
benchmarks, but it is being posted early for feedback and as a public
checkpoint.

Matt

Matthew Brost (8):
  drm/xe: Add xe_hw_engine_write_ring_tail
  drm/xe: Add ULLS support to LRC
  drm/xe: Add ULLS flags for jobs
  drm/xe: Add ULLS migration job support to migration layer
  drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
  drm/xe: Add ULLS migration job support to ring ops
  drm/xe: Add ULLS migration job support to GuC submission
  drm/xe: Enable ULLS migration jobs when opening LR VM

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |  26 +++-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  10 ++
 drivers/gpu/drm/xe/xe_hw_engine.h             |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  49 +++++++
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
 drivers/gpu/drm/xe/xe_lrc_types.h             |   2 +
 drivers/gpu/drm/xe/xe_migrate.c               | 130 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_migrate.h               |   4 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  32 +++++
 drivers/gpu/drm/xe/xe_sched_job_types.h       |   3 +
 drivers/gpu/drm/xe/xe_vm.c                    |  10 ++
 12 files changed, 268 insertions(+), 8 deletions(-)

-- 
2.34.1

