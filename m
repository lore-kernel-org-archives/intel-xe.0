Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F13BC83F03
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 17:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EB310E092;
	Fri,  4 Jul 2025 17:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSmUB1vD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E813510E092
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751649746; x=1783185746;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U1bWnCZWzDYR7OOyKT+60JOBYWFjuFnsEdBteBrjdR0=;
 b=fSmUB1vDdMxVaamiqwjZoQAc3fE8xhcawRJxJnZ7EtiI5KuxQYD1ULx0
 gYkOqGKFic8dfHrf6MP67XXs3qsoAYD0eXif2RVsYJpOtkRTzsEBZLuwY
 OsRDls3WAC/xWxi9VoKhvxlpJ73HzKzD1I1DT2bImV4EDtm4ow6yF1syS
 91HmpUS2+I1cFxl6Qcb/M0VAgchvPjXFJxc+43BmI+UcmNmbdTO72Tori
 FbNHaxtVXggATdcrBAnquLqfCw7Ur9JhU0MA/DfH4/lsI055gDQ8iZecb
 dpnjHLkwFF3xNOXPuiBpWFIaid/HqQtbybR45YsWj940HgLn1TmoJkCe5 Q==;
X-CSE-ConnectionGUID: ZlpTR+RrTAm4aua/2wdjjg==
X-CSE-MsgGUID: mkMnZrdwSaGSGXSbExBtuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64234100"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="64234100"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 10:22:25 -0700
X-CSE-ConnectionGUID: fVb59/EPRf+lYWlfKkvtIw==
X-CSE-MsgGUID: 9VSBCbMIQfSrMER6JxoHCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="159030284"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 10:22:23 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, badal.nilawar@intel.com, karthik.poosa@intel.com,
 riana.tauro@intel.com, jonathan.cavitt@intel.com
Cc: soham.purkait@intel.com, ashutosh.dixit@intel.com, jani.nikula@intel.com
Subject: [PATCH v9 0/1] Add debugfs node to expose G-state and pcie link state
 residency
Date: Fri,  4 Jul 2025 22:46:09 +0530
Message-Id: <20250704171610.1294466-1-soham.purkait@intel.com>
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

