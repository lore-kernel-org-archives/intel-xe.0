Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66F0C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 13:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEBA10E879;
	Thu, 26 Jun 2025 13:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwJqcVLt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3537410E855
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 13:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750944274; x=1782480274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=62GtpcquyXR+wF5r7m5/w5kHGzxuPT755CaISKgGzRs=;
 b=GwJqcVLt9y+Nu4s4KKGCI6e0GCAl+l2C2V2XikSS96AI5Gm+3BsM9lHs
 vPZPbbcQ6+ohS8xDpGIn3u5S72fnRmi034NWzIiu9RstQMeWM3tGZYDaE
 jf8xZsLLtHKCCLfE6VUZbXuBYL2gPHY+QO8bLFemq45CA1hoXezq8GVgR
 mmatgLnP63NCdZoqKZ02UrM8NumYF1MO56tvG35KeK6ZwfMzq+oHhvL37
 zAPhYmuTs8GnSim8N+CeXOoX8AxW6VLIkpmu2uqz9sIGnp58qTBe7iKi0
 9UR1oyNwh/QdyC1y1U6gfbKgOdAJ+aZjq5Dz/9da/+qlnR8bRJuK/DBhp g==;
X-CSE-ConnectionGUID: hlLM2BaqRaazHcLGVoeX6A==
X-CSE-MsgGUID: 0faiRv65QqiOV3ZhSxcthA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53106157"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="53106157"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 06:24:34 -0700
X-CSE-ConnectionGUID: ct7Y3Pj3QsmAJB4ZhrOCTQ==
X-CSE-MsgGUID: O4c7SHmOT22pojdGX45e7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="156790908"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 06:24:31 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jonathan.cavitt@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, jani.nikula@intel.com
Subject: [PATCH v7 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie link
 state residency offset
Date: Thu, 26 Jun 2025 18:48:04 +0530
Message-Id: <20250626131805.3977408-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626131805.3977408-1-soham.purkait@intel.com>
References: <20250626131805.3977408-1-soham.purkait@intel.com>
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

v1:
 - Move offset macros to drm/xe/regs/xe_pmt. (Riana)
v2:
 - Add BMG prefix to PCIe Link state residency
   offset macros names. (Anshman)
v3:
 - Fix typo in commit message. (Jonathan)
 - Rephrase commit message. (Karthik)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index b0efd9b48d1e..34f5bfdffe46 100644
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
+#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
+#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
+#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
+
 #endif
-- 
2.34.1

