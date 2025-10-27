Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A191CCF9F0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 21:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBC610E565;
	Mon, 27 Oct 2025 21:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDL+MfXK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A083F10E19A
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 21:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761601377; x=1793137377;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yoFT/JJsVWbv9l0Zr2hSjW6XPJrfXjDc+jCjwQ9HC+U=;
 b=LDL+MfXKqBUQor//J884ReFCqEQKFXrGX7Obl8ErX+XpcC2N7AWO9PmW
 BPHf9EhnBflHantEEdn3CnuJSZM3HbI7/HfYlN25durvv0GMcRFWcUusc
 9NdJpWZJ0DTM+gCVO63nYCwUxw+eQ47IFyH6CajPfn8vrTDNDRVbvWxX4
 bcsmHESbR4q0bNteO4sTKJcMdG8Y1eLZM5ljW0UUWLlyHxbgB87zY1amM
 4hD9IiJXuMq7RB0TdAGcHCoZXL++Rq6uerC47zEVM8CK8N/iT6EyThzL7
 4M20WCCEx4qvDrClQN/aW3sb351bLFBUk3ueJ2Dx8BYzwEiWC2nPXiiZS g==;
X-CSE-ConnectionGUID: NtID02oPQJyaSgFnK/iZnQ==
X-CSE-MsgGUID: X3NaoOdcRoWG5/23PTcBpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74368842"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74368842"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:56 -0700
X-CSE-ConnectionGUID: 5Nf3G8EFQG6nBwsUx0UYwg==
X-CSE-MsgGUID: ruIDGxSHTrKIsDUtTHerfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184782342"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 0/8] Fix dma-fence-array ordering 
Date: Mon, 27 Oct 2025 14:42:44 -0700
Message-Id: <20251027214252.2455093-1-matthew.brost@intel.com>
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

For CI, only do not review.

Matt

Matthew Brost (8):
  drm/xe: Add last fence attachment to TLB invalidation job queues
  drm/xe: Decouple bind queue last fence from TLB invalidations
  drm/xe: Do not wait on TLB invalidations in page fault binds
  drm/xe: Don't allow in fences on zero batch exec or zero binds
  drm/xe: Remove last fence dependecy check from binds
  workqueue: Add ordered workqueue
  dma-buf: Fix dma-fence-array signaling ordering
  dma-buf: Fix dma-fence-chain signaling ordering

 drivers/dma-buf/dma-fence-array.c        |   6 +-
 drivers/dma-buf/dma-fence-chain.c        |   6 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 108 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.h       |  20 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 ++
 drivers/gpu/drm/xe/xe_migrate.c          |  14 +++
 drivers/gpu/drm/xe/xe_migrate.h          |   8 ++
 drivers/gpu/drm/xe/xe_pt.c               |  80 ++++++-----------
 drivers/gpu/drm/xe/xe_sync.c             |  74 +++++++++-------
 drivers/gpu/drm/xe/xe_tlb_inval_job.c    |  31 +++++--
 drivers/gpu/drm/xe/xe_tlb_inval_job.h    |   5 +-
 drivers/gpu/drm/xe/xe_vm.c               |  93 +++++++++++--------
 drivers/gpu/drm/xe/xe_vm_types.h         |   6 +-
 include/linux/dma-fence-array.h          |   6 +-
 include/linux/dma-fence-chain.h          |  10 +--
 include/linux/workqueue.h                |   1 +
 kernel/workqueue.c                       |   7 +-
 17 files changed, 311 insertions(+), 169 deletions(-)

-- 
2.34.1

