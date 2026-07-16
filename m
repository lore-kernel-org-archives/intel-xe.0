Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A769C44511
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 15:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA64710E314;
	Thu, 16 Jul 2026 15:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndnFCjTe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328F610E273
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784217078; x=1815753078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=975KoVm9p9nNlj0c+CiH05n6x7MKVwe1OcC53ia25ss=;
 b=ndnFCjTePyCgyVZTItuXnbiAY8Xu4/6tA4l48xNHbPi/aferKAtyXKsZ
 XHEqtO2Wutt9E/dJlXS43p8Ai25SX3kvt+pU4/4JadZjQ6dCOQqhmIbEG
 wnFdEz7Kl9452B5HA12Lt+ANQIP9ayRMZbBasDgA5mYfYs+DtXNUssgbe
 8PBUWux0yNhUaaa8QvHYXyQ+wfgZJnDDHZLh693fMigZhX2xM43bbnnd2
 jBV0dlVDL/gGi36Ky6wioEKtgEZy3wUEPehbsxSgUHDAbBvG4pphUCRq8
 1hBwZrJKQncjBNDEr0SbpndR9zrj6KtotoLZve/DDeSgdwJWpO7ExwZpP g==;
X-CSE-ConnectionGUID: GoqPDfemRjSq3fkzzEfLWg==
X-CSE-MsgGUID: 1QL3mQr9Rh65dllpUs8pSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84659649"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84659649"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:51:17 -0700
X-CSE-ConnectionGUID: 8rPzaLxnTI2AtLJC9rh/Eg==
X-CSE-MsgGUID: WtWIh73gQVmoD7MVadJeIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="256590474"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by orviesa007.jf.intel.com with ESMTP; 16 Jul 2026 08:51:17 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: julia.filipchuk@intel.com, matthew.brost@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 0/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Thu, 16 Jul 2026 11:51:12 -0400
Message-Id: <20260716155114.1427366-1-zhanjun.dong@intel.com>
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

GuC snapshot output is currently expensive in both size and latency: large
log buffers are emitted as raw ascii85, and the surrounding dump text
includes a bit of avoidable noise. This series makes xe snapshot dumps more
compact and easier to handle by compressing the large binary payloads,
tightening the textual output, and trimming the default GuC log size.

Select ZSTD_COMPRESS in DRM_XE so the xe module pulls in the zstd
compressor when built.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
History:
v5: Update cover letter messages to remove shrink log size.
    Fix kernel-doc warning.
v4: No longer auto-select ZSTD_DECOMPRESS
v3: Add Kconfig option to control compression of GuC log and CTB dumps,
    allowing users to choose between reduced dump sizes or lower memory
    usage.
    Remove "reduce GuC log size from 8MB to 2MB" patch, to be added later
    if needed.
    Replace pr_err with xe_gt_err and add more error print.
v2: Fix Kunit test error by selecting ZSTD_DECOMPRESS in DRM_XE config,
    required by zstd_is_error/zstd_get_error_name.

Zhanjun Dong (2):
  drm/xe: Remove extra newlines from LRC snapshot dump
  drm/xe/guc: Compress GuC log and CTB dump with zstd

 drivers/gpu/drm/xe/Kconfig                |  15 ++
 drivers/gpu/drm/xe/xe_devcoredump.c       |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c            |  19 +--
 drivers/gpu/drm/xe/xe_guc_ct.h            |   4 +-
 drivers/gpu/drm/xe/xe_guc_log.c           | 162 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_log.h           |   9 +-
 drivers/gpu/drm/xe/xe_lrc.c               |   4 +-
 kernel/build64-debug/Makefile             |   3 +
 kernel/build64-debug/scripts/basic/fixdep | Bin 0 -> 16936 bytes
 9 files changed, 189 insertions(+), 31 deletions(-)
 create mode 100644 kernel/build64-debug/Makefile
 create mode 100755 kernel/build64-debug/scripts/basic/fixdep

-- 
2.34.1

