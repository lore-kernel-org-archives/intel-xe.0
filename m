Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6E0C4453A
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 18:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E1B10EE6C;
	Wed, 22 Jul 2026 18:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMKJct71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A25510EE6C
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784743582; x=1816279582;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H2B7T6qUEl9pR8fTw2iNEgSRy77lFewMwwhzmd9Uh3A=;
 b=OMKJct71PDEwcg6o5AVZPwjY+KZTFxISiZ0ulVYwjShN4mH3JSnwNsAn
 lccTSAsSpyhwJAFv0h0TNOWIq8oELFL7gWU5SavmAf7UrWBPX+XcB8LzV
 7QmL1lyuMdM1MvW1Ga7OgmLkOSIm9tYQ+bAjI91e0snYi2NH8/Rckei/E
 n9LFol4YRRyo6QCr0X2oouKSC80hp5wzzkrJQAMN17Jw5qUjJMpMMq+rM
 kavVOSg2MGQRC6g2WCyA9nJqk4iCYDKE2tH7ktFBdLvDzrrqeMzipYzNL
 ay/4alNoieJcJ19iTPXw+H2KQe/jUShIqeVxpUZSXBXUhTYbghqUrwG3i Q==;
X-CSE-ConnectionGUID: 3hPfi6VKQvuHc4bDUWvOhQ==
X-CSE-MsgGUID: yCjp+E1hTKWXyZCOWARVIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95744217"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="95744217"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 11:06:07 -0700
X-CSE-ConnectionGUID: Frkx1iWRSJGYkiSKdSRqMg==
X-CSE-MsgGUID: t7mZqH9VSb61/SWGrEEi2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="253802238"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by fmviesa006.fm.intel.com with ESMTP; 22 Jul 2026 11:06:06 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: julia.filipchuk@intel.com, matthew.brost@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v6 0/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Wed, 22 Jul 2026 14:06:03 -0400
Message-Id: <20260722180605.2498906-1-zhanjun.dong@intel.com>
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

