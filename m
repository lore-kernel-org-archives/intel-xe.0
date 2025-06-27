Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A5CC7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 19:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DA010E33F;
	Fri, 27 Jun 2025 19:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aln8n6qg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D869D10E33F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 19:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751051244; x=1782587244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6iJQL6z414rKwxy7N5u1WzUwMny3Bahezfc+ikj8two=;
 b=aln8n6qgdfmV96mVkx0hNWUtAdgJ0d8nNzWfwnIEfNRorCfvi2a/gDwa
 Micbmfe4wLOuq3gd7EL7Yt+4qVAuvY7AFKlrIYhaaefG+H2yqfy8gZikK
 VYZRuK2K227/0JG32Zwma2Iye5iAuk+li/2OhzKsdSMk/Mi/30o1cRoYl
 qNFWHJXd/r+wKhKFISy9xqnSHCfhRCMPz3VFe1AvFXLwb9ngYiWv0+hRC
 sm1Vn4Fzwm51zttkfrTFYPW097mMeve/3L5M9MWf/xO3upkkMIh84EDZH
 rUS45Kd4RR+NsM6O0Dy3fX6F0eMYbJUjxSHcXOKuavP5p+dxcJMdZCpNi w==;
X-CSE-ConnectionGUID: h/28bDEJSkeXWgg2e6bffA==
X-CSE-MsgGUID: YVKsOwDFRh6Xw6Y1RM8hJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57181475"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="57181475"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 12:07:24 -0700
X-CSE-ConnectionGUID: /vX5ohTBQRe+K7hzMwEilw==
X-CSE-MsgGUID: U15SuwunRI2ax/+HlKdwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="152974665"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 12:07:21 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jonathan.cavitt@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, jani.nikula@intel.com
Subject: [PATCH v8 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie link
 state residency offset
Date: Sat, 28 Jun 2025 00:30:40 +0530
Message-Id: <20250627190041.238015-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627190041.238015-1-soham.purkait@intel.com>
References: <20250627190041.238015-1-soham.purkait@intel.com>
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
 - Rearrange residency offsets in ascending order. (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index b0efd9b48d1e..038f34698206 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -21,4 +21,14 @@
 #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
 #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
 
+#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
+#define BMG_G2_RESIDENCY_OFFSET			(0x530)
+#define BMG_G6_RESIDENCY_OFFSET			(0x538)
+#define BMG_G8_RESIDENCY_OFFSET			(0x540)
+#define BMG_G10_RESIDENCY_OFFSET		(0x548)
+
+#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
+#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
+#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
+
 #endif
-- 
2.34.1

