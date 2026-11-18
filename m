Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA99606A32F
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 15:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kcq0S+Ru
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAFF10FD85;
	Wed, 18 Nov 2026 15:32:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A803310FD85
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795015966; x=1826551966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bjkA2mc5DKLCgfwGvIkV9i2mPqZk7bon53HF9SvF8ek=;
 b=Kcq0S+RuWWbIxNgWhUwEWI755dRDa2KiFkNWKOsR5ASMy1u+qtKyU6tp
 pe1CXNsVysD14I6OSG/lR5Nr3rQGFTms18r4/7VLMD2hZK/8lXsyQDKd4
 76h4esGmvPZV7q5UDAJ7HtMVLdHq1d32TDX2dY0t19PWMiaMvInc6F632
 nPJl34CL4BKqiMW1iyrJPlWabUyBjYbr4fgxrYCOXYUxCGhBlEee0hHC7
 cRUX1dwvHmqVtYeIJ29cfy+xfqjwe2QV45N3DaTUyvz17wVSS60uMsrwr
 dp9GcxQBcK6n1H6oo9lJ8jLVRNUqWDfoG+wmj+ZgX9EQ+DHWaEOJ+c5OW A==;
X-CSE-ConnectionGUID: dP5pt9lsSty3q3PJ1CMuRg==
X-CSE-MsgGUID: FF+5YVweSMylUlg9WEVHvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3832242"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3832242"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:32:39 -0800
X-CSE-ConnectionGUID: 2EthYrTvS6S5i6hFBbIpbw==
X-CSE-MsgGUID: D3YYfkN6RNu+ThTP4xAILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10079077"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 18 Nov 2026 07:32:38 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, stuart.summers@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/2] Protect drm_ras against unplugged or wedged device
Date: Wed, 18 Nov 2026 21:01:33 +0530
Message-ID: <20261118153154.2024753-1-raag.jadav@intel.com>
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

Raag Jadav (2):
  drm/xe/drm_ras: Protect against unplugged or wedged device
  drm/xe/wedge: Introduce xe_wedge_mode_is_no_reset()

 drivers/gpu/drm/xe/xe_drm_ras.c     | 93 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_ads.c     |  3 +-
 drivers/gpu/drm/xe/xe_guc_capture.c |  3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c  |  2 +-
 drivers/gpu/drm/xe/xe_pci_error.c   |  2 +-
 drivers/gpu/drm/xe/xe_wedge.c       |  7 +--
 drivers/gpu/drm/xe/xe_wedge.h       |  5 ++
 7 files changed, 83 insertions(+), 32 deletions(-)

-- 
2.43.0

