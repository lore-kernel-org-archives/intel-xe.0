Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4A3C25B79
	for <intel-xe@archiver.kernel.org>; Sat, 18 May 2024 04:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2432010E049;
	Sat, 18 May 2024 04:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PE2myWQs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2668810E034
 for <Intel-Xe@lists.freedesktop.org>; Sat, 18 May 2024 04:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716007022; x=1747543022;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UfW+NZI/pwIuWpBNgZVyWe7kvpKRSY8Jv6IvCKnLv54=;
 b=PE2myWQs36+zHpLar+ZRVW+8fA2ylazR9qpbhFjIOkwbfQ9+QrXgBv9p
 gOZEXwNPFimYQAm91tzq9Yiwz35sSnZzyfeVS1hLdvXMN8ZOkLjLmZG+M
 nJ1SkfdeH2zKDwzi/l3GorA6faxCGGhFhXHhTWUNJAuwMU3LSc3yUaRqA
 VpusTnpoqk3w0visNqHRIrSopadzgAOZV8Kv50OupuS6wvyB+ETFhZAu7
 JPIvgQqaWio8fsisURB6iDQDNpuVq3GDj8ygqLlrIVdMWQ9+06uQq22GT
 hjW8+qoPGvxZjip6SlagY8TBj9Yy3bDsRzmuy4qbz1yQZnmh4cJyg8XWC g==;
X-CSE-ConnectionGUID: ahJR+O0LQdeA8k9tHkNN4A==
X-CSE-MsgGUID: +riiPnxCSj+USJNTE/iq9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="23343734"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="23343734"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 21:37:01 -0700
X-CSE-ConnectionGUID: 8P4X7afUSByqYSWPx2Lp6g==
X-CSE-MsgGUID: S1Goz9LVSW6nMm9WmVsqIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="32572953"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 17 May 2024 21:37:01 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 0/2] Support/debug for slow GuC loads
Date: Fri, 17 May 2024 21:36:57 -0700
Message-ID: <20240518043700.3264362-1-John.C.Harrison@Intel.com>
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
v6: Fix typo in _wait32_not (review feedback from Lucas) and rebase.

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
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  13 --
 drivers/gpu/drm/xe/xe_guc.c                   | 203 +++++++++++++++---
 drivers/gpu/drm/xe/xe_mmio.c                  |  61 ++++++
 drivers/gpu/drm/xe/xe_mmio.h                  |   2 +
 10 files changed, 293 insertions(+), 63 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c => xe_gt_throttle.c} (86%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

-- 
2.43.2

