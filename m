Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EF9EB491B
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 13:02:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A0210E734;
	Thu, 12 Feb 2026 13:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/i5QOsx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9050410E734
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770901374; x=1802437374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nx9d+nwipd2AQnjmhxQDZ89CH7TZysVUAU6iM/fHEg0=;
 b=n/i5QOsx/HTB+/wh3JiJhX+qNp7ws+pfW8TR+5pOG+M3HYGPCYQbt9MD
 ZJZFvjmZv8PfprV/etVsRF81qLqyleOfuPJaKPjPoHKkOLCV3R8mj/5U1
 KPvYND+MW3ETyDGpr7R6fqLqFZfzjKRlQK9Ox5+zgGnrCfIU/8SYDVccy
 yhjbwKQAeJQ4UXFtVuoyFhqY8XGxSXtTmPrChRuJvlDNg58dkFtQUc+4x
 tcEHks+kpcYbGEIeB6ozjINIZKcoSGvHKNwiaBjsv1jHGKLPw0/4HGE0h
 nzs+JVABBzANqWj9IgVqRwBBUq5hgGZA5L+lfQGnl7MvMxLlnCXfnB6gV g==;
X-CSE-ConnectionGUID: ABC0tKlIT9WuakT0UB6GkQ==
X-CSE-MsgGUID: z2YaX03TS1GdCwc7EwiZ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89479421"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="89479421"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 05:02:53 -0800
X-CSE-ConnectionGUID: gGYu6a5dRVqe0DQ9ISP58g==
X-CSE-MsgGUID: 2qUs9gGPRMyDSimPdKrLuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212423902"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa009.jf.intel.com with ESMTP; 12 Feb 2026 05:02:52 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 0/3] Fix fs_reclaim deadlock caused by CCS save/restore
Date: Thu, 12 Feb 2026 13:02:44 +0000
Message-ID: <20260212130243.399353-5-satyanarayana.k.v.p@intel.com>
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

 drivers/gpu/drm/drm_suballoc.c  | 110 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bb.c      |  72 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_bb.h      |   6 +-
 drivers/gpu/drm/xe/xe_migrate.c |  99 +++++++++++++++-------------
 drivers/gpu/drm/xe/xe_sa.c      |  45 +++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |   3 +
 include/drm/drm_suballoc.h      |   8 +++
 7 files changed, 259 insertions(+), 84 deletions(-)

-- 
2.43.0

