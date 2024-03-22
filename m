Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69273C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 14:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2530B1124E1;
	Fri, 22 Mar 2024 14:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8iMuvi5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCBC1124E1
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 14:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711117612; x=1742653612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o4E/Zj83U0Y6YxG0rpC9OFsnUQMyBjXmE47shmXfxs8=;
 b=N8iMuvi52GpPQ9Vna/IKtGOz9UzYPvBtvdfZIW1o+IvoLAIwbmvbOnDV
 oGDJ8ZWcKpXRXlOaRz1+3jyJzXMSda+SR6cf7Kt4KzV2tr9ZqJgSblFVX
 mEKTNKd6tZT+TYF1VLObZyw8lCUG/P/JuFwyWi8yE3ICbNuCmMx3mIMrA
 PHZoGCh6AfRvptoiST4l52mHTXmgM136hjKObhWPDKm7SILPSxHpLsB02
 YsIP5XRJMeOMH//EMrAIu+C0XkMjVTFCOjul2C+pauNMfYwwoqSJT4IEq
 xhB2nYntFzE7z45rHio850hQGojUw6JRZee10yuzG1iH60oaeDpx+hFaq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5996398"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="5996398"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19587353"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:26:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [CI 0/2] drm/xe: Refactor BO flag
Date: Fri, 22 Mar 2024 07:27:00 -0700
Message-ID: <20240322142702.186529-1-lucas.demarchi@intel.com>
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
any change in behavior here.

Lucas De Marchi (2):
  drm/xe: Stop passing user flag to xe_bo_create_user()
  drm/xe: Normalize bo flags macros

 .../xe/compat-i915-headers/i915_gem_stolen.h  |   2 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c      |   8 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  16 +--
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  22 ++--
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |   4 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   6 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |   4 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |  54 ++++-----
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  20 ++--
 drivers/gpu/drm/xe/xe_bo.c                    | 106 +++++++++---------
 drivers/gpu/drm/xe/xe_bo.h                    |  45 ++++----
 drivers/gpu/drm/xe/xe_bo_evict.c              |   2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c               |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  12 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |   8 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c             |   4 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               |   6 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   6 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c          |   6 +-
 drivers/gpu/drm/xe/xe_guc_log.c               |   6 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |   6 +-
 drivers/gpu/drm/xe/xe_huc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   6 +-
 drivers/gpu/drm/xe/xe_lmtt.c                  |   4 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |   6 +-
 drivers/gpu/drm/xe/xe_memirq.c                |  10 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   4 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  10 +-
 drivers/gpu/drm/xe/xe_sa.c                    |   6 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |   4 +-
 drivers/gpu/drm/xe/xe_vm.c                    |   2 +-
 33 files changed, 203 insertions(+), 204 deletions(-)

-- 
2.43.0

