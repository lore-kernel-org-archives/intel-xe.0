Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1920E668AC
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 01:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D6A10E057;
	Sat, 20 Dec 2025 01:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uu61K67R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA44910E057
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Dec 2025 01:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766195089; x=1797731089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TDrIXKvC8njGErBG9ks7Yz33/OTC1pLQvV9d5NHf7ok=;
 b=Uu61K67Rn77PPM7UPCDAya5LH2Sgu6Jd7DWQBJlSRyfH6rJNGfj20tuV
 DCC77p76i0RbV1Cm0gJK/RTvsTHikOw8g8NO2bs7swXNpKCDIrtNusmyD
 1oZGrq8rmF9zzZPt/0CGVcq0DLWoxT+7UcT/f9PAS1kY/jw2EgTUwBtdy
 RAQWTkFkElmJBlSUQ7+92Lq63yv7NmLycaMqF6MxGXJcg3huv0HPUIDS9
 nj+EGoIfpwX79e26Z9sXRD1N0xfpMEFqVYylHr9ZCdAEylwNVU+KSZb75
 dKN/pe7QuIiTrKrhJThfbMTZl+YQDb+0rn6ncCv4W4Gp7nBjKxggYMMRr A==;
X-CSE-ConnectionGUID: /k8XLQX2Tiy8nTVc1WGwPQ==
X-CSE-MsgGUID: 9cvxJrtTRpetE2+lNlok7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79273650"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="79273650"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 17:44:48 -0800
X-CSE-ConnectionGUID: AzUxOJBeQ7+vpy+2njz7lA==
X-CSE-MsgGUID: VMfkFE4/SzWzt/iJEC9hpA==
X-ExtLoop1: 1
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 17:44:48 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v6 0/3] Add SoC remapper support for system controller
Date: Fri, 19 Dec 2025 17:44:43 -0800
Message-ID: <20251220014442.3076408-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add system controller configuration using SoC remapper for Xe3p

v2:
- s/remapper/soc_remapper/
- return status from init during probe
- reorder patches 1 and 2 from earlier series
- fix copyright year
- retain comment
- s/BITS/MASK/

v3 and v4 with review comments incorporated.
v5: Rebase since patch did not apply for CI run
v6: Review comments from Badal

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/soc_remapper: Initialize SoC remapper during Xe probe
  drm/xe/soc_remapper: Use SoC remapper herlper from VSEC code
  drm/xe/soc_remapper: Add system controller config for SoC remapper

 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h              |  3 --
 .../gpu/drm/xe/regs/xe_soc_remapper_regs.h    | 14 +++++
 drivers/gpu/drm/xe/xe_device.c                |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h          | 16 ++++++
 drivers/gpu/drm/xe/xe_pci.c                   |  5 ++
 drivers/gpu/drm/xe/xe_pci_types.h             |  2 +
 drivers/gpu/drm/xe/xe_soc_remapper.c          | 52 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_soc_remapper.h          | 13 +++++
 drivers/gpu/drm/xe/xe_vsec.c                  |  6 ++-
 10 files changed, 112 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h

-- 
2.43.0

