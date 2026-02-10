Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DF0E7E0DB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 10:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E964F10E550;
	Tue, 10 Feb 2026 10:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lW5lKt7L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25D910E550
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770721180; x=1802257180;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0UBA4uQscYsk/0zIgKy+U8p7aJOC3JNU+U85AhTCeZE=;
 b=lW5lKt7LsznffYPTlfKHSDA+qyaRAHPA6TtxHWemDkaVTvWWrNmT2SJo
 HFIY8E151uWlq0t7ZidSI8+s6YqtnHyayO5NIr9WeOTTwLEGS0q+VKz/H
 aIeiMIGDxV2xSLYephPS1gwvsxS2WTvRmvbSKJMC8vbDT6F1lzgXuafmq
 Wz2RZ3gmnfJGRiu1TFmKn0x2z3zElXqXr9Qu13ZVcONR0YYMG3pM4rGVF
 farCOqs7TB0Mf55CI0fRm7yoADiA4JO3QaIAHYFbgq5KLHeZls5FBxHkl
 BU8RkkoyfUXobUXaEV3mfM9hWrca1MPp6lVIlR6udPpLQSGCxJDERHen5 Q==;
X-CSE-ConnectionGUID: MEoUPLpzQ82LHv7O4MCZxg==
X-CSE-MsgGUID: OmGw+LyrSJyBYGWLDvXkxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71056497"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71056497"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 02:59:39 -0800
X-CSE-ConnectionGUID: 5C94llh4TWKig5QWIkC2uw==
X-CSE-MsgGUID: Gqy3WjbjTDaJ87PDs//0ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242510329"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa002.jf.intel.com with ESMTP; 10 Feb 2026 02:59:38 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 0/3] Fix fs_reclaim deadlock caused by CCS save/restore
Date: Tue, 10 Feb 2026 10:59:30 +0000
Message-ID: <20260210105929.4089794-5-satyanarayana.k.v.p@intel.com>
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

 drivers/gpu/drm/drm_suballoc.c  | 110 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bb.c      |  49 +++++++++-----
 drivers/gpu/drm/xe/xe_bb.h      |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c |  96 +++++++++++++++-------------
 drivers/gpu/drm/xe/xe_sa.c      |  46 +++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |   3 +
 include/drm/drm_suballoc.h      |   8 +++
 7 files changed, 238 insertions(+), 81 deletions(-)

-- 
2.43.0

