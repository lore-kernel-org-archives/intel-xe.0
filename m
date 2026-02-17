Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE629E68172
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 12:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAEE10E24C;
	Tue, 17 Feb 2026 12:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXFKVl0b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2774410E24C
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771330077; x=1802866077;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FQrGIVB/XD1HvxiFY7gN5XJJzeXwXE1SJcRrO2WzpfA=;
 b=mXFKVl0bujQ7eG8pPuyA5podJ0as6Taqa5EQJ8JFSsWgMns2CSJ6FAh2
 FjTypf6W5t5FsawciM/0Wgy0Jf9LgMP72Gwfr5672JIR1z6beYYMvh5UE
 Lu7xdoZ+NEmXeB7Sjmnea6khsAOjiv9yD+P0SgXySgsi2HDQENAqMtFFG
 B6H12vJS4EJ7gdExY1ZRUQN5gXDaJXkpszRbYXJGH8h5C17QnuhGBuqw6
 kHIOMKCit72GnULB53Ta0LX3gJrJ+7C6a481Lr5pSuHPa/Q1ozstH6zHs
 6kXnCVvwx1u93DA20f6dpBA0zNeMYQOeQWHVXBNDQcWDzWd6ix0nmuB5h w==;
X-CSE-ConnectionGUID: Qk0hZtNKSZKn9sdy4OHl2w==
X-CSE-MsgGUID: Ut40YqUtQFebmcEa0NEgDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89980938"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="89980938"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 04:07:57 -0800
X-CSE-ConnectionGUID: z4SS/YWjReuw3zmrF4nSLQ==
X-CSE-MsgGUID: UBFJysU1RZ2BGlgh0dtOiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="244460048"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa002.jf.intel.com with ESMTP; 17 Feb 2026 04:07:56 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v5 0/3] Fix fs_reclaim deadlock caused by CCS save/restore
Date: Tue, 17 Feb 2026 12:07:46 +0000
Message-ID: <20260217120745.1074232-5-satyanarayana.k.v.p@intel.com>
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

 drivers/gpu/drm/drm_suballoc.c  | 110 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bb.c      |  72 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_bb.h      |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c |  99 +++++++++++++++-------------
 drivers/gpu/drm/xe/xe_sa.c      |  45 +++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |   3 +
 include/drm/drm_suballoc.h      |   8 +++
 7 files changed, 259 insertions(+), 85 deletions(-)

-- 
2.43.0

