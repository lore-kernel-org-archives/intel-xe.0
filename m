Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1084CC7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 19:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2CB10E062;
	Fri, 27 Jun 2025 19:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApxXUwmR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F1910E062
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 19:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751051241; x=1782587241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MJaGQyCkPM1ZckPhqi+KsMhpc2stc5Mu6KmJKGEdXIA=;
 b=ApxXUwmRuacuNxS3RbGb9N2Y0154biJjkKoUOSH4ejPxg/HSg8fod0Ol
 bIkTMWkdGTytK93HQDokM9wygrWcCE9IY0mzAkd+vNu/Qt5k1EAZoSCXQ
 l5w5F5WJdJXvmtmh8GLnkCAfdcL/1lkJfpKBH+zQot+7I1pnp25PNlA3Q
 w5bYu29kFD9Jy4GbPLjBxHqRXbmyZFeBv7FthN3yMa8495oD+5xlZ4j/5
 GXq9fv/y7E4rHRqv+3mJPcEMT0Yr2p9kuGUNeA5bCJauins3f1pRqg2ze
 ut1qRp+zTzU2PJRWlxRFuthZKRdTRvD09oH++zGdxaqiNaAZwxTxfJ0lV Q==;
X-CSE-ConnectionGUID: ZcWR11cUQ/K9Z/WOEMCQAg==
X-CSE-MsgGUID: jxcw9NssSCiT6k7+8uakaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57181470"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="57181470"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 12:07:21 -0700
X-CSE-ConnectionGUID: b2tP71iqQzuUscSUlhDScA==
X-CSE-MsgGUID: SSE15tJqRK2DisUVqgS4pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="152974660"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 12:07:18 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jonathan.cavitt@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, jani.nikula@intel.com
Subject: [PATCH v8 0/2] Add debugfs node to expose G-state and pcie link state
 residency
Date: Sat, 28 Jun 2025 00:30:39 +0530
Message-Id: <20250627190041.238015-1-soham.purkait@intel.com>
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

 drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++
 drivers/gpu/drm/xe/xe_debugfs.c  | 87 ++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

-- 
2.34.1

