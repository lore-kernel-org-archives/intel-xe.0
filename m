Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7382C7EE33
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 13:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DA710E855;
	Thu, 26 Jun 2025 13:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+XpdZ/S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EE910E879
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750944272; x=1782480272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=88hTCTpOe3z1cHcKdZ9JLpg0mmg0U6eLsO5mP0BYyIU=;
 b=X+XpdZ/Snf/8U8T08kAMViLIDNKiVr9BFQ2XJEr/1+rBb9QoIfhqI3T7
 vvVnQjW71NbBKp8P+wIcyoTFPBg2sj81eyXuYJSmuf5LlOYcSrkRG8WMF
 D8C01OsAOmN9WIaoJvINGkVzzzZHST3byN+FuyDK+qarfzMF9XRDqgv3b
 K/a/xwh5JUeiKxsGZNARnu9adGaDCeK+a3O3MiTOFju+lpi0UfOmsIbEA
 d2psIILCss4fShpYXNfY3CS08TYASSYw4sYy2g55tShgcap+48I2I2mob
 kl+mgbWWQVL+MEppQotuC0ClEFYOmh7UZ+1b1VQjhOfFrvQ5yl2fwypjP Q==;
X-CSE-ConnectionGUID: 5MZbVLHwRcGHuStJy/b4Zw==
X-CSE-MsgGUID: KRYqQTULRJyEj45DnDjBMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53106146"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="53106146"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 06:24:31 -0700
X-CSE-ConnectionGUID: Sh+nz18xSS27VbJ67Od/yw==
X-CSE-MsgGUID: QgGIq+0oSIK+b8gOPPuHZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="156790903"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 06:24:28 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jonathan.cavitt@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, jani.nikula@intel.com
Subject: [PATCH v7 0/2] Add debugfs node to expose G-state and pcie link state
 residency
Date: Thu, 26 Jun 2025 18:48:03 +0530
Message-Id: <20250626131805.3977408-1-soham.purkait@intel.com>
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

Example:
$ cat /sys/kernel/debug/dri/<bdf>/dgfx_pkg_residencies
Package G2 : 42853454
Package G6 : 26564
Package G8 : 705212205
Package G10 : 0
Package ModS : 396016642

$ cat /sys/kernel/debug/dri/<bdf>/dgfx_pcie_link_residencies
PCIE LINK L0 RESIDENCY : 12336019
PCIE LINK L1 RESIDENCY : 2326635578
PCIE LINK L1.2 RESIDENCY : 2326632312

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

