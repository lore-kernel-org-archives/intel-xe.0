Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D4DC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 14:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A6510E742;
	Wed, 25 Jun 2025 14:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBmEZeIX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF8E10E742
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750862349; x=1782398349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UjYXR8osmwC/BDizKyXgZZH6sKZU99UcvPZGiVbssJ4=;
 b=NBmEZeIXvhlnP6g1kXkAQBAhKRbPNbco5N9kb9iOwHV7OAgYafnztb+Z
 mhB2JI/0+FDgdqa3y9FGP6Op22vB8pcU4dZvdD7T/ACRZ9LkGIc2Uyqkg
 68NMTnbE8+B/b3qQSYNNtxFQSbbRJsX+V9YQnY4nrWbr5EEgR9ElRxSFs
 WrNESoApIf0BqLW9OBks/3MDad1NqejBQHlF9Qz/aWryCAHE0Eo/0/JO1
 dMX5nQPsHL7Ye+U8bT/FW7j3hl+Ei8qQVEK/kibI+0j4lZUhm0oBlVDQ2
 Fw/UgT70KJcZF0uOp1Nb5czGhyyjW/gA7lIpLrwx/4i0gkS8yTA9CwVp6 Q==;
X-CSE-ConnectionGUID: Cspes8Z5QSynq9IY6ZFRcw==
X-CSE-MsgGUID: y37G1R2ESL61fU5NqkCong==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63738906"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="63738906"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:39:09 -0700
X-CSE-ConnectionGUID: 16IpHt9aRwa0rIj2FUV+gg==
X-CSE-MsgGUID: loE6EzcBQhyRix6qUVLA9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156260168"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:39:07 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jonathan.cavitt@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, jani.nikula@intel.com
Subject: [PATCH v6 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie link
 state residency offset
Date: Wed, 25 Jun 2025 20:02:53 +0530
Message-Id: <20250625143254.3505218-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625143254.3505218-1-soham.purkait@intel.com>
References: <20250625143254.3505218-1-soham.purkait@intel.com>
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
v6:
 - Mark MBG to pcie link residency offset. (Anshuman)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
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

