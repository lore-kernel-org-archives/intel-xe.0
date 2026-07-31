Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCCFC54F54
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 15:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFE610E208;
	Fri, 31 Jul 2026 15:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKq+maRp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5120110E208
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 15:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785513254; x=1817049254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F2xNYLrX/W/wHjtWFIl315qsrD/C+ZJTsy9lI5V4iYM=;
 b=IKq+maRpM5YtS8gE5+l/uQRVvUsbQzzccEotI+Tu3+TYABC9hnlx0ylY
 QUGTxxtPqOfCVBVSTAsyooENu1pTZPhv2cLqEbJbQdyxwpzZUxf6bIE53
 Oz+j7731zBzKGHjt0nwliLL002SeEB6u0F9znIITGXDR/CeyrRd/0RW61
 gPWGjE0CIgH8HWONR6fCnqAKr9Lc5L6dtOfW4G3eCtCvIoEonX1IFguBu
 jrjgR5WjIBqbPuFFcY3nGCM3321nQfCnfaXx6XZj8C8wOZvQ/uk8xirjM
 LHM/nJ7V+hd15J6KmF2TYzicSDphNLQL26e3PTJAWgKgzNGdbzK11C0Ip A==;
X-CSE-ConnectionGUID: uCp3jYAlRKClVXieB2Wtbw==
X-CSE-MsgGUID: vb35qODfQKWJZ6AmSBL58g==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="108937854"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="108937854"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 08:54:13 -0700
X-CSE-ConnectionGUID: A9Mp52sASHmzX9zIMdyZiw==
X-CSE-MsgGUID: 3pMw4FPzToi9xEv97VH0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="260665818"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by orviesa007.jf.intel.com with ESMTP; 31 Jul 2026 08:54:14 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: julia.filipchuk@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v7 0/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Fri, 31 Jul 2026 11:54:09 -0400
Message-Id: <20260731155411.496975-1-zhanjun.dong@intel.com>
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
tightening the textual output.

Select ZSTD_COMPRESS in DRM_XE so the xe module pulls in the zstd
compressor when built.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
History:
v7: Add *why* to the commit message (Rodrigo)
v6: Remove intermediate build files(Julia)
    Remvoe unnecessary comment(Julia)
v5: Update cover letter messages to remove shrink log size.
    Fix kernel-doc warning.
v4: Remove ZSTD_DECOMPRESS dependency.
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

