Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58F0E9A04F
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 22:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB2510E633;
	Wed, 18 Feb 2026 22:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mX3rrOHR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB7F10E323
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771452590; x=1802988590;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=3YpEuaKZmyBGkx3dallxD/grKD+v9WvEC19vLe5CqdY=;
 b=mX3rrOHRhwRlLyR7NBWrLkOjcadkY4uZOMk4JVOwQnNdXV3RPB14nQgy
 f2VA7zhnORTlrcxJ4DqS/lBKN+EGmYhc0d164C5hUlvYq1vnFWnqez8NE
 rAD6tXVk9M0NUfxI+EY65AO3sUlNxGBptOkyaiS1kZpudoQZqdggKa37g
 Rz2rurNtQg0bYOWnyIH8oEa6YWYg2RRTndHSgIqH24GfZbdGXMk22thcv
 AYRmnKDqxW4ondtAXX4M+DSPKbftmTHf1vXGYAn86OZk/55/NWexQYY0H
 VY/fHdMeqRNAJ/gCBAZTchRhrjyaUVfxv0gJlkSYsIhY9l0E0QjSapkOo w==;
X-CSE-ConnectionGUID: GdP2TpHIQ7eeogIwHhvF3w==
X-CSE-MsgGUID: ph0A7Q8rSGOIgOQ9XtqxLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76399066"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76399066"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:09:49 -0800
X-CSE-ConnectionGUID: tlYfy++ZSPiExCDdsewFPg==
X-CSE-MsgGUID: QAbHbg5HTaCoKoYMhI2rFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214329412"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:09:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 18 Feb 2026 14:09:13 -0800
Subject: [PATCH v4 2/4] drm/xe/reg_sr: Add debugfs to verify status of
 reg_sr programming
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-sr_verify-v4-2-35d6deeb3421@intel.com>
References: <20260218-sr_verify-v4-0-35d6deeb3421@intel.com>
In-Reply-To: <20260218-sr_verify-v4-0-35d6deeb3421@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5660;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=3YpEuaKZmyBGkx3dallxD/grKD+v9WvEC19vLe5CqdY=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpljisWVzBJv/Vhg3m5rPhVSBbkex/lMeCg8IFO
 Sc+6N2V9TqJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZY4rAAKCRBNeSQFyHKQ
 BDK/D/oC4OvGWGklWR+/Lwr+jPBicd+nyThh/RmFjfzgjKhRyyfmdZkXmQyKe4hHdEljAvJ4u1a
 KXwoynVQriYlovKRg7yS7ZvhtN6FIvo7GdhJVSi00DbUg1r9ijGOb/894xFzXlwzwQ2lgOvr9AG
 Q2DY90L4I2Hez6lH19+CuyZkycqjy+r+M1HMLxZ1fDzIoUbfDOUrO7jM6wnQk1Bc964xDD9K4/9
 1Vxra9d9bCW8CTjza6QsvB3S7LU+PE0lyhjTNY4YZHJOygIEIFsFZBIrfkgvQ13jD0y/d4c9IVH
 ysbFGWSbW8574cHLzLoDz+HEvZbHKw4tXM/tgBBWGb92os6F1wmpRiFcaprMYEU+g4Ye/0YmCDb
 6j7A2lemhWQMZdtfEes432GQVJtZbLJk/LBANJWoIzmz/JfbR/KwlfuEJ4JjpETM4O0BsWwWwKB
 3jFTUaMV/SWkxNBN6wKmFLK371K/oAUdLuGMr4RJirOQQvGMg4R3ZrbnJQo0UGk+glpNjeePt9B
 9WTX3MvCpxiyFo7T9zClWHIWvZCCY0so+ygr84U+7EM3yAMOnXiCe7ikszIP3mt2AN6TwwUXyTz
 qgURBQCiFvfeEYkiW372QS76sIsoKXmZnBilaz0YXueMRnmrdOCFQF4mkagkAlyKmbLQJPbBEbd
 awwM7kbybteoklQ==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

