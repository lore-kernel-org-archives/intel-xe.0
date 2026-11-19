Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BEA606A32A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jee13SIP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEE211221D;
	Thu, 19 Nov 2026 09:52:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6692811221D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 09:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795081935; x=1826617935;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I8jf5817vIJOSaGp+U8W9JeM1Y2T01tueevjv3oerQU=;
 b=Jee13SIP+OBZdlEQLGLcSZWBMHP63xYIWOWOUe8U2XXr4X2ugXEP1HzW
 TuhtOH7ZPVvbXnns3rMI9/nV5+FujFCHg4PB/CjFS/5DWHSYbE2ebM5e0
 kQfGWUQtJ1jcZMR4R459sTdMEIMjb4Red0Xn+1Lqv8Dg1Kycp12PUoCFT
 H51mGuwN7dbYPrBf3kkGkZNcPRpTivsbPM3hj9HhNV5meX1FGxP8T0GpN
 FxdEpNtQKHMZx7ErtuXFUibPIzHWz9JjrbAdoY6edvUJ0IE2qTNqT62iY
 W0oaH3NWKwHmPQd/7zTetTk+65IBgRIVD3irdbdu2vePdrBGI6BZSh3pk g==;
X-CSE-ConnectionGUID: yoGQnhBbRGOMY+IwM6s1yw==
X-CSE-MsgGUID: ADcLuEcaTC+s/McWbgvEIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="4004855"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="4004855"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 01:52:14 -0800
X-CSE-ConnectionGUID: 1IQHDjyoQROjDmjqxknX/w==
X-CSE-MsgGUID: E+cKB0t8TtGUjIG0HiNeLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10749153"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2026 01:52:13 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, stuart.summers@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 0/2] Protect drm_ras against unplugged or wedged device
Date: Thu, 19 Nov 2026 15:21:29 +0530
Message-ID: <20261119095151.2041411-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes drm_ras counter access against unplugged or wedged
device and while at it, introduces xe_wedge_mode_is_no_reset() helper.
Detailed description in commit message.

v1: https://patchwork.freedesktop.org/series/178643/

v2: Allow counter access with XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET (Riana)
    Introduce xe_wedge_mode_is_no_reset()

v3: Fix wedge_validate_mode() to check for local mode (Sashiko)

Raag Jadav (2):
  drm/xe/drm_ras: Protect against unplugged or wedged device
  drm/xe/wedge: Introduce xe_wedge_mode_is_no_reset()

 drivers/gpu/drm/xe/xe_drm_ras.c     | 93 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_ads.c     |  3 +-
 drivers/gpu/drm/xe/xe_guc_capture.c |  3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c  |  2 +-
 drivers/gpu/drm/xe/xe_pci_error.c   |  2 +-
 drivers/gpu/drm/xe/xe_wedge.c       |  5 +-
 drivers/gpu/drm/xe/xe_wedge.h       |  5 ++
 7 files changed, 82 insertions(+), 31 deletions(-)

-- 
2.43.0

