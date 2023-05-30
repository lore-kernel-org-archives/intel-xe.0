Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F853C7EE33
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BC410E438;
	Tue, 30 May 2023 21:16:09 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E243810E430
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481366; x=1717017366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vWwxCosYfOMujfbrx7yqiQj/hV2AguKQ6ywvCiBvuhY=;
 b=D0eoAnG9LbcHID+IzDckQO5bNdB8Gh+5UoFZDr3ouLJxe9pEcDCgw1bL
 gL4GaEJJ/4/ZoNZcD29iPi0LM1AkBecdTPJbTIlvYlZTiJwEJBfo21HxO
 3HCg0BJRvG06VQfvgvnZSYxmG5fYTvE+9JvqqIbHJ1Nc8SlPlmJTA4EZJ
 qaPy9iMlQ3VDlrsj1UvKbiCAHvN5PPl3ZE77TJYV7+rQtO56Kqy6eGqGt
 InbQk8AcD/mWdMayoTnb0R5R2CC3fFPOBPIVgsgLMtR+imDY10LeJ1qgg
 iHdgPpRjwk9ep3NfSWnKVSOl6Ps7+QbIqWOrSbwKOVZlmxfGvd03sjEYE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311936"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311936"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139391"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139391"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:25 -0700
Message-Id: <20230530211549.2632538-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 07/31] fixup! drm/xe/display: Implement
 display support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index a0f22bd52549..6235ff9dec36 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -670,7 +670,7 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 
 void gen11_display_irq_handler(struct drm_i915_private *i915)
 {
-	void __iomem * const regs = to_gt(i915)->mmio.regs;
+	void __iomem * const regs = xe_device_get_root_tile(i915)->mmio.regs;
 	const u32 disp_ctl = raw_reg_read(regs, GEN11_DISPLAY_INT_CTL);
 
 	/*
-- 
2.40.1

