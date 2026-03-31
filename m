Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7099310F92E3
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 17:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C1510E382;
	Tue, 31 Mar 2026 17:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoZmZsrX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3FF10E382
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774977898; x=1806513898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TkzLn7kooM5HuK2OLxhNu191Cq8b02Vbrw8zVcW49qM=;
 b=JoZmZsrXSq+xHUyyIvB/ySEHCZWw+GA0763wGMWhTaRuusJ1D9Fieh42
 gMB9F2Tvd/mulZkgsXogzKtdUmjSHI02ry8AoUT5Jqgf2QB5rqRWE2jvv
 Jw+J+IIRCL+XMVgEJKiLvJ7UtYNMOhqMi6eCZ9NlNfuOg+PgX9mXwkus8
 tuJk5+CT5oKjhPyaKeuUm9g8Xht9xXiM1eOveRdJysyRaEV+Vsx/l5XZo
 FWkQUKssaVSRH9RK1gV3EVU1BreIHWtoY+7KsKQP60A3h1UVvUa7nznud
 dMriIZitevTHOeYVg23KYrGnZ6o8w8K0DdFGrqll3+8tSkd4isIFojk+2 g==;
X-CSE-ConnectionGUID: RXND2NbDQPerWlfZMFXWkQ==
X-CSE-MsgGUID: mX8cEzDxSHuZ5UzGNhrM6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76016506"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="76016506"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 10:24:58 -0700
X-CSE-ConnectionGUID: v08rnPneS3i3PtX6zN+hSw==
X-CSE-MsgGUID: NpMjngVNTyS45y8DYv6Shg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="223551775"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2026 10:24:56 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/5] drm/xe/uapi: Update xe_drm.h documentation
Date: Tue, 31 Mar 2026 17:20:50 +0000
Message-ID: <20260331172049.3053871-7-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

This series fixes various documentation issues in the Xe DRM
UAPI header (xe_drm.h). All changes are doc-comment-only with
no functional impact.

The fixes are split into 5 patches by category:

Patch 1: Typos and spelling errors (7 fixes)
  Basic misspellings like creaed, mmaping, 0xdeadbeaf, and
  incorrect names like MONOTONIC_CLOCK (should be
  CLOCK_MONOTONIC).

Patch 2: Grammar errors (11 fixes)
  Missing words, wrong articles, subject-verb agreement,
  e.g. "should only ever used", "must qword aligned",
  "the users responsibility".

Patch 3: Wrong names and references (12 fixes)
  Incorrect field names, struct names, ioctl names, and
  kernel-doc cross-reference prefixes. For example,
  referencing non-existent probed_size instead of
  @cpu_visible_size, wrong ioctl name
  DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS, and using &
  instead of % for constant references.

Patch 4: Code examples (4 fixes)
  Outdated field names in struct initializer examples
  (.num_bb_per_exec -> .width, .num_eng_per_bb ->
  .num_placements), wrong nested field access
  (.atomic_val -> .atomic.val), and unnecessary backslash
  escaping in UUID format string.

Patch 5: Formatting and completeness (4 fixes)
  Missing entries in the IOCTL overview list and device
  query doc list, a formatting issue with a closing */,
  and ioctl's -> ioctls.

Shuicheng Lin (5):
  drm/xe/uapi: Fix typos and spelling errors in xe_drm.h documentation
  drm/xe/uapi: Fix grammar errors in xe_drm.h documentation
  drm/xe/uapi: Fix wrong names and references in xe_drm.h
  drm/xe/uapi: Fix code examples in xe_drm.h documentation
  drm/xe/uapi: Fix doc formatting and completeness in xe_drm.h

 include/uapi/drm/xe_drm.h | 86 ++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 42 deletions(-)

-- 
2.43.0

