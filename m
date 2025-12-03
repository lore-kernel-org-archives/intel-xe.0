Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1704FD1268D
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 00:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFDF10E6FE;
	Wed,  3 Dec 2025 00:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5DGNLrk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1CF10E6FE
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 00:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764722886; x=1796258886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c2/S7wx/zpTPNYeSYXRqwENicwdP17rQgl1oGwJEOkY=;
 b=g5DGNLrk/1FBXdz33kpAwj2wkfogHrWNTBNapN1GqO/oZceVM1kwdEzM
 XtmqhTDOIbYXpzdOMX+YJEeDjIAyH62YeEwmXS3LtDWlDa5Fj0EmVuC+d
 7EPxwl1M/TmUOcuxO+nZNYYopalK8NDxwsaE+TPMpy0MvoMiF697BHDLS
 KA+94bwLO0ISJ6D3aFKJVKkCDwemrWjX4HbzYZpicMxMd2sVnVNXCcDdG
 KUNEZr4OKwq0454/jbdYwzBLBqS2TV+S9ZN0rVqh1q3pbfLDPOnInVVsE
 Kih8VGX4CkADHOEOpyN4uuR7pnAwVA0LC/3E/Fy2s6x2pE9n11kk/vaOk Q==;
X-CSE-ConnectionGUID: zTrL2YCzShuCkow58J+Xbg==
X-CSE-MsgGUID: l1b1ikI8SAa7hWLXy+y2KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65895342"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="65895342"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 16:48:06 -0800
X-CSE-ConnectionGUID: nQun+iWhS1WP5fMRMKbTUQ==
X-CSE-MsgGUID: osC+8ti9TFaHX69G35a0+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194340521"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 16:48:05 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, ashutosh.dixit@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v3 3/3] drm/xe/soc_remapper: Add system controller config for
 SoC remapper
Date: Tue,  2 Dec 2025 16:48:04 -0800
Message-ID: <20251203004800.1993258-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251203004800.1993258-5-umesh.nerlige.ramappa@intel.com>
References: <20251203004800.1993258-5-umesh.nerlige.ramappa@intel.com>
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

Define system controller config bits and helpers for SoC remapper.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

v2: (Badal)
- Add kernel doc for function
---
 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h |  1 +
 drivers/gpu/drm/xe/xe_soc_remapper.c           | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_soc_remapper.h           |  1 +
 3 files changed, 15 insertions(+)

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
index d28fd9f3c253..273e34c4183a 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.c
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
@@ -27,6 +27,19 @@ void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
 				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
 }
 
+/**
+ * xe_soc_remapper_set_sysctrl_region() - Select the system controller function
+ * @xe: Pointer to xe device.
+ * @index: Index of the function to be accessed.
+ *
+ * Selects a specific system controller function based on the index passed.
+ */
+void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index)
+{
+	xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_SYSCTRL_MASK,
+				   REG_FIELD_PREP(SG_REMAP_SYSCTRL_MASK, index));
+}
+
 /**
  * xe_soc_remapper_init() - Initialize SoC remapper
  * @xe: Pointer to xe device.
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
index c7bee284405b..137c9f6f3bbe 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.h
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
@@ -10,5 +10,6 @@
 
 int xe_soc_remapper_init(struct xe_device *xe);
 void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index);
+void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index);
 
 #endif
-- 
2.43.0

