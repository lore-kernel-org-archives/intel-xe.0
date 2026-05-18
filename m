Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A12CD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 23:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDAB10E26C;
	Mon, 18 May 2026 23:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2uPNTjK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C99910E35E
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 23:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779148051; x=1810684051;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0HgE03T1e0WJyAraaeR9Ca52DNdFO0OzBNRMBOkV0Vs=;
 b=K2uPNTjKP9/YqJ3ISBbo7OfGEysISVF9d/EnQQ1n1eTRJTjZQnrugHBF
 +EUNKQXLc3fPlMIYVOYARZm5fAF1Y1oniwupHEoNRoriSg2Kv4Ko24gqo
 qyTK4vzfszxPWQgNDD7fCsgT+14L/Q23vZXsba0BeFvQZx+VGAQe4NWI0
 aEYv7q49wmpOdVwA5/2NAzMtVSI3HtrhXnOV7b8BRCTq09uc8kc/+Ry6z
 AFWRGtVCNQM/wgzNaxgxiHzDLKYtDUsens6tACzvqdayaa03XBZc0RQmI
 1byVhIfZo7DvXlFH2DFFgX38p6ZY6rbQubRGN5uDTPW4SR16anh5hJpyU w==;
X-CSE-ConnectionGUID: vrwPk2rcSXCUkdMEMMvpUg==
X-CSE-MsgGUID: PfTE2RNRT2ihUyhCCpk2Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79866831"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79866831"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:47:21 -0700
X-CSE-ConnectionGUID: EhPDoBWIRm6yiQ0dRM+tmg==
X-CSE-MsgGUID: PNVDD4w2Swm/lA460C4Y5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="236959326"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:47:20 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/9] drm/xe/rtp: (De-)whitelist OA registers for all hwe's for
 a gt
Date: Mon, 18 May 2026 16:47:14 -0700
Message-ID: <20260518234716.1540123-8-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
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

Whitelist or de-whitelist OA registers for all hwe's on the gt on which the
OA stream is opened. This simplifies the case where an oa unit has 0
attached hwe's (but which monitors OA events on the associated GT).

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 32 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_reg_whitelist.h |  4 ++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 0d2cf3d964a51..50b34c5008df7 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -229,7 +229,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
 	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->reg_sr, nonpriv_slots);
 }
 
-__maybe_unused static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool whitelist)
+static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool whitelist)
 {
 	struct xe_reg_sr_entry *entry;
 	unsigned long reg;
@@ -244,6 +244,36 @@ __maybe_unused static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool wh
 	xe_reg_sr_apply_mmio(&hwe->oa_sr, hwe->gt);
 }
 
+/**
+ * xe_reg_whitelist_oa_regs - whitelist oa registers for gt
+ * @gt: gt to whitelist oa registers for
+ *
+ * Whitelist OA registers by resetting RING_FORCE_TO_NONPRIV_DENY
+ */
+void xe_reg_whitelist_oa_regs(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	for_each_hw_engine(hwe, gt, id)
+		__whitelist_oa_regs(hwe, true);
+}
+
+/**
+ * xe_reg_dewhitelist_oa_regs - dewhitelist oa registers for gt
+ * @gt: gt to dewhitelist oa registers for
+ *
+ * Dewhitelist OA registers by setting RING_FORCE_TO_NONPRIV_DENY
+ */
+void xe_reg_dewhitelist_oa_regs(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	for_each_hw_engine(hwe, gt, id)
+		__whitelist_oa_regs(hwe, false);
+}
+
 /**
  * xe_reg_whitelist_print_entry - print one whitelist entry
  * @p: DRM printer
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.h b/drivers/gpu/drm/xe/xe_reg_whitelist.h
index 3b64b42fe96e9..e1eb1b7d5480b 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.h
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.h
@@ -9,12 +9,16 @@
 #include <linux/types.h>
 
 struct drm_printer;
+struct xe_gt;
 struct xe_hw_engine;
 struct xe_reg_sr;
 struct xe_reg_sr_entry;
 
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
 
+void xe_reg_whitelist_oa_regs(struct xe_gt *gt);
+void xe_reg_dewhitelist_oa_regs(struct xe_gt *gt);
+
 void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
 				  u32 reg, struct xe_reg_sr_entry *entry);
 
-- 
2.54.0

