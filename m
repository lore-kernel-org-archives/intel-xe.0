Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B4BCCF9F6
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 01:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AB210E55F;
	Wed,  6 Sep 2023 01:20:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB0110E46E
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 01:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693963251; x=1725499251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oof8HvedQbCKDoG/QTf4banxPl34uDOcvbFAuhrEDd4=;
 b=QuvdMe+Cgc2Ez4V8v2YtpfDIP3eWIf2XZ8aCO49pM24T3SjCscJFivNq
 caQZJg+7sHMKBuzE57D/FDDWl9vLBCYNpuvuRKVOTrFeWu5+AEnrUPqSc
 SdX2Ax+6QCOIc9CnSRyoAfOHBZZeR+XM+dHlOyJXH5ZW3uxlN6Fve3hm8
 yyEiBHZkvd0K+syAgsj606bBrLZJZGJNYfgt8pzYkknFTzLnBhSCukfBe
 iRc6iwSqINS3FEYPZqNj/wmcE6q2GfeFm2rfdhxqkTwo/EfOu5nUJjUcs
 l+a8miGYNAnvhPu2CbQ4Ru1ewQAih8fmMByexXJdGgKxChUBUacAAZ4Rb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="380747238"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="380747238"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 18:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="915072562"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="915072562"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 18:20:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 18:20:50 -0700
Message-Id: <20230906012053.1733755-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230906012053.1733755-1-lucas.demarchi@intel.com>
References: <20230906012053.1733755-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/4] drm/xe/reg_sr: Simplify check for masked
 registers
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For all RTP actions, clr_bits is a superset of the bits being modified.
That's also why the check for "changing all bits" can be done with
`clr_bits + 1`. So always use clr_bits for setting the upper bits of a
masked register.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c    | 8 ++++----
 drivers/gpu/drm/xe/xe_rtp_types.h | 5 ++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 7c88352636d2..264520015861 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -153,15 +153,15 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
 	u32 val;
 
 	/*
-	 * If this is a masked register, need to figure what goes on the upper
-	 * 16 bits: it's either the clr_bits (when using FIELD_SET and WR) or
-	 * the set_bits, when using SET.
+	 * If this is a masked register, need to set the upper 16 bits.
+	 * Set them to clr_bits since that is always a superset of the bits
+	 * being modified.
 	 *
 	 * When it's not masked, we have to read it from hardware, unless we are
 	 * supposed to set all bits.
 	 */
 	if (reg.masked)
-		val = (entry->clr_bits ?: entry->set_bits) << 16;
+		val = entry->clr_bits << 16;
 	else if (entry->clr_bits + 1)
 		val = (reg.mcr ?
 		       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index d170532a98a5..637acc7626a4 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -22,7 +22,10 @@ struct xe_gt;
 struct xe_rtp_action {
 	/** @reg: Register */
 	struct xe_reg		reg;
-	/** @clr_bits: bits to clear when updating register */
+	/**
+	 * @clr_bits: bits to clear when updating register. It's always a
+	 * superset of bits being modified
+	 */
 	u32			clr_bits;
 	/** @set_bits: bits to set when updating register */
 	u32			set_bits;
-- 
2.40.1

