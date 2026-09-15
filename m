Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08D9C982C1
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7B110E383;
	Tue, 15 Sep 2026 17:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUeTbI1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAA010E383
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 17:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789494524; x=1821030524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pg6nypjQ///VgD5EHHMTbUGHeNAlahyz2QBOU0JzLiM=;
 b=DUeTbI1NfgxG3t8UMjh+EA44xeOtEezeo3n9AaK/UDjV+KBnsMBQtjtG
 szKtmAl4N/loHA1M0Kz1cD3UdeNONRindbS++Xl6XEY1UCvuTznvD6eBa
 kqWMu/mt9KI9AJLQBHH11PaBsHVd8V3JEmn7zEQzQQvRQkRs3Lmsd/Gxq
 7X+/gH5Tk5hrkW5l+fjs6uDbALq5eZfETUsncZ2KHoAQuLEvfj+YUBItY
 /gu1iBVAZV58Ud0JGerDhokorirzWJByNJ3JDjgMpZyjDWdrr1VXp6pWt
 6Dfa3HwhrWk2khi3J/fcoPCX6Evlk6c5SQwLLyhTT3fDtrAQFhrz50cdM Q==;
X-CSE-ConnectionGUID: TNFjtSUnQPKQBhS201nhng==
X-CSE-MsgGUID: 3YLhyiPdQ5O14lvzN4ir4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107378786"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107378786"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:48:43 -0700
X-CSE-ConnectionGUID: s5PsgMvtRFitU6KtDclgqQ==
X-CSE-MsgGUID: a0OBLEddQoOk+cW0N8BgWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269814738"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa007.fm.intel.com with ESMTP; 15 Sep 2026 10:48:43 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 julia.filipchuk@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v9 0/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Tue, 15 Sep 2026 10:48:38 -0700
Message-ID: <20260915174840.531473-4-alan.previn.teres.alexis@intel.com>
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


base-commit: 4fb02d7ad2f3a5c67d0b7a341c452a07b9a9eaf6
-- 
2.43.0

