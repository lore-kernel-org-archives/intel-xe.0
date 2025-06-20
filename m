Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43894C7115D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 12:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041EC10E227;
	Fri, 20 Jun 2025 12:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IS70p682";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8C710E227
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 12:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750421395; x=1781957395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GgmJreELMjn6ElAagimUdlxttv58Cc4aw1B7ws3oyWI=;
 b=IS70p682HA8PCzkmaFq3gi8PIKvnqqtlmTEeN5HVGPfZqpOvxsaeXMMv
 3fecnoRYRxKO4fkMixoN5sv7B6OLAISXcifMRDfw1/rOxZfXE7gEAjN+K
 s2EH5x9ITzl3DjD8o08d/H0/CAN8GshsjAAq/dpXwxLuJt90Cy3ppBJCG
 xKl92PJzejzZ9sNZvdFwoZLOctBqTTJzkf64PRZuKtqSmhC9mAxOPWzr9
 ABfv70U9PX2VlXWp9B+jTVaWzG5jj0zOpS2hZUV+srBfelFjAFQRoA+ch
 +StoDwiWL7PcSlLYq/isYFMcpMAq0DCEp7WROph6eU8VEPSi6rsYxrVkc w==;
X-CSE-ConnectionGUID: 8nbRdbMjTrO6vjQ/QNOHpg==
X-CSE-MsgGUID: snVXsuTSRUeDQjibJ79Ixw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="56361823"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="56361823"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 05:09:54 -0700
X-CSE-ConnectionGUID: /rJKiLnlRrqFAdd6LLjkDw==
X-CSE-MsgGUID: CWoyxAXdQE+x/9I+l9kSBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="151036734"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 05:09:51 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jonathan.cavitt@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, jani.nikula@intel.com
Subject: [PATCH v5 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie link
 state residency offset
Date: Fri, 20 Jun 2025 17:33:55 +0530
Message-Id: <20250620120356.3289744-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620120356.3289744-1-soham.purkait@intel.com>
References: <20250620120356.3289744-1-soham.purkait@intel.com>
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

   Add G-State residency and pcie link state residency
offset macros for G2, G6, G8, G10, ModS and L0, L1, L1.2
respectively.

v1 : Moved offset macros to drm/xe/regs/xe_pmt. (Riana)

v5 : Reordered commits to reflect the correct dependency hierarchy.  (Jonathan)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index b0efd9b48d1e..4e377b6eac92 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -21,4 +21,14 @@
 #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
 #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
 
+#define BMG_G2_RESIDENCY_OFFSET			(0x530)
+#define BMG_G6_RESIDENCY_OFFSET			(0x538)
+#define BMG_G8_RESIDENCY_OFFSET			(0x540)
+#define BMG_G10_RESIDENCY_OFFSET		(0x548)
+#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
+
+#define PCIE_LINK_L0_RESIDENCY_COUNTER		(0x570)
+#define PCIE_LINK_L1_RESIDENCY_COUNTER		(0x578)
+#define PCIE_LINK_L1_2_RESIDENCY_COUNTER	(0x580)
+
 #endif
-- 
2.34.1

