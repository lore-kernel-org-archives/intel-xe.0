Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6231073CB6
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 13:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E811710E63C;
	Wed,  8 Apr 2026 13:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l32KimaN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3001710E63C;
 Wed,  8 Apr 2026 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775654175; x=1807190175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bHmDtJqIP3oG7Kxp2gN+n5ufJ4nCVwT20JYDYyaywH8=;
 b=l32KimaNLrhDVg9xK1DAmj4F+DT7Bwad5KaaxoHn4WIHhCEJUnyFH3UF
 nXzi/Sc7zwFXj2dVmIOle8nolRZ18vbD0anyhxWuMErF1RA2ZZT8QE923
 gpSRGiGrIbld3G9Pcvl6+j0DFBkVwNIkRt9HPFWyvglvjPppY3teIlk8A
 bf9ytT2NdhyJ5B3CEdk2bCjshadvbSfDsVHlbq3dchtCF/BB8sVqKxCb1
 sWFn6oYNhNcYpGxcsh+bL/TMRbxHjKeVBAEhBAOICrVWagsuScBVC6B2e
 rl0I3XzM8Fk/Nohb3m24ObA4T2wX7di9S2YJlrn6rqCgWWVlYwkN7IYuG g==;
X-CSE-ConnectionGUID: u7vY43iURj2PlR9SAxWFPw==
X-CSE-MsgGUID: Jt9kh1YLQGCVgk9Kt3qcnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94216457"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="94216457"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 06:16:15 -0700
X-CSE-ConnectionGUID: vGrzNeCySNyy7+7q8IRSJQ==
X-CSE-MsgGUID: atTr77gOSsaj5pL881n/zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="266457418"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 06:16:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH 3/4] drm/i915/display: add struct intel_error_regs and use it
Date: Wed,  8 Apr 2026 16:15:50 +0300
Message-ID: <08aab16c568f7a19dd9514cc92168abc00cf4834.1775653994.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775653994.git.jani.nikula@intel.com>
References: <cover.1775653994.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Add struct intel_error_regs, a display version of struct
i915_error_regs, and use it. The goal is to reduce the dependency on
i915 core types and headers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_irq.c      | 4 ++--
 drivers/gpu/drm/i915/display/intel_display_reg_defs.h | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_display_regs.h     | 2 +-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 8b6b4709989e..3869551cb9fd 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -73,7 +73,7 @@ static void irq_init(struct intel_display *display, struct intel_irq_regs regs,
 	intel_de_posting_read(display, regs.imr);
 }
 
-static void error_reset(struct intel_display *display, struct i915_error_regs regs)
+static void error_reset(struct intel_display *display, struct intel_error_regs regs)
 {
 	intel_de_write(display, regs.emr, 0xffffffff);
 	intel_de_posting_read(display, regs.emr);
@@ -84,7 +84,7 @@ static void error_reset(struct intel_display *display, struct i915_error_regs re
 	intel_de_posting_read(display, regs.eir);
 }
 
-static void error_init(struct intel_display *display, struct i915_error_regs regs,
+static void error_init(struct intel_display *display, struct intel_error_regs regs,
 		       u32 emr_val)
 {
 	intel_de_write(display, regs.eir, 0xffffffff);
diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
index d044967aa6d9..a56f8ed055f6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
@@ -20,6 +20,14 @@ struct intel_irq_regs {
 #define INTEL_IRQ_REGS(_imr, _ier, _iir) \
 	((const struct intel_irq_regs){ .imr = (_imr), .ier = (_ier), .iir = (_iir) })
 
+struct intel_error_regs {
+	intel_reg_t emr;
+	intel_reg_t eir;
+};
+
+#define INTEL_ERROR_REGS(_emr, _eir) \
+	((const struct intel_error_regs){ .emr = (_emr), .eir = (_eir) })
+
 #define VLV_DISPLAY_BASE		0x180000
 
 /*
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 4fc18e5ee239..d87e52d278c7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -117,7 +117,7 @@
 #define   VLV_ERROR_PAGE_TABLE				(1 << 4)
 #define   VLV_ERROR_CLAIM				(1 << 0)
 
-#define VLV_ERROR_REGS		I915_ERROR_REGS(VLV_EMR, VLV_EIR)
+#define VLV_ERROR_REGS		INTEL_ERROR_REGS(VLV_EMR, VLV_EIR)
 
 #define _MBUS_ABOX0_CTL			0x45038
 #define _MBUS_ABOX1_CTL			0x45048
-- 
2.47.3

