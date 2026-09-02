Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED50C624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 22:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2F910E062;
	Wed,  2 Sep 2026 22:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLGhHivA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3BF10E062
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 22:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788389061; x=1819925061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=91MywIDdJywPlzaw7E6NrYPG96sJkZF7e69L1r79xRQ=;
 b=LLGhHivAyN7bo1GvntWwoskf5uqjssLr6GK4mTSLtDBRekUR3H6/y4pu
 pFGM2tmwPj2eV8oRSSjr9ETYsi7QlCzz52nzNKAhgVi7xo+7ayas/N+s/
 j449OZfQOPbaIj4dpjvxHt+BFWcOSEJQTToWXl+90MGIwVvE7aw7RTtEw
 PGxgn0tYPGZlZK/GBnAkCdg76kD19P1ADR0aqVTTtP8CzBnlqbx2U51w8
 3RHaEYXCbAcijpZBCmPw7z094udgOSg+ZtMb9zn1xJB4Kk0Ql3+uKr0SH
 Van4j3kzFGWFcp2k3UgBcuGHZfCV6QlUOSrQm5n3QWEZSL6JRXEeQGDNZ Q==;
X-CSE-ConnectionGUID: GapjN+kvQtOewsxrjec+0Q==
X-CSE-MsgGUID: fyYot99MS/yLubvYx8y0WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92561638"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92561638"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 15:44:21 -0700
X-CSE-ConnectionGUID: UN83Zli7TwuS10LVpHpMPA==
X-CSE-MsgGUID: sKWmPjpjTBu49zgh5nYbcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="269545705"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by orviesa007.jf.intel.com with ESMTP; 02 Sep 2026 15:44:20 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 julia.filipchuk@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v8 0/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Wed,  2 Sep 2026 15:44:15 -0700
Message-ID: <20260902224417.879960-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731155411.496975-1-zhanjun.dong@intel.com>
References: <20260731155411.496975-1-zhanjun.dong@intel.com>
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

---
History:
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


base-commit: a7f2b1429f908875e6b235c7902fc47805b07bf4
-- 
2.43.0

