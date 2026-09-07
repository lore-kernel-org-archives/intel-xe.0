Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50BAC79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 09:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8682010E38E;
	Mon,  7 Sep 2026 09:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Un652tDp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CD110E38E
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788774440; x=1820310440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lukoKwiQA0NQh52fDtnkHjuxCbvyO+qKAgADA0FOndI=;
 b=Un652tDpDuOsvQx0wuVBGWOtmWODPOLbfg8/DJn5ndVCSfLZAP0zV4Nn
 dRqGlW4rvQ31sBPSffAlo9bmNAIMVQ3TiFBTk+gjV+G+va3POTT6TVns3
 IFMYJIKvuj0j4CMyVNwhV8k74jew/lQuYhDZytRn5XDey1QABBinmPQDA
 VgmQH4KwmKEVgSesT888LqjT++bjRZTmUWXcJ3iy0gvTm1nEgboCYG+7k
 1VGG/p1xpyyfyVXXa/6XL1Oe2ra0SGvroc0bALNPalsVu2fncp1kubdlY
 z2Oy0S91bvAZgmnCohgqeuFAjR3AQvbrb1LPsVs/A5OVuRA5iTsuBkMX8 g==;
X-CSE-ConnectionGUID: kXPs7iD3TZusQ5dSLIxY7Q==
X-CSE-MsgGUID: IVOhoRRtRkKntQvF0HNJiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100531973"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100531973"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:47:19 -0700
X-CSE-ConnectionGUID: m4XbPCh3SPSc3gsvd8jVQQ==
X-CSE-MsgGUID: Oh+bvMbZRJqd57aLvIIJJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274175689"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:47:17 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v2 0/6] Add support to handle memory double-bit ecc errors
Date: Mon,  7 Sep 2026 15:17:06 +0530
Message-ID: <20260907094706.1407436-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

This series introduces the firmware commands required to handle
uncorrectable memory double-bit ecc errors.

When a error is detected, the driver determines whether the affected
page can be offlined and sends an offline/decline request to firmware
via sysctrl interface. Pages belonging to critical Bos or stolen memory
require a Secondary Bus Reset(SBR) to recover.
Pages configured for log-only handling are declined.

For the rest of the valid pages, the first error is a poison error and a
decline is sent to firmware to avoid marking the page as bad. On the
second occurence at the same address, we request the firmware to offline
the page as this would indicate a Double-bit ECC error. Any subsequent
errors at the same address should be because of memory scrubber and a
decline is sent to firmware to remove the page from queue. This is done
by tracking the firmware offlined pages by Xe KMD.

At module load, the driver queries firmware for both the offline list
and the queue and processes them accordingly.

Rev2: Rebase
      fix sigid logs
      fix sashiko review comments

Riana Tauro (6):
  drm/xe/xe_ras: Handle page offline requests for device memory ecc
    errors
  drm/xe/xe_ras: Add support to query page offline queue and list
  drm/xe: Separate drm-ras netlink data from device and firmware RAS
    state
  drm/xe/xe_ras: Add function to get maximum pages firmware can store
  drm/xe/xe_ttm_vram: Report max_pages reported by firmware in debugfs
  drm/xe/xe_ras: Track offlined pages by firmware to avoid duplicates

 drivers/gpu/drm/xe/xe_device.c                |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  11 +-
 drivers/gpu/drm/xe/xe_drm_ras.c               |  16 +-
 drivers/gpu/drm/xe/xe_drm_ras_types.h         |   3 -
 drivers/gpu/drm/xe/xe_hw_error.c              |   6 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 272 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |  13 +-
 drivers/gpu/drm/xe/xe_ras_types.h             |  93 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   6 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   9 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |   2 -
 11 files changed, 395 insertions(+), 40 deletions(-)

-- 
2.47.1

