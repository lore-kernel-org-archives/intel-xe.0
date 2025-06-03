Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93722C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A32B10E5DB;
	Tue,  3 Jun 2025 18:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUdkydoa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDF210E5DB
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748974656; x=1780510656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h3p/vQXJoP7a13A/S8VqKrkKZWNrCEJ7y1rqb9D4WiQ=;
 b=nUdkydoarLelZ7Lj6MtO17/VKy45vSDi70Tm56ONFAwjsB4uDmGC3Wfr
 NppbD0OXANDvpme4E/gR6Oxr6z9nm2O5IIGDxhSGI4MUay7UsxNJ5xIQH
 SXkd+9uW0Bfc2EaRVHJ2r4+GobEZ8Ja9GJVGqhT0wt9f3taOrY5BY8BRm
 tmDQiU14NiIzt9yERqQElEHlUL7nWXmaGPilMi0dUY0fujz1M9aulGQTe
 2VcrhQU6m0ofQCtqBKU2yyyzs8nmYp8t0Pq3qWfuMehUkIHGe2QCvrENh
 lSEerYAqT8jkO59mRIht6xyTZYmKGZdC/6XbApEnmi6kVwI+3jjoGvLyx w==;
X-CSE-ConnectionGUID: PA/l8LLQTbOr1HtVaV/2iA==
X-CSE-MsgGUID: 6c+o6chUTWKLNWl7qhrl7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="73563224"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="73563224"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:17:35 -0700
X-CSE-ConnectionGUID: jpSxlWGWREun11DgtgGm4w==
X-CSE-MsgGUID: ZzzSQTWWR+Os4ro/IWI7nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145560731"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:17:33 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com, riana.tauro@intel.com, jani.nikula@intel.com
Subject: [PATCH v3 2/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie link
 state residency offset
Date: Tue,  3 Jun 2025 23:42:05 +0530
Message-Id: <20250603181205.1680363-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603181205.1680363-1-soham.purkait@intel.com>
References: <20250603181205.1680363-1-soham.purkait@intel.com>
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

