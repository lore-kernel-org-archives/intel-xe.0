Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4057CC61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 03:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D925110E372;
	Tue,  1 Sep 2026 03:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8E2fx4j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7371C10E372
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 03:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788233517; x=1819769517;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vk2FapncFzP9xiygktClbncx6E7ZKUwh+uLSayGl99A=;
 b=k8E2fx4jTNYAzgUlDJku2mZBXmhAC3r8BgAxF8/kCi0eyOJaej19CJVd
 LCCykX1gyVS9C98JWJ9Q4LMZRExmp/T6K59a2vN4cekntQiVXEfR+EcP1
 YlPe1Y1jPnJ+IC1OY6aXjETu6is4gMGnA/xgO7GsBSGXi3BKLCw7WtsCU
 hhD8hb3AxZuqRhS9a9MJE/M37jRZQ6Ev3/jlCswoXCIRkcV6NHKX8HMnR
 n05fOKM24YDHAFDIS9PBVzCnSvas1qqQdD5rg/qexLO2xJpDVbXSivJkq
 uP4/rWMsiKpddTwYfom/ymWCUVohIVx2hfF9L202KwcA9+kYeG9LpSIcb w==;
X-CSE-ConnectionGUID: bSd39cQeS4mBgrBf0l47bA==
X-CSE-MsgGUID: zRhbrMPlRFC1XRPxsElcuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99249688"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="99249688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 20:31:57 -0700
X-CSE-ConnectionGUID: vVWoev+5Q9+VePASgfdB2A==
X-CSE-MsgGUID: VvIWDWEnRwajUGkY3oWkvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="264685111"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa006.fm.intel.com with ESMTP; 31 Aug 2026 20:31:56 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v4 0/2] drm/xe/shrinker: Runtime PM and walk termination fixes
Date: Tue,  1 Sep 2026 03:31:51 +0000
Message-Id: <20260901033153.219481-1-shuicheng.lin@intel.com>
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

The xe shrinker walks the SYSTEM and TT LRUs without a runtime PM
reference.  Shrinking a bo outside system memory invalidates its GPU
mappings, so with the device runtime suspended the page table zap trips
an assert and the TLB invalidation returns -ENODEV.  Patch 2 takes a
reference before walking a memory type other than XE_PL_SYSTEM.

Patch 1 is a separate problem found while reviewing that one:
xe_bo_shrink() returns -EBUSY for a bo that is simply not a shrink
candidate, and the walk treats it as fatal.  It is first in the series
because its Fixes commit is a year older, so it applies on its own to
stable trees that must not take patch 2.

Verified with igt@xe_madvise@dontneed-before-exec while the GPU is
runtime suspended:

  unmodified                            15/15 runs hit the WARN
  with patch 2                           0/15
  CI-like, device active, 10 runs        10 pass, 0 skip, no splats

ftrace confirms the new path executes, runtime_usage returns to 0, and
there are no lockdep reports.

For patch 1, tracing shows the walk continuing past the -EBUSY and
reclaiming two further bos that previously ended it.  Note that
xe_shrinker_walk() re-enters the walk for each escalation level, so the
bos are usually still reached on a later pass and the pages reported to
mm were unchanged in that test - the effect is repeated restarts rather
than lost reclaim.

Shuicheng Lin (2):
  drm/xe/shrinker: Do not abort the walk on unshrinkable bos
  drm/xe/shrinker: Take a runtime PM ref before shrinking non-system
    memory

 drivers/gpu/drm/xe/xe_shrinker.c | 42 +++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 9 deletions(-)

-- 
2.43.0

