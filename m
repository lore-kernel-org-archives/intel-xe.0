Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F035AC43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 17:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B618A10E9D9;
	Mon, 29 Jun 2026 17:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtUxJ8D9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D9110E9D6
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782753761; x=1814289761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tMLPhi2mO11A30D5aiSskqt6zPmvhtKGOdt6zJzekxY=;
 b=TtUxJ8D9O5iJxnG1blTzVC80gc85jEry0crjsrjvC4cn8LkbZeAKucgX
 GC+/FtV9iIZ5sSZWjPBJ2zsy3tQgUk1ZawJTbAHPzDvtlSaSRlUO52Wdl
 FgN+3XmmY4N9frrmDuAQQYASp3DDG26+hbejUoMwzcGJ9w9o98RPk/5p0
 w6bky2eYNHYfQJkShZQmZVVOy9Kdl3RhIALqLJ5VvN8XfwI0BEa4ihJrP
 +Cml+q+t1o7njHlpw0Wc4rZ/HXHYMAMiLgPx1lfHI6FQGqR3iK4/96Qby
 U+3fSFMiIEPM/phj0ln+XnU5CaAJBjN3Y0CsUjChRcxGiU49kdsxuuxXF g==;
X-CSE-ConnectionGUID: eshjq7HhQIelpOhD7ncesA==
X-CSE-MsgGUID: QWjvyowfSnSgrmjirVMg6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94947219"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="94947219"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 10:22:41 -0700
X-CSE-ConnectionGUID: Wnt9/i0aS/GiBA6DxuXbhg==
X-CSE-MsgGUID: gu6gO5Y3ROu4hOKHu1UewA==
X-ExtLoop1: 1
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by fmviesa003.fm.intel.com with ESMTP; 29 Jun 2026 10:22:41 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 0/2] drm/xe/guc: shrink and compress GuC snapshot dumps
Date: Mon, 29 Jun 2026 13:22:37 -0400
Message-Id: <20260629172239.2377117-1-zhanjun.dong@intel.com>
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

Select ZSTD_COMPRESS/ZSTD_DECOMPRESS in DRM_XE so the xe module pulls in
the zstd compressor when built.

Reduces the default GuC log buffer from 8MB to 2MB, which still preserves
useful history while cutting dump latency and dmesg load; with typical
compression, the emitted payload drops further.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
History:
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

 drivers/gpu/drm/xe/Kconfig          |  16 +++
 drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
 drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
 drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
 drivers/gpu/drm/xe/xe_lrc.c         |   4 +-
 7 files changed, 186 insertions(+), 31 deletions(-)

-- 
2.34.1

