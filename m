Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97205E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374EF10E5E9;
	Wed, 18 Feb 2026 15:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLy7mh+p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69ECF10E2F8
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771429661; x=1802965661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9TsHe4a2bDmVRytEtBbjwOJEXr2tXlwY/EYax/ul4T4=;
 b=WLy7mh+pQ7Zoq4JxvK0aL0gWFV4xK4Jyokr6zKnBbGVMr/K0Ip11jZ4O
 VzEeKIX6gLJ2EjyYD3mFfFrB8Jf52Dl8a55GIsjeqQaEttdqahmCw8FG9
 ePQxmRB9W4E03Ykk3YjB2lSekoTtc0j7dIDxaOuqUwIrDmx8ScwRr3/VY
 Q2o2laLNPReBRYEvobNG6qEzpxqXBSshT8wAmLDeq0oGYDFSfpnzctmey
 DWRO9wTvJi7qGXm4+AB6+8H2cgwzsVzssaR1brtX3qVG0S8/kKjl2pmLP
 mkdeHLFugG9w/HckbMS4ZWBaLTIL+gUuaqzV2p940K1+i6Bp1rkCioXgJ A==;
X-CSE-ConnectionGUID: lXVhQQeeTby9oj9jYdV2qg==
X-CSE-MsgGUID: OlVIRgftS1u0xnevEMayFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83224389"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="83224389"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:47:38 -0800
X-CSE-ConnectionGUID: nr9it7gDRUG1vEWXjIwQCg==
X-CSE-MsgGUID: 0gj6TbrFTLyLcnj/petpaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="212889137"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa007.fm.intel.com with ESMTP; 18 Feb 2026 07:47:37 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v6 0/3] Fix fs_reclaim deadlock caused by CCS save/restore
Date: Wed, 18 Feb 2026 15:47:29 +0000
Message-ID: <20260218154728.1508151-5-satyanarayana.k.v.p@intel.com>
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

 drivers/gpu/drm/drm_suballoc.c  | 114 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bb.c      |  72 +++++++++++++++-----
 drivers/gpu/drm/xe/xe_bb.h      |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c |  99 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_sa.c      |  45 +++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |   3 +
 include/drm/drm_suballoc.h      |   8 +++
 7 files changed, 262 insertions(+), 86 deletions(-)

-- 
2.43.0