When applying save-restore register programming for workarounds, tuning
settings, and general device configuration we assume the programming was
successful.  However there are a number of cases where the desired
reg_sr programming can become lost:

 - workarounds implemented on the wrong RTP table might not get
   saved/restored at the right time leading to, for example, failure to
   re-apply the programming after engine resets
 - some hardware registers become "locked" and can no longer be updated
   after firmware or the driver finishes initializing them
 - sometimes the hardware teams just made a mistake when documenting the
   register and/or bits that needed to be programmed

Add a debugfs entry that will read back the registers referenced on a
GT's save-restore lists and print any cases where the desired
programming is no longer in effect.  Such cases might indicate the
presence of a driver/firmware bug, might indicate that the documentation
we were following has a mistake, or might be benign (occasionally
registers have broken read-back capability preventing verification, but
previous writes were still successful and effective).

For now we only verify the GT and engine reg_sr lists.  Verifying the
LRC list will require checking the expected programming against the
default_lrc contents, not the live registers (which may not reflect the
reg_sr programming if no context is actively running).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_sr.c     | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_sr.h     |  3 +++
 3 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 4363bc9c36067f3b22ff9f8fa5d64dece31cbe3b..aa43427a9f4b824b8ad41d02f634c07c76d989b2 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -155,6 +155,30 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+/*
+ * Check the registers referenced on a save-restore list and report any
+ * save-restore entries that did not get applied.
+ */
+static int register_save_restore_check(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
+		drm_printf(p, "ERROR: Could not acquire forcewake\n");
+		return -ETIMEDOUT;
+	}
+
+	xe_reg_sr_readback_check(&gt->reg_sr, gt, p);
+	for_each_hw_engine(hwe, gt, id)
+		xe_reg_sr_readback_check(&hwe->reg_sr, gt, p);
+
+	/* TODO: Check hwe->reg_lrc against contents of default_lrc. */
+
+	return 0;
+}
+
 static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
@@ -209,6 +233,8 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{ "default_lrc_vecs", .show = xe_gt_debugfs_show_with_rpm, .data = vecs_default_lrc },
 	{ "hwconfig", .show = xe_gt_debugfs_show_with_rpm, .data = hwconfig },
 	{ "pat_sw_config", .show = xe_gt_debugfs_simple_show, .data = xe_pat_dump_sw_config },
+	{ "register-save-restore-check",
+		.show = xe_gt_debugfs_show_with_rpm, .data = register_save_restore_check },
 };
 
 /* everything else should be added here */
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 1ac911fc6e943ce05b8ac7cef33bc23d872d5ec4..75aa4426b3ec6026bc13095df3c3f9cb0a794b97 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -208,3 +208,37 @@ void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p)
 			   str_yes_no(entry->reg.masked),
 			   str_yes_no(entry->reg.mcr));
 }
+
+static u32 readback_reg(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_reg_mcr mcr_reg = to_xe_reg_mcr(reg);
+
+	if (reg.mcr)
+		return xe_gt_mcr_unicast_read_any(gt, mcr_reg);
+	else
+		return xe_mmio_read32(&gt->mmio, reg);
+}
+
+/**
+ * xe_reg_sr_readback_check() - Readback registers referenced in save/restore
+ *     entries and check whether the programming is in place.
+ * @sr: Save/restore entries
+ * @gt: GT to read register from
+ * @p: DRM printer to report discrepancies on
+ */
+void xe_reg_sr_readback_check(struct xe_reg_sr *sr,
+			      struct xe_gt *gt,
+			      struct drm_printer *p)
+{
+	struct xe_reg_sr_entry *entry;
+	unsigned long offset;
+
+	xa_for_each(&sr->xa, offset, entry) {
+		u32 val = readback_reg(gt, entry->reg);
+		u32 mask = entry->clr_bits | entry->set_bits;
+
+		if ((val & mask) != entry->set_bits)
+			drm_printf(p, "%#8lx & %#10x :: expected %#10x got %#10x\n",
+				   offset, mask, entry->set_bits, val & mask);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index 51fbba423e27f3f3eab737221270e43aba56f54e..cd133a09aa9b3f046dbd913aa9711250e771ee1a 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -19,6 +19,9 @@ struct drm_printer;
 
 int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
 void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
+void xe_reg_sr_readback_check(struct xe_reg_sr *sr,
+			      struct xe_gt *gt,
+			      struct drm_printer *p);
 
 int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
 		  struct xe_gt *gt);

-- 
2.53.0

