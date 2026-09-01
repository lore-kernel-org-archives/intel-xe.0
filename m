Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D69BC624D3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 17:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB2A10EDFE;
	Tue,  1 Sep 2026 17:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQzMyH/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1DF10EDFE
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 17:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788283873; x=1819819873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+rBwghF8eqUs93gbRl7D2qpDI9Hoc+Lk59WUBkYyTYU=;
 b=QQzMyH/Civgl/68LXu6fOPmeUEAtmsER6GHpZUlDjpOi8VRz+t4oqjpE
 Mfmtr/IQtBXQupEWOpagLyjICzFzqBJy0v7el0b4JRBb7pCw+pZFeKZBI
 6st7ZSXLN/vhOezKXq85PXk87gU4srkGilrtc+yFrmwDVp7ob7XXqRs6m
 0dAUp6from5ofVgmTd4kADaXzQSPRb8F8TlU/RJ0uAOH6krE6pSSwTJVG
 jPsjQGNq6jG4qiOlOI5LGi0sl0G8HHeTJllvdAF5/DLXkKx5SEmilDkoV
 EcpM1BmW3g2NJTO8NIcwl7cGhbZNhgLO80u+tcvzkFOz4S5GkfgLq5DdM g==;
X-CSE-ConnectionGUID: w0xvFEn8R5uZt3Br5C1jdQ==
X-CSE-MsgGUID: T6IxJ1MoTJqNwVgWdUQ1sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87862138"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="87862138"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 10:31:13 -0700
X-CSE-ConnectionGUID: SfMiHdUFTreZ7sFb50QTHQ==
X-CSE-MsgGUID: q9S8JDmVQmC41hvGFlNSnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="269750049"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa009.jf.intel.com with ESMTP; 01 Sep 2026 10:31:12 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v5 0/2] drm/xe/shrinker: Runtime PM and freed page accounting
 fixes
Date: Tue,  1 Sep 2026 17:30:57 +0000
Message-Id: <20260901173059.455469-1-shuicheng.lin@intel.com>
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
__xe_shrinker_walk() and xe_shrinker_walk() return an error in place of
the pages they have already freed, so those pages are never reported to
mm while *scanned still counts them.  It comes first because its Fixes
commit is a year older and it applies on its own to stable trees that
must not take patch 2.

Since v4, patch 1 no longer skips bos that return -EBUSY.  That made the
walk traverse the whole LRU instead of stopping at to_scan, and it had
no measurable effect on the pages reported to mm, so only the accounting
fix is kept here.  Treating -EBUSY as fatal is still wrong and will be
revisited separately with a proper progress bound.

Verified with igt@xe_madvise@dontneed-before-exec while the GPU is
runtime suspended:

  unmodified                            15/15 runs hit the WARN
  with patch 2                           0/15
  CI-like, device active, 10 runs        10 pass, 0 skip, no splats

ftrace confirms the new path executes, runtime_usage returns to 0, and
there are no lockdep reports.

Shuicheng Lin (2):
  drm/xe/shrinker: Do not discard freed pages on error
  drm/xe/shrinker: Take a runtime PM ref before shrinking non-system
    memory

 drivers/gpu/drm/xe/xe_shrinker.c | 44 ++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 11 deletions(-)

-- 
2.43.0

