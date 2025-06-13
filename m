Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76339C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386FA10E4AC;
	Fri, 13 Jun 2025 19:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLHdkcZu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6FB10E4AC
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749843110; x=1781379110;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UCqS4je6me1uSRyxPf23QwViJV3q5FLLJ51zh69ZJGw=;
 b=hLHdkcZuuugGQU6yYBFp6QgCcLN3xDm2LV+qsOMiE//S3dEddE++kdne
 s6N80DtVrNZXjrqHgaRC4m4MIW0C9JTbsETW5Q8YsnWsoMunqRBMdF9Ii
 Oc0kynVuHcz3CviJgka/mPI5ZAF8AF0ZegYzH53NPvHarGrB1tpmMjFII
 j8pCzdug9v1DZ/Cj23HSw/TqfwydHcopKVTEde7nRbiAc67UGGRscEF7P
 kfWzpetJ2oEYKutFjJcxQoAPp+yPrFnoL0o3vMGe8Q+/bfIhSWjmzG/dn
 f3GnDMGUhMC4xKmasKMduNiWu8SxuAEUqLJPhQWaKDKfos0OHvCAzVMX1 w==;
X-CSE-ConnectionGUID: VhxlJhT1TNWbxMPVnYlFQQ==
X-CSE-MsgGUID: nHfcdWSWTLaJV2Z0FMy6Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69510496"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69510496"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:31:50 -0700
X-CSE-ConnectionGUID: Pa0wJxS9Tbq5B1fOVxh76g==
X-CSE-MsgGUID: rmDix2z4Qpq01ZMfp+UBNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="151722638"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 12:31:48 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 0/9] Add WildCat Lake support
Date: Sat, 14 Jun 2025 01:01:37 +0530
Message-Id: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
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

Enable Wildcat Lake by adding PCI IDs and add the initial support GT, Media
and Display workarounds.

Dnyaneshwar Bhadane (3):
  drm/i915/xe3lpd: Extend DMC load path for display version 30.02
  drm/i915/wcl: C10 phy connected to port A and B
  drm/i915/xe3lpd: Extend WA 16023981245 for display 30.02

Matt Atwood (2):
  drm/i915/xe3lpd: Update bandwidth parameters for display version 30.02
  drm/i915: Set max cdclk for display 30.02

Matt Roper (4):
  drm/i915/xe3lpd: Add support for display version 30.02
  drm/xe/xe3: Add support for graphics IP version 30.03
  drm/xe/xe3: Add support for media IP version 30.02
  drm/xe: Add Wildcat Lake device IDs to PTL list

 .../gpu/drm/i915/display/intel_atomic_plane.c    |  3 ++-
 drivers/gpu/drm/i915/display/intel_bw.c          | 11 ++++++++++-
 drivers/gpu/drm/i915/display/intel_cdclk.c       |  4 +++-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c     |  8 +++++++-
 .../gpu/drm/i915/display/intel_display_device.c  |  1 +
 drivers/gpu/drm/i915/display/intel_dmc.c         |  3 ++-
 drivers/gpu/drm/xe/xe_pci.c                      |  2 ++
 drivers/gpu/drm/xe/xe_wa.c                       | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules               |  6 ++++++
 include/drm/intel/pciids.h                       |  4 +++-
 10 files changed, 52 insertions(+), 6 deletions(-)

-- 
2.34.1

