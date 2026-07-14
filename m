Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D18C44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 15:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB62C10EDC7;
	Tue, 14 Jul 2026 15:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5JRU+x0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCF410EDB7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784044154; x=1815580154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I/hz153sTMr9+xiaqTrOC77GIofyXGHHNTDQbH1B7/U=;
 b=O5JRU+x0VyJvYSJuKes/bQbKjcqv2NKENeUTic98qwZ9k1XksYecQ3XL
 rQKfGF3E7rlnnoDF9I75HmwdRPI7rdl0eaRGwdirLQ/x+6mjPfoBdgE6O
 7qEn5ukD7oMfnsiitLwMVUAWi+QnWtvE3m5lU03vfT+wBo3gkvfjT9Wes
 kqQu4+YXQMomOaMIjxZBtasLi/HCQgL3otK0JBldUnX3UrPyxxz6a5L/K
 84zPp6Z9FDZE5DnxAPJMFmLTH1pvBwKUnyt6txicK/qhEWYWUcGoxDG2E
 uS0s7QBu/EdfEt9nBgrWtiN3aAbxUk3iuswq/Dv65cRBHC21vzLAmtNzE A==;
X-CSE-ConnectionGUID: tC5orytZSQ290QEEDRNcrw==
X-CSE-MsgGUID: hYbaGb/xTUerNrqsnREzRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="102093347"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="102093347"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:49:13 -0700
X-CSE-ConnectionGUID: 9YTDG2gJRca441B8NRdQHg==
X-CSE-MsgGUID: dRGRU4NoTGmoTRYXQcAALA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="255941968"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by orviesa007.jf.intel.com with ESMTP; 14 Jul 2026 08:49:13 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: julia.filipchuk@intel.com, matthew.brost@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 0/2] drm/xe/guc: shrink and compress GuC snapshot dumps
Date: Tue, 14 Jul 2026 11:49:08 -0400
Message-Id: <20260714154910.900217-1-zhanjun.dong@intel.com>
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

Reduces the default GuC log buffer from 8MB to 2MB, which still preserves
useful history while cutting dump latency and dmesg load; with typical
compression, the emitted payload drops further.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
History:
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

 drivers/gpu/drm/xe/Kconfig          |  15 +++
 drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
 drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
 drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
 drivers/gpu/drm/xe/xe_lrc.c         |   4 +-
 7 files changed, 185 insertions(+), 31 deletions(-)

-- 
2.34.1

