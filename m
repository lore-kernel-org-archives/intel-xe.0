Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF70CA5FFE
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 17:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC7F10E43F;
	Tue,  6 Oct 2026 17:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmiDbgii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E0A10E3B4
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 17:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791309092; x=1822845092;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5jhV51q3oP9dxpAcC/x9aGoZ2mpumHjiT6f8g0GimzM=;
 b=VmiDbgii3uKNR1i93yGJ3ySJv/XvYPAri3PSZWPDM4ANRx4VO9GqXFTp
 J5qXlJBWTAvbYeigRVM1aqNuQrBi2wBVv6QKUo0Nm58OvQQcT32Gm9N3P
 duMLTRrXYMcgFZibs60rpLvoKO5qudbmqHL7NG7WRnyof4HtLpl1z6wX6
 imrsADy0S0TGZYMqz1aMumGVYa++mlmHLVr4nNlCcgZuGn54ZdVjJ9369
 Xc07jmTCGVJYnfu+VTxahwMCn868m2NLezGp4WqEJZEHitgBtncjviSqP
 h5ljdRhw2fJrMPQxDKZev3ImLx6TwueeWW2RMKllnAqO/WrHm16nLvl7C Q==;
X-CSE-ConnectionGUID: Anpcw9K5SRqaCaBs0RR1Ag==
X-CSE-MsgGUID: hVmPLlPfQg6sLlKxv6yrFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102588589"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="102588589"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 10:51:30 -0700
X-CSE-ConnectionGUID: ZKtJnYzNTEyi83SJ3EnI7w==
X-CSE-MsgGUID: +DNT9+4yQvOqSsjDW6KniA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="273573406"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa009.fm.intel.com with ESMTP; 06 Oct 2026 10:51:30 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 julia.filipchuk@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v10 0/3] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Tue,  6 Oct 2026 10:51:28 -0700
Message-ID: <20261006175129.3366784-5-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
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

GuC snapshot output is currently expensive in both size and latency: large
log buffers are emitted as raw ascii85, and the surrounding dump text
includes a bit of avoidable noise. This series makes xe snapshot dumps more
compact and easier to handle by compressing the large binary payloads,
tightening the textual output.

Select ZSTD_COMPRESS in DRM_XE so the xe module pulls in the zstd
compressor when built.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

---
History:
v10: Add a new patch to introduce dump_cache to optimize GuC CT/ Log
     compression e2e flows and manage errors across parses. (Sashiko
     and Rodrigo).
     P2: Reorder Kconfig compression dependency (Rodrigo) and round
     up buffer size to dword as per final output-dump expectation.
v9: Rebase to latest drm-tip, no functional changes, added Signed-
    off by Alan on 2nd patch. (Rodrigo)
v8: Improve patch #2 description on clarity and wording (Rodrigo)
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

Alan Previn (1):
  drm/xe/guc: Add dump_cache to optimize GuC CT/Log compression flow

Zhanjun Dong (2):
  drm/xe: Remove extra newlines from LRC snapshot dump
  drm/xe/guc: Compress GuC log and CTB dump with zstd

 drivers/gpu/drm/xe/Kconfig            |  15 ++
 drivers/gpu/drm/xe/xe_devcoredump.c   |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c        |  21 +--
 drivers/gpu/drm/xe/xe_guc_ct.h        |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h  |   3 +
 drivers/gpu/drm/xe/xe_guc_log.c       | 222 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_log.h       |  11 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h |  20 +++
 drivers/gpu/drm/xe/xe_lrc.c           |   4 +-
 9 files changed, 273 insertions(+), 31 deletions(-)


base-commit: daeb062fc40f727fafefed080c6d12a5ad1d0d12
-- 
2.43.0

