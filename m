Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD55E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 10:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF6F10E687;
	Thu, 19 Feb 2026 10:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hD2dgNcA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D54B10E687
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 10:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771498483; x=1803034483;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0sxRoQj0XhNQmChnzGFJxxJiItt1uMGgY3QXJ5wIJEQ=;
 b=hD2dgNcAUaVCTMtYqAakJPtQ2C3AsUkhaVDiaFXS9FjQTWmCd/VgNGxP
 fbpQldO1Q/JEj9lUHeqXkwEcDgGPa4nZQ11HrKVTePSUFvuY4VOm2caz+
 V0tDlIrS6SDeRIiXss2j9KhwPQWfuVi8qBX7PvZ4erMaGMXkSNC8bgJ4i
 4tP+2jl1APtCDK7eL2kFJhGYvJ/hbqME5ag1h/26R50gly4wW1QOEYjQC
 ujC3xCZk3d+Qn/rg6c56l0dU2SliZb6X4L5ugxmswrXzwnFaZwfX0Jwdx
 UH1AB5lpglaE+D+nvtCA7JP1RzRLmMHkUER4laReKPPDcBePBdq2LT3S2 w==;
X-CSE-ConnectionGUID: XOJeyKZiToCzdRr+AYy9cw==
X-CSE-MsgGUID: W/OohwuYRVeQB14shHy9ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="71604964"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="71604964"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 02:54:43 -0800
X-CSE-ConnectionGUID: ZOoq2zWOSIuTzV+MxVr17g==
X-CSE-MsgGUID: HZZzD/oJTFKkYLHwSGRrVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213163334"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa010.fm.intel.com with ESMTP; 19 Feb 2026 02:54:42 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 0/3] Fix fs_reclaim deadlock caused by CCS save/restore
Date: Thu, 19 Feb 2026 10:54:34 +0000
Message-ID: <20260219105433.2234194-5-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

CCS save/restore batch buffers are attached during BO allocation and
detached during BO teardown. The shrinker triggers xe_bo_move(), which is
used for both allocation and deletion paths.

When BO allocation and shrinking occur concurrently, a circular locking
dependency involving fs_reclaim and swap_guard can occur, leading to a
deadlock such as:

======================================================
WARNING: possible circular locking dependency detected
------------------------------------------------------

     CPU0                    CPU1
     ----                    ----
     lock(fs_reclaim);
                                  lock(&sa_manager->swap_guard);
                                  lock(fs_reclaim);
     lock(&sa_manager->swap_guard);

     *** DEADLOCK ***
=====================================================

To avoid this, the BB pointer and SA are allocated using xe_bb_alloc()
before taking lock and SA is initialized using xe_bb_init() preventing
reclaim from being invoked in this context.

V6 -> V7:
- Dropped R-B as some release sequence is changed.
- Dropped xe_bb_release() and used existing xe_bb_free().
- Dropped drm_suballoc_release() which was introduced in this patch.

V5 -> V6:
- Updated drm_suballoc_init() to drm_suballoc_insert(). (Maarten).

V4 -> V5:
- Fixed some nits (Michal).

V3 -> V4:
- Fixed some nits (Michal).

V2 -> V3:
- Created new functions xe_sa_bo_alloc(), xe_sa_bo_release() and
xe_sa_bo_init(). (Thomas)
- Created new functions xe_bb_alloc(), xe_bb_release and
xe_bb_init(). (Thomas)
- Updated guard() to scoped_guard() in xe_migrate_ccs_rw_copy(). (Thomas)
- Removed timeout logic from drm_suballoc_init(). (Thomas & Christian).

V1 -> V2:
- Split drm_suballoc_new() into drm_suballoc_alloc() and
drm_suballoc_init() (Thomas).
- Used drm_suballoc_alloc() and drm_suballoc_init() for BB allocation
(Thomas).

Satyanarayana K V P (3):
  drm/sa: Split drm_suballoc_new() into SA alloc and init helpers
  drm/xe/vf: Fix fs_reclaim warning with CCS save/restore BB allocation
  drm/xe/sa: Add lockdep annotations for SA manager swap_guard

 drivers/gpu/drm/drm_suballoc.c  | 105 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bb.c      |  59 +++++++++++++-----
 drivers/gpu/drm/xe/xe_bb.h      |   6 +-
 drivers/gpu/drm/xe/xe_migrate.c |  99 ++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_sa.c      |  36 +++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |   2 +
 include/drm/drm_suballoc.h      |   6 ++
 7 files changed, 229 insertions(+), 84 deletions(-)

-- 
2.43.0

