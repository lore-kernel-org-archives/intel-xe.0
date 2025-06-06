Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3F6C61DB2
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 19:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBADA10ECA5;
	Fri,  6 Jun 2025 19:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsGF1CjM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A06F10EC19
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 19:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749239467; x=1780775467;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eKKduhHGU9VJ6u5vRgpZnROC0CXjjVTUlxlSXsMz+h0=;
 b=GsGF1CjMfCgeZ/Q8ybs19a9beXtZaoD8wIi/a4teOArZIiYzezYauImw
 MxWmvEa8jWgNX3YNhxNPpNZBFlOhbdwxhhKCX6384O8nsLWE0rK+R4qYl
 miZhj4h9Io18l5fqWZ9da7wto3nAQHKvQDClkv1iVR0AkQNU25aVib/DG
 jDGMTomSPf88DfEvW/REDEUVzq7zOHqWgeOiIBjsYQLQK8eqtK0IySjea
 ZcSYc3s+45RaLCvHgD9jhUg5h3tj5pwP28NuHao2aI0LrqQDb9n2Frt+X
 vzYQDsTOE75jTFdKRAy/QGjBQSwNVoj2fMWHOdIP1M/m8g6/b4J4tvXKw w==;
X-CSE-ConnectionGUID: 1JMbjGEuQCKxZD7EsPacfQ==
X-CSE-MsgGUID: tMhI0BaLTJiT2ktRydHurg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51277285"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="51277285"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:51:07 -0700
X-CSE-ConnectionGUID: 7jfQAUOnSIuRIV5b6ekOIg==
X-CSE-MsgGUID: m5KqBnxVT7a4ju6HNa3qFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="145796001"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2025 12:51:05 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 0/9] Add WildCat Lake support
Date: Sat,  7 Jun 2025 01:20:55 +0530
Message-Id: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
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
  drm/i915/xe3lpd: Extend DMC path for display version 30.02
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
 drivers/gpu/drm/i915/display/intel_cx0_phy.c     |  3 +++
 .../gpu/drm/i915/display/intel_display_device.c  |  1 +
 drivers/gpu/drm/i915/display/intel_dmc.c         |  3 ++-
 drivers/gpu/drm/xe/xe_pci.c                      |  2 ++
 drivers/gpu/drm/xe/xe_wa.c                       | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules               |  8 ++++++--
 include/drm/intel/pciids.h                       |  4 +++-
 10 files changed, 48 insertions(+), 7 deletions(-)

-- 
2.34.1

