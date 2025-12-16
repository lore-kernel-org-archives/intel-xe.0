Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8636D5B87E
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 01:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE2C10E633;
	Tue, 16 Dec 2025 01:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEdxmHPn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9910E62A
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 01:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765847952; x=1797383952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dlgp2iq6yQ/cTRT0/fSTUJwacu0UNxwwE1qgWjJpuLs=;
 b=AEdxmHPnMMg5/6YftcEOAIEX9I49/+w2XVHFFjVBqDGD0UEkTbX4njt/
 gfDT9BIxNhcGd+dT08lx7Z5lIljW6gK7OVouPLUluUwQebG+vc2OkYQWY
 +xKDKMOcJcj4vGssTVzxIOIMiVp8qFU3/lFk8UylTg8DZ8xG//co3uTbl
 MCgfNYNJOvzTJr5MNt5WljkbhxjAIQC6aR4lM3PwruPtLa1kNG57K+kf1
 xbi9fGdDhjIX5bY4GY6aZlOt34Y6Lm3rr+ljN9VVPGHeS1D+dw0pv+O7L
 yk9367Uzp5J6O3wT+nIDVfSE0ORdca+1LEBGKjG4jC1vh2wUjWmdbTDPB w==;
X-CSE-ConnectionGUID: UJcVKSz1SXmQLqiAU261Zw==
X-CSE-MsgGUID: inOp2rH+QgqkisUHIANacA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85172139"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="85172139"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 17:19:11 -0800
X-CSE-ConnectionGUID: JdudDqBVS8iGAfzIPNbNTA==
X-CSE-MsgGUID: ijCOJ1B0QE+sC+dYB5o1Zg==
X-ExtLoop1: 1
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 17:19:10 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v4 0/3] Add SoC remapper support for system controller
Date: Mon, 15 Dec 2025 17:19:05 -0800
Message-ID: <20251216011904.2771875-5-umesh.nerlige.ramappa@intel.com>
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

