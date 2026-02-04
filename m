Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBA5E9D410
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 16:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31C310E6CC;
	Wed,  4 Feb 2026 16:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ag5YLyY2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFCC10E6CC
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770223616; x=1801759616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8AH2Ai6beYD+EeN+O8HAwtuvH0YIwAFMCctwrToxxRo=;
 b=Ag5YLyY2XChM9ZcoU+TZM0XQl+vStTzoEgKU8SYiKjmDjvrPpBbEW0ZC
 BLovcjlISInXCfQmn6fsY8o0UKPPWQ0EVrNzPRI62tHyrVk7HPml3xiPW
 lBKQEp053PtUfSWlEKqbOrhD85T8SespMFuV9OcjqQ5sVOfH2S5ns0CIG
 QFo2xa6nwas0FskidusMu7y7PwQheyfWrQp3mFV4FwRP6wFYnOX97yaI/
 7jYC5C1Vl6pYTq9FnVnATY+7B2q6XJ4PiEdJoM9kLN7giqzKgchq8ResA
 y24NKutdGPgb4VAHDM4S+Ng9N8tvpikZCrfa6sFgInk7piQwTgYjrkb7D Q==;
X-CSE-ConnectionGUID: fR7c4qGeQheAUR4KK0Jl6w==
X-CSE-MsgGUID: DyTqyqrmSoieeFnObSXDyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70433614"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="70433614"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:46:55 -0800
X-CSE-ConnectionGUID: YAT4RefiRGmjk8t91LkkTQ==
X-CSE-MsgGUID: scmYBmwzS6i7O5amsOTjYA==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2026 08:46:54 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 0/3] Fix fs_reclaim deadlock caused by CCS save/restore
Date: Wed,  4 Feb 2026 16:46:43 +0000
Message-ID: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
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

CCS save/restore batch buffers are currently attached during BO allocation
and detached during BO teardown. The shrinker also triggers xe_bo_move(),
which is used for both allocation and deletion paths.

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
***  DEADLOCK   ***
=====================================================

To avoid this, the BB pointer allocation is separated from xe_bb_ccs_new(),
used drm_suballoc_alloc() for SA allocation and drm_suballoc_init() for BB
allocation preventing reclaim from being invoked in this context.

---
V1 -> V2:
- Splitted drm_suballoc_new() into drm_suballoc_alloc() and
drm_suballoc_init() (Thomas).
- Used drm_suballoc_alloc() and drm_suballoc_init() for BB allocation
(Thomas).

Satyanarayana K V P (3):
  drm/sa: Split drm_suballoc_new() into SA alloc and init helpers
  drm/xe/sa: Add lockdep annotations for SA manager swap_guard
  drm/xe/vf: Fix fs_reclaim warning with CCS save/restore BB allocation

 drivers/gpu/drm/drm_suballoc.c  | 135 ++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_bb.c      |  22 ++----
 drivers/gpu/drm/xe/xe_bb.h      |   4 +-
 drivers/gpu/drm/xe/xe_migrate.c |  29 ++++++-
 drivers/gpu/drm/xe/xe_sa.c      |  30 +++++++
 drivers/gpu/drm/xe/xe_sa.h      |  19 +++++
 include/drm/drm_suballoc.h      |   8 ++
 7 files changed, 196 insertions(+), 51 deletions(-)

-- 
2.43.0

