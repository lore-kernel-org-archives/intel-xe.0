Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D923C021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 21:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BF410E4A1;
	Fri, 14 Feb 2025 21:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhDmlE79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6183410E08A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 21:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739568223; x=1771104223;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ABi482qmTP0rGD2IWIRgAwC2mg9Da+8QUY3Cr1rTlC8=;
 b=IhDmlE79sJmBzFmRc1FwkrIGF75D+82vsRLrmaWejLAvZzj2nffGaHPg
 XuNDV5GBIXDjt7oDz3kE2dq8xbo5IXzQSEuelA6ParT2S2/jQ+oJlatWB
 IKL86U8JGmCV9bK3GtGoy2hYTxu4BThkASbYry5kq8Mx2kXacJY8ItesF
 mXObiOWDUeqylx+V9KWW1dfOprVw26AyA2EZgAmiCdVR7jrS3aQHtaSsb
 rVv49EUzw0PVwPrEFAM+vnv93vJIY1YKYFyg4prb4hmy3z6BtfWhjAqPq
 U0e2SdUN0cEbEhT09TpZ+eoxQODIpLjpcTnE2eNmREke8I5COUfuSaszk Q==;
X-CSE-ConnectionGUID: EnuUK2i+QUqK9W9AlZ9tFQ==
X-CSE-MsgGUID: Suvnthy/TZO1LgqjIciJjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40447015"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40447015"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:43 -0800
X-CSE-ConnectionGUID: AP102mo4SqKGCutxDCwAZw==
X-CSE-MsgGUID: oTWm8ij/QLGPB+JXEUfztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113757017"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:42 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/9] Cleanup error handling on probe, batch 2
Date: Fri, 14 Feb 2025 13:23:04 -0800
Message-ID: <20250214212313.1767562-1-lucas.demarchi@intel.com>
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

More patches to cleanup the probe sequence. This time there are some
dependencies on the devres change (first patch). I may detangle some of
these dependencies though to continue landing what makes sense,
depending on how review goes. I don't see a pressing need for patch 4 as
we will need it as long as 1 is not solved.

Lucas De Marchi (9):
  FOR-CI-ONLY: devres
  drm/xe: Stop setting drvdata to NULL
  drm/xe: Switch from xe to devm actions
  drm/xe: Drop remove callback support
  drm/xe/display: Drop xe_display_driver_remove()
  drm/xe: Move survivability entirely to xe_pci
  drm/xe: Stop ignoring errors from xe_heci_gsc_init()
  drm/xe: Rename update_device_info() after sriov
  drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init()

 drivers/base/devres.c                      |  7 ++
 drivers/gpu/drm/xe/display/xe_display.c    | 13 +--
 drivers/gpu/drm/xe/display/xe_display.h    |  1 -
 drivers/gpu/drm/xe/xe_device.c             | 98 +++-------------------
 drivers/gpu/drm/xe/xe_device.h             |  3 -
 drivers/gpu/drm/xe/xe_device_sysfs.c       |  6 --
 drivers/gpu/drm/xe/xe_device_types.h       | 14 ----
 drivers/gpu/drm/xe/xe_gsc_proxy.c          |  2 +-
 drivers/gpu/drm/xe/xe_heci_gsc.c           | 37 ++++----
 drivers/gpu/drm/xe/xe_heci_gsc.h           |  3 +-
 drivers/gpu/drm/xe/xe_pci.c                | 27 +++---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 77 +++++++++--------
 drivers/gpu/drm/xe/xe_survivability_mode.h |  5 +-
 13 files changed, 88 insertions(+), 205 deletions(-)

-- 
2.48.1

