Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C8DC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 19:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF32C10F6E6;
	Tue,  9 Apr 2024 19:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IwLw6R7X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7526110F6E6
 for <Intel-Xe@lists.freedesktop.org>; Tue,  9 Apr 2024 19:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712689526; x=1744225526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AQ/9SH7zlvk5CmJCTUEPsCb9Z8+fyrCG8B+fMEIuf80=;
 b=IwLw6R7X32JowejbI3pcqS0sHr0SkVMk0rGFuSkzMEs9SRC42nuipThv
 vwUv/0T9AJvlxOMRBNk9ZZ2ENb5yGoTYTF6i96HQJDzZ8H15NgzZNIati
 y+C6i437ngVR4RxhyHB/7B4KD06k9Xuh4GjZbQFJg5EKxwzcK1/7DGXsk
 Ar17o+KFsAS9RsGlYdadieEZto3MAOO2r18KAFidfXFeZDbWZ6cpZs95X
 10CLhkq4SZigFvAFkUobVKV4VcIo++73lGws2sWlat1oF7wo8MCpJ5iVa
 jXdKBoVyrjpp+X6QDN9Stxx8FpXW7+L2h+5ZdSQjdet2LCNa3aauzQjVN w==;
X-CSE-ConnectionGUID: M/obNkRYRui8+X6ZMjroEA==
X-CSE-MsgGUID: trEnZaz8TT2t5jrxnPyT7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11814856"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11814856"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 12:05:16 -0700
X-CSE-ConnectionGUID: 8hB3Gp7VSYym+0ezjpmtVg==
X-CSE-MsgGUID: fAuD4h4mTYec00vW065oww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20884210"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 09 Apr 2024 12:05:17 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 0/2] Support/debug for slow GuC loads
Date: Tue,  9 Apr 2024 12:05:12 -0700
Message-ID: <20240409190516.2884064-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Sometimes the GuC load is slower that it should be. For end users,
that usually means some kind of thermal throttling issue. Internally,
there can be any number of bugs that cause it. So don't completely
fail to load, just cope with it and report the problem.

v2: Revert include order (review feedback from Lucas)
v3: Remove '_sysfs' from throttle file names and keep limit query in
the same file rather than moving elsewhere (review feedback from
Rodrigo). Fix the reporting of requested vs granted frequencies
(review feedback from Badal).
v4: Manually code the loop timeout/condition checking because helper
functions are not allowed (review feedback from Lucas/Rodrigo)
v5: Correct a #include, improve the comments even more, add units to a
#define (review feedback from Lucas).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe: Make read_perf_limit_reasons globally accessible
  drm/xe/guc: Port over the slow GuC loading support from i915

 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/gpu/drm/xe/abi/guc_errors_abi.h       |  26 ++-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   2 +
 drivers/gpu/drm/xe/xe_gt_freq.c               |   4 +-
 ...e_gt_throttle_sysfs.c => xe_gt_throttle.c} |  26 +--
 drivers/gpu/drm/xe/xe_gt_throttle.h           |  17 ++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  16 --
 drivers/gpu/drm/xe/xe_guc.c                   | 215 +++++++++++++++---
 drivers/gpu/drm/xe/xe_mmio.c                  |  61 +++++
 drivers/gpu/drm/xe/xe_mmio.h                  |   2 +
 10 files changed, 305 insertions(+), 66 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c => xe_gt_throttle.c} (86%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

-- 
2.43.2

