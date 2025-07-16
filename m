Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F4AC83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 10:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8B410E26F;
	Wed, 16 Jul 2025 10:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTs9eUOH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D9A10E26F
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752661247; x=1784197247;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dSq55WisTmF2X2LMO4k/zZmI30lR7keGys7glJlnRQc=;
 b=mTs9eUOHfaZPIt26ROsOcG2neoPZEhQwADheleUCMkgKpEGGfM0DJEYb
 2PIRa6nZq9p9QVkpEdqrkft0b2NJOLvugWxjhY0gZXA9A+aaFsCKUINmU
 DxQE/iFatAWzouw4lPztwJa7ruefKFTrWJCjzCtJDfLOIk0f1K/tvQPHh
 nbD4xDaFTyf8rcdIDirQsCa91krJxr7neEV3/03z+TCDoPO6o/Xms1tnX
 2XGH3axT3kzRSoZKzixTLWkmHKXxWCDharfQmiot8mTo/bUJ64n1qligV
 ws51T85EyIe3ypAo+TwrgLjt4/LO2BGiwLyNKPat7JZRIaJfI2qpeJRix A==;
X-CSE-ConnectionGUID: WA8/Ct92STiQJYCN0QMP9Q==
X-CSE-MsgGUID: BY+tTH4wTiWCG+QzjZ8dcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55046448"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="55046448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:20:46 -0700
X-CSE-ConnectionGUID: tq7lgwmIQ6qhfXRTwWM3lg==
X-CSE-MsgGUID: XzSTTJvlS5mcp2jiKXBEAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="157818919"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:20:42 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, badal.nilawar@intel.com, karthik.poosa@intel.com,
 riana.tauro@intel.com, jonathan.cavitt@intel.com
Cc: soham.purkait@intel.com, rodrigo.vivi@intel.com, ashutosh.dixit@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v11 0/1] Add debugfs node to expose G-state and pcie link
 state residency
Date: Wed, 16 Jul 2025 15:44:11 +0530
Message-Id: <20250716101412.3062780-1-soham.purkait@intel.com>
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

  This patch exposes G-state and pcie link state residency counter values
through debugfs. The debugfs node "dgfx_pkg_residencies" exposes G-states
counters (G2, G6, G8, G10, ModS) and "dgfx_pcie_link_residencies" exposes
PCIe link states(L0, L1, L1.2) residency counters.

Example:
$ cat /sys/kernel/debug/dri/<bdf>/dgfx_pkg_residencies
Package G2 : 42853454
Package G6 : 26564
Package G8 : 705212205
Package G10 : 748303164
Package ModS : 396016642

$ cat /sys/kernel/debug/dri/<bdf>/dgfx_pcie_link_residencies
PCIE LINK L0 RESIDENCY : 12336019
PCIE LINK L1 RESIDENCY : 2326635578
PCIE LINK L1.2 RESIDENCY : 2326632312

Soham Purkait (1):
  drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency
    counters through debugfs

 drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++
 drivers/gpu/drm/xe/xe_debugfs.c  | 85 ++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

-- 
2.34.1

