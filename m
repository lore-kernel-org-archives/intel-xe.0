Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AAF606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jkZL+xoM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5213211224A;
	Thu, 19 Nov 2026 10:24:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F5A11224A
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 10:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795083871; x=1826619871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uXMcYUHFnCm+uMtQei55EfXBTUUWLjx1A6USZ0M71j4=;
 b=jkZL+xoM1JkQevfTWowXvpAl/mrKj6Qe0Q2tP7dS1ICXAS1uZzGuPu37
 mUjcVGW5ZobsocQfcpyy5ySYo/1qk99RGXESqYfxUyiRY2ogY+OVBIkHy
 IAZXL2Cpx2cdmpM5mGtXH1cZxDYsXejbM7CPB3R4WyczQkBEn4yMr3ghv
 4btwNjWTk5us+Ndaq2+VUYzeJoiWSi03jXYGh0sJ1Ppni5Dcs2FTV3dwN
 kH2BZ2JdI2g2V3F7VQ8cpo+3AJr/P6yVKEgvKPS6Sy7YJwMWJBel7obDH
 wzikFpkTOYJjakT8gkCv7tfpBlcnv3fvaBUDHJJOrX8Dvpr7thxOktKz5 w==;
X-CSE-ConnectionGUID: IXt5PQ9uQUK6YBjmhQ16vw==
X-CSE-MsgGUID: Muws8ztuTOigRkWigxLing==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3957618"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3957618"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 02:24:31 -0800
X-CSE-ConnectionGUID: vvAmj2cVS9+AWzNDoIjHbg==
X-CSE-MsgGUID: A4oPN+zlSi2rR3D8dBuMbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10473882"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 02:24:29 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, stuart.summers@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 0/2] Protect drm_ras against unplugged or wedged device
Date: Thu, 19 Nov 2026 15:52:16 +0530
Message-ID: <20261119102344.2053821-1-raag.jadav@intel.com>
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

v4: Also use xe_wedge_mode_is_no_reset() in guc_submit_hint_wedged() (Sashiko)

Raag Jadav (2):
  drm/xe/drm_ras: Protect against unplugged or wedged device
  drm/xe/wedge: Introduce xe_wedge_mode_is_no_reset()

 drivers/gpu/drm/xe/xe_drm_ras.c     | 93 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_ads.c     |  3 +-
 drivers/gpu/drm/xe/xe_guc_capture.c |  3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c  |  4 +-
 drivers/gpu/drm/xe/xe_pci_error.c   |  2 +-
 drivers/gpu/drm/xe/xe_wedge.c       |  5 +-
 drivers/gpu/drm/xe/xe_wedge.h       |  5 ++
 7 files changed, 83 insertions(+), 32 deletions(-)

-- 
2.43.0

