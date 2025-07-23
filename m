Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58DAC83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 18:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C3410E08C;
	Wed, 23 Jul 2025 18:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEKqs4eN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE49110E08C
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 18:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753294945; x=1784830945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0wUkgNAF2N+oG7ngTzhc7M0V9lKNkd2M5VjFmVpuHpE=;
 b=TEKqs4eN2j9QIRwaZM+DYCFHVmvGt954Fw8xmJJUERzYj6iZU0NoXxIs
 blQETcM5TJxEWW62JCvzpfaFDzVk4/41Eymfg42pGeeo8qxSG8aQgc67D
 UUKijunT4fbywIzHr9tGqDfXgn0GVpdgkEAAkLM/+X7WusNg5LGLXuyrf
 kvJo9aSR92tLLnD6OdCOOUQ4hek2xUgXpyUzaFEnJ4L1zIBAHDzCC7+vZ
 SVQT6zNHTnJ2y/frFVATV7JCZNOsuEzzee4mvgCg1mYBr+zvtB75O34VQ
 5NzPgaPPodbrfVmvUYxxRAKYGkalWPEaotnqnZObr508vKEaQC42pns0N g==;
X-CSE-ConnectionGUID: EWDKVUwERbKWA9TdDGjBcw==
X-CSE-MsgGUID: 6JriTDxfSiaQK7tPDasjZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59249608"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="59249608"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 11:22:25 -0700
X-CSE-ConnectionGUID: JYxNuUMlRaa+I5ii5BZhDA==
X-CSE-MsgGUID: EW9vS45uTW+yT8+ieOD6fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="159670593"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT166ARLU.fm.intel.com) ([10.105.23.66])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 11:22:24 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 maarten.lankhorst@linux.intel.com, farah.kassabri@intel.com,
 intel-xe@lists.freedesktop.org, stuartsummers <stuart.summers@intel.com>
Subject: [PATCH 0/5] Add TLB invalidation abstraction
Date: Wed, 23 Jul 2025 18:22:17 +0000
Message-Id: <20250723182222.48423-1-stuart.summers@intel.com>
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

This is a new collection of patches from Matt that has
been floating around internally and on the mailing list.
The goal here is to abstract the actual mechanism of
the invalidation from the higher level invalidation triggers
(like page table updates).

Most of these were brought in unmodified by Matt, but
I've done some minor rebase work here and there and
added my signoff where those rebases seemed a little
more extensive.

This is built on top of [1] and [2]. I've also brought
in [3] and [4] individually from a separate series
from Matt.

Stuart

[1] https://patchwork.freedesktop.org/series/151670/#rev1
[2] https://patchwork.freedesktop.org/series/150402/#rev3
[3] https://lists.freedesktop.org/archives/intel-xe/2024-July/041363.html
[4] https://lists.freedesktop.org/archives/intel-xe/2024-July/041364.html

Matthew Brost (5):
  drm/xe: Add xe_gt_tlb_invalidation_done_handler
  drm/xe: Decouple TLB invalidations from GT
  drm/xe: Prep TLB invalidation fence before sending
  drm/xe: Add helpers to send TLB invalidations
  drm/xe: Split TLB invalidation code in frontend and backend

 drivers/gpu/drm/xe/Makefile                   |   5 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |   6 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   6 +-
 drivers/gpu/drm/xe/xe_gt_tlb_inval.c          | 600 ------------------
 drivers/gpu/drm/xe/xe_gt_tlb_inval.h          |  40 --
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h      |  34 -
 drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h    |  64 --
 drivers/gpu/drm/xe/xe_gt_types.h              |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c         | 263 ++++++++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.h         |  19 +
 drivers/gpu/drm/xe/xe_lmtt.c                  |  12 +-
 drivers/gpu/drm/xe/xe_migrate.h               |  10 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  63 +-
 drivers/gpu/drm/xe/xe_svm.c                   |   1 -
 drivers/gpu/drm/xe/xe_tlb_inval.c             | 411 ++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h             |  47 ++
 ..._gt_tlb_inval_job.c => xe_tlb_inval_job.c} | 154 +++--
 drivers/gpu/drm/xe/xe_tlb_inval_job.h         |  34 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h       | 138 ++++
 drivers/gpu/drm/xe/xe_trace.h                 |  24 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  26 +-
 22 files changed, 1073 insertions(+), 888 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval.c
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_inval.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_inval.h
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval.c
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval.h
 rename drivers/gpu/drm/xe/{xe_gt_tlb_inval_job.c => xe_tlb_inval_job.c} (51%)
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval_job.h
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval_types.h

-- 
2.34.1

