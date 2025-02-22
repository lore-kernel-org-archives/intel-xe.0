Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C37C021B7
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 00:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2C510EB46;
	Sat, 22 Feb 2025 00:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ly0zCQMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883F810E0E9
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 00:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740183069; x=1771719069;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WqYkKBb2u63T5V29qMe/Fq0rAwTbtGuBCC8GzSPJer0=;
 b=ly0zCQMFUJ2tW/qnqs/YurasBVVZRYgaTzUxJ5Cve8IV5LV5ahuHQlp2
 SsrYS1Iz5A3xpbHPuXovPzK9ggL1Y7PIq22FFB1BAdwY3zy+rZVdA2z2S
 L1iEqoHxEuxr6RX8SPvUtYBGLdwjdw+YKBzriZbfxvyvfez0Km7HXVkxo
 MIiYkGPX/NBBB7J4YJH2DRHDYEYDoLYOBFPDkv9+UJ6623Ehkg3OhhWjs
 +1+TRnnzq4TVkJ/Kjz2uH11yOlHJV/09zOISof0QFdtiac44wLtvbnB5V
 OW6IEXDA84Fbb0TogK3lvBfYitNgbraHMmVp7PDi+DIJR+ZVkrHBP3cgv w==;
X-CSE-ConnectionGUID: CPDd9O+6R6GCxGEA2uj3nQ==
X-CSE-MsgGUID: gZF2+7fdQJSDLr6l/3v/pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44926384"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="44926384"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:08 -0800
X-CSE-ConnectionGUID: eEBOEzk0SnqnvGzbgPy8gg==
X-CSE-MsgGUID: LKEPTmMhR76A3MvzpiNjAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115704924"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 00/11] Cleanup error handling on probe, batch 2
Date: Fri, 21 Feb 2025 16:10:40 -0800
Message-ID: <20250222001051.3012936-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
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

More patches to cleanup the probe sequence.

v2:
  - Minor rewords and comments from code review
  - Bring the Acked devres patches from the other series since
    it's clear now this is going through drm tree.

Lucas De Marchi (11):
  drivers: base: devres: Allow to release group on device release
  drivers: base: devres: Fix find_group() documentation
  drivers: base: component: Add debug message for unbind
  drm/xe: Stop setting drvdata to NULL
  drm/xe: Switch from xe to devm actions
  drm/xe: Drop remove callback support
  drm/xe/display: Drop xe_display_driver_remove()
  drm/xe: Move survivability entirely to xe_pci
  drm/xe: Stop ignoring errors from xe_heci_gsc_init()
  drm/xe: Rename update_device_info() after sriov
  drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init()

 drivers/base/component.c                   |  3 +
 drivers/base/devres.c                      | 12 ++-
 drivers/gpu/drm/xe/display/xe_display.c    | 13 +--
 drivers/gpu/drm/xe/display/xe_display.h    |  1 -
 drivers/gpu/drm/xe/xe_device.c             | 98 +++-------------------
 drivers/gpu/drm/xe/xe_device.h             |  3 -
 drivers/gpu/drm/xe/xe_device_sysfs.c       |  6 --
 drivers/gpu/drm/xe/xe_device_types.h       | 14 ----
 drivers/gpu/drm/xe/xe_gsc_proxy.c          |  2 +-
 drivers/gpu/drm/xe/xe_heci_gsc.c           | 37 ++++----
 drivers/gpu/drm/xe/xe_heci_gsc.h           |  3 +-
 drivers/gpu/drm/xe/xe_pci.c                | 28 +++----
 drivers/gpu/drm/xe/xe_survivability_mode.c | 77 +++++++++--------
 drivers/gpu/drm/xe/xe_survivability_mode.h |  5 +-
 14 files changed, 96 insertions(+), 206 deletions(-)

-- 
2.48.1

