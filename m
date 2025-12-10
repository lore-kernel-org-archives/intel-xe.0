Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F11D3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 06:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA4E10E666;
	Wed, 10 Dec 2025 06:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fk1C2qXg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3725710E666
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765347793; x=1796883793;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PiSkGg7K5KqLpbO0MpUCcUcmeH3Au2lHxYEYjekN4Ao=;
 b=fk1C2qXgcaaR+X0M02DnubjJYLVukj2JXr+Fcv9qUNsv7M9TA71WEt1d
 YlA16vzKIDc8/Lu+/aH2uDAfRrEi9IJiUC8DZBDP+AJGltPflGeyihzEy
 lLLV9ipUbA+loxDRAfjQrTH3aKf4X78Rf36nuvQBIwkX5GfhdEJNIK7Eb
 ihULsT1jjOOMRsIgt/+CLn/QzJiUZjl0rTK7ZvYVqi2b2cDz15An1SdYY
 ti2zlAMK95VJC44mMlhO58+gwlQJ0Rp1U1iDibV0zst0f68hrB4PwELyx
 AN+4BOmXzER3LVpxOfX3SLft5yu4ozOsGGCHh1Xtq1R9HKBLlMlYRIKbI Q==;
X-CSE-ConnectionGUID: mVwnNNYYRsaWgeBVxmKYAg==
X-CSE-MsgGUID: GeIcsLehR5yRJoXXtmwbpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71176005"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71176005"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:12 -0800
X-CSE-ConnectionGUID: KtLmAvwjRFm+I+WeH1lZ6w==
X-CSE-MsgGUID: b/dez2VnSNyADI9SswVp6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196483757"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:09 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 0/7] drm/xe/hwmon: Expose new temperature attributes
Date: Wed, 10 Dec 2025 11:52:54 +0530
Message-Id: <20251210062301.4080549-1-karthik.poosa@intel.com>
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

Expose tempX_emergency and tempX_crit for package and vram,
representing shutdown and critical temperature thresholds.
These values are read via pcode thermal mailbox commands.

These are read using pcode thermal mailbox commands

v2: 
 - Expose memory controller, pcie and individual vram
   temperatures also.
 - Addressed some of review comments of v1 from KVP.

Karthik Poosa (7):
  drm/xe/hwmon: Read temperature limits using pcode mailbox
  drm/xe/hwmon: Expose tempX_emergency
  drm/xe/hwmon: Expose tempX_crit
  drm/xe/hwmon: Read thermal sensors count
  drm/xe/hwmon: Expose memory controller temperature
  drm/xe/hwmon: Expose GPU pcie temperature
  drm/xe/hwmon: Expose individual vram temperature

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 104 +++++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h          |   3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 286 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 7 files changed, 399 insertions(+), 9 deletions(-)

-- 
2.25.1

