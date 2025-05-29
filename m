Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F7BC5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 16:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EF910E0AB;
	Thu, 29 May 2025 16:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNxH/IU2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C5810E0AB
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748536508; x=1780072508;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SSDL/a/UVNVcCeAEuEL6gPa2hj5kRc0txquTYQTHsTk=;
 b=NNxH/IU2VOH79eq/oea2KVOjCclI5t51+swdvHZ36IGxJ4sP0x0cTyaE
 HCD98jQfvEtwT80zmI7HViJBdjoSDakc14Kee1Zhb3lsw7ONoB+4yBFKj
 C27dQR4GwlBaozp/2gZfiCag+uUzwlg8wJ7CTpCrWAAGK1xuFnYi5Thoi
 /05TGR7/K0bMOP4tlIqQ4C0Hq+EVeYZ6hHAufP+fS/9Eyx9P+xgMRvCvo
 K6SZ9FRYIt1cBJ1GApnTC5R5rY9w62xyns98lygREjz0j1doucac1ygxt
 2v9Gz3VyoQ8nGNd8AbwWtEwSQKH5HCbWb3a5sXwp5uH4f8U/oYoX7x3sv A==;
X-CSE-ConnectionGUID: 0jl/Y1PDTI6sSr1LmoiZVw==
X-CSE-MsgGUID: /KgH5L84T1uw6RSjYXnh2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="53233185"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="53233185"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 09:35:07 -0700
X-CSE-ConnectionGUID: 4fFjEUsvRO2sKppRUhVH+A==
X-CSE-MsgGUID: clR+wh9iQqCmCloxrWVRMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148398999"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 09:35:06 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v12 0/6] drm/xe/hwmon: Add mailbox power limits, PL2,
 read energy from PMT
Date: Thu, 29 May 2025 22:04:52 +0530
Message-Id: <20250529163458.2354509-1-karthik.poosa@intel.com>
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
 - Clamp the power limits maximum to GPU firmwar default value due to
   HSD:16027383332.

v3:
 - Clamp power limit write also to GPU firmware default for platforms
   with mailbox support.
 - Enable power label if any of PL1 or PL2 is enabled.
 - Address review comments in v2.

v4:
 - Remove unncessary debug prints.
 - Rebase.

v5:
 - Resolve unused variable compiler warning.
 - Add a return value check.

v6:
 - Address kernel-doc build error.
 - Rebase.

v7:
 - Rebase.

v8:
 - Rebase.

v9:
 - Rebase.

v10:
 - Remove unnecessary drm_warn.
 - Rectify powerX_label permission to read-only on platforms
   without mailbox power limits support.
 - Expose powerN_max/cap_xxx entries only on platforms with mailbox
   support.

v11:
 - Enable power_xxx sysfs entries only when GPU firmware support it.
 - Display logs in dmesg about which power limits are supported in
   the GPU firmware.
 - Recitfy few drm_dbg prints.

v12:
 - Remove an unneeded comment.

Patch series history:

https://patchwork.freedesktop.org/series/148148/ - RFC
https://patchwork.freedesktop.org/series/148506/
https://patchwork.freedesktop.org/series/148811/
https://patchwork.freedesktop.org/series/148819/
https://patchwork.freedesktop.org/series/148926/
https://patchwork.freedesktop.org/series/149026/
https://patchwork.freedesktop.org/series/149387/
https://patchwork.freedesktop.org/series/149434/
https://patchwork.freedesktop.org/series/149633/


Karthik Poosa (6):
  drm/xe/hwmon: Add support to manage power limits though mailbox
  drm/xe/hwmon: Move card reactive critical power under channel card
  drm/xe/hwmon: Add support to manage PL2 though mailbox
  drm/xe/hwmon: Expose powerX_cap_interval
  drm/xe/hwmon: Read energy status from PMT
  drm/xe/hwmon: Expose power sysfs entries based on firmware support

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  68 ++-
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  10 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   6 -
 drivers/gpu/drm/xe/regs/xe_pmt.h              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 508 ++++++++++++++----
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pcode.c                 |  11 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_vsec.c                  |   4 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |   4 +
 12 files changed, 498 insertions(+), 137 deletions(-)

-- 
2.25.1

