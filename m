Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D1FC3ABBC
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 13:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A589A10E26A;
	Fri,  9 May 2025 13:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2wCTy4C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FED410E26F
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746798682; x=1778334682;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mQ9KikpIq0VSLNrWaB+5Sk1PodiSv3BxMRQB6IndCVg=;
 b=F2wCTy4C7bRsqaugGtcHuDpka2GdLCO69vV5GCQcwU7fAUSBEoQhxXkZ
 9I+ztrcZOqliyMG2VWVvwVJStUoX2HkWIeCtOPuHQhUGqW0H5WUGw9laF
 zF6dxngu7LZ1esv0lFY+OJNsYKAH5yZWq78MnjHLcn4qFgP6UqzpCUpLE
 /8QMHGbQyEvq86e7NiUh58kf/JKJlKwmv/annF/qNqRvsBlpTKjgW6aN5
 h7r04ScvL4oGFzPLXEQvyJhy9EGamJkW67uFgJlx2PPmt6vHRiYqwOW0J
 aA1x5LCmVQYEyGs50vFRqXDmekuX3Y3lEi7Nb6cdI5yEDe9IlNEkGnSIh g==;
X-CSE-ConnectionGUID: IJlIUPbhS8ehldPbVn2L+g==
X-CSE-MsgGUID: TE8YO9BjSg2ARHG7aMPG5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59288517"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="59288517"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 06:51:17 -0700
X-CSE-ConnectionGUID: AXvUQcvURxG+q1jLxAk5jw==
X-CSE-MsgGUID: AkTzshJYTuS089Iy6TMKwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="141539078"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 06:51:15 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 0/5] drm/xe/hwmon: Add mailbox power limits, PL2,
 read energy from PMT
Date: Fri,  9 May 2025 19:20:58 +0530
Message-Id: <20250509135103.345303-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add support manage power limits through pcode mailboxes.
Enable PL2 support through powerX_cap.
Expose PL2 interval through powerX_cap_interval.
Read energy status from PMT instead of MMIO.
Move power2_crit to power1_crit.

v2:
 - Addressed review comments from Badal.
 - Clamp the power limits maximum to BIOS default value due to
   HSD:16027383332.

v3:
 - Clamp power limit write also to BIOS default for platforms
   with mailbox support.
 - Enable power label if any of PL1 or PL2 is enabled.
 - Address review comments in v2.

v4:
 - Remove unncessary debug prints.
 - Rebase.

RFC patch: https://patchwork.freedesktop.org/series/148148/

Karthik Poosa (5):
  drm/xe/hwmon: Add support to manage power limits though mailbox
  drm/xe/hwmon: Move card reactive critical power under channel card
  drm/xe/hwmon: Add support to manage PL2 though mailbox
  drm/xe/hwmon: Expose powerX_cap_interval
  drm/xe/hwmon: Read energy status from PMT

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  68 ++-
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  10 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   6 -
 drivers/gpu/drm/xe/regs/xe_pmt.h              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 477 +++++++++++++-----
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pcode.c                 |  11 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_vsec.c                  |   4 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |   4 +
 12 files changed, 468 insertions(+), 136 deletions(-)

-- 
2.25.1

