Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E402ECCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 23:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E9E10E110;
	Fri, 31 Oct 2025 23:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e0p3lV5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E96610E0F9
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 23:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761954058; x=1793490058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mVZLUraBSYbW8nqvY1aOnNhXmwqYap+QF+AX/a6hPkQ=;
 b=e0p3lV5LQbBQXbaXJidhMNSvzsMexhT685FhG9bPv2k/GpvcCWUp7DsC
 uSq84EK2iNZJojAQ70NBiAhrJSj9X5LFKtDshprt4VXxGC9C/6H/pXKfC
 opSiUkOW79fq54FPLuErpg0LsZNmU7dash1lncyEeY4cnWLhQZwT8EB0t
 L5+XCMEWiqDmjcQngMDROmelTj2OwNcHjbxDsrebc7P0v3Nd4DwoKxWnL
 fLiaKQDxAz3fSAI0bm+uXxLVipJGxVK+YfZoLFBfYnAaueqeKFGsL+BeJ
 TBovKE+RkPzHyEpJ8WAsZ/uigHwPoGW3KpHYZycrABlAH6vU3bFTjEqD/ w==;
X-CSE-ConnectionGUID: CwKnMvYAQCyKQ+Tdi+97bw==
X-CSE-MsgGUID: wu40835AR+i4W/EXnpooGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="81749184"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="81749184"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 16:40:58 -0700
X-CSE-ConnectionGUID: 7AHFJh2XRtaEIcGPRnFygw==
X-CSE-MsgGUID: QKMrBZmZTpS/EQzNqppbWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="223595471"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 16:40:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 0/6] Fix serialization on burst of unbinds - v2
Date: Fri, 31 Oct 2025 16:40:44 -0700
Message-Id: <20251031234050.3043507-1-matthew.brost@intel.com>
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

Attempting to resolve part of [1]; this solution differs than v1 [2] by
changing last fence semantics detailed in the patches.

Overview of issue in [1]:

When a burst of unbind jobs is issued, a dependency chain can form
between the TLB invalidation of a previous unbind job and the current
one. This leads to undesirable serialization, causing current jobs to
wait unnecessarily for prior TLB invalidations, execute on the GPU when
not needed, and significantly slow down the unbind burst—resulting in up
to a 4× to 8× slowdown depending on platform.
 
Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
[2] https://patchwork.freedesktop.org/series/156144/

Matthew Brost (6):
  drm/xe: Enforce correct user fence signaling order using
  drm/xe: Attach last fence to TLB invalidation job queues
  drm/xe: Decouple bind queue last fence from TLB invalidations
  drm/xe: Skip TLB invalidation waits in page fault binds
  drm/xe: Disallow input fences on zero batch execs and zero binds
  drm/xe: Remove last fence dependency check from binds and execs

 drivers/gpu/drm/xe/xe_exec.c             |   7 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 120 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.h       |  23 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  12 +++
 drivers/gpu/drm/xe/xe_migrate.c          |  14 +++
 drivers/gpu/drm/xe/xe_migrate.h          |   8 ++
 drivers/gpu/drm/xe/xe_oa.c               |  45 ++++++---
 drivers/gpu/drm/xe/xe_oa_types.h         |   8 ++
 drivers/gpu/drm/xe/xe_pt.c               |  80 +++++----------
 drivers/gpu/drm/xe/xe_sched_job.c        |  17 ----
 drivers/gpu/drm/xe/xe_sched_job.h        |   1 -
 drivers/gpu/drm/xe/xe_sync.c             |  91 ++++++++++-------
 drivers/gpu/drm/xe/xe_sync.h             |   3 +
 drivers/gpu/drm/xe/xe_sync_types.h       |   3 +
 drivers/gpu/drm/xe/xe_tlb_inval_job.c    |  31 ++++--
 drivers/gpu/drm/xe/xe_tlb_inval_job.h    |   5 +-
 drivers/gpu/drm/xe/xe_vm.c               |  97 +++++++++++-------
 drivers/gpu/drm/xe/xe_vm_types.h         |   6 +-
 18 files changed, 377 insertions(+), 194 deletions(-)

-- 
2.34.1

