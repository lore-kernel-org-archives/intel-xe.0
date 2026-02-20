Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591B9C54EFC
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 05:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0247610E1C7;
	Fri, 20 Feb 2026 05:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GElGZaf4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DF910E1C7
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771566930; x=1803102930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lg53VxFbHxfGY/wAln28T0RY33tbAErnxON2exRpu5U=;
 b=GElGZaf4JsGyEUerjT3XBx+/b/UgRGuIlKVWvXMpfhmfDTxDDIqft7Ix
 fJ4+45bF/OY+aZQ2RF7tXuZYaJdWjA7Fv8U+JWuQ9v+R8G03MqSjnucji
 HlOBuNsVfhL7VNZtah3V7swYPJAkZrIVmQoeNQdq6NyfnzXaWIkfVuU9K
 H4k4exq3OtQSBXP1jzbLEQ80xZUcOWWO94q9gdZ8F1nJFAdASAm9czpUD
 CEXwRzZYgMuinkqiOI7lCuHFSsa1xffLfLUt2CxK/9xcW0Fr8c+ntF8m4
 YkIhfUnIUbDh/bfVBOB8g4QILCj3uhTVvXCOeqbCwrZTO+Fb0Wdg4iAGQ A==;
X-CSE-ConnectionGUID: ZdcLqtHHQ3mnxYW+XY5zTA==
X-CSE-MsgGUID: hEomf1EgRIWnZQ3swYMqLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72723179"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72723179"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 21:55:29 -0800
X-CSE-ConnectionGUID: 6IAbWooARtCYOlMLjpiABw==
X-CSE-MsgGUID: dbtSu/0kQpW6P1fbv/eaiQ==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa003.fm.intel.com with ESMTP; 19 Feb 2026 21:55:28 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v8 0/3] Fix fs_reclaim deadlock caused by CCS save/restore
Date: Fri, 20 Feb 2026 05:55:20 +0000
Message-ID: <20260220055519.2485681-5-satyanarayana.k.v.p@intel.com>
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

V7 -> V8:
- Add missing sa->manager=NULL in the error flow in drm_suballoc_insert()
(Matt).

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

 drivers/gpu/drm/drm_suballoc.c  | 106 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bb.c      |  59 +++++++++++++-----
 drivers/gpu/drm/xe/xe_bb.h      |   6 +-
 drivers/gpu/drm/xe/xe_migrate.c |  99 +++++++++++++++--------------
 drivers/gpu/drm/xe/xe_sa.c      |  36 +++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |   2 +
 include/drm/drm_suballoc.h      |   6 ++
 7 files changed, 230 insertions(+), 84 deletions(-)

-- 
2.43.0

