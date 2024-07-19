Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8A5C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 16:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4FE10EC5D;
	Fri, 19 Jul 2024 16:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGoepnjS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D86210EC59
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 16:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721407767; x=1752943767;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u1c84FnHqLJ8Tv/HmL6u+MJuhHmomuRVM9KFwfcHe6k=;
 b=JGoepnjS+jyZ0qdbswY5J82Y+RoRuJcS6yOg7rxDgKvZYvkykvmlCmTx
 VbhJhSWr5MFkN+H2PPg2GAEmUZNKZpXWLDb+KUECsbvC4V11pTVIxZ2xT
 JhrKre0OL8kR5G0qBCEKvHamPaQrtBrAjLUYZZRS0MfS24fRh5VUOE3lB
 +4sBQP0ULHCkmKaUBbagBckIVb0uAGW/uuJ3eTN0tN7Mwb00Aab+6T0gc
 kq8zHC5UU34FOvs9JzjpyJnQ+bgssxIsd8QyO/gR6PfMrGndVnEr4qzbs
 XD8y6pdN16oE5gwhs4r1CeYpkLw+UrVDM9kmieikdMg87PKskVYpOX7XQ A==;
X-CSE-ConnectionGUID: MiMlt+1ISEKwvL1lvV7pCw==
X-CSE-MsgGUID: z1AjoC5ESWCycpJEin1dqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18651475"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18651475"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 09:49:26 -0700
X-CSE-ConnectionGUID: SM6MBvO6QKiauyh+tDJXpA==
X-CSE-MsgGUID: ahALZyTzQAKo1Epekg6BYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51192716"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 09:49:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/4] Keep device awake TLB invalidations and G2H in flight
Date: Fri, 19 Jul 2024 09:50:08 -0700
Message-Id: <20240719165012.1512428-1-matthew.brost@intel.com>
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

Combine [1], [2] to fix PM issues

[1] https://patchwork.freedesktop.org/series/136226/
[2] https://patchwork.freedesktop.org/series/136219/

Matthew Brost (4):
  drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
  drm/xe: Drop xe_gt_tlb_invalidation_wait
  drm/xe: Hold a PM ref when GT TLB invalidations are inflight
  drm/xe: Build PM into GuC CT layer

 drivers/gpu/drm/xe/xe_device.c                |   4 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 201 ++++++++++--------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  12 +-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |   4 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |  10 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   4 +
 drivers/gpu/drm/xe/xe_pt.c                    |  26 +--
 drivers/gpu/drm/xe/xe_vm.c                    |  32 +--
 8 files changed, 160 insertions(+), 133 deletions(-)

-- 
2.34.1

