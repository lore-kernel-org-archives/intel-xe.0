Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27136C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 05:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969D410E21D;
	Thu, 14 Mar 2024 05:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbFNoqA+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1401688DE5
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 05:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710394094; x=1741930094;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qrxBoGiF8C//8OpLnUSxqYLlLupmbY+n9vMmVM27JBE=;
 b=YbFNoqA+ih1rrDo+a/V3Jcq7RXaSNIMt9EF7xoI/OneJ4L4t5ECvt/1w
 XXRoRen/zHapyUi8v4qWVgxkodysAJE/HNzkgWRYD2kZavIvXpwPpr6ih
 /BOHuZHNxU+k5mEljjgSIqGPFuqiJgRD5J9apk8TfyURYChtDmr/XTs4r
 5kp3Mler8QRe8EmdhC0ZQeM6LH4AeebLwVGHW8PcLiLxnNY9ZvaglXg7X
 0/ZzI2QDpsl80LbXJLRfwkxCv+KkZXekiL2wuPajgKTj6gae1Kjf6tzt1
 RHnLw8PULF+JxT0UV9eclmvJCkg5RtsI4Al4MITWDemjwSIyfcTdC8Iga w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5050004"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5050004"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 22:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="35298637"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 22:28:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/2] drm/xe: Refactor BO flags
Date: Wed, 13 Mar 2024 22:26:17 -0700
Message-ID: <20240314052619.2628396-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Change the flag names to follow a specific pattern. There shouldn't be
any change in behavior here. The removal of CREATE name is up for
debate; it seemed appropriate to remove, but let's hear what others
think.

Next step that I'm thinkig about doing is to remove
XE_BO_FLAG_VRAM_IF_DGFX(). For that, during the tile initialization we
set a default_bo_placement like:

	if (IS_DGFX(xe))
		tile->default_bo_placement = XE_BO_FLAG_VRAM0 << (tile)->id;
	else
		tile->default_bo_placement = XE_BO_FLAG_SYSTEM;

Still need to check all callers because some are passing tile to the
create function, but root tile to the placement. I'm not sure yet if
that was intended or just an accident.  If the latter, then we could
very well leave the placement to the xe_bo_create*() when no placement
is set by the caller.  Thoughts?

Lucas De Marchi (2):
  drm/xe: Stop passing user flag to xe_bo_create_user()
  drm/xe: Normalize bo flags macros

 .../xe/compat-i915-headers/i915_gem_stolen.h  |   2 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c      |   8 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  16 +--
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  16 +--
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |   4 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   6 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |   4 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |  54 +++++-----
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  20 ++--
 drivers/gpu/drm/xe/xe_bo.c                    | 102 +++++++++---------
 drivers/gpu/drm/xe/xe_bo.h                    |  41 ++++---
 drivers/gpu/drm/xe/xe_bo_evict.c              |   2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c               |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |   8 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |   8 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c             |   4 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   4 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c          |   4 +-
 drivers/gpu/drm/xe/xe_guc_log.c               |   4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |   4 +-
 drivers/gpu/drm/xe/xe_huc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   4 +-
 drivers/gpu/drm/xe/xe_lmtt.c                  |   4 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_memirq.c                |   8 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   4 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  10 +-
 drivers/gpu/drm/xe/xe_sa.c                    |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |   2 +-
 32 files changed, 183 insertions(+), 184 deletions(-)

-- 
2.43.0

