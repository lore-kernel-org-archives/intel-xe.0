Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9699EC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 14:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C50910E73D;
	Wed, 25 Jun 2025 14:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AoSl/kuE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F8610E73D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750862347; x=1782398347;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PPvlukfz5DjmEcc/9XCZh5owU029407BBKaYCJ33L1w=;
 b=AoSl/kuEjOWvI+dcUkaVHVabEHyL9Qui3cTnoBy8TzCHaZO0fIXJ1crZ
 XrK/5aUcbUHKhW7d6f260u4x1mDNtWO60f4qbyB0VNbWhZPYta9RbeCtD
 3F0cT4ZWlLAOfiliRb9FyUiKW5AfuftRQULFui1CJCk53SkJ6YG1xSctJ
 KdRhAy0HjTzuanrGuyJfG7YQZYZVgY1cMazKWmAVaGdnI0+M0HSJxPqSV
 qzv91CNVRujzne/6RCggEbB445FX8gpQqFZrZiLnrHa4a902nxmxVEfZA
 nWQmd0s3GVLu5XYo1eINc7f/NQu0l/16OtSWjoKLaoLVV7Rz/rbtAHPaw Q==;
X-CSE-ConnectionGUID: e/BDVpD7SpizPO1ZesE9uA==
X-CSE-MsgGUID: ZExlVy9+RQGxVh78xjdiaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63738899"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="63738899"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:39:06 -0700
X-CSE-ConnectionGUID: jPZ44dxBRuGpN/D7lzwkGQ==
X-CSE-MsgGUID: Lb5jwvrzTp+cOnsBNepbyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156260162"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:39:04 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jonathan.cavitt@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, jani.nikula@intel.com
Subject: [PATCH v6 0/2] Add debugfs node to expose G-state and pcie link state
 residency
Date: Wed, 25 Jun 2025 20:02:52 +0530
Message-Id: <20250625143254.3505218-1-soham.purkait@intel.com>
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

This patch exposes G-state and pcie link state residency counter
values through debugfs. The debugfs node "dgfx_pkg_residencies" exposes
G-states counters (G2, G6, G8, G10, ModS) and "dgfx_pcie_link_residencies"
exposes PCIe link states(L0, L1, L1.2) residency counters.

Soham Purkait (2):
  drm/xe/regs/xe_pmt: Macros for G-State and pcie link state residency
    offset
  drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency
    counters through debugfs

 drivers/gpu/drm/xe/regs/xe_pmt.h | 10 +++++
 drivers/gpu/drm/xe/xe_debugfs.c  | 71 ++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

-- 
2.34.1

