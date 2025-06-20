Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBA4C71155
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 12:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022EC10E21F;
	Fri, 20 Jun 2025 12:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAN/TarS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A716810E21F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 12:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750421392; x=1781957392;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dlLQjGbMEJVzRyNAjJ/li/w/BR1iY8D8q27dYLUeuL0=;
 b=LAN/TarSibLkCOeD289Dte8PbTKASOUYPjGtARk9I92nj1z3ZzmZB4+x
 sTW8c/gUU3+JbL6PpQaVpNEmK432z83ccuYOkiDk1njmHvTyYlPpBAIMu
 PBQEfhNWG4AdJ3+XycR7nKFYnvAKXj2JYBlyLf/VkV0xhrMcMTSDduHVd
 0dQRI2M21/XUla2Kh87DEPQErgnRigWPciTllekVnduEr4ttWV4VwEWqG
 NxHYsyTv6I5FtuGn2m+2q1loumNxJFqu90ypUdBcQoKHTtfGSi2BZkzgc
 Ks5MdLaEItrKQou3mSDv2nm1SnsU03cq4e0s4c74GuAkz1boA4gha2CFM w==;
X-CSE-ConnectionGUID: 4G1+0RDrRT+KRy5Gd9aPxA==
X-CSE-MsgGUID: WNYg6xvQSQSeZRz0d1noeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="56361819"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="56361819"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 05:09:52 -0700
X-CSE-ConnectionGUID: bOmgd/e2SzKt3vCKZ/e5cQ==
X-CSE-MsgGUID: VH5sMHYSShimRWV5EE4qIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="151036711"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 05:09:48 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jonathan.cavitt@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, jani.nikula@intel.com
Subject: [PATCH v5 0/2] Add debugfs node to expose G-state and pcie link state
 residency
Date: Fri, 20 Jun 2025 17:33:54 +0530
Message-Id: <20250620120356.3289744-1-soham.purkait@intel.com>
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

