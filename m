Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07187C5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 19:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAC210E755;
	Thu, 29 May 2025 19:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzrqnLg8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5689210E745
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 19:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748547101; x=1780083101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4sg0rdutt6xM68sUotdFTD6KYsFAomFWejkiM1NS09w=;
 b=fzrqnLg8r2pxIwh+W94OCD3Pmrgobq3Z/kgq41Ir6aCosTdYc1p9VU5V
 dZoBXt1We951dhCscHXQ4k9q3dWFnjqQHxiPPxTbEzK+6aaGSivtnFr87
 RDB2hSOLAujAEEpsrzx30LzYarcEoro49yZQgWdRfJa4amHQD8h/jt5DM
 yjE3JWMJ0Wlk+ysGhKC/yDND/UhwS+61qJHGhUSb3mXy2m8XM/bVF7Har
 Y34VgKb7KTI7eaFARJin/r0Je1bTYUHSzmdoZ745Q42J30ULj6QL5TMUi
 lixd7S1TSLhgperNGew4fr5VqvdFujr6khJ573ehE6RgcEMXTuY3EQShk g==;
X-CSE-ConnectionGUID: x7qoRQtjS4iX9C7ZlXtGBw==
X-CSE-MsgGUID: 5QbSKP0kTg2xYOhcKypc4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68049953"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="68049953"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 12:31:41 -0700
X-CSE-ConnectionGUID: 05OjiPDfQga4xzFCSGe6Kw==
X-CSE-MsgGUID: dDJPjBHORe++0HqtBVlFig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="144642024"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 12:31:38 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jani.nikula@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH 2/3] drm/xe/regs/xe_pmt: Macros for pcie link state residency
 offset
Date: Fri, 30 May 2025 00:56:19 +0530
Message-Id: <20250529192620.1227468-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529192620.1227468-1-soham.purkait@intel.com>
References: <20250529192620.1227468-1-soham.purkait@intel.com>
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

   Add pcie link state residency offset macros for L0, L1, L1.2

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index b1d4504e4adc..de9c8d29351d 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -21,4 +21,8 @@
 #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
 #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
 
+#define PCIE_LINK_L0_RESIDENCY_COUNTER		(0x570)
+#define PCIE_LINK_L1_RESIDENCY_COUNTER		(0x578)
+#define PCIE_LINK_L1_2_RESIDENCY_COUNTER	(0x580)
+
 #endif
-- 
2.34.1

