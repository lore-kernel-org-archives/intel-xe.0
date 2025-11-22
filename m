Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6650CFC515
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 04:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAC810E8FF;
	Sat, 22 Nov 2025 04:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQt1FhD9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C1C10E8FF
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 04:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763787508; x=1795323508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2TxMxkgkUijU4x3kNKTsi+JFyUkl0bjhCxUkj4MPxIU=;
 b=YQt1FhD9+5wXB8LpeeFhUYRuvqm4HYnVLuIrWH4TJkbOw7pcRodtlvYT
 ZLSEShzVMqf82oiRmL88lnv1uoM+GGLT6RfQKtrUMNCF2qNeMEmfXd4c6
 CjAfGTm9nu9EgA4Ek5x+twZVnSGii9lat6L+3Pd5lmTH4oR8+ky3yKOpq
 kZ/krbUCtP/HomQ0HAX2sh5rfS1C9vRm3jtwxc6b4uOkLOEWLWKGbCHr6
 R7bVPPbXsc5dRmPto2jUXLaugYvdVW5P0WJydfpJv868zWeRAQfykqgKs
 vhFFfB8Pn63a3aP7e3APVVlKthQh9stvikmKjL+qMwwy+w4CInPWGHc78 w==;
X-CSE-ConnectionGUID: 4OQl0ZqUR2Cl+ingzUj9jA==
X-CSE-MsgGUID: J+5GCOfmRN6BACSqjFWgig==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65921460"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="65921460"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:58:27 -0800
X-CSE-ConnectionGUID: QBPir/KNReqwSCn+B92Pmw==
X-CSE-MsgGUID: uLYx8hWjTFGMMIPQESz11g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191976559"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:58:24 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, mohamed.mansoor.v@intel.com, kam.nasim@intel.com,
 anoop.c.vijay@intel.com
Subject: [RFC 3/5] drm/xe/soc_remapper: Add system controller config for SoC
 remapper
Date: Fri, 21 Nov 2025 20:58:05 -0800
Message-ID: <20251122045803.3616201-10-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
References: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Define system controller config bits and helpers for SoC remapper.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h | 1 +
 drivers/gpu/drm/xe/xe_soc_remapper.c           | 6 ++++++
 drivers/gpu/drm/xe/xe_soc_remapper.h           | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
index 9edf234227a9..be0eb37e73ad 100644
--- a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
@@ -9,5 +9,6 @@
 
 #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
 #define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
+#define   SG_REMAP_SYSCTRL_MASK		REG_GENMASK(23, 16)
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
index 85d37a86117a..ed6b6c594e51 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.c
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
@@ -25,6 +25,12 @@ void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
 				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
 }
 
+void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index)
+{
+	xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_SYSCTRL_MASK,
+				   REG_FIELD_PREP(SG_REMAP_SYSCTRL_MASK, index));
+}
+
 int xe_soc_remapper_init(struct xe_device *xe)
 {
 	spin_lock_init(&xe->soc_remapper.lock);
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
index 75431b94e66a..289aa41c3408 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.h
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
@@ -12,5 +12,6 @@
 
 int xe_soc_remapper_init(struct xe_device *xe);
 void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index);
+void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index);
 
 #endif
-- 
2.43.0

