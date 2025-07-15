Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB32FC83F1D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 10:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DF010E57D;
	Tue, 15 Jul 2025 10:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAR7wvk8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDCB10E57D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 10:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752573704; x=1784109704;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ogJy0UKNuO795Wrq9czv9H4+a/SjAf20cGq5flHM12Q=;
 b=nAR7wvk8mnwFwwm6zhOxkTwJJnUJoJVAAMRuBjlfUCVcCHoO1TfAc+hu
 htxyMSQ4ecsqy50a42jrQQi+giyz3f8Y3DaavmTUnaqwN1HxmEoDkO6KX
 RsTZAOpnm2FLqmGDapMrftd24D97hm+pokbe9/CqS5eF1OfEcw95ixNDX
 6IBCkVNw6mlrZj4l0bn1YjvutcD/tQ1hRrWq3ZG6vaUjrwtg0DLy/MJAC
 m0kyJbLNXSRZRfrnqaqvlMT+tKM36gLOU6fr6D4YAgp/hKAjM6fHGRT7/
 jfVFcdMgioKa+udUe40Cy9ob7SIzRS2fgFG8xBegfzVdjk5/uY4MDCmGL A==;
X-CSE-ConnectionGUID: S2V8sb6xT3qlBewBmo6t9Q==
X-CSE-MsgGUID: Jx1D/ZrXR3u/Z1COA0+/nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58552719"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="58552719"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:01:44 -0700
X-CSE-ConnectionGUID: 3LodiRPQRf2JOWLNvPHBDA==
X-CSE-MsgGUID: BOX2FapjQA+cA201eamaZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="162833074"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:01:41 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, badal.nilawar@intel.com, karthik.poosa@intel.com,
 riana.tauro@intel.com, jonathan.cavitt@intel.com
Cc: soham.purkait@intel.com, rodrigo.vivi@intel.com, ashutosh.dixit@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v10 0/1] Add debugfs node to expose G-state and pcie link
 state residency
Date: Tue, 15 Jul 2025 15:24:21 +0530
Message-Id: <20250715095422.2901899-1-soham.purkait@intel.com>
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

