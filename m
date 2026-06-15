Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30857CD98DE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 22:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD38710E54A;
	Mon, 15 Jun 2026 22:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cbjm5CTq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77C610E54A
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 22:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781563353; x=1813099353;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=il5gB8qTzD6fMRjdxBEGarAimY241lAezTcwdBNNIVM=;
 b=Cbjm5CTqC/yO01Ma4H7xOjO/D7aS9Mt7SBgYSdGWySzDTMhyweFcoue8
 wMycX+PVVWb4pf/3natYEkxGV9L+zu7kEdeGh0LqFWxNgkwUBZ35hfDnq
 3gAc9vSm8z9ZX2nvklb0J0eeRK2Ac7kZ/lxUAgyw1npKkJkzk7Yuixuuu
 r2GQX+dygrnwN/BIcUVevDQYr/D4lo/KjXE2tzl6ORyT/TE2yWkIq2Prl
 sauV3oTumnJXZZmAfUwTtPNPol8N4YwfgrYTRIP1vU4yWobS/HcOVLBfa
 T2mSeWBft6obsIEnOsee+a428su7nZplBKR0nDtg/Pw8L9x951CJbTgjg A==;
X-CSE-ConnectionGUID: ck3WTB68Qh2jsw/gdDi8Ww==
X-CSE-MsgGUID: fgEWGCXEQta8iQjWlnqGEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82513155"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="82513155"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 15:42:32 -0700
X-CSE-ConnectionGUID: RS4suKy2RZioyLn764c4sA==
X-CSE-MsgGUID: NYVsb56FQ8GhiX6EEAalNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="247676801"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 15:42:31 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 4/9] drm/xe/rtp: Generalize whitelist_apply_to_hwe
Date: Mon, 15 Jun 2026 15:42:22 -0700
Message-ID: <20260615224227.34880-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615224227.34880-1-ashutosh.dixit@intel.com>
References: <20260615224227.34880-1-ashutosh.dixit@intel.com>
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

Generalize whitelist_apply_to_hwe to construct both non-OA and OA
whitelist nonpriv registers.

v2: Rename slot_in arg of whitelist_apply_to_hwe to first_slot

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index b5ae7d26e5ba3..e9d0a0b82527d 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -161,9 +161,10 @@ static const struct xe_rtp_table_sr oa_whitelist = XE_RTP_TABLE_SR(
 	},
 );
 
-static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
+static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe, struct xe_reg_sr *in,
+				  struct xe_reg_sr *out, int first_slot)
 {
-	struct xe_reg_sr *sr = &hwe->reg_whitelist;
+	struct xe_reg_sr *sr = in;
 	struct xe_reg_sr_entry *entry;
 	struct drm_printer p;
 	unsigned long reg;
@@ -172,7 +173,7 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
 	xe_gt_dbg(hwe->gt, "Add %s whitelist to engine\n", sr->name);
 	p = xe_gt_dbg_printer(hwe->gt);
 
-	slot = 0;
+	slot = first_slot;
 	xa_for_each(&sr->xa, reg, entry) {
 		struct xe_reg_sr_entry hwe_entry = {
 			.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
@@ -189,7 +190,7 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
 		}
 
 		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
-		xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
+		xe_reg_sr_add(out, &hwe_entry, hwe->gt);
 
 		slot++;
 	}
@@ -211,7 +212,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
 	int first_oa_slot;
 
 	xe_rtp_process_to_sr(&ctx, &register_whitelist, &hwe->reg_whitelist, false);
-	first_oa_slot = whitelist_apply_to_hwe(hwe);
+	first_oa_slot = whitelist_apply_to_hwe(hwe, &hwe->reg_whitelist, &hwe->reg_sr, 0);
 
 	xe_rtp_process_to_sr(&ctx, &oa_whitelist, &hwe->oa_whitelist, false);
 }
-- 
2.54.0

