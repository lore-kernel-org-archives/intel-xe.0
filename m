Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA3DC54E41
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 06:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588A810E129;
	Thu, 29 Feb 2024 06:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqD+htLE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848BA10E0AE
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 06:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709187209; x=1740723209;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=64avR8JdXSQndXUcvApsk4iCXoiZT6PeE5ZMzcbvZH8=;
 b=HqD+htLEYbr2lsd0R1jTfhqJ7Kx2nk/0sLDQEiUSlT5L3pO3dQH9RKxD
 Hm8GdgHLNDw/u/UZYzthhhiWArQZrIfCwHF3TMSJsqrtCyRMZKW8MmWKj
 icVoiV0ssMMofk7vCmJDypazXFv/9Vsp3W+OyENBohGHwpoV+ndNECf/f
 +RBgw+0tUznUoEodrOxrFxEvd8AOru/VaoGBnl3pjvkN6di9c8e8jNbMt
 fl8z4Pv8f+LaF1qYtTF4fCCIK4VCyzJ44LBXSjzw3VcDLMkrqGTa0W83d
 KItomCNjZ0KtKBZ7SIRnzl0ImLF8PFOF/EB49VNrEC7MkZGTBQwRR9V0x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3802659"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="3802659"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:13:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="12400561"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by orviesa003.jf.intel.com with ESMTP; 28 Feb 2024 22:13:27 -0800
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH V1 0/3] drm/xe/arl: Add Arrow Lake H support
Date: Thu, 29 Feb 2024 11:43:28 +0530
Message-Id: <20240229061331.3398966-1-dnyaneshwar.bhadane@intel.com>
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

These patches includes the new PCI ids and support of workarounds 
for ARL-H platform.

Graphics version 12.74 (which is technically called "Xe_LPG+") should 
be handled the same as versions Xe_LPG 12.70/12.71 by the KMD.


Matt Roper (2):
  drm/xe/xelpg: Recognize graphics version 12.74 as Xe_LPG
  drm/xe/xelpg: Extend some workarounds to graphics version 12.74
  drm/xe/arl: Add Arrow Lake H support

 drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
 drivers/gpu/drm/xe/xe_pci.c           | 1 +
 drivers/gpu/drm/xe/xe_tuning.c        | 4 ++--
 drivers/gpu/drm/xe/xe_wa.c            | 8 ++++----
 include/drm/xe_pciids.h               | 3 +++
 5 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.34.1

