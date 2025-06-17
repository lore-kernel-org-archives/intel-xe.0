Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CD6C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 15:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910A510E36D;
	Tue, 17 Jun 2025 15:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNhaMsuP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF9110E3F0
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 15:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750174581; x=1781710581;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rEnlkuIQjlQsFTP69DKAYdbnZpuSIAzi91nWVazFnAw=;
 b=kNhaMsuPx8D/wxLx/YzSSU2EsbNOl9y7qm0LqxrNuql2ZFHU01NsmCUz
 HN8BVjvvEJ1mwzqVBsg91YOKT2RBuPiMkxi19gF/YOSUTt0eeF+dYD1Vw
 3m2qcfkaA1UUOyLfhr/a3ocjy/ncpR1FhnBt9gksy9wxf9MXsq+mW5sgm
 2Ipf8JA0SU5ScApRBmFRYXQ+BfBNlblx/YF2CWl7PHUDBLHiHcCBAeUzM
 muPafw9OTJfiOVcm4lNjVLBxtFmxI6RyjmuP1bC7lMYFQuhUHAkzVsWPY
 3HynkHxJbyqCyWRxChGJy8SydgYKGuAFmNAXMUP2zl1GrUey9ebkPotWK A==;
X-CSE-ConnectionGUID: PEzrPVZuRmOAy+g8BalkXQ==
X-CSE-MsgGUID: EKsZXxkcQ5i/DUtGMtGqLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52230873"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52230873"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:36:14 -0700
X-CSE-ConnectionGUID: OzTqu1yHTfGy30wLHv0iBA==
X-CSE-MsgGUID: 5ujSdYKrToeORF2Qv3eg4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148667721"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:35:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 matthew.auld@intel.com
Subject: [PATCH 0/6] Use DRM scheduler for delayed GT TLB invalidations 
Date: Tue, 17 Jun 2025 08:37:24 -0700
Message-Id: <20250617153730.2136174-1-matthew.brost@intel.com>
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

Use the DRM scheduler for delayed GT TLB invalidations, which properly
fixes the issue raised in [1]. GT TLB fences have their own dma-fence
context, so even if the invalidations are ordered, the dma-resv/DRM
scheduler cannot squash the fences. This results in O(M*N*N) complexity
in the garbage collector, where M is the number of ranges in the garbage
collector and N is the number of pending GT TLB invalidations.

Admittedly, it's quite a lot of code, but the series includes extensive
kernel documentation and clear code comments. It introduces a generic
dependency scheduler that can be reused in the future and is logically
much cleaner than the previous open-coded solution for delaying GT TLB
invalidations until a bind job completes.

Matt

[1] https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1

Matthew Brost (6):
  drm/xe: Explicitly mark migration queues with flag
  drm/xe: Add generic dependecy jobs / scheduler
  drm/xe: Add dependency scheduler for GT TLB invalidations to bind
    queues
  drm/xe: Add xe_migrate_job_lock/unlock helpers
  drm/xe: Add GT TLB invalidation jobs
  drm/xe: Use GT TLB invalidation jobs in PT layer

 drivers/gpu/drm/xe/Makefile              |   2 +
 drivers/gpu/drm/xe/xe_dep_job_types.h    |  29 +++
 drivers/gpu/drm/xe/xe_dep_scheduler.c    | 145 ++++++++++++
 drivers/gpu/drm/xe/xe_dep_scheduler.h    |  21 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       |  24 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  15 ++
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c | 274 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h |  34 +++
 drivers/gpu/drm/xe/xe_migrate.c          |  44 +++-
 drivers/gpu/drm/xe/xe_migrate.h          |  13 ++
 drivers/gpu/drm/xe/xe_pt.c               | 193 +++++++---------
 11 files changed, 678 insertions(+), 116 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
 create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h

-- 
2.34.1

