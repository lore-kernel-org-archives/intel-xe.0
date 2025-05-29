Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E888CC5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 18:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC2A10E0BC;
	Thu, 29 May 2025 18:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/T3/gdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD45210E0BC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 18:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748541795; x=1780077795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G1r7INon+8L692ww/WgeHKOsPoGdTxPSihC0RpXeV00=;
 b=k/T3/gdhoWeqzlbMabOHu3hRO63x6dY0PZQP5XX5GsUNwle5NYYlu8Z3
 xIwjblC6TXIsupdKzJ8A44OrFgLyy8t61i1OJeuo+PGnbaZHax085Tky1
 ixO/fb4kePiQdwIDDjKihaZShHQF+lIbBJiq50lJjEcvojfhPVSdDXdRm
 wtmlMfnXECH3J7H+WejchURdkpGCVsIXDNnH5BZksk+0gqV4I8F1sji3i
 CWGwgyf6FrQI03CN9r4JS6qYhh3t/oU07IUilk1hrBYjwPF9+k6tz8R3y
 wQB5b/Tv72dh79w6Iy7bR/mXKLkHdCRBLFeh3LxuacWBH4iat+xg3J0IT g==;
X-CSE-ConnectionGUID: pbsKzl1VT6qFhfzqOGAm6g==
X-CSE-MsgGUID: oYIFEDQ1RGKD6TQXCjqBww==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50542977"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50542977"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:03:14 -0700
X-CSE-ConnectionGUID: vWE/hk7rTv2d/jlV5S1UOg==
X-CSE-MsgGUID: 6lNGnCa8QmiNpInNrP5eTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143661850"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:03:12 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jani.nikula@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v2 3/3] drm/xe/regs/xe_pmt: Macros for G-State residency offset
Date: Thu, 29 May 2025 23:27:52 +0530
Message-Id: <20250529175752.1222913-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529175752.1222913-1-soham.purkait@intel.com>
References: <20250529175752.1222913-1-soham.purkait@intel.com>
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

   Add G-State residency offset macros for G2, G6, G8, G10
and ModS.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index b1d4504e4adc..23995835a583 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -21,4 +21,10 @@
 #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
 #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
 
+#define BMG_G2_RESIDENCY_OFFSET			(0x530)
+#define BMG_G6_RESIDENCY_OFFSET			(0x538)
+#define BMG_G8_RESIDENCY_OFFSET			(0x540)
+#define BMG_G10_RESIDENCY_OFFSET		(0x548)
+#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
+
 #endif
-- 
2.34.1

